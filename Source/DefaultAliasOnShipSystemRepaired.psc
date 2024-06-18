Scriptname DefaultAliasOnShipSystemRepaired extends ReferenceAlias Const Default
{sets stages when the ship in this alias repairs system damage

Actor values for ship systems:
 SpaceshipBuildableEnginePower
 SpaceshipBuildableThrusterPower
 SpaceshipBuildableShieldPower
 SpaceshipGravJumpPower
}

struct SystemRepairStage
	int StageToSet
	{Stage to Set}

	ActorValue TargetSystem
	{The ship system we're interested in}

	bool SetStageOnlyFromNormalDamage
	{(Default: false) If true, stage will be set only when this system repairs "real" (non-EM weapon) damage. If false, stage will be set when this system repairs any damage including EM damage}

	Int PrereqStage = -1
	{OPTIONAL - Stage that must be set for this script's functionality to execute for this case}

	Int TurnOffStage = -1
	{OPTIONAL - If stage >= TurnOffStage, this script's functionality is ignored for this case}
	endStruct

group SystemDamage_Properties
    SystemRepairStage[] property SystemRepairStages auto Const
    { array of stage/system data }
endGroup

Group Optional_Properties
	Int Property PrereqStage = -1 Auto Const
	{Stage that must be set for this script's functionality to execute}

	Int Property TurnOffStage = -1 Auto Const
	{If stage >= TurnOffStage, this script's functionality is ignored}

	Int Property TurnOffStageDone = -1 Auto Const
	{If this stage is specfically done, this script's functionality is ignored}
EndGroup

Group Debug_Properties
    Bool Property ShowTraces = false Auto Const
    {(Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives.}
EndGroup

Event OnShipSystemRepaired(ActorValue akSystem, int aBlocksGained, bool aElectromagneticDamage)
	DefaultScriptFunctions.Trace(self, "OnShipSystemRepaired() akSystem=" + akSystem + ", aBlocksGained=" + aBlocksGained + ", aElectromagneticDamage=" + aElectromagneticDamage, ShowTraces)
        Quest myQuest = GetOwningQuest()
        ; first check overall stage properties
        if ( PrereqStage == -1 || myQuest.GetStageDone(PrereqStage) ) && ( TurnOffStage == -1 || myQuest.GetStage() < TurnOffStage )

            ; check stage array for this repair
            int i = 0
            while i < SystemRepairStages.Length
                SystemRepairStage theSystemRepair = SystemRepairStages[i]
                if theSystemRepair.TargetSystem == akSystem
                    if myQuest.GetStageDone(theSystemRepair.StageToSet) == false && ( theSystemRepair.PrereqStage == -1 || myQuest.GetStageDone(theSystemRepair.PrereqStage) ) && ( theSystemRepair.TurnOffStage == -1 || myQuest.GetStage() < theSystemRepair.TurnOffStage )
                        ; passes stage checks
                        if theSystemRepair.SetStageOnlyFromNormalDamage == false || aElectromagneticDamage == false
                            DefaultScriptFunctions.TryToSetStage(	CallingObject = self, \
																		ShowNormalTrace = ShowTraces, \
																		\
																		QuestToSet = myQuest, \
																		StageToSet = theSystemRepair.StageToSet, \
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
                        endif
                    endif
                endif
                i += 1
            endwhile
        endif
EndEvent
