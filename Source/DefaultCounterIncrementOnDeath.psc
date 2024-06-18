ScriptName DefaultCounterIncrementOnDeath extends Actor Default
{Once this actor dies it increments the counter on it's LinkedRef's DefaultCounter script.}

Group Optional_Properties
	Keyword property LinkedRefKeyword Auto Const Mandatory
	{The keyword of the LinkedRef to the Counter. Defaults to the unnamed linkedref.}

	Bool Property CheckForOnDyingInstead = FALSE Auto Const
	{If true the Increment will happen when this actor recieves the OnDying() event instead, which happens the instant the actor dies, unlike the
	OnDeath() event which can happen several seconds later.}
EndGroup

Auto STATE WaitingForDeath
	Event OnDeath(ObjectReference akKiller)
		if !CheckForOnDyingInstead
			GoToState("AlreadyDied")
			(Self.GetLinkedRef(LinkedRefKeyword) As defaultCounter).Increment()
		endif
	EndEvent

	Event OnDying(ObjectReference akKiller)
		if CheckForOnDyingInstead
			GoToState("AlreadyDied")
			(Self.GetLinkedRef(LinkedRefKeyword) As defaultCounter).Increment()
		endif
	EndEvent

EndSTATE

STATE AlreadyDied
	; Do Nothing
EndSTATE
