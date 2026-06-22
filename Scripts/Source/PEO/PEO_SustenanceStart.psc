Scriptname PEO:PEO_SustenanceStart extends Quest
{Attached to SQ_PEO_Sustenance Quest}

Group Autofill
    Quest Property MQ101 Mandatory Const Auto
    Quest Property MQ402 Mandatory Const Auto
    GlobalVariable Property PEO_Sustenance_GV Mandatory Auto
    GameplayOption Property PEO_GPO_Sustenance Mandatory  Const Auto
EndGroup

int Property SustenanceStartStage = 100 Const Auto ;This is the stage that the player consumes the potions on Sustenance Start and allows the player to start with Positive buffs one time
int Property MainQuestStage = 310 Const Auto
int Property UnityStage = 100 Const Auto

Event OnQuestStarted()

        RegisterForRemoteEvent(MQ101, "OnStageSet")
        RegisterForRemoteEvent(MQ402, "OnStageSet")
        RegisterForGameplayOptionChangedEvent()
        CallStage()

EndEvent

Event Quest.OnStageSet(Quest aksender, int auiStageID, int auiItemID)

    if ((akSender == MQ101) && (auiStageID == MainQuestStage)) || ((akSender == MQ402) && (auiStageID == UnityStage))
        CallStage()
    EndIf

EndEvent

Event OnGameplayOptionChanged(GameplayOption[] aChangedOptions)

    if aChangedOptions.Find(PEO_GPO_Sustenance) >= 0
        CallStage()
    endif

EndEvent

Function CallStage()

    int SustenanceSetting = PEO_Sustenance_GV.GetValueInt()

    if (GetStageDone(SustenanceStartStage) == false && SustenanceSetting != 0 && MQ101.IsStageDone(MainQuestStage)) || MQ402.IsRunning()

        SetStage(SustenanceStartStage)
        UnregisterForGameplayOptionChangedEvent()

    EndIf

EndFunction