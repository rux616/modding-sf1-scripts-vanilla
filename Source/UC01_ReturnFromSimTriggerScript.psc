Scriptname UC01_ReturnFromSimTriggerScript extends ReferenceAlias

GlobalVariable Property UC01_ShipSim_PlayerEverPassedSequence Mandatory Const Auto
{Only set the stage if the player enters the trigger after this global has been set to 1}

int Property StageToSet = 600 Const Auto
{Stage to set if the player has ever completed the ship sim sequence}

Event OnTriggerEnter(ObjectReference akActionRef)
    trace(self, "Exit sequence trigger activated by: " + akActionRef + ". UC01_ShipSim_PlayerEverPassedSequence val: " + UC01_ShipSim_PlayerEverPassedSequence.GetValue())
    if akActionRef == Game.GetPlayer() && UC01_ShipSim_PlayerEverPassedSequence.GetValue() >= 1
        trace(self, "Setting stage: " + StageToSet)
        GetOwningQuest().SetStage(StageToSet)
    endif
EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC01", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction