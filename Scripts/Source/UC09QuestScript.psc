Scriptname UC09QuestScript extends Quest

ReferenceAlias[] Property CabinetNPCAliases Mandatory Const Auto
{Array of Cabinet NPC aliases we use to get everyone in place for the big conversation}

ReferenceAlias Property EmergencyRecording Auto
{Holding alias for the emergency recording the player uses in the Cabinet scene}

Function GetNPCsInPlace()
    int i = 0
    int iLength = CabinetNPCAliases.Length

    while i < iLength
        Actor currACT = CabinetNPCAliases[i].GetActorRef()
        trace(self, "CurrAct: "+ currACT +" pre-Move location: " + currACT.GetCurrentLocation() + ". Cell:" + currACT.GetParentCell())

        if currACT
            currACT.EvaluatePackage()
            trace(self, "CurrAct: "+ currACT +" currect package: " + currACT.GetCurrentPackage() + "." )
            currACT.MoveToPackageLocation()
            trace(self, "CurrAct: "+ currACT +" post-Move location: " + currACT.GetCurrentLocation() + "." )
        endif

        i += 1
    endwhile
EndFunction

Function StaggeredEvalPackages()
    int i = 0
    int iLength = CabinetNPCAliases.Length
    float minwait = 0.2
    float maxwait = 0.4

    While (i < iLength)
        float fRand = Utility.RandomFloat(minwait, maxwait)
        Actor currAct = CabinetNPCAliases[i].GetActorRef()
        Utility.Wait(fRand)
        currAct.EvaluatePackage()

        i += 1
    EndWhile


EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC09", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction