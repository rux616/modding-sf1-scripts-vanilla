Scriptname MissionBoardActivatorScript extends ObjectReference

Keyword property MissionBoardFilterKeyword auto Const
{ optional - keyword to pass in to filter mission quests }

ConditionForm property AccessConditions auto Const
{ optional - if included, this condition must be true to open the menu }

Message property AccessFailureMessage auto Const
{ optional - if included, message will be displayed if the AccessConditions are false }

MissionParentScript Property MB_Parent Auto Const Mandatory
{ mission parent quest }

Location property OverrideLocation auto Const
{ optional - if provided, the missions will populate using this location rather than the mission board's location }

int property FactionID = -1 auto Const
{ optional - pass in one of the following factionIDs if you want a "themed" mission board UI:
    United Colonies = 1
    Ryujin Industries = 2
    House Varuun = 3
    Freestar = 4
    Crimson Fleet = 5
    Constellation = 6
    Trackers Alliance = 7
}

bool property NeverResetOnLoad = false auto Const
{ used by "local" activators since we don't want to reset missions on load when the player may not be in the location }

bool property AlwaysResetOnLoad = false auto const 
{ if true, will reset with override onLoad. Use carefully, normally we don't want this behavior }

auto state default
Event OnActivate(ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer()
        GotoState("busy")
        Trace(Self, " OnActivate")
        if AccessConditions == NONE || AccessConditions.IsTrue(Game.GetPlayer(), self)
            Trace(Self, " OnActivate: updating mission data")
            ; update any mission data as needed
            MB_Parent.UpdateMissions()
            Trace(Self, " OnActivate: DONE updating mission data MissionBoardFilterKeyword: " + MissionBoardFilterKeyword + ", FactionID" + FactionID)
            Game.ShowMissionBoardMenu(MissionBoardFilterKeyword, FactionID)
        Elseif AccessFailureMessage
            AccessFailureMessage.Show()
        endif
        GotoState("default")
    endif
EndEvent
EndState

state busy
    Event OnActivate(ObjectReference akActionRef)
        Trace(Self, " OnActivate: busy - ignore input")
    endEvent
EndState

Event OnLoad()
    Trace(Self, " OnLoad")
    if NeverResetOnLoad == false
        ResetMissions()
    endif
EndEvent

Function ResetMissions()
    Trace(Self, " Mission board activator: ResetMissions")
    ; try to start any quests to fill in ones that the player has finished
    Location myResetLocation

    if OverrideLocation
        myResetLocation = OverrideLocation
    else
        if GetWorkshop()
            ; outpost - always reset missions
            myResetLocation=GetCurrentLocation()
        else
            Location[] settlementLocations = GetCurrentLocation().GetParentLocations(MB_Parent.LocTypeSettlement)
            if settlementLocations.Length > 0
                myResetLocation=settlementLocations[0]
            endif
        endif
        if myResetLocation == None
            myResetLocation=GetCurrentLocation()
        endif
    endif
    Trace(Self, " myResetLocation=" + myResetLocation)
    if myResetLocation
        MB_Parent.ResetMissions(bShutDownUnstarted=false, bShutDownAll=false, resetLocation=myResetLocation, resetLocationOverride = AlwaysResetOnLoad)
    endif
endFunction

Event OnWorkshopObjectPlaced(ObjectReference akReference)
    ; for workshop mission boards
    ResetMissions()
EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "SQ_Missions",  string SubLogName = "ParentScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "SQ_Missions",  string SubLogName = "ParentScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction