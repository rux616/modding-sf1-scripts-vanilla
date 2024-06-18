Scriptname SQ_Env_TutorialQuestScript extends Quest

Struct MagicEffectTutorialDatum
    Keyword TutorialEffectKeyword
    {filter for: ENV_TutorialEffect_*}
    String TutorialEvent
EndStruct 

group Autofill
    SQ_ENV_AfflictionsScript Property SQ_Env Mandatory Const Auto

    Message Property SQ_ENV_TutorialMsgBox_StatusMenu_Afflictions Mandatory Const Auto
    Message Property SQ_ENV_TutorialMsgBox_InventoryMenu_MatchingTreatment Mandatory Const Auto
    FormList Property ENV_AFFL_TreatmentTypeKeywords Mandatory Const Auto

    ActorValue Property Oxygen Mandatory Const Auto
    ActorValue Property CarbonDioxide Mandatory Const Auto

    ActorValue Property EnvDmg Mandatory Const Auto
    ActorValue Property ENV_Damage_Soak Mandatory Const Auto

    Keyword Property ENV_EffectType_AFFL_Affliction Mandatory Const Auto
endgroup

group EnableTutorials

    Quest Property MQ101 Mandatory Const Auto
    int Property EnableStage = 640 Const Auto
endgroup

MagicEffectTutorialDatum[] Property MagicEffectTutorialData Mandatory Const Auto

DefaultTutorialQuestScript TutorialIns

;asEvent strings used by DefaultTutorialQuestScript
string EventString_GainInjury = "GainInjury"
string EventString_MatchingTreatment = "MatchingTreatment"
string EventString_Oxygen = "Oxygen"
string EventString_OxygenOut = "OutOfOxygen"
string EventString_CarbondioxideGain = "GainCarbonDioxide"
string EventString_CarbondioxideMaxed = "MaxedCarbonDioxide"
string EventString_EnvDmgSoak = "EnvDmgSoak"
string EventString_EnvDmg = "EnvDmg"
string EventString_EnvDmgReminder = "EnvDmg3"

;names of menus
string MenuName_StatusMenu = "StatusMenu" const
string MenuName_InventoryMenu = "InventoryMenu" const

int iTutorialState_Unset = 0
int iTutorialState_Started = 1
int iTutorialState_Finished = 2

int AfflictionTutorialState
int TreatmentTutorialState
int TreatmentAcquireTutorialState

bool FirstOxygenTutorialFinished
bool FirstCarbonDioxideTutorialFinished


int TimerID_EnvDmgHealReminder = 1 const
float TimerDur_EnvDmgHealReminder = 60.0 ;not const because it is added to
float TimerDur_TimerDurMax_EnvDmgHealReminder = 960.0 const


float InitialValue_Env_Damage_Soak = 200.0

bool TutorialsEnabled = false

Event OnQuestStarted()
    TutorialIns = (Self as Quest) as DefaultTutorialQuestScript
    RegisterForRemoteEvent(MQ101, "OnStageSet")
EndEvent

Event OnTimer(int aiTimerID)
    if aiTimerID == TimerID_EnvDmgHealReminder
        if game.GetPlayer().GetValue(EnvDmg) > 0 ;only show tutorial until player has healed the EnvDmg
            TutorialIns.ShowHelpMessage(EventString_EnvDmgReminder)

            ;increase the amount of time each time through, until max, then stop reminding player - trying to be helpful, not annoying. ;)
            if TimerDur_EnvDmgHealReminder < TimerDur_TimerDurMax_EnvDmgHealReminder
                TimerDur_EnvDmgHealReminder = TimerDur_EnvDmgHealReminder * 2
                StartTimer(TimerDur_EnvDmgHealReminder, TimerID_EnvDmgHealReminder)
            endif
        endif
    endif
EndEvent

event Quest.OnStageSet(Quest akSender, int auiStageID, int auiItemID)
    Trace(self, "OnStageSet() akSender: " + akSender + ", auiStageID: " + auiStageID)

    if akSender == MQ101 && auiStageID == EnableStage
        EnableTutorials()
        UnregisterForRemoteEvent(MQ101, "OnStageSet")
    endif
EndEvent


Function EnableTutorials()
    Trace(self, "EnableTutorials() ")
    TutorialsEnabled = true
    StartOxygenTutorial()
    StartEnvDmgTutorial()


    ;does the player already have an affliction?
    if SQ_Env.GetActiveAfflictions().Length > 0
        StartAfflictionTutorial()
    endif

    ;does the player have a magic effect that wants to send a tutorial event?
    Actor playerRef = Game.GetPlayer()
    int i = 0
    While (i < MagicEffectTutorialData.length)
        MagicEffectTutorialDatum currentDatum = MagicEffectTutorialData[i]
        
        if playerRef.HasMagicEffectWithKeyword(currentDatum.TutorialEffectKeyword)
            string tutorialEventString = currentDatum.TutorialEvent
            Trace(self, "ShowEffectScriptHelpMessage() EnableTutorials: " + tutorialEventString)
            ((self as quest) as DefaultTutorialQuestScript).ShowHelpMessage(tutorialEventString)
        endif

        i += 1
    EndWhile

    if playerRef.HasMagicEffectWithKeyword(ENV_EffectType_AFFL_Affliction)
        StartAfflictionTutorial()
    endif

EndFunction


;called when gaining an affliction. See ENV_AfflictionScript.Gain()
Function StartAfflictionTutorial()
    if TutorialsEnabled == false
       Trace(self, "StartAfflictionTutorial() but TutorialsEnabled == false. IGNORING.")
        RETURN
    endif

    if AfflictionTutorialState == iTutorialState_Unset
        Trace(self, "StartAfflictionTutorial() AfflictionTutorialState == iTutorialState_Unset")

        AfflictionTutorialState = iTutorialState_Started
        TreatmentTutorialState = iTutorialState_Started
        TreatmentAcquireTutorialState = iTutorialState_Started
    
        TutorialIns.ShowHelpMessage(EventString_GainInjury)
        RegisterForMenuOpenCloseEvent(MenuName_StatusMenu)
        RegisterForMenuOpenCloseEvent(MenuName_InventoryMenu)

        AddInventoryEventFilter(ENV_AFFL_TreatmentTypeKeywords)
        RegisterForRemoteEvent(Game.GetPlayer(), "OnItemAdded")
    endif
EndFunction

Function StartOxygenTutorial()
    Trace(self, "StartOxygenTutorial()")
    Actor playerRef = Game.GetPlayer()
    RegisterForActorValueLessThanEvent(playerRef, Oxygen, 85)
    RegisterForActorValueGreaterThanEvent(playerRef, CarbonDioxide, 25)
EndFunction

Function StartEnvDmgTutorial()
    Trace(self, "StartEnvDmgTutorial()")
    Actor playerRef = Game.GetPlayer()
    RegisterForActorValueLessThanEvent(playerRef, ENV_Damage_Soak, InitialValue_Env_Damage_Soak - 1)
EndFunction


Function ShowEffectScriptHelpMessage(Keyword TutorialEffectKeyword)
    Trace(self, "ShowEffectScriptHelpMessage() TutorialEffectKeyword: " + TutorialEffectKeyword + ", TutorialsEnabled: " + TutorialsEnabled)

    if TutorialsEnabled 
        int foundIndex = MagicEffectTutorialData.FindStruct("TutorialEffectKeyword", TutorialEffectKeyword)

         if foundIndex > -1
            string tutorialEventString = MagicEffectTutorialData[foundIndex].TutorialEvent

            Trace(self, "ShowEffectScriptHelpMessage() tutorialEventString: " + tutorialEventString)
            ((self as quest) as DefaultTutorialQuestScript).ShowHelpMessage(tutorialEventString)
        endif
    endif

EndFunction

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
    Trace(self, "OnActorValueLessThan() akObjRef: " + akObjRef + ", akActorValue: " + akActorValue)
    if akActorValue == Oxygen
        if FirstOxygenTutorialFinished == false
            TutorialIns.ShowHelpMessage(EventString_Oxygen)
            FirstOxygenTutorialFinished = true
            RegisterForActorValueLessThanEvent(Game.GetPlayer(), Oxygen, 20)
        else
            TutorialIns.UnshowHelpMessage(EventString_Oxygen)
            TutorialIns.ShowHelpMessage(EventString_OxygenOut)
        endif

    elseif akActorValue == ENV_Damage_Soak
        TutorialIns.ShowHelpMessage(EventString_EnvDmgSoak)

        ;sometimes things happen too fast...
        Utility.Wait(10) ;minmum display time
        RegisterForActorValueGreaterThanEvent(Game.GetPlayer(), EnvDmg, 1)
    endif
EndEvent

Event OnActorValueGreaterThan(ObjectReference akObjRef, ActorValue akActorValue)
    Trace(self, "OnActorValueGreaterThan() akObjRef: " + akObjRef + ", akActorValue: " + akActorValue)
    if akActorValue == CarbonDioxide
        if FirstCarbonDioxideTutorialFinished == false
            TutorialIns.UnshowHelpMessage(EventString_OxygenOut) ;stop showing O2 message, more important player is warned about dangers of CO2
            TutorialIns.ShowHelpMessage(EventString_CarbondioxideGain)
            FirstCarbonDioxideTutorialFinished = true
            RegisterForActorValueGreaterThanEvent(Game.GetPlayer(), CarbonDioxide, 99)
        else
            TutorialIns.UnshowHelpMessage(EventString_CarbondioxideGain)
            TutorialIns.ShowHelpMessage(EventString_CarbondioxideMaxed)
        endif

    elseif akActorValue == EnvDmg
        TutorialIns.UnshowHelpMessage(EventString_EnvDmgSoak)
        TutorialIns.ShowHelpMessage(EventString_EnvDmg)
        StartTimer(TimerDur_EnvDmgHealReminder, TimerID_EnvDmgHealReminder)
    endif
EndEvent

Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)
    Trace(self, "OnMenuOpenCloseEvent() asMenuName: " + asMenuName + ", abOpening: " + abOpening)

    if abOpening
        ;The Status Menu
        if asMenuName == MenuName_StatusMenu && AfflictionTutorialState == iTutorialState_Started
            TutorialIns.UnshowHelpMessage(EventString_GainInjury) ; this told us to open this menu, we are here, so we should stop showing that
            SQ_ENV_TutorialMsgBox_StatusMenu_Afflictions.Show()
            UnregisterForMenuOpenCloseEvent(MenuName_StatusMenu)
            AfflictionTutorialState = iTutorialState_Finished

        ;The Inventory Menu
        elseif asMenuName == MenuName_InventoryMenu && TreatmentTutorialState == iTutorialState_Started
            bool hasMatchingAfflictionTreatment = SQ_Env.PlayerHasMatchingTreatmentItemForAnActiveAffliction()
            Trace(self, "OnMenuOpenCloseEvent() hasMatchingAfflictionTreatment: " + hasMatchingAfflictionTreatment)

            if hasMatchingAfflictionTreatment
                TutorialIns.UnshowHelpMessage(EventString_MatchingTreatment) ; this told us to open this menu, we are here, so we should stop showing that
                SQ_ENV_TutorialMsgBox_InventoryMenu_MatchingTreatment.Show()
                TreatmentTutorialState = iTutorialState_Finished
                TreatmentAcquireTutorialState = iTutorialState_Finished

                ;we also don't need to tell player when they get one, since they already had one and found it in their inventory
                UnregisterForMenuOpenCloseEvent(MenuName_InventoryMenu)
            endif
        endif
    endif
EndEvent

Event ObjectReference.OnItemAdded(ObjectReference akSender, Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
    Trace(self, "OnItemAdded() akSender: " + akSender + ", akBaseItem: " + akBaseItem + ", aiItemCount: " + aiItemCount + ", akItemReference: " + akItemReference + ", akSourceContainer: " + akSourceContainer + ", aiTransferReason: " + aiTransferReason)
    
    if TreatmentAcquireTutorialState == iTutorialState_Started
        bool hasMatchingAfflictionTreatment = SQ_ENV.FormHasMatchingTreatmentItemForAnActiveAffliction(akBaseItem)

        Trace(self, "OnItemAdded() hasMatchingAfflictionTreatment: " + hasMatchingAfflictionTreatment + ", TreatmentAcquireTutorialState: " + TreatmentAcquireTutorialState)

        if hasMatchingAfflictionTreatment
            TutorialIns.ShowHelpMessage("MatchingTreatment")
            TreatmentAcquireTutorialState = iTutorialState_Finished
        endif
    endif

    if TreatmentAcquireTutorialState == iTutorialState_Finished ;could happen if player goes to inventory with such an item already, no need to tell them when they get another one
        UnregisterForRemoteEvent(Game.GetPlayer(), "OnItemAdded")
    endif    
EndEvent



;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "EnvironmentalGameplay",  string SubLogName = "Tutorials", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "EnvironmentalGameplay",  string SubLogName = "Tutorials", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction