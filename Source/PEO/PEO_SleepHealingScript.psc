Scriptname PEO:PEO_SleepHealingScript extends Quest

Group Autofill
    ConditionForm Property PEO_SleepHeal_HardDifficultyLocations Mandatory Const Auto
    SQ_ENV_AfflictionsScript Property SQ_ENV Mandatory Const Auto
    ActorValue Property HealthAV Mandatory Const Auto
    GlobalVariable Property PEO_SleepHealing_GV Mandatory Const Auto
EndGroup

Group Restore_Health_Data
    float Property RestorePartialHealthAmountPercentage = 0.5 Const Auto 
    float Property FullSleepTime = 0.33 Const Auto ; this comes out to 7.92 hours which will meet the criteria of sleeping 8 hours
EndGroup

float SleepStartTime = 0.0

Event OnQuestInit()

    RegisterForPlayerSleep()

EndEvent

Event OnPlayerSleepStart(float afSleepStartTime, float afDesiredSleepEndTime, ObjectReference akBed)

    SleepStartTime = afSleepStartTime

EndEvent

Event OnPlayerSleepStop(bool abInterrupted, ObjectReference akBed); This logic controls when the player does and does not heal based on which slider is active. 
;There is a condition form Labeled PEO_SleepHeal_Healing that controls when the player heals while sleeping
    int SleepHealingSetting = PEO_SleepHealing_GV.GetValueInt()

    If SleepHealingSetting == 0 ; EASY: Full Heal and cure all afflictions 

        SQ_ENV.CureAllAfflictions()

    ;SleepHealingSetting == 1 ; MEDIUM: Default healing - Full Heal, no afflictions

    ElseIf SleepHealingSetting == 2 && PEO_SleepHeal_HardDifficultyLocations.IsTrue(Game.GetPlayer()) ; HARD: Heal in outpost, settlements, and ships; Limited Healing if less than 8 hours

        SleepHealing()

    ;SleepHealingSetting == 3 ; VERY HARD: Do not Heal

    EndIf

EndEvent

float Function TrackTotalSleep()

    float currentTime = Utility.GetCurrentGameTime()
    float TotalSleep = currentTime - SleepStartTime

    RETURN TotalSleep

EndFunction

Function SleepHealing()

    ObjectReference PlayerRef = Game.GetPlayer()
    float MaxHealth = PlayerRef.GetBaseValue(HealthAV)
    float AmountToRestore = 9999
   
    float TotalSleep = TrackTotalSleep()

    if TotalSleep < FullSleepTime

        float PartialRestore = (MaxHealth * RestorePartialHealthAmountPercentage)
        AmountToRestore = PartialRestore

    EndIf

    PlayerRef.RestoreValue(HealthAV, AmountToRestore)

EndFunction
