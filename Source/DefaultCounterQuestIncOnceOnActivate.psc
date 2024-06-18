ScriptName DefaultCounterQuestIncOnceOnActivate extends ReferenceAlias Default hidden
{Once this ALIAS is activated (by the PLAYER) it increments the counter on its Quest's DefaultCounterQuest script}

Auto STATE WaitForActivate
	Event OnActivate(ObjectReference akActionRef)
		if akActionRef == Game.GetPlayer()
			GoToState("DoneWaiting")
			Increment()
		endif
	EndEvent
EndSTATE

Function Increment()
	(GetOwningQuest() as DefaultCounterQuest).Increment()
EndFunction

STATE DoneWaiting
	; Do Nothing
EndSTATE
