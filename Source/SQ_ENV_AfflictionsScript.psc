Scriptname SQ_ENV_AfflictionsScript extends Quest

Group Autofill
    SQ_EnvScript Property SQ_ENV Mandatory Const Auto
    Message Property ENV_AFFL_Cured_Msg Mandatory Const Auto
    Message Property ENV_AFFL_AttemptedToCure_Msg Mandatory Const Auto
    Message Property ENV_AFFL_Gained_Msg Mandatory Const Auto
    Message Property ENV_AFFL_Worsened_Msg Mandatory Const Auto
    Message Property ENV_AFFL_Improved_Msg Mandatory Const Auto
    Message Property ENV_AFFL_Improved_Severity_Msg Mandatory Const Auto
    GlobalVariable Property ENV_AFFL_InfectionSpreadAllowed Mandatory Const Auto
    GlobalVariable Property ENV_AFFL_WorsenAllowed Mandatory Const Auto
    GlobalVariable Property PEO_AfflictionTreatment_GV Mandatory Const Auto

    ActorValue Property ENV_AFFL_Treatment_CureChance_Infection Mandatory Const Auto
    ActorValue Property ENV_AFFL_Treatment_CureChance_Injury Mandatory Const Auto
EndGroup

Struct FallingAfflictionDatum
    ENV_AfflictionScript Affliction
    bool SmallFall
    bool MediumFall
    bool LargeFall
EndStruct

Env_AfflictionScript[] Property AfflictionData Mandatory Const Auto

FallingAfflictionDatum[] Property FallingAfflictionData Mandatory Const Auto


;Duration set in GetTimerDuration()
float SystemDuration = 150.0 const ;in seconds - how often do we want each system to fire?
float TimerDur_Override = -1.0 ;can change with debug command to make go faster: DebugSetTimerDuration()

int NumberOfSystems = 4 const ;how many systems do we account for (4 is Cure, Infection, Worsen, and Improve)
int iNextSystem ;For "round robin" style handling
int iSystem_Cure = 0 const
int iSystem_Infection = 1 const ;NOTE: this system is being removed from the core shipping game, gated behind a global for potential future use.
int iSystem_Worsen = 2 const ;NOTE: currently nothing worsens. See note on ENV_AfflictionScript.AttemptToWorsen()
int iSystem_Improve = 3 const

int DebugDieRoll_Cure = -1
int DebugDieRoll_Worsen = -1 
int DebugDieRoll_Infection = -1 
int DebugDieRoll_Improve = -1 

Event OnQuestInit()
    Trace(self, "OnQuestInit() ")
    StartAfflictionTimer(self)
EndEvent

Event OnTimer(int aiTimerID)
    Trace(self, "OnTimer() aiTimerID: " + aiTimerID)
    HandleTimer()
EndEvent

bool Function IsInfectionSpreadAllowed()
    bool returnVal = ENV_AFFL_InfectionSpreadAllowed.GetValueInt() != 0
    Trace(self, "IsInfectionSpreadAllowed() returnVal: " + returnVal)
    return returnVal
EndFunction

bool Function IsWorsenAllowed()
    bool returnVal = ENV_AFFL_WorsenAllowed.GetValueInt() != 0
    Trace(self, "IsWorsenAllowed() returnVal: " + returnVal)
    return returnVal
EndFunction

Function StartAfflictionTimer(ScriptObject CallingObject) ;can be called externally by ENV_AFflictionScript - when adding a new affliction, so that you never add one and immediately cure it or get infected by it
    Trace(self, "StartAfflictionTimer() CallingObject: " + CallingObject)
    StartTimer(GetTimerDuration())
EndFunction


float Function GetTimerDuration()
    Trace(self, "GetTimerDuration()")

    float returnVal = SystemDuration / NumberOfSystems   ;so that each system runs once every SystemDuration, but systems are intertwined so they don't all hit at once
    if TimerDur_Override > -1
        Trace(self, "GetTimerDuration() returnVal = TimerDur_Override: " + TimerDur_Override)
        returnVal = TimerDur_Override     
    endif

    Trace(self, "GetTimerDuration() returnVal: " + returnVal)

    return returnVal
EndFunction


Function HandleTimer()
    Trace(self, "HandleTimer() iNextSystem: " + iNextSystem)

    ;we only need to worry about things the player actually has
    ENV_AfflictionScript[] activeAfflictionDataToProcess 

    ;only process things that can be cured when testing for cure chance, that can be improved when testing improve chance, etc.
    if iNextSystem == iSystem_Cure
        activeAfflictionDataToProcess = GetActiveAfflictions(OnlyCurable = true)

    elseif iNextSystem == iSystem_Infection && IsInfectionSpreadAllowed()
        activeAfflictionDataToProcess = GetActiveAfflictions(OnlyInfectable = true)
    
    elseif iNextSystem == iSystem_Worsen && IsWorsenAllowed() ;NOTE: currently nothing worsens. See note on ENV_AfflictionScript.AttemptToWorsen()
        activeAfflictionDataToProcess = GetActiveAfflictions(OnlyWorsenable = true)

    elseif iNextSystem == iSystem_Improve
        activeAfflictionDataToProcess = GetActiveAfflictions(OnlyImproveable = true)
    endif

;    Trace(self, "HandleTimer() activeAfflictionDataToProcess: " + activeAfflictionDataToProcess)

    ;loop through afflictions...
    bool handled ;do once per timer update
    int[] randomizedIndexes = CommonArrayFunctions.GetRandomizedIndexes(activeAfflictionDataToProcess.Length)

    Trace(self, "HandleTimer() randomizedIndexes: " + randomizedIndexes)

    ;we use a single die roll for every Attempt below so that we don't increase the chance if player has multiple afflictions
    int dieRoll = Game.GetDieRoll()

    int i = 0
    While (i < randomizedIndexes.length && handled == false)
        ENV_AfflictionScript currentAffliction = activeAfflictionDataToProcess[randomizedIndexes[i]]
        
        Trace(self, "HandleTimer() currentAffliction: " + currentAffliction)

        if iNextSystem ==  iSystem_Cure
            Trace(self, "HandleTimer() iNextSystem: " + iNextSystem + ", DebugDieRoll_Cure: " + DebugDieRoll_Cure)
            handled = currentAffliction.AttemptToCure(ForcedDieRoll = dieRoll, DebugDieRoll = DebugDieRoll_Cure)
        elseif iNextSystem == iSystem_Infection
            ;NOTE: activeAfflictionDataToProcess could be empty if the IsInfectionSpreadAllowed() check above was false. If so it won't do this.
            Trace(self, "HandleTimer() iNextSystem: " + iNextSystem + ", DebugDieRoll_Infection: " + DebugDieRoll_Infection)
            handled = currentAffliction.AttemptToGainInfection(ForcedDieRoll = dieRoll, DebugDieRoll = DebugDieRoll_Infection)
        elseif iNextSystem == iSystem_Worsen 
            ;NOTE: currently nothing worsens. See note on ENV_AfflictionScript.AttemptToWorsen()
            Trace(self, "HandleTimer() iNextSystem: " + iNextSystem + ", DebugDieRoll_Worsen: " + DebugDieRoll_Worsen)
            handled = currentAffliction.AttemptToWorsen(ForcedDieRoll = dieRoll, DebugDieRoll = DebugDieRoll_Worsen)
        elseif iNextSystem == iSystem_Improve
            Trace(self, "HandleTimer() iNextSystem: " + iNextSystem + ", DebugDieRoll_Improve: " + DebugDieRoll_Improve)
            handled = currentAffliction.AttemptToImprove(ForcedDieRoll = dieRoll, DebugDieRoll = DebugDieRoll_Improve)
        endif
        Trace(self, "HandleTimer() handled: " + handled)

        i += 1
    EndWhile

    ;after being handled or trying all the afflictions, increment next system for round robin
    iNextSystem = (iNextSystem + 1) % NumberOfSystems

    Trace(self, "HandleTimer() done... updated iNextSystem: " + iNextSystem)
    StartAfflictionTimer(self)
EndFunction


ENV_AfflictionScript[] Function GetActiveAfflictions(bool OnlyCurable = false, bool OnlyInfectable = false, bool OnlyWorsenable = false, bool OnlyImproveable = false, Keyword OnlyMatchingTreatmentEffectKeyword = None)
    Trace(self, "GetActiveAfflictions() OnlyMatchingTreatmentEffectKeyword: " + OnlyMatchingTreatmentEffectKeyword)

    ENV_AfflictionScript[] activeAfflictionData = new ENV_AfflictionScript[0]

    int i = 0
    While (i < AfflictionData.length)
        ENV_AfflictionScript currentAffliction = AfflictionData[i]
        
        if currentAffliction.Active
            if OnlyCurable == false || currentAffliction.GetChance_Cure() > 0
                if OnlyInfectable == false || currentAffliction.GetChance_Infection() > 0
                    if OnlyWorsenable == false || currentAffliction.GetChance_Worsen() > 0 
                        if OnlyImproveable == false || currentAffliction.GetChance_Improve() > 0
                            if OnlyMatchingTreatmentEffectKeyword == None || currentAffliction.TreatmentEffectKeyword == OnlyMatchingTreatmentEffectKeyword
                                activeAfflictionData.Add(currentAffliction)
                            endif
                        endif
                    endif
                endif
            endif
        endif

        i += 1
    EndWhile

    Trace(self, "GetActiveAfflictions() activeAfflictionData: " + activeAfflictionData)

    return activeAfflictionData
EndFunction


Function ImproveActiveAfflictions(keyword TreatmentEffectKeyword, int ImprovementLevels = 1, bool IsTreatment = false)
    Trace(self, "ImproveActiveAfflictions() TreatmentEffectKeyword: " + TreatmentEffectKeyword)
    ENV_AfflictionScript[] afflictionsToImprove = GetActiveAfflictions(OnlyMatchingTreatmentEffectKeyword = TreatmentEffectKeyword)

    bool cureRandomInfection = IsTreatment && Game.GetDieRollSuccess(Game.GetPlayer().GetValue(ENV_AFFL_Treatment_CureChance_Infection) as int)
    bool cureRandomInjury =  IsTreatment && Game.GetDieRollSuccess(Game.GetPlayer().GetValue(ENV_AFFL_Treatment_CureChance_Injury) as int)

    Trace(self, "ImproveActiveAfflictions() potentially will cureRandomInfection: " + cureRandomInfection + ", cureRandomInjury: " + cureRandomInjury)

    int[] randomizedIndexes = CommonArrayFunctions.GetRandomizedIndexes(afflictionsToImprove.Length)
    int i = 0
    While (i < randomizedIndexes.length)
        ENV_AfflictionScript currentAffliction = afflictionsToImprove[randomizedIndexes[i]]

        bool cured = false

        if cureRandomInfection && currentAffliction.IsInfection
            Trace(self, "ImproveActiveAfflictions() randomly curing infection currentAffliction: " + currentAffliction)
            cured = true
            cureRandomInfection = false
        elseif cureRandomInjury && currentAffliction.IsInfection == false
            Trace(self, "ImproveActiveAfflictions() randomly curing injury currentAffliction: " + currentAffliction)
            cured = true
            cureRandomInjury = false
        endif
        
        if PEO_AfflictionTreatment_GV.GetValueInt() != 0 && cured == false
            Trace(self, "ImproveActiveAfflictions() improving currentAffliction: " + currentAffliction)
            currentAffliction.Improve(ImprovementLevels = ImprovementLevels, isTreatment = true)
        elseif IsTreatment ;simplified standard game
            cured = true
        endif

        if cured
            currentAffliction.Cure()
        endif

        i += 1
    EndWhile
    

EndFunction


keyword[] Function GetTreatmentKeywordsForActiveAfflictions()
    Trace(self, "GetTreatmentKeywordsForActiveAfflictions()")

    Keyword[] treatmentKeywords = new Keyword[0]

    ENV_AfflictionScript[] activeAfflictions = GetActiveAfflictions()

    int i = 0
    While (i < activeAfflictions.length)
        ENV_AfflictionScript currentAffliction = activeAfflictions[i]

        ;add if new
        if treatmentKeywords.Find(currentAffliction.TreatmentEffectKeyword) < 0
            treatmentKeywords.Add(currentAffliction.TreatmentEffectKeyword)   
        endif

        i += 1
    EndWhile

    Trace(self, "GetTreatmentKeywordsForActiveAfflictions() returning treatmentKeywords: " + treatmentKeywords)
    return treatmentKeywords
EndFunction

;used by SQ_Env_TutorialQuestScript
bool Function PlayerHasMatchingTreatmentItemForAnActiveAffliction()
    Trace(self, "PlayerHasMatchingTreatmentItemForAnActiveAffliction() ")
    
    bool returnVal
    Actor PlayerRef = Game.GetPlayer()
    Keyword[] neededTreatmentKeywords = GetTreatmentKeywordsForActiveAfflictions()

    int i = 0
    While (returnVal == false && i < neededTreatmentKeywords.length)
        Keyword currentKeyword = neededTreatmentKeywords[i]
        returnVal = PlayerRef.GetItemCount(currentKeyword) > 0
        i += 1
    EndWhile

    Trace(self, "PlayerHasMatchingTreatmentItemForAnActiveAffliction() returnVal: " + returnVal)

    return returnVal
EndFunction

;used by SQ_Env_TutorialQuestScript
bool Function FormHasMatchingTreatmentItemForAnActiveAffliction(Form FormToCheck)
    Trace(self, "FormHasMatchingTreatmentItemForAnActiveAffliction() FormToCheck: " + FormToCheck)
    bool returnVal

    Keyword[] neededTreatmentKeywords = GetTreatmentKeywordsForActiveAfflictions()

    Trace(self, "FormHasMatchingTreatmentItemForAnActiveAffliction() neededTreatmentKeywords: " + neededTreatmentKeywords)

    int i = 0
    While (returnVal == false && i < neededTreatmentKeywords.length)
        Keyword currentKeyword = neededTreatmentKeywords[i]

        Trace(self, "FormHasMatchingTreatmentItemForAnActiveAffliction() currentKeyword: " + currentKeyword)

        returnVal = FormToCheck.HasKeyword(currentKeyword)

        i += 1
    EndWhile

    Trace(self, "FormHasMatchingTreatmentItemForAnActiveAffliction() returnVal: " + returnVal)

    return returnVal
EndFunction


ENV_AfflictionScript[] Function GetFallingAfflictionsSmall()
    return GetFallingAfflictions(FallingAfflictionData.GetAllMatchingStructs("SmallFall", true))
EndFunction
ENV_AfflictionScript[] Function GetFallingAfflictionsMedium()
    return GetFallingAfflictions(FallingAfflictionData.GetAllMatchingStructs("MediumFall", true))
EndFunction
ENV_AfflictionScript[] Function GetFallingAfflictionsLarge()
    return GetFallingAfflictions(FallingAfflictionData.GetAllMatchingStructs("LargeFall", true))
EndFunction

;iFallSize: 1 = small, 2 = medium, 3 = large
ENV_AfflictionScript[] Function GetFallingAfflictions(FallingAfflictionDatum[] MatchingData) private
    ENV_AfflictionScript[] matchingAfflictions = new ENV_AfflictionScript[MatchingData.Length]

    int i = 0
    While (i < MatchingData.length)
        matchingAfflictions[i] = MatchingData[i].Affliction
        i += 1
    EndWhile
    return matchingAfflictions
