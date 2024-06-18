Scriptname ElevatorMasterScript extends ObjectReference Hidden conditional
{Script for handling elevators. Be sure to AttachRef any thing you want to move with the platform helper}

Group Optional_Properties
	Float Property fTimeTakenToMove = 3.0 Auto
	{The time, in seconds, it takes for the elevator to move from point A to B.}

	Bool Property bStartAtTop = TRUE Auto
	{Default = TRUE, elevator is starting at the top}

	;int property bottomFloor = -99 Auto Const
	;{Bottom floor number, which tells the announcer what to say when thish floor is reached (Default = -99, which just makes a garbled "BBBzzzttt Floor!")}

	;int property upperFloor = -99 Auto Const
	;{Top floor number, which tells the announcer what to say when thish floor is reached (Default = -99, which just makes a garbled "BBBzzzttt Floor!")}

	Bool Property bStartDeactivated = FALSE Auto
	{Whether this elevator starts "off" or not.  }

	Message Property DeactivatedMessage Auto
	{Message that shows up when any elevator button is pressed while it's deactivated.}

	Bool Property CloseInteriorDoor = TRUE Auto
	{Inner door closes by default. Set this to FALSE to keep it from closing at all.}

	;Bool Property ignoreTopDoorActivation = FALSE Auto
	;{Activating elevator doors calls them by default. Set this to TRUE to ignore player activation of the upper door if it needs to be handled differently.}

	;Bool Property ignoreBottomDoorActivation = FALSE Auto
	;{Activating elevator doors calls them by default. Set this to TRUE to ignore player activation of the lower door if it needs to be handled differently.}

endGroup

Group No_Touchy CollapsedOnRef
	Keyword Property Elevator_PlatformHelper Auto Mandatory
	Keyword Property Elevator_InteriorButton Auto Mandatory
	Keyword Property Elevator_BottomButton Auto Mandatory
	Keyword Property Elevator_TopButton Auto Mandatory
	Keyword Property Elevator_InteriorDoor Auto Mandatory
	Keyword Property Elevator_BottomDoor Auto Mandatory
	Keyword Property Elevator_TopDoor Auto Mandatory
	Keyword Property Elevator_BottomNavCut Auto Mandatory
	Keyword Property Elevator_TopNavCut Auto Mandatory
	Keyword Property Elevator_DisableAfterLoad Auto Mandatory
	Keyword Property Elevator_SoundMarker01 Auto Mandatory
	{SoundMarker that enables when elevator moves and disables when elevator stops}

	
	;Keyword Property Elevator_InteriorButton Auto ; This is the interior button panel.
	;Keyword Property Elevator_TopButton Auto
	;Keyword Property Elevator_TopButton Auto
	;Keyword Property Elevator_TopDoor Auto
	;Keyword Property Elevator_BottomDoor Auto
	;Keyword Property Elevator_InteriorDoor Auto
	;Keyword Property LinkCustom07 Auto
	;Keyword Property LinkCustom08 Auto
	;Keyword Property LinkCustom09 Auto

	;Sound Property ElevatorLoop Auto
	;Sound Property ElevatorDing Auto
	;Sound Property ElevatorDoorOpen Auto
	;Sound Property ElevatorDoorClose Auto
	;Sound Property ElevatorCallButtonClick Auto

	;ActorValue Property elevatorDestinationFloor Auto Hidden
	;scene property elevatorFloorAnnounceScene auto const
	;scene property elevatorGoingUpDownScene auto const
	;Quest Property DNMasterQuest Auto Const
	;ReferenceAlias Property elevatorAlias Auto Const
endGroup

;***********************************************************

Bool bElevatorIsMoving = FALSE conditional
Bool bElevatorIsAtTop = FALSE conditional
Bool bHasAlreadyLoaded = FALSE
bool bBeingActivated = FALSE
Int iElevatorLoopInstance
float fAnimRate

;***********************************************************

State AlreadyLoaded
	EVENT OnLoad()
	    ;Do Nothing
	EndEvent
endState

;***********************************************************

State Busy
	;do nothing
endState

;***********************************************************

Event OnInit()
	fAnimRate = 1.0 / fTimeTakenToMove
endEvent

;***********************************************************

Event OnCellLoad()
	ElevatorSetupFunction()
endEvent

;***********************************************************

Event OnUnload()
	UnregisterForDistanceEvents(self, Game.GetPlayer())
endEvent

;***********************************************************

Function ElevatorSetupFunction()

	ObjectReference PlatformHelper = GetLinkedRef(Elevator_PlatformHelper)
	ObjectReference CallButtonTop = GetLinkedRef(Elevator_TopButton)
	ObjectReference CallButtonBottom = GetLinkedRef(Elevator_BottomButton)
	ObjectReference TopDoor = GetLinkedRef(Elevator_TopDoor)
	ObjectReference BottomDoor = GetLinkedRef(Elevator_BottomDoor)
	ObjectReference DisableAfterLoad = GetLinkedRef(Elevator_DisableAfterLoad)

	GoToState("AlreadyLoaded")
	RegisterForRemoteEvent(GetLinkedRef(Elevator_InteriorButton), "OnActivate")
	;if GetLinkedRef(Elevator_InteriorButton).GetLinkedRef()
	;	RegisterForRemoteEvent(GetLinkedRef(Elevator_InteriorButton).GetLinkedRef(), "OnActivate")
	;endif
	;debug.trace("Registering Elevator_InteriorButton")
	if (CallButtonTop)
		RegisterForRemoteEvent(CallButtonTop, "OnActivate")
		;debug.trace("Registering CallButtonTop")
	endif

	if (TopDoor)
		TopDoor.BlockActivation()
		;if (!ignoreTopDoorActivation)
		RegisterForRemoteEvent(TopDoor, "OnActivate")
		RegisterForRemoteEvent(TopDoor, "OnOpen")
		RegisterForRemoteEvent(TopDoor, "OnClose")
		;debug.trace("Registering TopDoor")
		;EndIf
	endif

	if (CallButtonBottom)
		RegisterForRemoteEvent(CallButtonBottom, "OnActivate")
		;debug.trace("Registering CallButtonBottom")
	endif

	if (BottomDoor)
		BottomDoor.BlockActivation()
		;if (!ignoreBottomDoorActivation)
		RegisterForRemoteEvent(BottomDoor, "OnActivate")
		RegisterForRemoteEvent(BottomDoor, "OnOpen")
		RegisterForRemoteEvent(BottomDoor, "OnClose")
		debug.trace("Registering BottomDoor")
		;EndIf
	endif

	if (bHasAlreadyLoaded == FALSE)
		ObjectReference InteriorDoor = GetLinkedRef(Elevator_InteriorDoor)
		;ObjectReference InnerMeter = GetLinkedRef(LinkCustom07)
		;ObjectReference InnerMeterLinkRef = InnerMeter.GetLinkedRef()

		if (bStartDeactivated == FALSE)
			;if (InnerMeter.Is3DLoaded() == FALSE)
			;	InnerMeter.Waitfor3dLoad()
			;endif
			;InnerMeter.PlayAnimation("StartOn")
			
			if (CloseInteriorDoor == FALSE)
				if (InteriorDoor.Is3DLoaded() == FALSE)
					InteriorDoor.Waitfor3dLoad()
				endif
				InteriorDoor.SetOpen()
			endif

			TopDoor.BlockActivation(TRUE)
			BottomDoor.BlockActivation(TRUE)

		else
			;CallButtonTop.Playanimation("StartOff")
			;CallButtonBottom.Playanimation("StartOff")
		endif

		;if (InnerMeterLinkRef)
		;	if !bStartDeactivated
		;		InnerMeterLinkRef.PlayAnimation("StartOn")
		;	endif
		;endif

	    if (bStartAtTop == TRUE)
	    	;if (bStartDeactivated == FALSE)
	    		;GetLinkedRef(LinkCustom08).PlayAnimation("StartOn")
	    	;endif

	    	PlatformHelper.SetAnimationVariableFloat("CurrentPosition", 1)
	    	PlatformHelper.SetAnimationVariableFloat("Position", 1)
	    	;PlatformHelper.SetAnimationVariableFloat("fvalue", 1)
	    	;PlatformHelper.PlayAnimation("Play01")
	    	bElevatorIsAtTop = TRUE
	    	DisableAfterLoad.Disable()
	    else
	    	;if !bStartDeactivated
	    	;	GetLinkedRef(LinkCustom09).PlayAnimation("StartOn")
	    	;endif

			if (PlatformHelper.Is3DLoaded() == FALSE)
				PlatformHelper.Waitfor3dLoad()
				
			endif

	    	PlatformHelper.SetAnimationVariableFloat("CurrentPosition", 0)
	    	PlatformHelper.SetAnimationVariableFloat("Position", 0)
	    	;PlatformHelper.SetAnimationVariableFloat("fvalue", 0)
	    	;PlatformHelper.PlayAnimation("Play01")
	    	bElevatorIsAtTop = FALSE
	    endif

	    bHasAlreadyLoaded = TRUE
	endif

endFunction

;***********************************************************

Function ResetElevator()
	bHasAlreadyLoaded = FALSE
	ElevatorSetupFunction()
endFunction

;***********************************************************

Function MakeElevatorFunctional()

	ObjectReference PlatFormHelper = GetLinkedRef(Elevator_PlatformHelper)
	ObjectReference CallButtonTop = GetLinkedRef(Elevator_TopButton)
	ObjectReference CallButtonBottom = GetLinkedRef(Elevator_BottomButton)
	;ObjectReference InnerMeter = GetLinkedRef(LinkCustom07)
	;ObjectReference InnerMeterLinkRef = InnerMeter.GetLinkedRef()
	;ObjectReference OuterMeterA = GetLinkedRef(LinkCustom08)
	;ObjectReference OuterMeterB = GetLinkedRef(LinkCustom09)

	bStartDeactivated = FALSE
	;InnerMeter.PlayAnimation("StartOn")
	;CallButtonTop.Playanimation("Play02")
	;CallButtonBottom.Playanimation("Play02")

	;if (InnerMeterLinkRef)
	;	InnerMeterLinkRef.PlayAnimation("StartOn")
	;endif

    ;if (bStartAtTop == TRUE)
    ;	OuterMeterA.PlayAnimation("StartOn")
    ;else
    ;	OuterMeterB.PlayAnimation("StartOn")
    ;endif

    bHasAlreadyLoaded = TRUE
    PlatFormHelper.SetAnimationVariableFloat("Speed", fAnimRate)

endFunction

;***********************************************************

Function MakeElevatorNonFunctional()

	ObjectReference PlatFormHelper = GetLinkedRef(Elevator_PlatformHelper)
	ObjectReference CallButtonTop = GetLinkedRef(Elevator_TopButton)
	ObjectReference CallButtonBottom = GetLinkedRef(Elevator_BottomButton)
	;ObjectReference InnerMeter = GetLinkedRef(LinkCustom07)
	;ObjectReference InnerMeterLinkRef = InnerMeter.GetLinkedRef()
	;ObjectReference OuterMeterA = GetLinkedRef(LinkCustom08)
	;ObjectReference OuterMeterB = GetLinkedRef(LinkCustom09)

	bStartDeactivated = TRUE
	;InnerMeter.PlayAnimation("StartOff")
	;CallButtonTop.Playanimation("StartOff")
	;CallButtonBottom.Playanimation("StartOff")

	;if (InnerMeterLinkRef)
	;	InnerMeterLinkRef.PlayAnimation("StartOff")
	;endif

    ;if (bStartAtTop == TRUE)
    ;	OuterMeterA.PlayAnimation("StartOff")
    ;else
    ;	OuterMeterB.PlayAnimation("StartOff")
    ;endif

    bHasAlreadyLoaded = TRUE
    PlatFormHelper.SetAnimationVariableFloat("Speed", fAnimRate)

endFunction

;***********************************************************

Event ObjectReference.OnOpen(ObjectReference akSender, ObjectReference akActionRef)
    ObjectReference TopDoor = GetLinkedRef(Elevator_TopDoor)
	ObjectReference BottomDoor = GetLinkedRef(Elevator_BottomDoor)

	if (akSender == TopDoor)
		TopDoor.BlockActivation(TRUE,TRUE)
	endif

	if (akSender == BottomDoor)
		BottomDoor.BlockActivation(TRUE,TRUE)
	endif
endEvent

;***********************************************************

Event ObjectReference.OnClose(ObjectReference akSender, ObjectReference akActionRef)
    ObjectReference TopDoor = GetLinkedRef(Elevator_TopDoor)
	ObjectReference BottomDoor = GetLinkedRef(Elevator_BottomDoor)

	if (akSender == TopDoor)
		TopDoor.BlockActivation(TRUE,FALSE)
	endif

	if (akSender == BottomDoor)
		BottomDoor.BlockActivation(TRUE,FALSE)
	endif
endEvent

;***********************************************************

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
	;debug.trace("Activated: " + akSender + " by: " + akActionRef)
	
	if akActionRef == Game.GetPlayer()
		GoToState("Busy")
		ObjectReference CallButtonTop = GetLinkedRef(Elevator_TopButton)
		ObjectReference CallButtonBottom = GetLinkedRef(Elevator_BottomButton)
		ObjectReference TopDoor = GetLinkedRef(Elevator_TopDoor)
		ObjectReference BottomDoor = GetLinkedRef(Elevator_BottomDoor)
		ObjectReference InteriorDoor = GetLinkedRef(Elevator_InteriorDoor)
		ObjectReference InteriorButton = GetLinkedRef(Elevator_InteriorButton)
		;ObjectReference InteriorButtonLinkRef = InteriorButton.GetLinkedRef()
		;ObjectReference InteriorDoorLinkRef = InteriorDoor.GetLinkedRef()

		Bool bIgnoreDoorActivation = FALSE
	

		if (akSender == TopDoor) && (Math.ABS(TopDoor.GetHeadingAngle(game.getPlayer())) < 90)
			bIgnoreDoorActivation = TRUE
			TopDoor.SetOpen()
		endif

		if (akSender == BottomDoor) && (Math.ABS(BottomDoor.GetHeadingAngle(game.getPlayer())) < 90)
			bIgnoreDoorActivation = TRUE
			BottomDoor.SetOpen()
		endif

		if (bStartDeactivated == FALSE && bIgnoreDoorActivation == FALSE)

			if (bElevatorIsMoving == FALSE && bBeingActivated == FALSE)
				BlockAllButtons()
				bBeingActivated = TRUE
				;Begin joel stuff - force my interior button panel into the alias!
				;elevatorAlias.clear()
				;elevatorAlias.forceRefTo(self)
				;here ends this chunk of joel stuff.

				if (akSender == InteriorButton) ;|| akSender == InteriorButtonLinkRef)
					;Interior Button activated, move elevator no matter where it is.
					GetLinkedRef(Elevator_PlatformHelper).SetAnimationVariableFloat("Speed", fAnimRate)
					;InteriorButton.PlayAnimation("play01")

					;if (InteriorButtonLinkRef)
					;	InteriorButtonLinkRef.PlayAnimation("play01")
					;endif

					HandleElevatorDoor(TopDoor, 0)
					HandleElevatorDoor(BottomDoor, 0)
					HandleElevatorDoor(InteriorDoor, 0)

					;if (InteriorDoorLinkRef)
					;	HandleElevatorDoor(InteriorDoorLinkRef, 0)
					;endif

					utility.Wait(0.5)
					MoveElevator(1)

				elseif (akSender == CallButtonTop) || (akSender == TopDoor && bStartDeactivated == FALSE)
					GetLinkedRef(Elevator_PlatformHelper).SetAnimationVariableFloat("Speed", fAnimRate / 2)
					;CallButtonTop.PlayAnimation("play01")
					;int ElevatorCallButtonClickInstance = ElevatorCallButtonClick.play(CallButtonTop)  
					;Sound.SetInstanceVolume(ElevatorCallButtonClickInstance, 1)
					if (bElevatorIsAtTop == TRUE)
						;Top call button activated, and elevator at top. Open doors.
						;int DingInstanceID = ElevatorDing.play(InteriorDoor)  
						;Sound.SetInstanceVolume(DingInstanceID, 1)
						utility.Wait(0.5)
						;CallButtonTop.PlayAnimation("play01")
						HandleElevatorDoor(TopDoor, 1)
						utility.Wait(utility.RandomFloat(0.1, 0.3))

						;if (InteriorDoorLinkRef == FALSE)
						;	HandleElevatorDoor(InteriorDoor, 1)
						;else
						;	HandleElevatorDoor(InteriorDoorLinkRef, 1)
						;endif

						bBeingActivated = FALSE
						BlockAllButtons(FALSE)
					else
						;Top call button activated, and elevator at bottom. Move elevator.
						HandleElevatorDoor(TopDoor, 0)
						utility.Wait(utility.RandomFloat(0.1, 0.3))
						HandleElevatorDoor(BottomDoor, 0)
						HandleElevatorDoor(InteriorDoor, 0)

						;if (InteriorDoorLinkRef)
						;	HandleElevatorDoor(InteriorDoorLinkRef, 0)
						;endif

						utility.Wait(0.5)
						MoveElevator(0)
						;CallButtonTop.PlayAnimation("play01")
					endif

				elseif (akSender == CallButtonBottom) || (akSender == BottomDoor && bStartDeactivated == FALSE)
					GetLinkedRef(Elevator_PlatformHelper).SetAnimationVariableFloat("Speed", fAnimRate / 2)
					;CallButtonBottom.PlayAnimation("play01")
					;int ElevatorCallButtonClickInstance = ElevatorCallButtonClick.play(CallButtonBottom)  
					;Sound.SetInstanceVolume(ElevatorCallButtonClickInstance, 1)
					if (bElevatorIsAtTop == FALSE)
						;Bottom call button activated, and elevator at bottom. Open doors.
						;int DingInstanceID = ElevatorDing.play(InteriorDoor)  
						;Sound.SetInstanceVolume(DingInstanceID, 1)
						utility.Wait(0.5)
						;CallButtonBottom.PlayAnimation("play01")
						HandleElevatorDoor(BottomDoor, 1)	
						utility.Wait(utility.RandomFloat(0.1, 0.3))
						HandleElevatorDoor(InteriorDoor, 1)
						bBeingActivated = FALSE
						BlockAllButtons(FALSE)
					else
						;Bottom call button activated, and elevator at top. Move elevator.
						HandleElevatorDoor(TopDoor, 0)
						utility.Wait(utility.RandomFloat(0.1, 0.3))
						HandleElevatorDoor(BottomDoor, 0)
						HandleElevatorDoor(InteriorDoor, 0)

						;if (InteriorDoorLinkRef)
						;	HandleElevatorDoor(InteriorDoorLinkRef, 0)
						;endif

						utility.Wait(0.5)
						MoveElevator(0)
						;CallButtonBottom.PlayAnimation("play01")
					endif
				endif
			else
				;Do Nothing
			endif
		elseif (bStartDeactivated == TRUE)
			DeactivatedMessage.Show()
			;debug.trace(DeactivatedMessage)
			;debug.trace("Show deactivated message.")		
		endif

		if (bIgnoreDoorActivation == TRUE)
			bIgnoreDoorActivation = FALSE
		endif
	endif

endEvent

;***********************************************************

Function BlockAllButtons(bool bShouldBlock = TRUE)

	ObjectReference InteriorButton = GetLinkedRef(Elevator_InteriorButton)
	ObjectReference CallButtonTop = GetLinkedRef(Elevator_TopButton)
	ObjectReference CallButtonBottom = GetLinkedRef(Elevator_BottomButton)

	if (bShouldBlock == TRUE)
		InteriorButton.BlockActivation()

		;if (InteriorButton.GetLinkedRef())
		;	InteriorButton.GetLinkedref().BlockActivation()
		;endif

		CallButtonTop.BlockActivation()
		CallButtonBottom.BlockActivation()
	else
		InteriorButton.BlockActivation(FALSE)

		;if (InteriorButton.GetLinkedRef())
		;	InteriorButton.GetLinkedref().BlockActivation(FALSE)
		;endif

		CallButtonTop.BlockActivation(FALSE)
		CallButtonBottom.BlockActivation(FALSE)
	endif

endFunction

;***********************************************************

Function HandleElevatorDoor(ObjectReference akDoor, Bool bOpen)

	ObjectReference InteriorDoor = GetLinkedRef(Elevator_InteriorDoor)
		; If we are supposed to try to open this door...
	if (bOpen == TRUE)
		;...and the door is closed...
		if (akDoor.GetOpenState() >= 3)
				; ...then open the door.
			akDoor.SetOpen()
		else
			; ...don't open the door, it's already opened.
		endif
	else
		; If we are supposed to close this door...
		if (akDoor.GetOpenState() <= 2)
			; ...and the door is open...
			; If we are trying to close the inner door, and we aren't supposed to, then don't
			if (akDoor == InteriorDoor && CloseInteriorDoor == FALSE)
				;do Nothing
			else
				akDoor.SetOpen(FALSE)
			endif
		else
			; ...don't close the door, it's already closed.
		endif
	endif

endFunction

;***********************************************************

Function MoveElevator(bool bActivatedFromPanel)
	;Function for moving the elevator, multiple if bElevatorIsAtTop statements present due to the timing of the elevator animations. Setting properties moved to another function for readability.

	ObjectReference PlatFormHelper = GetLinkedRef(Elevator_PlatformHelper)
	ObjectReference TopDoor = GetLinkedRef(Elevator_TopDoor)
	ObjectReference BottomDoor = GetLinkedRef(Elevator_BottomDoor)
	ObjectReference InteriorDoor = GetLinkedRef(Elevator_InteriorDoor)
	ObjectReference InteriorButton = GetLinkedRef(Elevator_InteriorButton)
	ObjectReference ElevatorRef = GetLinkedRef()
	ObjectReference SoundMarker01 = GetLinkedRef(Elevator_SoundMarker01)
	;ObjectReference OuterMeterA = GetLinkedRef(LinkCustom08)
	;ObjectReference OuterMeterB = GetLinkedRef(LinkCustom09)
	;ObjectReference InnerMeter = GetLinkedRef(LinkCustom07)
	;ObjectReference InnerMeterLinkRef = InnerMeter.GetLinkedRef()
	;ObjectReference InteriorButtonLinkRef = InteriorButton.GetLinkedRef()

	;Set my actor value (bottom floor) so that the scene conditions play the correct line.")
	bElevatorIsMoving = TRUE

	;InnerMeter.PlayAnimation("Play01")
	;if (InnerMeterLinkRef)
	;	InnerMeterLinkRef.PlayAnimation("Play01")
	;endif

	;OuterMeterA.PlayAnimation("Play01")
	;OuterMeterB.PlayAnimation("Play01")

	;iElevatorLoopInstance = ElevatorLoop.play(InteriorDoor)  
	;Sound.SetInstanceVolume(iElevatorLoopInstance, 1)

	;Play the "Going Down/Up" Scene Line
	;elevatorGoingUpDownScene.start()
	utility.wait(0.2)

	if (bElevatorIsAtTop == TRUE)
		PlatformHelper.SetAnimationVariableFloat("Position", 0)
		MoveElevatorFloorPlatHandler(0) ;bottomFloor,
	else
		PlatformHelper.SetAnimationVariableFloat("Position", 1)
		MoveElevatorFloorPlatHandler(1) ;UpperFloor, 
	endif
	
	;enable any sound markers
	if(SoundMarker01)
		SoundMarker01.enableNoWait()
	endif
	
	ElevatorRef.PlayAnimation("Stage2")
	PlatFormHelper.PlayAnimationAndWait("Play01", "done")
	ElevatorRef.PlayAnimation("Stage1")
	
	;disable any sound markers
	if(SoundMarker01)
		SoundMarker01.disableNoWait()
	endif
	;Sound.StopInstance(iElevatorLoopInstance)

	;if (bActivatedFromPanel == TRUE_
	;    InteriorButton.PlayAnimation("play01")
	;    if (InteriorButtonLinkRef)
	;		InteriorButtonLinkRef.PlayAnimation("play01")
	;	endif
	;endif

	;InnerMeter.PlayAnimation("Play02")

	;if (InnerMeterLinkRef)
	;	InnerMeterLinkRef.PlayAnimation("Play02")
	;endif

	;if (bElevatorIsAtTop == FALSE)
	;	MoveElevatorMeterHandler(Meter1 = OuterMeterA, Meter2 = OuterMeterB)
	;else
	;	MoveElevatorMeterHandler(Meter1 = OuterMeterB, Meter2 = OuterMeterA)
	;endif

	;int DingInstanceID = ElevatorDing.play(InteriorDoor)  
	;Sound.SetInstanceVolume(DingInstanceID, 1)
	;utility.Wait(0.5)

	;play the scene to announce floor we're arrived at!
	;elevatorFloorAnnounceScene.start()

	if (bElevatorIsAtTop == FALSE)
		MoveElevatorDoorHandler(DoorRef = BottomDoor) 
	else 
		MoveElevatorDoorHandler(DoorRef = TopDoor) 
	endif

	utility.Wait(utility.RandomFloat(0.1, 0.3))
	;ObjectReference InteriorDoorLinkRef = InteriorDoor.GetLinkedRef()

	MoveElevatorDoorHandler(DoorRef = InteriorDoor)
	
	;if (bElevatorIsAtTop == FALSE)
	;	MoveElevatorDoorHandler(DoorRef = InteriorDoor)
	;elseif (InteriorDoorLinkRef == FALSE)
	;		MoveElevatorDoorHandler(DoorRef = InteriorDoor)
	;	else
	;		MoveElevatorDoorHandler(DoorRef = InteriorDoorLinkRef)
	;endif

	utility.Wait(1.2)
	BlockAllButtons(FALSE)
	bBeingActivated = FALSE
	bElevatorIsMoving = FALSE
	GoToState("")

endFunction

;***********************************************************

Function MoveElevatorFloorPlatHandler(int PlatformHelperAnimVar) ;int iFloor, 

	;setValue(elevatordestinationfloor, iFloor)
	ObjectReference PlatformHelper = GetLinkedRef(Elevator_PlatformHelper)
    ;PlatFormHelper.SetAnimationVariableFloat("fvalue", PlatformHelperAnimVar)
   	bElevatorIsAtTop = PlatformHelperAnimVar

endFunction

;***********************************************************

Function MoveElevatorDoorHandler(ObjectReference DoorRef)
	HandleElevatorDoor(DoorRef, 1)
	HandleElevatorDoor(DoorRef, 1)
endFunction

;***********************************************************

Function MoveElevatorMeterHandler(ObjectReference Meter1, ObjectReference Meter2)
	;Meter1.PlayAnimation("Play01")
	;Meter2.PlayAnimation("Play02")
endFunction

;***********************************************************