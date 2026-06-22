Scriptname UCR04_PlayerAliasScript extends ReferenceAlias

Guard CountGuard ;Guard used to ensure NumSamplesCollected doesn't get processed out of order

int Property NumSamplesRequired Auto
{Local var set from the quest script so we know how many samples we need to collect this round}

GlobalVariable Property UCR04_SamplesHarvested Auto Const Mandatory RequiresGuard(CountGuard)
{Global var used to track the number of samples the player's collected}

int Property AllSamplesCollectedStage = 500 Auto Const
{Stage to set once the player's collected sufficent samples}

MiscObject Property UCR04_SpecimenSample Mandatory Const Auto
{Misc object we're watching the player collect}

int Property SampleCollectionObj = 100  Auto Const
{Objective index for the primary quest objective}

;Called from quest script once it's finished setting up all the vars
Function ReadyPlayerAliasScript(int iSamplesRequired = 1)
    NumSamplesRequired = iSamplesRequired
    AddInventoryEventFilter(UCR04_SpecimenSample)
    trace(self, "Player alias prepped! NumSamplesRequired: " + NumSamplesRequired)
EndFunction

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
    trace(self, "We got a new item on the player: " + akBaseItem + ". Ref: " + akItemReference)
    if akBaseItem == UCR04_SpecimenSample
        ProcessNewSample()
    endif
EndEvent

Function ProcessNewSample()
    LockGuard CountGuard
        Quest OQ = GetOwningQuest()
        trace(self, "Processing our new sample. Harvested count before processing: " +  UCR04_SamplesHarvested.GetValueInt())

        if OQ.ModObjectiveGlobal(1.0, UCR04_SamplesHarvested, SampleCollectionObj, NumSamplesRequired)
            RemoveAllInventoryEventFilters()
            OQ.SetStage(AllSamplesCollectedStage) 
        endif
    EndLockGuard
EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UCR04", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction