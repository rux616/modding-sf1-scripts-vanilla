Scriptname UC03_SpaceportGuardRefColl extends RefCollectionAlias

Function MarkCollectionIgnoreFriendlyHits(RefCollectionAlias akTargetCollection, bool bIgnore = true)
    int i = 0
    int iCount = akTargetCollection.GetCount()
    trace(self, "Collection count to make friendly: " + iCount)

    while i < iCount
        ObjectReference currObj = akTargetCollection.GetAt(i)
        currObj.IgnoreFriendlyHits(bIgnore)
        trace(self, "NPC: " + currObj + " is now marked to IgnoreFriendlyHits:" + currObj.IsIgnoringFriendlyHits() )

        i += 1
    endwhile
EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC04", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction