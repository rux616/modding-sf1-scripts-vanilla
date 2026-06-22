Scriptname GlowingKlaxonLightScript extends ObjectReference

bool property StartOn Auto 
{Whether the lights start on or not.  Default = FALSE}

bool property AutoOff = True Auto
{Whether to have the klaxon automatically turn off or not.  Default = FALSE}

int property AutoOffTime = 10 Auto
{Time before the klaxon automatically turns off.}

Auto State WaitingOff

	Event OnLoad()
  		if (StartOn == TRUE)
  			gotoState("BlockingActivation")
  			PlayLights()
  		endif
	endEvent

	Event OnActivate(ObjectReference akActionRef)
		gotoState("BlockingActivation")
		PlayLights()
	EndEvent

EndState

State WaitingOn

	Event OnActivate(ObjectReference akActionRef)
		gotoState("BlockingActivation")
		StopLights()
	EndEvent

EndState

State BlockingActivation

EndState

Function PlayLights()

		ObjectReference KlaxonLight = Self.GetLinkedRef()
		ObjectReference KlaxonSound = KlaxonLight.GetLinkedRef()
		
		;animate light
		Self.PlayAnimation("Stage2")
		;animate Klaxon
		KlaxonLight.Enable()
		KlaxonLight.PlayAnimation("Stage2")
		;enable sound, have to check to see if they have sounds because some of them don't
		if(KlaxonSound)
			KlaxonSound.enable()
		endif
		if AutoOff
			StartTimer(AutoOffTime, 1)
		endif
		gotoState("WaitingOn")
endFunction

;turns lights off
Function StopLights()

		ObjectReference KlaxonLight = Self.GetLinkedRef()
		ObjectReference KlaxonSound = KlaxonLight.GetLinkedRef()

		;animate light off
		Self.PlayAnimation("Reset")
		;animate Klaxon off
		KlaxonLight.Disable()
		KlaxonLight.PlayAnimation("Reset")
		;disable sound, have to check to see if they have sounds because some of them don't
		if(KlaxonSound)
			KlaxonSound.disable()
		endif
		CancelTimer(1)
		gotoState("WaitingOff")
EndFunction

;Auto-Off timer.
Event OnTimer(int timerID)
	if (timerID == 1)
		StopLights()
	EndIf
EndEvent