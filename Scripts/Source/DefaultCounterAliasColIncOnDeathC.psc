ScriptName DefaultCounterAliasColIncOnDeathC extends DefaultCounterQuestRefColIncOnDeath Default
{Once this ALIAS dies it increments the counter on its Quest's DefaultCounterQuestC script.}

Function Increment(ObjectReference akSenderRef)
	if (MaintainTargetValue)
		(GetOwningQuest() as DefaultCounterQuestC).TargetValue = GetCount()
	EndIf
	(GetOwningQuest() as DefaultCounterQuestC).Increment()
	if (RemoveWhenDead)
		Self.RemoveRef(akSenderRef)
		if (MaintainTargetValue)
			(GetOwningQuest() as DefaultCounterQuestC).Decrement()
		EndIf
	EndIf
	if ((GetCount() <= TargetRemainingCount) && (RemainingStage > -1))
		GetOwningQuest().SetStage(RemainingStage)
	EndIf
EndFunction