EndFunction



Function ShowCuredMessage(ENV_AfflictionScript AfflictionToShowMessageFor)
    SQ_ENV.DisplayTextReplacedMessage(ENV_AFFL_Cured_Msg, AfflictionToShowMessageFor)
    WwiseEvent.PlayMenuSound("UIAfflictionPopUpMessageCured")
EndFunction

Function ShowAttemptedToCureMessage(ENV_AfflictionScript AfflictionToShowMessageFor)
    SQ_ENV.DisplayTextReplacedMessage(ENV_AFFL_AttemptedToCure_Msg, AfflictionToShowMessageFor)
    WwiseEvent.PlayMenuSound("UIAfflictionPopUpMessageCured")
EndFunction

Function ShowGainedMessage(ENV_AfflictionScript AfflictionToShowMessageFor)
    SQ_ENV.DisplayTextReplacedMessage(ENV_AFFL_Gained_Msg, AfflictionToShowMessageFor)
    WwiseEvent.PlayMenuSound("UIAfflictionPopUpMessageGained")
EndFunction

Function ShowWorsenedMessage(ENV_AfflictionScript AfflictionToShowMessageFor)
    SQ_ENV.DisplayTextReplacedMessage(ENV_AFFL_Worsened_Msg, AfflictionToShowMessageFor)
    WwiseEvent.PlayMenuSound("UIAfflictionPopUpMessageWorsens")
EndFunction

Function ShowImprovedMessage(ENV_AfflictionScript AfflictionToShowMessageFor)
    SQ_ENV.DisplayTextReplacedMessage(ENV_AFFL_Improved_Msg, AfflictionToShowMessageFor)
    WwiseEvent.PlayMenuSound("UIAfflictionPopUpMessageImproved")
EndFunction

Function ShowSeverityImprovedMessage(ENV_AfflictionScript AfflictionToShowMessageFor)
    SQ_ENV.DisplayTextReplacedMessage(ENV_AFFL_Improved_Severity_Msg, AfflictionToShowMessageFor)
    WwiseEvent.PlayMenuSound("UIAfflictionPopUpMessageImproved")
EndFunction

ENV_AfflictionScript Function GetAfflictionByID(string ID) private
   int i = 0
   int iMax = AfflictionData.Length
   While (i < iMax)
       ENV_AfflictionScript currentAffliction = AfflictionData[i] as ENV_AfflictionScript
       if currentAffliction.ID == ID
        return currentAffliction
       endif 
       i += 1
   EndWhile

    Warning(self, "GetAfflictionByID() could not find AfflictionDatum for ID: " + ID)
    return None
EndFunction

Function CureAllAfflictions()
Trace(self, "CureAllAfflictions()")
    int i = 0
    While (i < AfflictionData.length)
        Trace(self, "CureAllAfflictions() calling Cure() for AfflictionData[i]:" + AfflictionData[i])
        AfflictionData[i].Cure()
        i += 1
    EndWhile
EndFunction

Function CureRandomAffliction(int CureChance)
    bool success = Game.GetDieRollSuccess(CureChance)

    Trace(self, "CureRandomAffliction() CureChance: " + CureChance + ", success: " + success)

    if success
        ENV_AfflictionScript[] activeAfflictions = GetActiveAfflictions()

      int iRandom = Utility.RandomInt(0, activeAfflictions.Length - 1)
      ENV_AfflictionScript randomENV_AfflictionScript = activeAfflictions[iRandom]

      Trace(self, "CureRandomAffliction() curring randomENV_AfflictionScript: " + randomENV_AfflictionScript)
      randomENV_AfflictionScript.Cure()
    endif

EndFunction


Function DebugGainAffliction(String stringID, bool PerformSkillCheck = false) private ;debug in name to scare away actual usages, not debug flagged because want this to always be available to testers
    ENV_AfflictionScript affliction = GetAfflictionByID(stringID)

    affliction.Gain(PerformSkillCheck)
EndFunction

Function DebugCureAffliction(String stringID) private ;debug in name to scare away actual usages, not debug flagged because want this to always be available to testers
    ENV_AfflictionScript affliction = GetAfflictionByID(stringID)

    affliction.Cure()
EndFunction

Function DebugAttemptToCureAffliction(String stringID) private ;debug in name to scare away actual usages, not debug flagged because want this to always be available to testers
    ENV_AfflictionScript affliction = GetAfflictionByID(stringID)

    affliction.AttemptToCure()  
EndFunction

Function DebugAttemptToWorsen(String stringID) private ;debug in name to scare away actual usages, not debug flagged because want this to always be available to testers
    ENV_AfflictionScript affliction = GetAfflictionByID(stringID)

    affliction.AttemptToWorsen()  
EndFunction

Function DebugAttemptToGainInfection(String stringID) private ;debug in name to scare away actual usages, not debug flagged because want this to always be available to testers
    ENV_AfflictionScript affliction = GetAfflictionByID(stringID)

    affliction.AttemptToGainInfection()  
EndFunction

Function DebugAttemptToImprove(String stringID) private ;debug in name to scare away actual usages, not debug flagged because want this to always be available to testers
    ENV_AfflictionScript affliction = GetAfflictionByID(stringID)

    affliction.AttemptToImprove()  
EndFunction

Function DebugImproveAffliction(String stringID) private ;debug in name to scare away actual usages, not debug flagged because want this to always be available to testers
    ENV_AfflictionScript affliction = GetAfflictionByID(stringID)

    affliction.Improve()
EndFunction

;in seconds
Function DebugSetTimerDuration(float duration = 0.0) private
    TimerDur_Override = duration
    StartAfflictionTimer(self)
EndFunction

;0 = always succeed
Function DebugSetDieRollCure(int DieRoll = 0) private
    DebugDieRoll_Cure = DieRoll
EndFunction

;0 = always succeed
Function DebugSetDieRollWorsen(int DieRoll = 0) private
    DebugDieRoll_Worsen = DieRoll
EndFunction

;0 = always succeed
Function DebugSetDieRollImprove(int DieRoll = 0) private
    DebugDieRoll_Improve = DieRoll
EndFunction

;0 = always succeed
Function DebugSetDieRollInfection(int DieRoll = 0) private
    DebugDieRoll_Infection = DieRoll
EndFunction

;outputs to log defined in ENV_AfflictionScript.TraceStats()
Function DebugTestCycle(string StringID, int NumberOfCycles) BetaOnly
    NumberOfCycles = math.Max(NumberOfCycles, 1) as int

    Trace(self, "DebugTestCycle() StringID: " + StringID + ", NumberOfCycles: " + NumberOfCycles)

    ENV_AfflictionScript affliction = GetAfflictionByID(stringID)

    DebugSetTimerDuration(0.5)

    int i = 0
    While (i < NumberOfCycles + 1)
        int waitBailout = 100
        int waitCount
        while (affliction.Active && waitCount < waitBailout)
            waitCount += 1
            Utility.Wait(1)
        endWhile

        if i < NumberOfCycles
            Trace(self, "DebugTestCycle() current cycle: " + i)
            affliction.Gain()
        endif
        i += 1
    EndWhile


    Trace(self, "DebugTestCycle() StringID: " + StringID + ", test complete.")

    ;restart normally
    DebugSetTimerDuration(-1) ;cancels override
EndFunction

Function DebugTestCycleAll(int NumberOfCycles)
    NumberOfCycles = math.Max(NumberOfCycles, 1) as int

    int i = 0
    While (i < AfflictionData.length)
        DebugTestCycle(AfflictionData[i].ID, NumberOfCycles)
        i += 1
    EndWhile

EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "EnvironmentalGameplay",  string SubLogName = "Afflictions", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "EnvironmentalGameplay",  string SubLogName = "Afflictions", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction