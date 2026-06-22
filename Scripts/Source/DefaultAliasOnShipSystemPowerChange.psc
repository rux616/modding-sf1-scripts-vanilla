Scriptname DefaultAliasOnShipSystemPowerChange extends ReferenceAlias Const Default
{sets stages when the ship in this alias changes system power

Actor values for ship systems:
 SpaceshipBuildableEnginePower
 SpaceshipBuildableThrusterPower
 SpaceshipBuildableShieldPower
 SpaceshipGravJumpPower
}

struct SystemPowerChangeStage
	int StageToSet
	{Stage to Set}

	ActorValue TargetSystem
	{The ship system we're interested in}

	bool SetStageOnlyWhenPowerAdded
	{OPTIONAL - (Default: false) If true, stage will be set only when power is added to this system. If false, stage will be set when any power change is made to this system }

	bool SetStageOnlyFromNormalPowerChange
	{OPTIONAL - (Default: false) If true, stage will be set only when this system power change is not from taking damage. If false, stage will be set when this system changes power for any reason, including system damage}

	Int PrereqStage = -1
	{OPTIONAL - Stage that must be set for this script's functionality to execute for this case}

	Int TurnOffStage = -1
	{OPTIONAL - If stage >= TurnOffStage, this script's functionality is ignored for this case}
endStruct

group SystemPowerChange_Properties
    SystemPowerChangeStage[] property SystemPowerChangeStages auto Const
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

Event OnShipSystemPowerChange(ActorValue akSystem, bool abAddPower, bool abDamageRelated)
	DefaultScriptFunctions.Trace(self, "OnShipSystemPowerChange() akSystem=" + akSystem + ", abAddPower=" + abAddPower + ", abDamageRelated=" + abDamageRelated, ShowTraces)
        Quest myQuest = GetOwningQuest()
        ; first check overall stage properties
        if ( PrereqStage == -1 || myQuest.GetStageDone(PrereqStage) ) && ( TurnOffStage == -1 || myQuest.GetStage() < TurnOffStage )

            ; check stage array for this damage
            int i = 0
            while i < SystemPowerChangeStages.Length
                SystemPowerChangeStage theSystemPowerChange = SystemPowerChangeStages[i]
                if theSystemPowerChange.TargetSystem == akSystem
                    if myQuest.GetStageDone(theSystemPowerChange.StageToSet) == false && ( theSystemPowerChange.PrereqStage == -1 || myQuest.GetStageDone(theSystemPowerChange.PrereqStage) ) && ( theSystemPowerChange.TurnOffStage == -1 || myQuest.GetStage() < theSystemPowerChange.TurnOffStage )
                        ; passes stage checks
                        if theSystemPowerChange.SetStageOnlyWhenPowerAdded == false || abAddPower
                            if theSystemPowerChange.SetStageOnlyFromNormalPowerChange == false || abDamageRelated == false
                            	DefaultScriptFunctions.TryToSetStage(	CallingObject = self, \
																		ShowNormalTrace = ShowTraces, \
																		\
																		QuestToSet = myQuest, \
																		StageToSet = theSystemPowerChange.StageToSet, \
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
                endif
                i += 1
            endwhile
        endif
EndEvent
