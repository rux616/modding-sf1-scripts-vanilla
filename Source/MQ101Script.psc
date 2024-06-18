Scriptname MQ101Script extends Quest

Group VascoCrew_Properties
SQ_CrewScript Property SQ_Crew auto const mandatory
{ SQ_Crew quest for assigning crew }

;THIS PROPERTY WILL BE OBSOLETE AND SHOULD BE REMOVED AFTER VASCO IS PROPERLY FIXED TO BE AN ELITE CREW:
SQ_CompanionsScript Property SQ_Companions auto const mandatory
{ SQ_Companinos for assigning companion }
EndGroup

InputEnableLayer Property VSEnableLayer Auto Hidden

GlobalVariable Property MQ101Debug Auto Const Mandatory

ReferenceAlias Property CharGenFurniture Auto Const Mandatory

ReferenceAlias Property MineBoringMachine Auto Const Mandatory

ObjectReference Property MQ101_Scene05_MarkerPlayer Auto Const Mandatory

ReferenceAlias Property Heller Auto Const Mandatory

ObjectReference Property MQ101_LGT_A Auto Const Mandatory

ObjectReference Property MQ101_LGT_B Auto Const Mandatory

Scene[] Property MQ101_013A_FlightScenes auto const
{ array of flight tutorial scenes that need to be stopped if player skips past tutorial }

ReferenceAlias Property Vasco Auto Const Mandatory

SQ_PlayerShipScript Property SQ_PlayerShip Auto Const Mandatory

bool property setHomeShipOnInit = false auto hidden
{ set by startup stages - since this calls SQ_PlayerShip, can't be done from startup stage during New Game start - SQ_PlayerShip isn't running yet }

bool property moveVascoToShipOnInit = false auto hidden
{ same as above - need to do this after startup }

bool property setVascoAsCrewOnInit = false auto hidden
{ same as above - need to do this after startup }

int timerInitID = 1 Const

ReferenceAlias Property Alias_BarrettShip Auto Const Mandatory
LocationAlias Property BarrettShip_ExteriorLocation Mandatory Const Auto
LocationAlias Property BarrettShip_InteriorLocation Mandatory Const Auto
ReferenceAlias Property BarrettPilotChair Auto Const Mandatory
ReferenceAlias Property BarrettShipDoor Auto Const Mandatory
ReferenceAlias Property BarrettShipCrewMarker Auto Const Mandatory
ReferenceAlias Property BarrettShipSmallItemMarker01 Mandatory Const Auto
ReferenceAlias Property BarrettShipSmallItemMarker02 Mandatory Const Auto
ReferenceAlias Property BarrettShipSmallItemMarker03 Mandatory Const Auto

ActorValue Property PlayerUnityTimesEntered Mandatory Const Auto
SpaceshipReference Property MQPlayerStarbornShipREF Mandatory Const Auto

Message Property Tutorial_Inventory Mandatory Const Auto
Message Property Tutorial_Inventory02 Mandatory Const Auto
Message Property Tutorial_Inventory03 Mandatory Const Auto
Message Property Tutorial_Inventory04 Mandatory Const Auto

Message Property Tutorial_FastTravel_01 Mandatory Const Auto
Message Property Tutorial_FastTravel_02 Mandatory Const Auto
Message Property Tutorial_FastTravel_03 Mandatory Const Auto
Int Property TutorialFastTravel01Stage=900 Const Auto
Int Property TutorialFastTravel02Stage=910 Const Auto
Int Property TutorialFastTravel03Stage=920 Const Auto
Int Property TutorialFastTravel04Stage=930 Const Auto
GlobalVariable Property MQ101SaveOff Mandatory Const Auto
bool MarkedForNGShutdown
int SaveTimerID = 20 const

Event OnQuestInit()
	Actor PlayerREF = Game.GetPlayer()
	RegisterForRemoteEvent(PlayerREF, "OnPlayerModifiedShip")

	If MQ101Debug.GetValueInt() == 1
		SetStage(400)
	EndIf
EndEvent

Event Actor.OnPlayerModifiedShip(Actor akSource, SpaceshipReference akShip)
	SpaceshipReference BarrettShipRef = Alias_BarrettShip.GetShipRef()
	if (akShip == BarrettShipRef)
		ResetBarrettShip(akShip)
	endif
EndEvent

; call this whenever Barrett's ship changes due to player modification
Function ResetBarrettShip(SpaceshipReference newShip)
	Alias_BarrettShip.ForceRefTo(newShip)

	;Make sure the exterior load door is accessible.
	newShip.SetExteriorLoadDoorInaccessible(False)
	; refill ship aliases
	BarrettShip_ExteriorLocation.ClearAndRefillAlias()
	BarrettShip_InteriorLocation.ClearAndRefillAlias()
	BarrettPilotChair.ClearAndRefillAlias()
	BarrettShipDoor.ClearAndRefillAlias()
	BarrettShipCrewMarker.ClearAndRefillAlias()
	BarrettShipSmallItemMarker01.ClearAndRefillAlias()
	BarrettShipSmallItemMarker02.ClearAndRefillAlias()
	BarrettShipSmallItemMarker03.ClearAndRefillAlias()
EndFunction

Function StartInitTimer(bool setVascoAsCrew, bool moveVasco, bool setHomeShip)
	debug.trace(self + " setVascoAsCrew=" + setVascoAsCrew + " moveVasco=" + moveVasco + " setHomeShip=" + setHomeShip)
	setVascoAsCrewOnInit = setVascoAsCrew
	moveVascoToShipOnInit = moveVasco
	setHomeShipOnInit = setHomeShip
	startTimer(1.0, timerInitID)
EndFunction

Event OnTimer(int aiTimerID)
	; all of this requires SQ_PlayerShip to be running and this quest to NOT still be starting
	if aiTimerID == timerInitID
		if SQ_PlayerShip.IsRunning() == false
			debug.trace(self + " SQ_PlayerShip not yet running - run timer again")
			; run timer again
			StartTimer(1.0, timerInitID)
		elseif self.IsStarting() == true
			debug.trace(self + " MQ101 not finished starting - run timer again")
			; run timer again
			StartTimer(1.0, timerInitID)
		else
			if setHomeShipOnInit
				debug.trace(self + " Init'ing ship.")
				Actor PlayerREF = Game.GetPlayer()
				If PlayerREF.GetValueInt(PlayerUnityTimesEntered) > 0
					debug.trace(self + "Player's been through the Unity at least once")
					SQ_PlayerShip.ResetHomeShip(MQPlayerStarbornShipREF)
					
					If MQ101SaveOff.GetValueInt() == 0 ;we somehow have not turned saving off yet inside of MQ101 Stage 0, so we'll need to run a failsafe timer
						debug.trace(self + "Starting save timer from timerInitID block.")
						StartTimer(2, SaveTimerID)
					Else
						debug.trace(self + "Unblocking saving from timerInitID block.")
						EnableSaveAndCheckForNGShutdown()			
					EndIf
					Game.RequestSave()
				Else
					SpaceshipReference FrontierShipREF = Alias_BarrettShip.GetShipRef()
					SQ_PlayerShip.ResetHomeShip(FrontierShipREF)
				EndIf
			endif

			if setVascoAsCrewOnInit
				AssignVascoAsCrew()
			endif

			if moveVascoToShipOnInit
				SQ_PlayerShip.LoadVascoInterior()
			endif
		endif
	endif

	If aiTimerID == SaveTimerID
		If MQ101SaveOff.GetValueInt() == 0 ;we somehow have not turned saving off yet inside of MQ101 Stage 0, so we'll need to run a failsafe timer
			debug.trace(self + "Starting save timer from SaveTimerID block.")
			StartTimer(2, SaveTimerID)
		Else
			debug.trace(self + "Unblocking saving from SaveTimerID block.")
			EnableSaveAndCheckForNGShutdown()
		EndIf
	EndIf
EndEvent

;SF-15833 - Called to restore the ability to save during MQ101. MarkedForNGShutdown is set from ShutdownMQ101ViaNG()
;which only gets called via MQ401Quest script when a NG+ variant tries to start
Function EnableSaveAndCheckForNGShutdown() private
	Game.SetInCharGen(False, False, False) ;allow saving
	MQ101SaveOff.SetValueInt(0)
	debug.trace(self + "Saving unblocked on MQ101!")
	if MarkedForNGShutdown
		debug.trace(self + "We were previously marked to shut down from MQ401. So shut down now.")
		Stop()
	endif
EndFunction

;SF-15833 - MarkedForNGShutdown gets set true from ShutdownMQ101ViaNG(), which is called from MQ401Script
;so they don't shut down MQ101 before its finished processing
Function ShutdownMQ101ViaNG()
	MarkedForNGShutdown = true
	debug.trace(self + "MQ401 has marked MQ101 to shut down.")
	if MQ101SaveOff.GetValueInt() == 0
		debug.trace(self + "Looks like we're already done processing thing, so we can shut down right now.")
		Stop()
	endif	
EndFunction

Function StartCharGen()
	Actor HellerREF = Heller.GetActorRef()
	If (!RegisterForAnimationEvent(HellerREF, "CharacterGenStart"))
		debug.trace(self + " FAILED to register for Heller's CharacterGenStart Animation. Checking OnLoad next.")
		RegisterForRemoteEvent(HellerREF, "OnLoad")
	endIf
EndFunction

Function RegisterForDrill()
	RegisterForAnimationEvent(MineBoringMachine.GetRef(), "ExitLoopEnd")
EndFunction

Event ObjectReference.OnLoad(ObjectReference akSender)
	Actor HellerREF = Heller.GetActorRef()
	If (!RegisterForAnimationEvent(HellerREF, "CharacterGenStart"))
		debug.trace(self + " FAILED to register for Heller's CharacterGenStart Animation during OnLoad. Race Menu will NOT load correctly")
	EndIf
EndEvent

Int Property SetUpCharGenStage=63 Const Auto
Int Property DrillerInPositionStage=33 Const Auto

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	Actor HellerREF = Heller.GetActorRef()
	Actor PlayerREF = Game.GetPlayer()
	ObjectReference DrillerREF = MineBoringMachine.GetRef()

	If akSource == HellerREF
		SetSTage(SetUpCharGenStage)
	ElseIf akSource == DrillerREF
		SetStage(DrillerInPositionStage)
	EndIF
EndEvent

Function SetUpChargen()
	Actor PlayerREF = Game.GetPlayer()
	Game.FadeOutGame(True, True, 0.0, 0.1, True) ;fade out
	Utility.Wait(0.5)	;wait for the fade
	MQ101_LGT_A.DisableNoWait()
	MQ101_LGT_B.EnableNoWait() ;swap lights
	RegisterForMenuOpenCloseEvent("ChargenMenu")
	RegisterForRemoteEvent(PlayerREF, "OnGetUp")
	CharGenFurniture.GetRef().Activate(Game.GetPlayer()) ;get the player out of furniture
EndFunction

Event Actor.OnGetUp(Actor akSender, ObjectReference akFurniture)
	Actor PlayerREF = Game.GetPlayer()
	Game.FadeOutGame(False, True, 0.5, 0.1) ;fade in so we see the char menu
	Game.ShowRaceMenu()
	CharGenFurniture.getRef().BlockActivation(True, True)
	UnRegisterForRemoteEvent(PlayerREF, "OnGetUp")
EndEvent

Int Property CharGenDoneStage=105 Const Auto
Int Property PlanetViewPrereqStage=606 Const Auto
Int Property PlanetViewMapOpenedStage=608 Const Auto
Int Property PlanetViewAlreadyLandedStage=607 Const Auto
Int Property SetCoursePrereqStage=1000 Const Auto
Int Property SetCourseDataMenuStage=1005 Const Auto
Int Property SetCourseMissionsMenuStage=1010 Const Auto
Int Property SetCourseGalaxyMenuStage=1020 Const Auto
Message Property Tutorial_SetCourse01 Mandatory Const Auto
Message Property Tutorial_SetCourse02 Mandatory Const Auto
Message Property Tutorial_SetCourse03 Mandatory Const Auto

Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)
    if (asMenuName== "ChargenMenu")
        if (abOpening) == False
		SetStage(CharGenDoneStage)
        endif
    endif

	If (asMenuName == "DataMenu")
		If (abOpening) ;helmet tutorial
			If GetStageDone(165) && !GetStageDone(168) && !GetStageDone(167)
				RegisterForTutorialEvent("OnHelmetTabOpened")
				RegisterForMenuOpenCloseEvent("InventoryMenu")
				Message.ClearHelpMessages()
				Tutorial_Inventory02.ShowAsHelpMessage(asEvent="None", afDuration=0, afInterval=0, aiMaxTimes=0)
				SetStage(166)
			EndIf
		Else ;menu closes after helmet tutorial advances far enough
			If GetStageDone(168)
				Message.ClearHelpMessages()
			EndIf
		EndIf
		
		If !abOpening ;hide inventory message if you close menu
			If GetStageDone(165) && !GetStageDone(168) && !GetStageDone(167)
				Message.ClearHelpMessages()
			EndIf
		EndIf

		If (abOpening) ;star map tutorial
			ClearStarMapTutorial()
		EndIf

		If (abOpening) && GetStageDone(SetCoursePrereqStage) ;set course tutorial
			Message.ClearHelpMessages()
			SetStage(SetCourseDataMenuStage)
			RegisterForMenuOpenCloseEvent("BSMissionMenu")
			Tutorial_SetCourse02.ShowAsHelpMessage(asEvent="None", afDuration=0, afInterval=0, aiMaxTimes=0)
		EndIf

		If !(abOpening) && (GetStageDone(SetCoursePrereqStage)) && !(GetStageDone(SetCourseGalaxyMenuStage)) ;reset messages
			Message.ClearHelpMessages()
			Tutorial_SetCourse01.ShowAsHelpMessage(asEvent="None", afDuration=0, afInterval=0, aiMaxTimes=0)
		EndIf
	EndIf

	If (asMenuName == "InventoryMenu")
		If (abOpening) ;helmet tutorial ends
			If !GetStageDone(167)
				Message.ClearHelpMessages()
				Tutorial_Inventory03.ShowAsHelpMessage(asEvent="None", afDuration=0, afInterval=0, aiMaxTimes=0)
				SetStage(167)
			EndIf
		EndIf
	EndIf

	If (asMenuName == "MonocleMenu")
		If (abOpening)
			If GetStageDone(TutorialFastTravel01Stage) && !GetStageDone(TutorialFastTravel03Stage) && !GetStageDone(TutorialFastTravel04Stage)
				Message.ClearHelpMessages()
				Tutorial_FastTravel_02.ShowAsHelpMessage(asEvent="None", afDuration=0, afInterval=0, aiMaxTimes=0)
				SetStage(TutorialFastTravel02Stage)
			EndIf
		Else
			IF GetStageDone(TutorialFastTravel01Stage) && !GetStageDone(TutorialFastTravel03Stage)
				Message.ClearHelpMessages()
				Tutorial_FastTravel_01.ShowAsHelpMessage(asEvent="None", afDuration=0, afInterval=0, aiMaxTimes=0)
			EndIf
		EndIf
	EndIF

	If (asMenuName == "BSMissionMenu")
		If (abOpening) && !(GetStageDone(SetCourseGalaxyMenuStage))
			Message.ClearHelpMessages()
			SetStage(SetCourseMissionsMenuStage)
			RegisterForMenuOpenCloseEvent("GalaxyStarMapMenu")
			Tutorial_SetCourse03.ShowAsHelpMessage(asEvent="None", afDuration=0, afInterval=0, aiMaxTimes=0)
		ElseIf !(abOpening) && !(GetStageDone(SetCourseGalaxyMenuStage)) ;reset messages
			Message.ClearHelpMessages()
			Tutorial_SetCourse02.ShowAsHelpMessage(asEvent="None", afDuration=0, afInterval=0, aiMaxTimes=0)
		EndIf
	EndIf

	If (asMenuName == "GalaxyStarMapMenu")
		If (abOpening)
			If GetStageDone(TutorialFastTravel01Stage) && !GetStageDone(TutorialFastTravel03Stage) && !GetStageDone(TutorialFastTravel04Stage)				
				Message.ClearHelpMessages()
				Tutorial_FastTravel_03.ShowAsHelpMessage(asEvent="None", afDuration=0, afInterval=0, aiMaxTimes=0)
				SetStage(TutorialFastTravel03Stage)
			EndIf
		Else
			If GetStageDone(TutorialFastTravel03Stage)		
				Message.ClearHelpMessages()
			EndIf
		EndIf

		;planet view tutorial
		If GetStageDone(PlanetViewPrereqStage) && !GetStageDone(PlanetViewAlreadyLandedStage) && !GetStageDone(PlanetViewMapOpenedStage)
			SetStage(PlanetViewMapOpenedStage)
			UnRegisterForMenuOpenCloseEvent("GalaxyStarMapMenu")
		EndIf

		;turn off Set Course tutorial
		If GetStageDone(SetCourseMissionsMenuStage)
			Message.ClearHelpMessages()
			UnRegisterForMenuOpenCloseEvent("GalaxyStarMapMenu")
			UnRegisterForMenuOpenCloseEvent("BSMissionMenu")
			UnRegisterForMenuOpenCloseEvent("DataMenu")
			UnRegisterForPlayerTeleport()
		EndIf
	EndIF
