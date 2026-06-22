Scriptname SQ_PlayerSleepScript extends Actor Const
{casts spells at player after waking up}

;reminder, the companions appearing near player after sleeping is handled in SQ_CompanionsScript

Struct EffectDatum
    Formlist KeywordList
    Spell SpellToCast
EndStruct

Group Properties
SQ_CompanionsScript Property SQ_Companions Mandatory Const Auto
{autofill}

ConditionForm Property CND_SleepRequirements_WellRested_And_EmotionalSecurity Mandatory Const Auto
{autofill; SUBJECT: Player, TARGET: Bed}

EffectDatum[] Property SleepEffectData Mandatory Const Auto
{holds data associating keywords on beds with effects to cast. This found first (lower indexes) take precedence}

float Property RomanticCompanionDistance = 5.0 Const Auto
{the distance needed for a romantic companion to be considered nearby; remember SQ_CompanionsScript moves companions to the bed the player clicked on if romantic}

Spell Property WakeRomanticSpell Mandatory Const Auto
{spell to cast if a romantic companion is nearby when player wakes}
EndGroup

Keyword Property COM_NoSleepTeleportLocation Mandatory Const Auto
{If the location has this keyword, don't allow Companion to teleport there when Player awakens}

Event OnInit()
    RegisterForPlayerSleep()
EndEvent

Event OnPlayerSleepStop(bool abInterrupted, ObjectReference akBed)
    Trace(self, "OnPlayerSleepStop() abInterrupted: " + abInterrupted + ", akBed: " + akBed)

    ;first check conditions are valid for getting one of these sleep effects (bed owned, in an outpost or player ship, etc.)
    if CND_SleepRequirements_WellRested_And_EmotionalSecurity.IsTrue(Game.GetPlayer(), akBed)
		;GEN-500356: Changing this from a distance check against the player's companions
        ;to a "is alias filled" check since, in the SQ_CompanionScript, we stopped moving NPCs that're in scenes when the player sleeps
        ;As well, I needed to check both the romantic and standard companion as SQ_CompanionScript
        ;will only fill the SleepCompanionRomantic alias is the player doesn't have an active companion    

        ObjectReference RomanticCompanion = SQ_Companions.SleepCompanionRomantic.GetRef()
        CompanionActorScript StandardCompanion = SQ_Companions.SleepCompanion.GetRef() as CompanionActorScript

        if (RomanticCompanion != none || (StandardCompanion != none && SQ_Companions.IsCompanionRomantic(StandardCompanion)))
            Apply(WakeRomanticSpell)
        else ;use bed keywords to trigger an effect
            int i = 0
            While (i < SleepEffectData.length)
                EffectDatum currentDatum = SleepEffectData[i]
  
                if akBed.GetCurrentLocation().HasKeyword(COM_NoSleepTeleportLocation) == 0
                    if akBed.HasKeywordInFormList(currentDatum.KeywordList)
                        Apply(currentDatum.SpellToCast)
                    endif
                endif
                
                i += 1
            EndWhile
        endif
    endif
EndEvent

Function Apply(Spell SpellToApply)
    Trace(self, "Apply() SpellToApply: " + SpellToApply)
    ;reminder: spell effect keyword data handles dispelling
    SpellToApply.Cast(Game.GetPlayer(), Game.GetPlayer())
EndFunction



;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "SQ_PlayerSleepScript",  string SubLogName = "", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "SQ_PlayerSleepScript",  string SubLogName = "", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction