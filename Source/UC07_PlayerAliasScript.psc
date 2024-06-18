Scriptname UC07_PlayerAliasScript extends ReferenceAlias

int Property PreReqStage = 300 Auto Const

int Property CraftedCellStage = 495 Auto Const
{Set this stage if the player crafted the Microcell, rather than bought it}

MiscObject Property UC07_Microcell Mandatory Const Auto
{Object to start watching for once the player knows they need one}

ReferenceAlias Property Microcell Mandatory Const Auto
{Ref alias to hold the acquired MicroCell so the player can't toss it}

Event OnAliasInit()
    trace(self, "Alias init'ed for NPC: " + GetRef())
    RegisterForRemoteEvent(GetOwningQuest(), "OnStageSet")
EndEvent

Event Quest.OnStageSet(Quest akSender, int auiStageID, int auiItemID)
    trace(self, "Stage Set: " + auiStageID)
    if auiStageID == PreReqStage
        trace(self, "Proper stage set. Register for inventory events.")
        UnregisterForRemoteEvent(GetOwningQuest(), "OnStageSet")
        AddInventoryEventFilter(UC07_Microcell)
    endif
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
    trace(self, "Item added: " + akBaseItem + ". akItemReference: " + akItemReference)
    if akBaseItem == UC07_Microcell
        RemoveAllInventoryEventFilters()
        Actor PlayACT = Game.GetPlayer()
        PlayACT.RemoveItem(UC07_Microcell, 1, abSilent = true)
        PlayACT.AddAliasedItem(UC07_MicroCell, Microcell, abSilent = true)
    endif
EndEvent

Event OnPlayerCraftItem(ObjectReference akBench, Location akLocation, Form akCreatedItem)
    if akCreatedItem == UC07_Microcell
        GetOwningQuest().SetStage(CraftedCellStage)
    endif
EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC07", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction