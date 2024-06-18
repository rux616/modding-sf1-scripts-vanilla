ScriptName DefaultCounterQuestRefColIncOnDestroyA extends DefaultCounterQuestRefColIncOnDestroy Default
{Once this ALIAS dies it increments the counter on its Quest's DefaultCounterQuestA script.}

Function Increment(ObjectReference akSenderRef)
	if (MaintainTargetValue)
		(GetOwningQuest() as DefaultCounterQuestA).TargetValue = GetCount()
	EndIf
	(GetOwningQuest() as DefaultCounterQuestA).Increment()
	if (RemoveWhenDestroyed)
		Self.RemoveRef(akSenderRef)
		if (MaintainTargetValue)
			(GetOwningQuest() as DefaultCounterQuestA).Decrement()
		EndIf
	EndIf
	if ((GetCount() <= TargetRemainingCount) && (RemainingStage > -1))
		GetOwningQuest().SetStage(RemainingStage)
	EndIf
EndFunction