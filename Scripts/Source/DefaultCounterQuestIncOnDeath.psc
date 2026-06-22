ScriptName DefaultCounterQuestIncOnDeath extends ReferenceAlias Default hidden
{Once this ALIAS dies it increments the counter on its Quest's DefaultCounterQuest script.}

Group Optional_Properties
	Bool Property CheckForOnDyingInstead = FALSE Auto Const
	{If true the Increment will happen when this actor recieves the OnDying() event instead, which happens the instant the actor dies, unlike the
	OnDeath() event which can happen several seconds later.}
	Bool Property SupportRespawning = FALSE Auto Const
	{If true then this script will reset after incrementing in order to allow the next respawned actor that fills it to increment upon death as well.}
EndGroup

Auto STATE WaitingForDeath
	Event OnDeath(ObjectReference akKiller)
		if !CheckForOnDyingInstead
			if !SupportRespawning
				GoToState("AlreadyDied")
			else
				;Do nothing, and fire again upon this aliases next OnDeath() event.
			endif
			Increment()
		endif
	EndEvent

	Event OnDying(ObjectReference akKiller)
		if CheckForOnDyingInstead
			if !SupportRespawning
				GoToState("AlreadyDied")
			else
				;Do nothing, and fire again upon this aliases next OnDeath() event.
			endif
			Increment()
		endif
	EndEvent

EndSTATE

Function Increment()
	(GetOwningQuest() as DefaultCounterQuest).Increment()
EndFunction

STATE AlreadyDied
	; Do Nothing
EndSTATE
