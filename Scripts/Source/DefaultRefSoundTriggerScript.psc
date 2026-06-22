ScriptName DefaultRefSoundTriggerScript Extends ObjectReference Default
{Plays a sound when a ref enters the trigger.}

Group Required_Properties
	WwiseEvent property SoundToPlayEvent Auto Const Mandatory
	{The sound to be played.}
EndGroup

Group Optional_Properties
	bool property PlayerTriggerOnly = True Auto Const
	{DEFAULT: True. Should we trigger this for the player only?}

	bool property UseLinkKeyword = True Auto Const
	{DEFAULT: True. If True, play the sound using the LinkKeyword (next item). If False, just play the sound from this ref.}

	bool property PlayOnceOnly = True Auto Const
	{DEFAULT: True. Should we play this sound only once?}

	Keyword property LinkKeyword Auto Const
	{DEFAULT: NONE. If this is linked to another ref with keyword LinkKeyword, play the sound from that ref. Otherwise, play the sound from the triggering ref.} 
EndGroup

Auto State Waiting
	Event OnTriggerEnter(ObjectReference triggerRef)
		if (!PlayerTriggerOnly || (triggerRef == Game.GetPlayer()))
			if (PlayOnceOnly)
				GoToState("Done")
			EndIf
			ObjectReference soundSource
			if (UseLinkKeyword)
				soundSource = GetLinkedRef(LinkKeyword)
				if (soundSource == None)
					soundSource = triggerRef
				EndIf
			Else
				soundSource = Self
			EndIf
			SoundToPlayEvent.Play(soundSource)
		EndIf
	EndEvent
EndState

State Done

EndState