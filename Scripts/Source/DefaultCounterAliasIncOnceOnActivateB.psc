ScriptName DefaultCounterAliasIncOnceOnActivateB extends DefaultCounterQuestIncOnceOnActivate Default
{Once this ALIAS is activated (by the PLAYER) it increments the counter on its Quest's DefaultCounterQuestB script}

Function Increment()
	(GetOwningQuest() as DefaultCounterQuestB).Increment()
EndFunction