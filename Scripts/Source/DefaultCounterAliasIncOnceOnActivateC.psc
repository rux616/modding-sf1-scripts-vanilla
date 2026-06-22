ScriptName DefaultCounterAliasIncOnceOnActivateC extends DefaultCounterQuestIncOnceOnActivate Default
{Once this ALIAS is activated (by the PLAYER) it increments the counter on its Quest's DefaultCounterQuestC script}

Function Increment()
	(GetOwningQuest() as DefaultCounterQuestC).Increment()
EndFunction