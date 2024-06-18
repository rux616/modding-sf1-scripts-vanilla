Scriptname RI03_SceneDataSetStage extends Scene
{Script for setting a quest's stage from the Scene Data on a scene.}

Group Required_Properties
	Int Property StageToSet = -1 Auto Const Mandatory
	{Stage to set.}
	Quest Property QuestToSet Auto Const Mandatory
	{Quest to set the stage on.}
EndGroup

Group Optional_Properties
	Bool Property SetStageOnEnd = False Auto Const
	{If true, set stage on end. If false, set stage on begin.}

	Int Property PrereqStage = -1 Auto Const
	{Stage that must be set for this script's functionality to execute.}

	Int Property TurnOffStage = -1 Auto Const
	{If stage >= TurnOffStage, this script's functionality is ignored.}

	Int Property TurnOffStageDone = -1 Auto Const
	{If this stage is specfically done, this script's functionality is ignored.}
EndGroup

Group Debug_Properties
	Bool Property ShowTraces = FALSE Auto Const
	{Default = FALSE, Set to TRUE if you want the traces in this script to show up in the log.}
EndGroup

Event OnBegin()
	If !SetStageOnEnd
		DefaultScriptFunctions.Trace(Self, ": OnBegin() Called on SceneDatatSetStage script.", ShowTraces)
		TryToSetStage()
	EndIf
EndEvent

Event OnEnd()
	If SetStageOnEnd
		DefaultScriptFunctions.Trace(Self, ": OnEnd() Called on SceneDataSetStage script.", ShowTraces)
		TryToSetStage()
	EndIf
EndEvent

Function TryToSetStage()
	DefaultScriptFunctions.Trace(Self, "SceneDataSetStage: TryToSetStage()", ShowTraces)
	DefaultScriptFunctions.TryToSetStage(	CallingObject = Self, \
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

