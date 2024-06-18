Scriptname MissionBoardSupplyActivatorScript extends ReferenceAlias

SQ_OutpostCargoLinkScript property SQ_OutpostCargoLink auto const mandatory

keyword property LinkOutpostCargoLink auto const mandatory
{ keyword to find linked ref of my cargo link }

keyword property OutpostCargoLinkFueledKeyword auto const mandatory
{ keyword to find fueled cargo links }

Event OnActivate(ObjectReference akActionRef)
    MissionQuestScript myQuest = GetOwningQuest() as MissionQuestScript
    if myQuest.PlayerAcceptedQuest
        if akActionRef == Game.GetPlayer()
            ObjectReference myCargoLink = GetRef().GetLinkedRef(LinkOutpostCargoLink)
            Trace(Self, " OnActivate: myCargoLink=" + myCargoLink)
            if myCargoLink
                ; register for link change event
                RegisterForRemoteEvent(myCargoLink, "OnWorkshopCargoLinkChanged")
                ; open cargo link menu
                myCargoLink.ShowWorkshopTargetMenu(abIncludeSameSystem = true, akSameSystemRequiredKeyword = None, abIncludeIntersystem = true, akIntersystemRequiredKeyword = OutpostCargoLinkFueledKeyword)
            endif
        endif
    endif
endEvent

Event ObjectReference.OnWorkshopCargoLinkChanged(ObjectReference akSource, ObjectReference akOldTarget, ObjectReference akNewTarget)
    Trace(Self, " OnWorkshopCargoLinkChanged akOldTarget=" + akOldTarget + " akNewTarget=" + akNewTarget)
    if akNewTarget == None
        ; update quest
        (GetOwningQuest() as MissionSupplyScript).CargoLinkCleared()
    elseif akNewTarget != akOldTarget
        ; update quest
        (GetOwningQuest() as MissionSupplyScript).CargoLinkEstablished(akNewTarget)
    endif
endEvent

Event OnWorkshopObjectRemoved(ObjectReference akActionRef)
    ; update quest
    (GetOwningQuest() as MissionSupplyScript).CargoLinkCleared()
endEvent


;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "SQ_Missions",  string SubLogName = "Supply", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "SQ_Missions",  string SubLogName = "Supply", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction