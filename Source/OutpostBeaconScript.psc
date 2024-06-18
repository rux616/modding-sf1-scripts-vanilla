Scriptname OutpostBeaconScript extends ObjectReference Const

SQ_CrewScript property SQ_Crew auto const mandatory
{ to handle crew assign/dismiss events}

OutpostTutorialScript property OutpostTutorial auto const mandatory
{ handle outpost tutorial events }

CompanionAffinityEventsScript Property SQ_Companions auto const mandatory
{to handle companions responding to things the player builds}

ActorValue property OutpostSurveyBoost auto const mandatory
{ actor value to flag when an outpost has reported a planet survey boost }

Message property OutpostSurveyBoostMessage auto const mandatory
{ message first time player returns to outpost after fully surveying planet }

Keyword property LocTypeOutpost auto const mandatory
{ make sure outpost locations have this keyword }

int iCheckForAttackTimerID = 1 const

; obviously should both be bigger for real
float fAttackTimerMinSeconds = 12.0 const ; 120.0 Const
float fAttackTimerMaxSeconds = 48.0 const ; 480.0 Const 

group outpostAttacks
    SQ_ParentScript property SQ_Parent auto const mandatory
    { holds outpost attack data/functions }

	bool Property AllowAttacks = true auto const conditional
	{ set to FALSE to prevent ALL random attacks }
EndGroup

Event OnCrewAssigned(Actor akCrew, ObjectReference akAssignmentRef, ObjectReference akPreviousAssignmentRef)
    Trace(self, " OnCrewAssigned " + akCrew)
    SQ_Crew.HandleOnCrewAssigned(akCrew, self)
    Trace(self, " OnCrewassigned DONE")
endEvent

Event OnCrewDismissed(Actor akCrew, ObjectReference akPreviousAssignmentRef)
    Trace(self, " OnCrewDismissed " + akCrew)
    SQ_Crew.HandleOnCrewDismissed(akCrew, self)
endEvent

Event OnUnload()
    trace(self, " OnUnload")
    ; see if any crew want to move here when I unload
    SQ_Crew.HandleCrewGoingHomeUnloaded(SQ_Crew.CrewGoingToOutposts)
endEvent

Event OnLoad()
    trace(self, " OnLoad")
    ; make sure my location has the outpost keyword (landing overlay won't)
    GetCurrentLocation().AddKeyword(LocTypeOutpost)

    ; see if any crew want to move here when I load
    SQ_Crew.HandleCrewGoingHomeUnloaded(SQ_Crew.CrewGoingToOutposts)
    if GetValue(OutpostSurveyBoost) == 0 && GetCurrentPlanet().GetSurveyPercent() >= 1.0
        SetValue(OutpostSurveyBoost, 1)
        OutpostSurveyBoostMessage.Show()
    endif
    ; run attack timer
    StartAttackTimer()
endEvent

Event OnWorkshopObjectPlaced(ObjectReference akReference)
	SQ_Companions.Trace(self, "OnWorkshopObjectPlaced() akReference: " + akReference )
	SQ_Companions.OutpostObjectPlaced(akReference)
    Resource[] resources = akReference.GetValueResources()
    debug.trace(self + "OnWorkshopObjectPlaced akReference=" + akReference + " resources=" + resources)
    if resources
        ; if this is a resource producing object, run attack timer again
        StartAttackTimer()
    endif
EndEvent

Event OnWorkshopMode(bool aStart)
    if aStart && OutpostTutorial.IsRunning()
        OutpostTutorial.EnterWorkshopMenu(self)
    endif
endEvent

function StartAttackTimer()
    float checkForAttackTime = Utility.RandomFloat(fAttackTimerMinSeconds, fAttackTimerMaxSeconds)
    debug.trace(self + " starting attack timer: " + checkForAttackTime + " seconds")
    StartTimer(checkForAttackTime, iCheckForAttackTimerID)
EndFunction

Event OnTimer(int aiTimerID)
    if aiTimerID == iCheckForAttackTimerID
        SQ_Parent.CheckForAttack(self)
    endif
EndEvent
;************************************************************************************
;****************************	   		Crew Logging		    *****************************
;************************************************************************************
bool bShowNormalTrace = true Const
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "Crew",  string SubLogName = "OutpostBeaconScript", bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "Crew",  string SubLogName = "OutpostBeaconScript", bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction
