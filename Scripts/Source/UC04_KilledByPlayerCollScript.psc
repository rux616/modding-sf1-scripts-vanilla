Scriptname UC04_KilledByPlayerCollScript extends RefCollectionAlias

GlobalVariable Property UC04_AttackActive Mandatory Const Auto
{Global used to track if the attack if still currently active}

int Property StagetoSet = 730 Auto Const
{Stage to set if this NPC was killed by the player}

Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
    trace(self, "Guard killed: " + akSenderRef + " by: " + akKiller)
    if UC04_AttackActive.GetValue() >= 1
        trace(self, "Attack is active.")
        if akKiller == Game.GetPlayer()
            trace(self, "Player is killer. Set the stage!")
            GetOwningQuest().SetStage(StagetoSet)
        endif
    endif
EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC04", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction