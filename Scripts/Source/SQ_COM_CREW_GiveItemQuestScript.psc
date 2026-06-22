Scriptname SQ_COM_CREW_GiveItemQuestScript extends Quest
{attached to SQ_Crew quest}

Struct SkillDatum
    Perk GiveItemSkill
    {a perk on crew that will give the player items after exploring types of planets/locations}

    ConditionForm Conditions
    {conditions that when true (checked on change location) will grant items to give the player upon returning to the ship}
EndStruct

Group Properties
    SkillDatum[] Property SkillData Mandatory Const Auto
    float Property DistanceFromShip = 100.0 Const Auto
    {how far must the skill holder be from the ship before we check Conditions to determine if they have items to give to player - ie: how far must they adventure to emulate them having a chance to find stuff?}
EndGroup

;called by COM_CREW_GiveItemActorScript
bool Function CheckGiveItemConditions(Actor ActorToCheck)
    ;first check distance
    bool passedDistanceCheck = ActorToCheck.GetDistance(Game.GetPlayerHomeSpaceShip()) >= DistanceFromShip

    Trace(self, "CheckGiveItemConditions() passedDistanceCheck: " + passedDistanceCheck)

    bool passedSkillAndConditionsCheck = false
    if passedDistanceCheck

        ;find the skill
        int i = 0
        While (i < SkillData.length && passedSkillAndConditionsCheck == false)
            SkillDatum currentSkillDatum = SkillData[i]
            
            bool hasSkillPerk = ActorToCheck.HasPerk(currentSkillDatum.GiveItemSkill)
            Trace(self, "CheckGiveItemConditions() currentSkillDatum: " +  currentSkillDatum + ", hasSkillPerk: " + hasSkillPerk)

            bool passedConditions
            if hasSkillPerk
                passedConditions = currentSkillDatum.Conditions.IsTrue(ActorToCheck)
                Trace(self, "CheckGiveItemConditions() currentSkillDatum: " +  currentSkillDatum + ", hasSkillPerk: " + hasSkillPerk + ", passedConditions: " + passedConditions)
            endif

            if hasSkillPerk && passedConditions
                passedSkillAndConditionsCheck = true
            endif

            i += 1
        EndWhile

        Trace(self, "CheckGiveItemConditions() passedSkillAndConditionsCheck: " + passedSkillAndConditionsCheck)
    endif

    return passedDistanceCheck && passedSkillAndConditionsCheck
   
EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "Crew",  string SubLogName = "GiveItem", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "Crew",  string SubLogName = "GiveItem", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction