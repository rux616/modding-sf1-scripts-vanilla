Scriptname DefaultRefOnTriggerEnterMultiActor extends DefaultOnEnterMultiActor conditional default
{sets a quest stage when the specified multiple actors enter a trigger

NOT YET FULLY REIMPLEMENTED.
It will test for stages but not other criteria.
Sorry for the inconvenience.
`TTP-27123: Default Script: fully implement DefaultRefOnTriggerEnterMultiActor`
Please alert Jon Paul Duvall and we'll try to make this a priority.
Thanks! :)
}

import CommonArrayFunctions

Group Required_Properties
	Quest Property QuestToSet Auto Const Mandatory
	{Quest containing the Stage to set}

	Int Property StageToSet = -1 Auto Const Mandatory
	{Stage to Set}
EndGroup

Group Optional_Properties
	Int Property PrereqStage = -1 Auto Const
	{Stage that must be set for this script's functionality to execute}

	Int Property TurnOffStage = -1 Auto Const
	{If stage >= TurnOffStage, this script's functionality is ignored}

	Int Property TurnOffStageDone = -1 Auto Const
	{If this stage is specfically done, this script's functionality is ignored}

	bool property DeleteWhenDone = True  auto
	{If true (default) will delete itself triggered.}
EndGroup

Function TryToSetStage(Bool PlayerCheckOverride = FALSE, ObjectReference RefToCheck = NONE, Form FormToCheck = NONE, ObjectReference[] ReferenceArray = NONE, ReferenceAlias[] AliasArray = NONE, Faction[] FactionArray = NONE, Form[] FormArray = NONE, Location[] LocationArray = NONE, LocationAlias[] LocationAliasArray = NONE, bool LocationMatchIfChild = false)
	DefaultScriptFunctions.Trace(self, "DefaultRef: TryToSetStage()", ShowTraces)
	DefaultScriptFunctions.TryToSetStage(	CallingObject = self, \
												ShowNormalTrace = ShowTraces, \
												\
												QuestToSet = QuestToSet, \
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

EndFunction

; what happens when all my targets are in the trigger?
; override on subclass to change behavior
function TriggerMe()
	TryToSetStage()
	if DeleteWhenDone && QuestToSet.GetStageDone(StageToSet)
		Delete()
	endif
	parent.TriggerMe()
endFunction