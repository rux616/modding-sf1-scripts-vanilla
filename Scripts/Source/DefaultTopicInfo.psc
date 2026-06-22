Scriptname DefaultTopicInfo extends TopicInfo Const hidden 
{Master script for the DefaultTopicInfo scripts.

TODO `TTP-27142: Default Script: reimplement DefaultTopicInfo`}

import CommonArrayFunctions

Group Required_Properties
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

	Quest Property QuestToSetStageOn = NONE Auto Const
	{ If this is left blank, stage will be set on topic info's owning quest }
EndGroup

Group Debug_Properties
	Bool Property ShowTraces = FALSE Auto Const
	{Default = FALSE, Set to TRUE if you want the traces in this script to show up in the log.}
EndGroup

Function TryToSetStage()
	DefaultScriptFunctions.Trace(self, "TryToSetStage()", ShowTraces)
	Quest questToSet = QuestToSetStageOn
	if questToSet == None
		questToSet = GetOwningQuest()
	EndIf

	DefaultScriptFunctions.TryToSetStage(	CallingObject = self, \
											ShowNormalTrace = ShowTraces, \
											\
											QuestToSet = questToSet, \
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