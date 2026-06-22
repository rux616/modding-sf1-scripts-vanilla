ScriptName DefaultCounterQuest extends DefaultQuest Default hidden
{A simple counter. Place on an Quest, then increment with another script (such as DefaultCounterQuestIncOnDeath, or DefaultCounterQuestIncOnceOnActivate). When the target value is reached (or, optionally, exceeded), the counter sets a Quest Stage.

NOT YET REIMPLEMENTED.
Sorry for the inconvenience.
`TTP-27118: Default Script: reimplement DefaultCounterQuest`
Please alert Jon Paul Duvall and we'll try to make this a priority.
Thanks! :)
}

Group Optional_Properties
	Int Property TargetValue = 0 Auto ;can be set by related script
	{The needed value to trigger this script's functionality.}
EndGroup

int count

Auto STATE AllowCounting
	Function Increment()
		count = count + 1

		; Has count reached it's TargetValue?
		if (count >= TargetValue)
			GoToState("StopCounting")
			DefaultScriptFunctions.TryToSetStage(	CallingObject = self, \
													ShowNormalTrace = ShowTraces, \
													\
													QuestToSet = Self, \
													StageToSet = StageToSet, \
													PrereqStage = PrereqStage, \
													TurnOffStage = TurnOffStage, \
													TurnOffStageDone = TurnOffStageDone, \
													\
													RefToCheck = NONE, \
													PlayerOnly = False, \
													ReferencesToCheckAgainst = NONE, \
													AliasesToCheckAgainst = NONE, \
													FactionsToCheckAgainst = NONE, \
													\
													LocationToCheck = NONE, \
													LocationToCheckOther = NONE, \
													LocationsToCheckAgainst = NONE, \
													LocationAliasesToCheckAgainst = NONE, \
													LocationMatchIfChild = False, \
													\
													CheckAliveActorOrShip = NONE, \
													FailOnDeadActor = False, \
													\
													ConditionFormToTest = NONE )
		
		EndIf
		
	EndFunction


	Function Decrement()
		count = count - 1
	EndFunction
EndSTATE

STATE StopCounting
	; Do Nothing
EndSTATE

Function Increment()
	;Do Nothing
EndFunction

Function Decrement()
	count = count - 1
EndFunction