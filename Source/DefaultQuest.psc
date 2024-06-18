Scriptname DefaultQuest extends Quest hidden
{Script that other default quest scripts should extend}

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

	ConditionForm Property ConditionFormToTest = None Auto Const
	{ConditionForm that must be true for this script's functionality to execute.}

EndGroup

Group Debug_Properties
    Bool Property ShowTraces = false Auto Const
    {(Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives.}
EndGroup