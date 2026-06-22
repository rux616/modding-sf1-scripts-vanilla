Scriptname UC03_PlayerAliasScript extends ReferenceAlias

Group StagesAndIndices
    int Property BloodstoneHuntStage = 810 Const Auto
    {Once this stage is set, start tracking the player's collection of Bloodstone}

    int Property CompletionStage = 820 Const Auto
    {Stage to set once the player's got enough Bloodstone}
EndGroup

Group Objects
    MiscObject Property InorgUniqueBloodstone Mandatory Const Auto
    {Bloodstone misc object}
EndGroup

Group Aliases
    ReferenceAlias Property HematiteQuestItem Mandatory Const Auto
    {Holding alias for the Hematite misc object the player acquires}
EndGroup

Event OnAliasInit()
    trace(self, "Player alias init'ed.")
    RegisterForRemoteEvent(GetOwningQuest(), "OnStageSet")
EndEvent

Function RegisterPlayerForBloodstoneCollection()
    AddInventoryEventFilter(InorgUniqueBloodstone)
    trace(self, "Player registered for inventory events.")
EndFunction

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
    trace(self, "Inventory event received. Base item: " + akBaseItem + ". Count: " + aiItemCount + " Ref: " +akItemReference)
    if akBaseItem == InorgUniqueBloodstone
        Quest myInst = GetOwningQuest()
        trace(self, "Checking owning quest: " + myInst)
        Game.GetPlayer().RemoveItem(InorgUniqueBloodstone, abSilent = true)
        Game.GetPlayer().AddAliasedItem(InorgUniqueBloodstone, HematiteQuestItem, abSilent = true)
        RemoveInventoryEventFilter(InorgUniqueBloodstone)
        if myInst.GetStageDone(BloodstoneHuntStage)
            myInst.SetStage(CompletionStage)
        endif
    endif
EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC03", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction