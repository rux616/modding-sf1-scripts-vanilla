ScriptName DefaultCounterAliasIncOnceOnDeathC extends DefaultCounterQuestIncOnDeath Default
{Once this ALIAS dies it increments the counter on its Quest's DefaultCounterQuestC script.}

Function Increment()
	(GetOwningQuest() as DefaultCounterQuestC).Increment()
EndFunction