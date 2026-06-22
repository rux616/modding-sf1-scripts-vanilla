ScriptName DefaultCounterAliasIncOnceOnDeathA extends DefaultCounterQuestIncOnDeath Default
{Once this ALIAS dies it increments the counter on its Quest's DefaultCounterQuestA script.}

Function Increment()
	(GetOwningQuest() as DefaultCounterQuestA).Increment()
EndFunction