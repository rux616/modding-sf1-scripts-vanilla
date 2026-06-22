Scriptname ENV_AfflictionScript extends Activator
{script attached to activator prefixed "ENV_AFFL_" - holds various data and functions for Afflictions}
;used so we can define things in one place and pass around, put in formlists and arrays, etc.

struct Stat
    string Name = "undefined"
    Curve ChanceCurve
    int Attempts_Poor = 0
    int Attempts_Stable = 0
    int Attempts_Good = 0
    int Attempts_Excellent = 0
endstruct

Group Autofill
    SQ_ENV_AfflictionsScript Property SQ_ENV Mandatory Const Auto
    ActorValue Property ENV_AFFL_BonusCureChance_Infection Mandatory Const Auto
    ActorValue Property ENV_AFFL_BonusCureChance_Injury Mandatory Const Auto
    ActorValue Property ENV_AFFL_SkillChallengeAV_Infection Mandatory Const Auto
    ActorValue Property ENV_AFFL_SkillChallengeAV_Injury Mandatory Const Auto
    ActorValue Property ENV_AFFL_SkillChance_PreventInfection Mandatory Const Auto
    ActorValue Property ENV_AFFL_SkillChance_PreventInjury Mandatory Const Auto
    ActorValue Property PEO_ENV_AFFL_Treatment_CureChance_AV Mandatory Const Auto
    GlobalVariable Property PEO_PrognosisChances_GV Mandatory Const Auto
    GlobalVariable Property PEO_PrognosisChances_IncChanceMult Mandatory Const Auto
EndGroup

Group Data
    string Property ID Mandatory Const Auto
    {a unique string to identify this object} ;The editor id names are just too long to use to identify these. Primarily used to make console commands friendlier.

    bool Property IsInfection = false Const Auto
    {True = infection, False (default) = Injury                                                          }

    WwiseEvent Property SoundEvent Mandatory Const Auto
    {what WwiseEvent to play when gaining the affliction}

    Formlist Property AfflictionSpellList Mandatory Const Auto 
    {the spells that represent this affliction (ie Rank1, 2, 3 versions)}

    Keyword Property TreatmentEffectKeyword Mandatory Const Auto 
    {the keyword is on magic effect that represents the treatment for this affliction}

    ENV_AfflictionScript[] Property InfectionArray Const Auto
    {an array of Infection Afflictions that this affliction can add}

    ActorValue Property PrognosisAV Mandatory Const Auto
    {the actorvalue that will hold this afflictions prognosis value}

    Curve Property Curve_Cure_Chance Mandatory Const Auto
    {Curve table expression chance to cure. Input is value of PrognosisAV
    CURE means to remove the affliction completely}

    Curve Property Curve_Improve_Chance Mandatory Const Auto
    {Curve table expression chance to improve to the next level. Input is value of PrognosisAV
    IMPROVE means to increase the prognosis}

    Curve Property Curve_Infection_Chance Const Auto
    {Curve table expression chance to gain an infection. Input is value of PrognosisAV}

    Curve Property Curve_Worsen_Chance Const Auto
    {Curve table expression chance to worsen to the next level. Input is value of PrognosisAV
    WORSEN means to increase the tier of the affliction from tier i to tier - ie add additional symptoms}
    
    bool Property Active Hidden Auto
    {Flag set/unset when gained/cured}
EndGroup

int iPrognosis_Poor      = 0 const
int iPrognosis_Stable    = 1 const
int iPrognosis_Good      = 2 const
int iPrognosis_Excellent = 3 const

Stat[] myStats

string strImproveAttempts =  "ImproveAttempts"
string strCureAttempts =  "CureAttempts"
string strWorsenAttempts =  "WorsenAttempts"
string strGainInfectionAttempts =  "GainInfectionAttempts"

Event OnInit()
    Trace(self, "OnInit() ")

    myStats = new Stat[0]

    stat Stat_Improve = new Stat
    Stat_Improve.Name = strImproveAttempts
    Stat_Improve.ChanceCurve = Curve_Improve_Chance
    myStats.Add(Stat_Improve)

    stat Stat_Cure = new Stat
    Stat_Cure.Name = strCureAttempts
    Stat_Cure.ChanceCurve = Curve_Cure_Chance
    myStats.Add(Stat_Cure)

    stat Stat_Worsen = new Stat
    Stat_Worsen.Name = strWorsenAttempts
    Stat_Worsen.ChanceCurve = Curve_Worsen_Chance
    myStats.Add(Stat_Worsen)

    stat Stat_GainInfection = new Stat
    Stat_GainInfection.Name = strGainInfectionAttempts
    Stat_GainInfection.ChanceCurve = Curve_Infection_Chance

    myStats.Add(Stat_GainInfection)

EndEvent

bool Function Improve(int ImprovementLevels = 1, bool isTreatment = false)
    Actor playerRef = Game.GetPlayer()

    int currentValue = playerRef.GetValue(PrognosisAV) as int

    bool severityImproved = false
    bool cured = false
    bool isPrognosisInitiallyExcellent = currentValue >= iPrognosis_Excellent

    Trace(self, "Improve() PrognosisAV: " + PrognosisAV + ", currentValue: " + currentValue + ", ImprovementLevels: " + ImprovementLevels)

    if isPrognosisInitiallyExcellent ;if we have taken a treatment, we also reduce the severity if we're at excellent prognosis

        if isTreatment 
            if Game.GetDieRollSuccess(game.GetPlayer().GetValue(PEO_ENV_AFFL_Treatment_CureChance_AV) as int)
                Cure()
                cured = true
            endif
        Else
            int iCurrentSpell = GetSpellListIndexForCurrentSpell()

            ;cured if we are first spell in list
            if iCurrentSpell == 0 
                Cure()
                cured = true
            else
                Spell currentSpell = AfflictionSpellList.GetAt(iCurrentSpell) as Spell
                Spell nextSpell = AfflictionSpellList.GetAt(iCurrentSpell - 1) as Spell
                Trace(self, "Gain() currentSpell: " + currentSpell + ", nextSpell: " + nextSpell)
                Game.GetPlayer().RemoveSpell(currentSpell)
                Game.GetPlayer().AddSpell(nextSpell, abVerbose = false)
                SQ_Env.StartAfflictionTimer(self) ;so we don't do anything immediately with this (it chooses a random active affliction if this is the only one or one of a few it would feel weird to potentially immediately cure it)
                severityImproved = true            
            endif
        endif

    endif

    int newValue = currentValue + ImprovementLevels

    ;clamp
    newValue = Math.Min(newValue, iPrognosis_Excellent) as int

    Trace(self, "Improve() newValue: " + newValue)

    Game.GetPlayer().SetValue(PrognosisAV, newValue)

    if severityImproved
        ;severity improved message
        SQ_ENV.ShowSeverityImprovedMessage(self)
    elseif cured == false
        if isPrognosisInitiallyExcellent
        ;cure attempted (but failed) message
        SQ_ENV.ShowAttemptedToCureMessage(self)
        Else
        ;prognosis improved message
        SQ_ENV.ShowImprovedMessage(self)
        endif
    endif

    return true 
EndFunction

Function ResetPrognosis()
    Trace(self, "ResetPrognosis()")
    Game.GetPlayer().SetValue(PrognosisAV, 0)
EndFunction


bool Function CheckSkillPrevention(ActorValue SkillAV) private
    int chanceToPrevent = Game.GetPlayer().GetValue(SkillAV) as int
    bool preventionSuccess = Game.GetDieRollSuccess(chanceToPrevent)

    Trace(self, "CheckSkillPrevention() SkillAV: " + SkillAV + ", chanceToPrevent: " + chanceToPrevent + ", preventionSuccess: " + preventionSuccess)

    return preventionSuccess
EndFunction

;returns true if gained or worsened
bool Function Gain(bool PerformSkillCheck = false, bool OnlyWorsen = false)
    Trace(self, "Gain() PerformSkillCheck: " + PerformSkillCheck + ", OnlyWorsen: " + OnlyWorsen)

    ;first see if skill prevents:
    bool skillCheckPrevented
    if PerformSkillCheck
        if IsInfection && CheckSkillPrevention(ENV_AFFL_SkillChance_PreventInfection)
            Trace(self, "Gain() skill PREVENTED infection!")
            skillCheckPrevented = true
        elseif IsInfection == false && CheckSkillPrevention(ENV_AFFL_SkillChance_PreventInjury)
            Trace(self, "Gain() skill PREVENTED injury!")
            skillCheckPrevented = true
        endif
    endif

    if skillCheckPrevented
        Trace(self, "Gain() skillCheckPrevented == true. BAILING! ")
        RETURN false
    endif

    bool gained
    bool worsened

    int iCurrentSpell = GetSpellListIndexForCurrentSpell()

    int currentSpellListMaxIndex = AfflictionSpellList.GetSize() - 1

    if iCurrentSpell == currentSpellListMaxIndex
        Trace(self, "Gain() already has highest rank available, no change.")

    elseif iCurrentSpell == -1 ;we don't have yet
        if OnlyWorsen == false ;we want to add it
         
            ;always start at the first severity level
            int nextSpellInt = 0

            Spell nextSpell = AfflictionSpellList.GetAt(nextSpellInt) as Spell
            Trace(self, "Gain() we don't have the affliction yet, will add random severity nextSpell: " + nextSpell)
            Game.GetPlayer().AddSpell(nextSpell, abVerbose = false)
            SQ_ENV.ShowGainedMessage(self)
            SQ_Env.StartAfflictionTimer(self) ;so we don't do anything immediately with this
            gained = true

        else 
            Trace(self, "Gain() we don't have this affliction yet, so we can't worsen it.")
        endif
    else
        Spell currentSpell = AfflictionSpellList.GetAt(iCurrentSpell) as Spell
        Spell nextSpell = AfflictionSpellList.GetAt(iCurrentSpell + 1) as Spell
        Trace(self, "Gain() currentSpell: " + currentSpell + ", nextSpell: " + nextSpell)
        Game.GetPlayer().RemoveSpell(currentSpell)
        Game.GetPlayer().AddSpell(nextSpell, abVerbose = false)
        SQ_ENV.ShowWorsenedMessage(self)
        SQ_Env.StartAfflictionTimer(self) ;so we don't do anything immediately with this (it chooses a random active affliction if this is the only one or one of a few it would feel weird to potentially immediately cure it)
        worsened = true
    endif

    if gained
        Active = true
    endif

    if gained || worsened
        SoundEvent.PlayUI()
        ResetPrognosis()
        SQ_ENV.SQ_ENV.SQ_ENV_Tutorial.StartAfflictionTutorial()
    endif

    return gained || worsened
EndFunction

int Function GetSpellListIndexForCurrentSpell() private
    int i = AfflictionSpellList.GetSize() - 1
    int iLastFound
    While (i > -1)
        Spell currentSpell = AfflictionSpellList.GetAt(i) as Spell

        if game.GetPlayer().HasSpell(currentSpell)
            Trace(self, "GetSpellListIndexForCurrentSpell() returning: " + i + ", currentSpell: " + currentSpell)
            return i
        endif

        i -= 1
    EndWhile

    Trace(self, "GetSpellListIndexForCurrentSpell() no spell found, returning: -1 ")
    return -1
EndFunction


;NOTE: it was decided that nothing should worsen on its own (including infections).
;   Accomplishing this with data set on ENV_AfflictionScript.
;   Leaving this system in because script timing and existing chance data is scaled with this attempt happening, and there's potential for possible inclusion in a game mode later
;returns true if Worsened, otherwise false
bool Function AttemptToWorsen(int ForcedDieRoll = -1, int DebugDieRoll = -1)
    Trace(self, "AttemptToWorsen() ForcedDieRoll: " + ForcedDieRoll + ", DebugDieRoll: " + DebugDieRoll)

    int Chance_Worsen = GetChance_Worsen()

    Trace(self, "AttemptToWorsen() Chance_Worsen: " + Chance_Worsen)

    if Chance_Worsen > 0

        bool WorsenSuccess = game.GetDieRollSuccess(Chance_Worsen, DebugDieRoll = DebugDieRoll, ForcedDieRoll = ForcedDieRoll)

       IncrementStat(strWorsenAttempts)


        Trace(self, "AttemptToWorsen() WorsenSuccess: " + WorsenSuccess)
        
        if WorsenSuccess
            return Gain(OnlyWorsen = true)
        endif

    endif

    return false
EndFunction

Function IncrementStat(string Name) private
    int iFound = myStats.FindStruct("Name", Name)

    if iFound > -1

        stat statToIncrement = myStats[iFound]

        float PrognosisLevel = Game.GetPlayer().GetValue(PrognosisAV)

       if PrognosisLevel ==  iPrognosis_Poor
            statToIncrement.Attempts_Poor += 1
       elseif PrognosisLevel == iPrognosis_Stable
            statToIncrement.Attempts_Stable += 1
       elseif PrognosisLevel == iPrognosis_Good
            statToIncrement.Attempts_Good += 1
       elseif PrognosisLevel == iPrognosis_Excellent
            statToIncrement.Attempts_Excellent += 1
       endif
    endif

EndFunction

Function ResetStats()
    int i = 0
    While (i < myStats.length)
        myStats[i].Attempts_Poor = 0
        myStats[i].Attempts_Stable = 0
        myStats[i].Attempts_Good = 0
        myStats[i].Attempts_Excellent = 0
        i += 1
    EndWhile
EndFunction

;returns true if Improve, otherwise false
bool Function AttemptToImprove(int ForcedDieRoll = -1, int DebugDieRoll = -1)
    Trace(self, "AttemptToImprove() ForcedDieRoll: " + ForcedDieRoll + ", DebugDieRoll: " + DebugDieRoll)

    int Chance_Improve = GetChance_Improve()

    Trace(self, "AttemptToImprove() Chance_Improve: " + Chance_Improve)

    if Chance_Improve > 0
        bool ImproveSuccess = game.GetDieRollSuccess(Chance_Improve, DebugDieRoll = DebugDieRoll, ForcedDieRoll = ForcedDieRoll)

        IncrementStat(strImproveAttempts)

        Trace(self, "AttemptToImprove() ImproveSuccess: " + ImproveSuccess)
        if ImproveSuccess
            return Improve()
        endif

    endif

    return false
EndFunction


;returns true if gained infection, otherwise false
bool Function AttemptToGainInfection(int ForcedDieRoll = -1, int DebugDieRoll = -1)
    Trace(self, "AttemptToGainInfection() ForcedDieRoll: " + ForcedDieRoll + ", DebugDieRoll: " + DebugDieRoll)

    int GainChance_Infection = GetChance_Infection()

    Trace(self, "AttemptToGainInfection() GainChance_Infection: " + GainChance_Infection)

    if GainChance_Infection > 0

        bool GainInfectionSuccess = game.GetDieRollSuccess(GainChance_Infection, DebugDieRoll = DebugDieRoll, ForcedDieRoll = ForcedDieRoll)
        
        IncrementStat(strGainInfectionAttempts)
        
        Trace(self, "AttemptToGainInfection() GainInfectionSuccess: " + GainInfectionSuccess)

        if GainInfectionSuccess
            ENV_AfflictionScript randomInfection
        
            int[] randomizedIndexes = CommonArrayFunctions.GetRandomizedIndexes(InfectionArray.Length)
            int i = 0
            While (i < randomizedIndexes.length && randomInfection == None)
                ENV_AfflictionScript currentInfection = InfectionArray[randomizedIndexes[i]]
                
                if currentInfection.PlayerHasAffliction() == false
                    randomInfection = currentInfection
                endif

                i += 1
            EndWhile

            Trace(self, "AttemptToGainInfection() gaining randomInfection: " + randomInfection)
            
            return randomInfection.Gain(PerformSkillCheck = true)
        endif

    endif

    return false
EndFunction

bool Function PlayerHasAffliction()
    bool returnVal

    int i = 0
    int iMax = AfflictionSpellList.GetSize()
    While (i < iMax && returnVal == false)
        Spell currentSpell = AfflictionSpellList.GetAt(i) as Spell
        
        if Game.GetPlayer().HasSpell(currentSpell)
            returnVal = true
        endif

        i += 1
    EndWhile

;    Trace(self, "PlayerHasAffliction() self: " + self + ", returnVal: " + returnVal)

    return returnVal
EndFunction

;returns true if cured, otherwise false
bool Function AttemptToCure(int ForcedDieRoll =-1,  int DebugDieRoll = -1)
    Trace(self, "AttemptToCure() ForcedDieRoll: " + ForcedDieRoll + ", DebugDieRoll: " + DebugDieRoll)

    int cureChance = GetChance_Cure()

    Trace(self, "AttemptToCure() cureChance: " + cureChance)

    bool cureSuccess = game.GetDieRollSuccess(cureChance, DebugDieRoll = DebugDieRoll, ForcedDieRoll = ForcedDieRoll)

    IncrementStat(strCureAttempts)
    

    Trace(self, "AttemptToCure() cureSuccess: " + cureSuccess)
    
    if cureSuccess
        return Cure()
    endif

    return false
EndFunction

;returns true if actually cured
bool Function Cure()
    Trace(self, "Cure()")
    Formlist AfflictionList = AfflictionSpellList

    bool hadAffliction

    int i = 0
    int iMax = AfflictionList.GetSize()
    While (i < iMax)
        Spell currentSpell = AfflictionList.GetAt(i) as Spell   
        
        hadAffliction = hadAffliction || Game.GetPlayer().HasSpell(currentSpell)
        
        Game.GetPlayer().RemoveSpell(currentSpell) ;afflictions are abilities, which is why we remove them
        i += 1
    EndWhile

    if hadAffliction
        SQ_ENV.ShowCuredMessage(self)
        Active = false
        
        ;increment tracking avs:
        Actor playerRef = Game.GetPlayer()
        if IsInfection
            playerRef.SetValue(ENV_AFFL_SkillChallengeAV_Infection, playerRef.GetValue(ENV_AFFL_SkillChallengeAV_Infection) + 1)
        else
            playerRef.SetValue(ENV_AFFL_SkillChallengeAV_Injury, playerRef.GetValue(ENV_AFFL_SkillChallengeAV_Injury) + 1)
        endif

        TraceStats()
        ResetStats()

        Trace(self, "Cure() returning true")
        return true

    endif

    Trace(self, "Cure() returning false")
    return false
EndFunction


int function GetCurveChance(Curve curveTable) private
    int iPrognosis = Game.GetPlayer().GetValue(PrognosisAV) as int
    
    int returnVal
    
    if curveTable ;expected to be none in case of non-infections that are attempting to worsen (only infections worsen)
        returnVal = curveTable.GetValueAt(iPrognosis) as int ;in terms of a d100
    endif

    Trace(self, "GetCurveChance() curveTable: " + curveTable + ", returnVal: " + returnVal)
    return returnVal
EndFunction

int Function GetChance_Cure()
    Trace(self, "GetChance_Cure()")

    int returnVal = GetCurveChance(Curve_Cure_Chance)

    if returnVal > 0 ;we don't want to add additional chance when there is NO chance (because no chance is when at poor prognosis)
        if IsInfection
            returnVal += Game.GetPlayer().GetValue(ENV_AFFL_BonusCureChance_Infection) as int
        else
            returnVal += Game.GetPlayer().GetValue(ENV_AFFL_BonusCureChance_Injury) as int
        endif

    endif

    returnVal = PEO_ChangeCureOrImproveChance(returnVal)
    
    Trace(self, "GetChance_Cure() returnVal: " + returnVal)
    
    return returnVal
EndFunction

int Function GetChance_Improve()
    Trace(self, "GetChance_Improve()")
    int returnVal = GetCurveChance(Curve_Improve_Chance)
    returnVal = PEO_ChangeCureOrImproveChance(returnVal)
    Trace(self, "GetChance_Improve() returnVal: " + returnVal)
    return returnVal
EndFunction

int Function GetChance_Worsen()
    Trace(self, "GetChance_Worsen()")
    int returnVal = GetCurveChance(Curve_Worsen_Chance)
    Trace(self, "GetChance_Worsen() returnVal: " + returnVal)
    return returnVal
EndFunction

int Function GetChance_Infection()
  Trace(self, "GetChance_Infection()")
    int returnVal = GetCurveChance(Curve_Infection_Chance)
    Trace(self, "GetChance_Infection() returnVal: " + returnVal)
    return returnVal
EndFunction

;for cure or improve chances, multiply the valueToChange by a value greater than 1 if the PEO setting is 1 (easy) or by a value less than 1 if the setting is 3 (hard)
int Function PEO_ChangeCureOrImproveChance(int valueToChange)
    
    int prognosisChances_Setting = PEO_PrognosisChances_GV.GetValueInt()

    if prognosisChances_Setting != 0
        valueToChange = Math.Floor((valueToChange * PEO_PrognosisChances_IncChanceMult.GetValue()))
    endif

    return valueToChange
EndFunction

string function MakeStatString(Stat StatToGet)
    string returnVal =  ", " + id + ", " + \
                        StatToGet.Name + ", " + \
                        StatToGet.ChanceCurve + ", " + \
                        StatToGet.Attempts_Poor + ", " + \
                        StatToGet.Attempts_Stable + ", " + \
                        StatToGet.Attempts_Good + ", " + \
                        StatToGet.Attempts_Excellent
    return returnVal
endFunction

Function TraceStats() BetaOnly

    string logname = "EnvironmentalGameplay_Afflictions_STATS"

    bool opened = debug.OpenUserLog(logName)

    if opened
        ;trace column headers
        debug.traceuser(logname, ", id, chance curve, stat, attempts poor, attempts stable, attempts good, attempts excellent")
    endif

    int i = 0
    While (i < myStats.length)
        Stat currentStat = myStats[i]

        string statString = MakeStatString(currentStat)

        debug.traceuser(logname, statString)

        i += 1
    EndWhile
   
 endFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "EnvironmentalGameplay",  string SubLogName = "Afflictions", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "EnvironmentalGameplay",  string SubLogName = "Afflictions", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction


