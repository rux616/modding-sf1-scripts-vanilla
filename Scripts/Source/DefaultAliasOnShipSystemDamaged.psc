Scriptname DefaultAliasOnShipSystemDamaged extends ReferenceAlias Const Default
{sets stages when the ship in this alias takes system damage

Actor values for ship systems:
 SpaceshipBuildableEnginePower
 SpaceshipBuildableThrusterPower
 SpaceshipBuildableShieldPower
 SpaceshipGravJumpPower
}

struct SystemDamageStage
    int StageToSet
    {Stage to Set}

    ActorValue TargetSystem
    {The ship system we're interested in}

    bool SetStageOnlyWhenFullyDamaged
    {OPTIONAL - (Default: false) if true, stage will be set only when this system is fully damaged. If false, stage will be set when this system takes any damage}

    bool SetStageOnlyFromNormalDamage
    {OPTIONAL - (Default: false) If true, stage will be set only when this system takes "normal" (non-EM weapon) damage. If false, stage will be set when this system takes damage including EM damage}

    Int PrereqStage = -1
    {OPTIONAL - Stage that must be set for this script's functionality to execute for this case}

    Int TurnOffStage = -1
    {OPTIONAL - If stage >= TurnOffStage, this script's functionality is ignored for this case}

endStruct

group SystemDamage_Properties
    SystemDamageStage[] property SystemDamageStages auto Const
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
    Bool Property ShowTraces = FALSE Auto Const
    {(Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives.}
EndGroup

Event OnShipSystemDamaged(ActorValue akSystem, int aBlocksLost, bool aElectromagneticDamage, bool aFullyDamaged)
    DefaultScriptFunctions.Trace(self, "OnShipSystemDamaged() akSystem=" + akSystem + ", aBlocksLost=" + aBlocksLost + ", aElectromagneticDamage=" + aElectromagneticDamage + ", aFullyDamaged=" + aFullyDamaged, ShowTraces)
        Quest myQuest = GetOwningQuest()
        ; first check overall stage properties
        if ( PrereqStage == -1 || myQuest.GetStageDone(PrereqStage) ) && ( TurnOffStage == -1 || myQuest.GetStage() < TurnOffStage )

            ; check stage array for this damage
            int i = 0
            while i < SystemDamageStages.Length
                SystemDamageStage theSystemDamage = SystemDamageStages[i]
                if theSystemDamage.TargetSystem == akSystem
                    if myQuest.GetStageDone(theSystemDamage.StageToSet) == false && ( theSystemDamage.PrereqStage == -1 || myQuest.GetStageDone(theSystemDamage.PrereqStage) ) && ( theSystemDamage.TurnOffStage == -1 || myQuest.GetStage() < theSystemDamage.TurnOffStage )
                        ; passes stage checks
                        if theSystemDamage.SetStageOnlyFromNormalDamage == false || aElectromagneticDamage == false
                            if theSystemDamage.SetStageOnlyWhenFullyDamaged == false || aFullyDamaged
                                DefaultScriptFunctions.TryToSetStage(   CallingObject = self, \
                                                                        ShowNormalTrace = ShowTraces, \
                                                                        \
                                                                        QuestToSet = myQuest, \
                                                                        StageToSet = theSystemDamage.StageToSet, \
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
