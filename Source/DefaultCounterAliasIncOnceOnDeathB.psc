ScriptName DefaultCounterAliasIncOnceOnDeathB extends DefaultCounterQuestIncOnDeath Default
{Once this ALIAS dies it increments the counter on its Quest's DefaultCounterQuestB script.}

Function Increment()
	(GetOwningQuest() as DefaultCounterQuestB).Increment()
EndFunction