endEvent

Event OnPlayerTeleport()
	Message.ClearHelpMessages()

	If GetStageDone(TutorialFastTravel04Stage) == 0
		Message.ClearHelpMessages()
		UnRegisterForMenuOpenCloseEvent("MonocleMenu")
		UnRegisterForPlayerTeleport()
		SetStage(TutorialFastTravel04Stage)
	EndIf

	If GetStageDone(SetCourseDataMenuStage)
		Message.ClearHelpMessages()
		UnRegisterForMenuOpenCloseEvent("DataMenu")
		UnRegisterForPlayerTeleport()
		SetStage(SetCourseGalaxyMenuStage)
	EndIf
endEvent

Event OnTutorialEvent(String asEventName, Message aMessage)
	If (asEventName == "OnHelmetTabOpened")
		Message.ClearHelpMessages()
		Tutorial_Inventory04.ShowAsHelpMessage(asEvent="None", afDuration=0, afInterval=0, aiMaxTimes=0)
	EndIf
EndEvent

Function StopFlightTutorialScenes()
	int i = 0
	while i < MQ101_013A_FlightScenes.Length
		MQ101_013A_FlightScenes[i].Stop()
		i += 1
	EndWhile
EndFunction

GlobalVariable Property MQ101VascoQuestFollower Mandatory Const Auto

Function AssignVascoAsCrew()
	;Use a global to indicate Vasco's temp follower state during MQ101, used in SQ_PlayerShipScript
	MQ101VascoQuestFollower.SetValueInt(1)
	Vasco.GetActorRef().SetPlayerTeammate(abCanDoFavor=False)
endFunction

Function MQ101DisablePlayerControls()
	VSEnableLayer = InputEnableLayer.Create()
	VSEnableLayer.DisablePlayerControls()
EndFunction

Function MQ101EnablePlayerControls()
	VSEnableLayer = None
EndFunction

Function StarMapTutorial()
	RegisterForMenuOpenCloseEvent("DataMenu")
EndFunction

Function ClearStarMapTutorial()
	If GetStageDone(510)
		Message.ClearHelpMessages()
	EndIf
EndFunction

Function InventoryTutorial()
	Tutorial_Inventory.ShowAsHelpMessage(asEvent="None", afDuration=0, afInterval=0, aiMaxTimes=0)
	RegisterForMenuOpenCloseEvent("DataMenu")
EndFunction

Function FastTravelTutorial()
	Tutorial_FastTravel_01.ShowAsHelpMessage(asEvent="None", afDuration=0, afInterval=0, aiMaxTimes=0)
	RegisterForMenuOpenCloseEvent("MonocleMenu")
	RegisterForPlayerTeleport() ;if player ever fast travels, cut the tutorial
EndFunction

Function PlanetViewTutorial()
	RegisterForMenuOpenCloseEvent("GalaxyStarMapMenu")
EndFunction

Function SetCourseTutorial()
	RegisterForMenuOpenCloseEvent("DataMenu")
	RegisterForPlayerTeleport() ;if player ever fast travels, cut the tutorial
	Tutorial_SetCourse01.ShowAsHelpMessage(asEvent="None", afDuration=0, afInterval=0, aiMaxTimes=0)
EndFunction