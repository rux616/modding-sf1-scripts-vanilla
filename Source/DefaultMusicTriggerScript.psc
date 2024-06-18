ScriptName DefaultMusicTriggerScript Extends ObjectReference Default

Group Required
	Int Property MusicTypeToPlay = 0 Auto Const
	{Set this to the Music you want triggered
		0 = Dread
		1 = Reveal
		2 = Reward
		3 = Stinger}

	Bool Property PlayShortVersion = FALSE Auto Const
	{Whether or not to play the short version of the MusicTypeToPlay.}

	MusicType Property MusicOverride Auto Const
	{Select a specific Music Type to play, will override any other setting on this script.}
EndGroup

Group NoTouchy CollapsedOnRef
	MusicType[] Property Music Auto Const
	MusicType[] Property MusicShort Auto Const
EndGroup

Auto State Waiting
	Event OnTriggerEnter(ObjectReference TriggerRef)
		Debug.Trace(Self + ": was triggered by " + TriggerRef)
		if MusicOverride
			GoToState("Done")
			Debug.Trace(Self + ": Adding MusicType " + MusicOverride)
			MusicOverride.Add()
		else
			GoToState("Done")
			if PlayShortVersion
				Debug.Trace(Self + ": Adding MusicType " + MusicShort[MusicTypeToPlay])
				MusicShort[MusicTypeToPlay].Add()
			else
				Debug.Trace(Self + ": Adding MusicType " + Music[MusicTypeToPlay])
				Music[MusicTypeToPlay].Add()
			endif
		endif
	EndEvent
EndState

State Done

EndState
