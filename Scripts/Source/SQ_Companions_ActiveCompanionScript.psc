Scriptname SQ_Companions_ActiveCompanionScript extends ReferenceAlias
{script for whatever companion is currently in ActiveCompanion alias}

group Perks
    Perk property Skill_Leadership auto const mandatory

    float property Skill_Leadership_Rank4_CompanionRecoverChance = 0.50 auto const
    { chance (0.0 - 1.0) to recover from bleedout (once per combat) }

    bool property Skill_Leadership_HasRecovered auto hidden
    { set to true when companion recovers - set back to false when combat ends }

    Quest property PlayerSkills auto const mandatory
    { used to check stage for Leadership rank 4 }

    int property Skill_Leadership_Rank4Stage = 1504 auto Const
    { stage to check for Leadership rank 4, since we don't have a papyrus function for that }

    float property Skill_LeadershipRecoveryDelay = 10.0 auto Const
    { seconds between going into bleedout and recovering }
endGroup

Group Travel_Affinity
GlobalVariable Property COM_AffinityTravelBonus_PreMQ Mandatory Const Auto
{Autofill}

GlobalVariable Property COM_AffinityTravelBonus_PostMQ Mandatory Const Auto
{Autofill}

GlobalVariable Property COM_AffinityTravelCoolDown Mandatory Const Auto
{Autofill}

Quest Property MQ302B Mandatory Const Auto
{autofill}

endGroup

int Skill_LeadershipRecoveryTimerID = 1 const
int TimerID_TravelAffinityCoolDown = 2 const ;duration is COM_AffinityTravelCoolDown

bool TravelAffinityCoolDownDone = true

auto state recoveryAllowed
Event OnEnterBleedout()
    debug.trace(self + " OnEnterBleedout")
    if Skill_Leadership_HasRecovered == false
        if PlayerSkills.GetStageDone(Skill_Leadership_Rank4Stage)
            debug.trace(self + " player has Leadership rank 4 - check for recovery")
            Actor actorRef = GetActorRef()
            ; roll for recover chance
            float recoverRoll = Utility.RandomFloat()
            debug.trace(self + " recoverRoll=" + recoverRoll + ", Skill_Leadership_Rank4_CompanionRecoverChance=" + Skill_Leadership_Rank4_CompanionRecoverChance)

            if recoverRoll <= Skill_Leadership_Rank4_CompanionRecoverChance
                ; success!
                debug.trace(self + "  recover success! running " + Skill_LeadershipRecoveryDelay + " second timer for recovery")
                Skill_Leadership_HasRecovered = true
                GotoState("noRecovery")
                StartTimer(Skill_LeadershipRecoveryDelay, Skill_LeadershipRecoveryTimerID)
            endif
        endif
    endif
EndEvent

Event OnCombatStateChanged(ObjectReference akTarget, int aeCombatState)
    if aeCombatState == 0
        debug.trace(self + " OnCombatStateChanged " + aeCombatState)
        ; clear recovered flag whenever I leave combat
        Skill_Leadership_HasRecovered = false
    endif
endEvent

EndState

state noRecovery
    ; don't allow recovery in this state
endState


Event OnAliasChanged(ObjectReference akObject, bool abRemove)
    debug.trace(self + " OnAliasChanged " + akObject + " " + abRemove)
    ; always clear recovered flag when alias changes
    Skill_Leadership_HasRecovered = false
EndEvent

Event OnTimer(int aiTimerID)
    if aiTimerID == Skill_LeadershipRecoveryTimerID
        Actor actorRef = GetActorRef()
        if actorRef.IsBleedingOut()
            debug.trace(self + " recovery timer done - restore health")
            ; if still bleeding out, recover
            actorRef.RestoreValue(Game.GetHealthAV(), 999.0)
            ; wait a bit before changing state to allow combat to restart
            utility.wait(5.0)
        endif
        gotoState("recoveryAllowed")
    elseif aiTimerID == TimerID_TravelAffinityCoolDown
        Trace(self, "OnTimer() Utility.GetCurrentRealTime(): " + Utility.GetCurrentRealTime())
        TravelAffinityCoolDownDone = true
        Trace(self, "OnTimer() TravelAffinityCoolDownDone is now: " + TravelAffinityCoolDownDone)
    endif
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
    Trace(self, "OnLocationChange() akOldLoc: " + akOldLoc + ", akNewLoc: " + akNewLoc + ", will call AwardAffinityTravelBonus() ")
    AwardAffinityTravelBonus()
EndEvent

Function AwardAffinityTravelBonus()
    Trace(self, "AwardAffinityTravelBonus() TravelAffinityCoolDownDone: " +  TravelAffinityCoolDownDone)
    if TravelAffinityCoolDownDone
        int amountToAdd 

        if MQ302B.IsCompleted()
            amountToAdd = COM_AffinityTravelBonus_PostMQ.GetValueInt()
        else
            amountToAdd = COM_AffinityTravelBonus_PreMQ.GetValueInt()
        endif

        Trace(self, "AwardAffinityTravelBonus() amountToAdd: " +  amountToAdd)

        (GetActorReference() as CompanionActorScript).AddAffinity(amountToAdd)
        StartTimer_AffinityTravelCoolDown()
    endif
EndFunction

Function StartTimer_AffinityTravelCoolDown(bool ExpireTimer = false)
Trace(self, "StartTimer_AffinityTravelCoolDown() ExpireTimer: " + ExpireTimer)
    TravelAffinityCoolDownDone = false
    Trace(self, "StartTimer_AffinityTravelCoolDown() TravelAffinityCoolDownDone is now: " + TravelAffinityCoolDownDone)

    float duration = 0
    if ExpireTimer == false
        duration = COM_AffinityTravelCoolDown.GetValue()
    endif

    Trace(self, "StartTimer_AffinityTravelCoolDown() duration: " + duration)

    Trace(self, "StartTimer_AffinityTravelCoolDown() Utility.GetCurrentRealTime(): " + Utility.GetCurrentRealTime())
    StartTimer(duration, TimerID_TravelAffinityCoolDown)
EndFunction


;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "Companions",  string SubLogName = "SQ_Companions_ActiveCompanion", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "Companions",  string SubLogName = "SUB_SQ_Companions_ActiveCompanionLOG_Name", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction