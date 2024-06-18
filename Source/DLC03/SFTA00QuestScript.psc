Scriptname DLC03:SFTA00QuestScript extends Quest

Int Property PlayerEnteredChopShopStage = 1000 Const Auto
Int Property PlayerEnteredJunkerStage = 1825 Const Auto
RefCollectionAlias Property Followers Auto Const Mandatory
ReferenceAlias Property ChopShopEntranceDockDoor Mandatory Const Auto
ReferenceAlias Property ChopShopStation Auto Const Mandatory
ReferenceAlias Property RobotBay Auto Const Mandatory
Location Property SFBGS003ChopShopLocation Auto Const Mandatory
Location Property SFTA00_DecoyShip_CreatedInteriorLocation Auto Const Mandatory
ActorBase Property Crew_Elite_Vasco Auto Const Mandatory
SQ_FollowersScript Property SQ_Followers Auto Const Mandatory

InputEnableLayer SFTA00FastTravelInputLayer


Function ChopShopDisableFastTravel()
    SFTA00FastTravelInputLayer = InputEnableLayer.Create()
    SFTA00FastTravelInputLayer.EnableFastTravel(False)
EndFunction

Function ChopShopEnableFastTravel()
    If (SFTA00FastTravelInputLayer != None)
		SFTA00FastTravelInputLayer.EnableFastTravel(True)
		SFTA00FastTravelInputLayer.Delete()
		SFTA00FastTravelInputLayer = None
    EndIf
EndFunction

; This script is for special handling for Vasco in the Chop Shop  because this is a zero-g space
; that uses a Ship Cell that connects to an Interior Cell. Since Interior Cells don't pass the check for
; "InSpace," the automated handling for Vasco doesn't work here. 

; Register for remote events.
Event OnQuestInit()
	Actor myPlayer = Game.GetPlayer()
	RegisterForRemoteEvent(myPlayer, "OnLocationChange")
	RegisterForRemoteEvent(myPlayer, "OnExitShipInterior")
EndEvent

; Track when player enters/leaves the Chop Shop to know if Vasco needs to be set as Inactive or Active.
; Also sets the Dock door to the Decoy Ship to be locked or unlocked. 
	; Note: there is an edge case where if a player does not have a previous Home Ship other than the Decoy Ship, they can still access its cockpit.
	; This does not prevent that. We are solving that by unlocking the dock when they enter the Decoy ship and locking it again, when they enter the Chop Shop.
Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
    If akSender == Game.GetPlayer()
        If akOldLoc == SFBGS003ChopShopLocation
            If GetStageDone(PlayerEnteredJunkerStage)
				SetDecoyDockAccessible(True)
				SetVascoZeroGInactive(False)
			EndIf
        ElseIf akNewLoc == SFBGS003ChopShopLocation
            SetVascoZeroGInactive(True)
			If !GetStageDone(PlayerEnteredJunkerStage)
				SetDecoyDockAccessible(False)
			Else 
				SetDecoyDockAccessible(True)
			EndIf
        EndIf
    EndIf
EndEvent

;Make the Decoy Ship inaccessible
Function SetDecoyDockAccessible(Bool abAccessible)
	ObjectReference myDockDoor = ChopShopEntranceDockDoor.GetRef()
	If abAccessible == false
		;Disable the door. Doing so will enable the facade door to prevent players from reentering the Decoy Ship.
		myDockDoor.Disable()
	Else
		;Enable the door. Doing so will disable the facade door and allow players to enter their ship again
		myDockDoor.Enable()
	EndIf
EndFunction


; Track when the player leaves the Ship Cell and enters its Interior Cell which does NOT qualify as "InSpace" 
; to make sure Vasco is set to Inactive.
Event Actor.OnExitShipInterior(Actor akSender, ObjectReference akShip)
	If akShip == ChopShopStation.GetShipRef() && (Game.GetPlayer().GetCurrentLocation() == SFBGS003ChopShopLocation)
        SetVascoZeroGInactive(True)
    EndIf 
EndEvent

; Toggle Vasco Inactive or Active due to zero-g.
Function SetVascoZeroGInactive(Bool ShouldBeInactive)

	; Check Followers for Vasco.
	Actor Vasco = Crew_Elite_Vasco.GetUniqueActor()
	Actor[] FollowerRefs = Followers.GetArray() as Actor[]
	Int iVascoIndex = FollowerRefs.Find(Vasco)

	If iVascoIndex >= 0

		Actor[] VascoArray = new Actor[1]
		VascoArray[0] = Vasco
		ObjectReference RobotBayRef = RobotBay.GetRef()

		If (ShouldBeInactive)
			SQ_Followers.TeleportFollowers(RobotBayRef, VascoArray, IncludeFollowingFollowers=True, IncludeWaitingFollowers=True, StartFollowingAfterTeleport=False, StartWaitingAfterTeleport=True, SkipWaitingFollowersObjective=True)
		Else
			SQ_Followers.TeleportFollowers(RobotBayRef, VascoArray)
		EndIf

	EndIf
EndFunction

