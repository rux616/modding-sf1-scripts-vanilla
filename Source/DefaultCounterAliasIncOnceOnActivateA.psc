ScriptName DefaultCounterAliasIncOnceOnActivateA extends DefaultCounterQuestIncOnceOnActivate Default
{Once this ALIAS is activated (by the PLAYER) it increments the counter on its Quest's DefaultCounterQuestA script}

Function Increment()
	(GetOwningQuest() as DefaultCounterQuestA).Increment()
EndFunction