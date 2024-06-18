Scriptname TestLVC_PlayerAliasScript extends ReferenceAlias

Message Property TESTLVC_ScanPercentTestMessage Mandatory Const Auto
{Message used to display scan percentage}

GlobalVariable Property TestLVC_EnableScanningPercentDisplay Mandatory Const Auto
{Global used to manage the display of the scanned percentage of the current actor on screen}

Event OnPlayerScannedObject(ObjectReference akScannedRef)
    if TestLVC_EnableScanningPercentDisplay.GetValue() >= 1.0
        float fPercentScanned
        ;fPercentScanned akScannedRef.GetPercentageKnown()
        TESTLVC_ScanPercentTestMessage.Show(fPercentScanned)

        ActorBase[] currBiomeActors
        ActorBase[] currBiomeFlora
        ;/     
        currBiomeActors = Game.GetPlayer().GetBiomeActors()
        currBiomeFlora = Game.GetPlayer().GetFloraActors()
        /;
        int i = 0
        int iLength = currBiomeActors.Length

        while i < iLength
            ActorBase currBase = currBiomeActors[i]

            i += 1
            trace(self, "This biome contains actor: " + currBase + " (" + i + "/" + currBiomeActors.Length + ")")
        endwhile

    endif
EndEvent


;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "TESTLVC",  string SubLogName = "ScanPercentages", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction