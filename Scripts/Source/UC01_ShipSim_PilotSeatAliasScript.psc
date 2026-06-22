Scriptname UC01_ShipSim_PilotSeatAliasScript extends ReferenceAlias

int Property StartupStage = 150 Auto Const
{Stage to set when the player sits in the sim seat for the 1st time}

Event OnEnterFurniture(Actor akActionRef)  
    Trace(self, "We just got sat in by " + akActionRef)
    UC01_ShipSimulationQuestScript OQ = GetOwningQuest() as UC01_ShipSimulationQuestScript
    if !OQ.GetStageDone(StartupStage)
        OQ.SetStage(StartupStage)
    elseif OQ.bSequencePaused && !OQ.bResetRequired
        OQ.ResumeCombatSequence()
    endif
endEvent 

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC01", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction