Scriptname DefaultAliasOnTriggerEnterMultiActor extends DefaultAlias Conditional Default
{Default script that sets a stage once all of the specified actors are in a trigger.

NOT YET FULLY REIMPLEMENTED.
It will test for stages but not other criteria.
Sorry for the inconvenience.
`Jira 301895: Default Script: fully implement DefaultAliasOnTriggerEnterMultiActor `
Please alert Jon Paul Duvall and we'll try to make this a priority.
Thanks! :)
}

Group Required_Properties
	ReferenceAlias[] property TriggerAliases Auto Const Mandatory
	{Ref Aliases the trigger is looking for. All of these actors must be in the trigger in order to set the stage.}
EndGroup

Group Optional_Properties
	bool property DisableWhenTriggered = True Auto Const
	{Delete this trigger once triggered.}
EndGroup

;Are all TriggerAliases in this trigger?
bool property AllTargetsInTrigger = False Auto Hidden Conditional

;Custom event to broadcast when changing from 'Not All Aliases in Trigger' to 'All Aliases in Trigger', or vice-versa.
CustomEvent MultiActorTriggerReady

;Lock variables
bool lock_CheckTargets


Event OnTriggerEnter(ObjectReference triggerRef)
	if (CommonArrayFunctions.FindInReferenceAliasArray(triggerRef, TriggerAliases) >= 0)
		CheckForTargetsInTrigger()
	EndIf
EndEvent

Event OnTriggerLeave(ObjectReference triggerRef)
	if (CommonArrayFunctions.FindInReferenceAliasArray(triggerRef, TriggerAliases) >= 0)
		CheckForTargetsInTrigger()
	EndIf
EndEvent


Function CheckForTargetsInTrigger()
	;Lock to prevent conflicts over AllTargetsInTrigger.
	While (lock_CheckTargets)
		Utility.Wait(0.1)
	EndWhile
	lock_CheckTargets = True

	;Update AllTargetsInTrigger.
	bool oldAllTargetsInTrigger = AllTargetsInTrigger
	AllTargetsInTrigger = AreAllTargetsInTrigger()

	;If all of our targets are in the trigger, try to set our stage.
	if (AllTargetsInTrigger)
		DefaultScriptFunctions.Trace(self, "DefaultAliasOnTriggerEnterMultiActor setting stage " + StageToSet, ShowTraces)
		DefaultScriptFunctions.TryToSetStage(	CallingObject = self, \
												ShowNormalTrace = ShowTraces, \
												\
												QuestToSet = GetOwningQuest(), \
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

		if (DisableWhenTriggered)
			TryToDisable()
		EndIf
	EndIf

	;If we've changed state, send our custom event.
	if (oldAllTargetsInTrigger != AllTargetsInTrigger)
		Var[] akArgs = new Var[1]
		akArgs[0] = AllTargetsInTrigger
		SendCustomEvent("MultiActorTriggerReady", akArgs)
	EndIf

	lock_CheckTargets = False
EndFunction

bool Function AreAllTargetsInTrigger()
	ObjectReference[] triggerRefs = new ObjectReference[TriggerAliases.Length]
	int i = 0
	While (i < TriggerAliases.Length)
		triggerRefs[i] = TriggerAliases[i].GetRef()
		i = i + 1
	EndWhile

	return GetRef().AreAllInTrigger(triggerRefs)
EndFunction