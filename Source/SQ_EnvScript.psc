Scriptname SQ_EnvScript extends Quest
{script attached to SQ_ENV quest}

Group Autofill
    ReferenceAlias Property TextReplacementRefAlias Mandatory Const Auto
    ReferenceAlias Property Player Mandatory Const Auto
    Curve Property ENV_AFFL_FallDamageAfflictionChance Mandatory Const Auto
    Message Property ENV_DEBUG_AFFL_Fall_Msg Mandatory Const Auto
    SQ_Env_TutorialQuestScript Property SQ_ENV_Tutorial Mandatory Const Auto
EndGroup

Group FallData
    float Property FallDamageThreshold_Small = 0.0 Const Auto 
    {anything less than this isn't a fall for  affliction granting}
    float Property FallDamageThreshold_Medium = 30.0 Const Auto
    {anything between this and FallDamageThreshold_Large is a medium fall}
    float Property FallDamageThreshold_Large = 60.0 Const Auto
    {anything this or greater is a large fall}
EndGroup

group DebugTest
    PackIn Property ENV_Hazard_PK_Vent_Gas_Corrosive Mandatory Const Auto
endgroup


bool DebugReportFallOn

Event OnQuestStarted()
    RegisterForRemoteEvent(Player.GetActorReference(), "OnPlayerFallLongDistance")
EndEvent

event Actor.OnPlayerFallLongDistance(Actor akSender, float afDamage)
    Trace(self, "OnPlayerFallLongDistance() akSender: " + akSender + ", afDamage: " + afDamage)
    GrantFallingAffliction(afDamage)
EndEvent

Function GrantFallingAffliction(float Damage)
    Trace(self, "GrantFallingAffliction() Damage: " + Damage)

    int afflictionChance = ENV_AFFL_FallDamageAfflictionChance.GetValueAt(Damage) as int
    bool dieRollSuccess = Game.GetDieRollSuccess(afflictionChance)

    Trace(self, "GrantFallingAffliction() afflictionChance: " + afflictionChance)
    Trace(self, "GrantFallingAffliction() dieRollSuccess: " + dieRollSuccess)

    _ReportFall(Damage, afflictionChance, dieRollSuccess)

    if dieRollSuccess
        ENV_AfflictionScript[] appropriateAfflictions
        SQ_ENV_AfflictionsScript SelfAfflictionScript = (self as quest) as SQ_ENV_AfflictionsScript

        if Damage >= FallDamageThreshold_Large
            Trace(self, "GrantFallingAffliction() is a large fall")
            appropriateAfflictions = SelfAfflictionScript.GetFallingAfflictionsLarge()
        elseif Damage >= FallDamageThreshold_Medium
            Trace(self, "GrantFallingAffliction() is a medium fall") 
            appropriateAfflictions = SelfAfflictionScript.GetFallingAfflictionsMedium()
        elseif Damage >= FallDamageThreshold_Small
            Trace(self, "GrantFallingAffliction() is a small fall")
            appropriateAfflictions = SelfAfflictionScript.GetFallingAfflictionsSmall()
        else 
            Trace(self, "GrantFallingAffliction() is too small a fall")
        endif

        if appropriateAfflictions.Length > 0
            int i = Utility.RandomInt(0, appropriateAfflictions.Length - 1)
            ENV_AfflictionScript randomAppropriateAffliction = appropriateAfflictions[i]

            Trace(self, "GrantFallingAffliction() gaining randomAppropriateAffliction: " + randomAppropriateAffliction)
            randomAppropriateAffliction.Gain(PerformSkillCheck = true)
        endif
    endif
EndFunction


Function _ReportFall(float Damage, int AfflictionChance, bool DieRollSuccess) private BetaOnly
    if DebugReportFallOn
        int fallSize = 0

        if Damage >= FallDamageThreshold_Large
            fallSize = 3
        elseif Damage >= FallDamageThreshold_Medium
            fallSize = 2
        elseif  Damage >= FallDamageThreshold_Small
            fallSize = 1
        endif

        ENV_DEBUG_AFFL_Fall_Msg.Show(Damage, fallsize, AfflictionChance as float, DieRollSuccess as float)
    endif
EndFunction

;FormWithName must be able have a reference created with PlaceAtMe (ex: an Activator)
Function DisplayTextReplacedMessage(Message MessageToDisplay, Form FormWithName)
    Trace(self, "DisplayTextReplacedMessage() MessageToDisplay: " + MessageToDisplay + ", FormWithName: " + FormWithName)
    
    ObjectReference tempRef = Game.GetPlayer().PlaceAtMe(FormWithName, abInitiallyDisabled = true, akAliasToFill = TextReplacementRefAlias)

    MessageToDisplay.Show()

    TextReplacementRefAlias.Clear()
    tempRef.Delete()

EndFunction

;************************************************************************************
;****************************      DEBUG FUNCTIONS      *****************************
;************************************************************************************
Function TestFallInjuryCurve() private BetaOnly ;for debug purposes
    TestCurve(10, 30)
EndFunction

Function TestCurve(float stepSize, int steps) private BetaOnly ;for debug purposes
    float[] inputs = new float[steps]

    int i = 0
    While (i < inputs.length)
        inputs[i] = i * stepSize
        i += 1
    EndWhile

    Trace(self, "TestCurve()")
    
    float[] values = ENV_AFFL_FallDamageAfflictionChance.GetValues(inputs)

    i = 0
    While (i < values.length)
        Trace(self, "TestCurve() inputs[i]: " + inputs[i] + " -> values[i]: " + values[i])
        i += 1
    EndWhile

EndFunction


Function DebugReportFall(bool On) private BetaOnly ;console command only
    DebugReportFallOn = On
EndFunction




;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "EnvironmentalGameplay",  string SubLogName = "SQ_EnvScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "EnvironmentalGameplay",  string SubLogName = "SQ_EnvScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction