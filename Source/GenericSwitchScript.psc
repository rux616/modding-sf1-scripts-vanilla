Scriptname GenericSwitchScript extends ObjectReference
{Script for controlling the state and color of generic switches.}

Group OptionalProperties
	String property CurrentState = "On" Auto
	{DEFAULT=On. The switch's current state.
	Available states: Off, On, Pulse, PulseFast, Flicker}
	
	String property CurrentColor = "Green" Auto
	{DEFAULT=Green. The switch's current color.
	Available colors: Green, Red, Blue, Orange, Yellow, White, Violet.}

	Keyword property ParentSwitchLink Auto Const
	{DEFAULT=None. If not none, if this switch is linked to another switch with this keyword, register for events on that switch.}
EndGroup

;Local Variables & Properties
bool initialized
bool property HasParentSwitch Auto Hidden
bool property IsParentSwitch Auto Hidden

;Custom Events
CustomEvent SetColorEvent
CustomEvent SetStateEvent


Event OnCellLoad()
	if (!initialized)
		initialized = True
		if (ParentSwitchLink != None)
			GenericSwitchScript parentSwitch = GetLinkedRef(ParentSwitchLink) as GenericSwitchScript
			if (parentSwitch != None)
				HasParentSwitch = True
				parentSwitch.IsParentSwitch = True
				RegisterForCustomEvent(parentSwitch, "SetColorEvent")
				RegisterForCustomEvent(parentSwitch, "SetStateEvent")
				SetColor(parentSwitch.CurrentColor)
				SetState(parentSwitch.CurrentState)
			EndIf
		EndIf
	EndIf
	if (!HasParentSwitch)
		SetColor(CurrentColor)
		SetState(CurrentState)
	EndIf
EndEvent


Event GenericSwitchScript.SetColorEvent(GenericSwitchScript akSender, Var[] akArgs)
	SetColor(akArgs[0] as String)
EndEvent

Function SetColor(String newColor)
	if (IsParentSwitch)
		Var[] akArgs = new Var[1]
		akArgs[0] = newColor
		SendCustomEvent("SetColorEvent", akArgs)
	EndIf
	if ((newColor == "Green") || (newColor == "Red") || (newColor == "Blue") || (newColor == "Orange") || \
		(newColor == "Yellow") || (newColor == "White") || (newColor == "Violet"))
		CurrentColor = newColor
		PlayAnimationIfLoaded("TurnColor" + newColor)
	Else
		Debug.Trace("ERROR: " + newColor + " is not a supported color.", 2)
	EndIf
EndFunction


Event GenericSwitchScript.SetStateEvent(GenericSwitchScript akSender, Var[] akArgs)
	SetState(akArgs[0] as String)
EndEvent

Function SetState(String newState)
	if (IsParentSwitch)
		Var[] akArgs = new Var[1]
		akArgs[0] = newState
		SendCustomEvent("SetStateEvent", akArgs)
	EndIf
	if (newState == "Off")
		CurrentState = newState
		PlayAnimationIfLoaded("TurnOffFull")
	ElseIf (newState == "On")
		CurrentState = newState
		PlayAnimationIfLoaded("TurnOnFull")
	ElseIf (newState == "Pulse")
		CurrentState = newState
		PlayAnimationIfLoaded("TurnOnPulse")
	ElseIf (newState == "PulseFast")
		CurrentState = newState
		PlayAnimationIfLoaded("TurnOnPulseFast")
	ElseIf (newState == "Flicker")
		CurrentState = newState
		PlayAnimationIfLoaded("TurnOnFlicker")
	Else
		Debug.Trace("ERROR: " + newState + " is not a supported state.", 2)
	EndIf
EndFunction

Function PlayAnimationIfLoaded(String animationToPlay)
	if (Is3DLoaded())
		PlayAnimation(animationToPlay)
	EndIf
EndFunction