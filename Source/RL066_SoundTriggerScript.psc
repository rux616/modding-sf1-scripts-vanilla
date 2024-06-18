ScriptName RL066_SoundTriggerScript Extends ObjectReference Default
{Plays a random sound at a random interval}

Group Required_Properties
	WwiseEvent[] property SoundToPlayEvent Auto Const Mandatory
	{The sounds to be played.}

	Keyword property LinkCustom01 Auto Const
	{play the sound from this link}

	Bool property StopSound = FALSE Auto
	{stops playing sounds if true}
EndGroup

;*****************************************************

Auto State Waiting
	Event OnTriggerEnter(ObjectReference triggerRef)
		if (triggerRef == Game.GetPlayer())
			ObjectReference soundSource = GetLinkedRef(LinkCustom01)
			if (soundSource == None)
				soundSource = triggerRef
			EndIf
			While(StopSound == FALSE)
				int index = Utility.RandomInt(0, SoundToPlayEvent.Length - 1)
				SoundToPlayEvent[index].Play(soundSource)
				;Debug.Notification("Playing sound from " +soundSource)
				float waitTime = Utility.RandomFloat(1.0, 5.0)
				Utility.Wait(waitTime)
			EndWhile

			if (StopSound == TRUE)
				;stop the sounds and go to done state
				GoToState("Done")
			EndIf
		EndIf
	EndEvent
EndState

;*****************************************************

State Done
	; do nothing
EndState