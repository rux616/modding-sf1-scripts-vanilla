ScriptName DefaultCounterAliasColIncOnDeathE extends DefaultCounterQuestRefColIncOnDeath Default
{Once this ALIAS dies it increments the counter on its Quest's DefaultCounterQuestE script.}

Function Increment(ObjectReference akSenderRef)
	if (MaintainTargetValue)
		(GetOwningQuest() as DefaultCounterQuestE).TargetValue = GetCount()
	EndIf
	(GetOwningQuest() as DefaultCounterQuestE).Increment()
	if (RemoveWhenDead)
		Self.RemoveRef(akSenderRef)
		if (MaintainTargetValue)
			(GetOwningQuest() as DefaultCounterQuestE).Decrement()
		EndIf
	EndIf
	if ((GetCount() <= TargetRemainingCount) && (RemainingStage > -1))
		GetOwningQuest().SetStage(RemainingStage)
	EndIf
EndFunction