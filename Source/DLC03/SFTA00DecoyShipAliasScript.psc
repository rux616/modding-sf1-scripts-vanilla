Scriptname DLC03:SFTA00DecoyShipAliasScript extends ReferenceAlias

Int Property EnterAkilaStage = 325 Const Auto
Int Property GetDecoyStage = 600 Const Auto
Int Property LeaveAkilaStage = 710 Const Auto
Int Property ChopShopDockStage = 850 Const Auto

LocationAlias Property ChopShopSpaceLoc Mandatory Const Auto
LocationAlias Property DecoyShipLocation Mandatory Const Auto
ReferenceAlias Property Hannibal Mandatory Const Auto
ReferenceAlias Property DecoyShipAdrastosPrisonerFurniture Mandatory Const Auto
ReferenceAlias Property DecoyShipRoachSeat Mandatory Const Auto
ReferenceAlias Property PlayerChopShopFriend Mandatory Const Auto
ReferenceAlias Property Roach Mandatory Const Auto
Scene Property SFTA00_0810a_ChopShop_Hailing Mandatory Const Auto

Event OnLoad()
    Quest myQuest = GetOwningQuest()
    SpaceshipReference myShip = GetShipRef()
    If myQuest.GetStageDone(EnterAkilaStage) && !myQuest.GetStageDone(LeaveAkilaStage) && myShip.IsDisabled()
        myShip.Enable()
    EndIf
    If myQuest.GetStageDone(GetDecoyStage)
        myShip.SetExteriorLoadDoorInaccessible(False)
    Else
        myShip.SetExteriorLoadDoorInaccessible(True)
    EndIf
EndEvent

; Handling to make sure the player is piloting the Decoy ship when docking with the Chop Shop. 
; The Chop shop dock requires the SFTA00_ChopShopStationFriendFaction, which is on the PlayerChopShopFriend Alias.
; We put the player in that Alias when the Decoy ship arrives in the Decoy Ship, and remove them when it leaves.
Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    Location myChopShopSpaceLoc = ChopShopSpaceLoc.GetLocation()
    Actor myPlayer = Game.GetPlayer()
    If akNewLoc == myChopShopSpaceLoc && GetOwningQuest().GetStageDone(ChopShopDockStage)
        PlayerChopShopFriend.ForceRefTo(myPlayer)
        ; If Roach or Hannibal/Adrastos aren't on board when the player gets here, make sure to move them. 
        ; It's heavyhanded, but better than having the quest break.
        ObjectReference myRoach = Roach.GetRef()
        Actor myHannibal = Hannibal.GetActorRef()
        Location myRoachLocation = myRoach.GetCurrentLocation()
        Location myDecoyShipIntLocation = DecoyShipLocation.GetLocation()
        If myRoachLocation != myDecoyShipIntLocation
            (myRoach as Actor).MoveToFurniture(DecoyShipRoachSeat.GetRef())
        EndIf
        If myHannibal.GetCurrentLocation() != DecoyShipLocation.GetLocation()
            myHannibal.MoveToFurniture(DecoyShipAdrastosPrisonerFurniture.GetRef())
        EndIf
    ElseIf akOldLoc == myChopShopSpaceLoc
        PlayerChopShopFriend.Clear()
    EndIf

    If akOldLoc == myChopShopSpaceLoc && SFTA00_0810a_ChopShop_Hailing.IsPlaying()
        SFTA00_0810a_ChopShop_Hailing.Stop()
    EndIf
EndEvent