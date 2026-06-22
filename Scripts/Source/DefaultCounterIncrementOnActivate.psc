ScriptName DefaultCounterIncrementOnActivate extends ObjectReference Default
{Once this is activated (by the PLAYER) it increments the counter on it's LinkedRef's DefaultCounter script.}

Group Optional_Properties
	Keyword property LinkedRefKeyword Auto Const
	{The keyword of the LinkedRef to the Counter. Defaults to the unnamed linkedref.}

	bool property ShouldToggle Auto Const
	{Optional; defaults to False. Should every other action decrement the counter instead of incrementing it?}
EndGroup

bool decrementNext = False

Auto STATE WaitForActivate
	Event OnActivate(ObjectReference akActionRef)
		if akActionRef == Game.GetPlayer()
			if (!ShouldToggle)
				GoToState("DoneWaiting")
			endif
			if (ShouldToggle && decrementNext)
				(Self.GetLinkedRef(LinkedRefKeyword) As defaultCounter).Decrement()
			else
				(Self.GetLinkedRef(LinkedRefKeyword) As defaultCounter).Increment()
			endif
			if (ShouldToggle)
				decrementNext = !decrementNext
			endif
		endif
	EndEvent
EndSTATE

STATE DoneWaiting
	; Do Nothing
EndSTATE
