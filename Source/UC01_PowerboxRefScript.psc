Scriptname UC01_PowerboxRefScript extends ObjectReference Const

int Property TargetDestructionState = 1 Const Auto
{If the object has switched to this state, disable its linked ref}

Keyword Property UC01_LaserGrid_SecondaryToggle_Keyword Mandatory Const Auto
{Keyword for if this powerbox has a secondary toggle}

bool Property ChainDisable = false Const Auto
{If true, this object is attached to a chain of markers and should turn all of them off}

int Property StageToSet = -1 Const Auto
{Is there a stage to set on UC01 once this change has been triggered?}

int Property ShutDownStage = 401 Const Auto
{If this stage has been set, don't set the "StageToSet" when this blows}

Quest Property UC01 Mandatory Const Auto
{UC01 quest object}

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
trace(self, "Old Destruction Stage: " + aiOldStage + ". New Dest Stage: " + aiCurrentStage + ". Target Stage: " + TargetDestructionState)
    if aiCurrentStage == TargetDestructionState

        if ChainDisable
            ObjectReference currLink = GetLinkedRef()
            currLink.Disable()
            currLink.DisableLinkChain()
        else
            GetLinkedRef().Disable()

            ObjectReference SecondaryLink = GetLinkedRef(UC01_LaserGrid_SecondaryToggle_Keyword)
            if SecondaryLink != none
                SecondaryLink.Disable()
            endif
        endif

        if StageToSet >= 0 && !UC01.GetStageDone(ShutDownStage)
            UC01.SetStage(StageToSet)
        endif
    endif
EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC01", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction