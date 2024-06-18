Scriptname UC06_QuestScript extends Quest

Quest Property SQ_PlayerShip Mandatory Const Auto
{Quest for the player's ship}

MiscObject Property UC06_OrlaseID Mandatory Const Auto
{Orlase's ID}

int Property StageToSet = 550 Const Auto
{Stage to set once the player has collected Orlase's ID}

ActorValue Property SpaceshipCrew Mandatory Const Auto
{Actor value used to adjust Spaceship Crew}

ActorValue Property Assistance Mandatory Const Auto
{Actor value used to adjust NPC assistance}

ActorValue Property HideShipFromHUDValue Mandatory Const Auto
{Actor value used to turn off ships in the player's HUD (used for ambush purposes)}

Faction Property PlayerFriendFaction Mandatory Const Auto
{Faction used to keep the turrets from going hostile to the player until the last possible moment}

RefCollectionAlias Property EthereaTurrets Mandatory Const Auto
{Collection of Orlase's turrets for his ambush}

Function RegisterForShipItemCollection()
    ReferenceAlias PlayerShipAlias = (SQ_PlayerShip as SQ_PlayerShipScript).PlayerShip
    trace(self, "Registering for inventory events from: " + PlayerShipAlias)

    if PlayerShipAlias != none
    	RegisterForRemoteEvent(PlayerShipAlias, "OnItemAdded")
        AddInventoryEventFilter(UC06_OrlaseID)
        trace(self, "Watching for the ID to arrive.")
    endif
EndFunction

Event ReferenceAlias.OnItemAdded(ReferenceAlias akSender, Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
    trace(self, "Inventory triggered events from: " + akSender + " for object: " + akBaseItem)
    if akBaseItem == UC06_OrlaseID && !GetStageDone(StageToSet) && akSender == (SQ_PlayerShip as SQ_PlayerShipScript).PlayerShip
        trace(self, "We got the ID! Unregister and set the stage!")
        RemoveAllInventoryEventFilters()
        SetStage(StageToSet)
    endif
EndEvent

Function PrepTurrets()
    int i = 0
    int iCount = EthereaTurrets.GetCount()

    while i < iCount
        SpaceshipReference currRef = EthereaTurrets.GetAt(i) as SpaceshipReference
        currRef.SetUnconscious(true)
        currRef.SetValue(HideShipFromHUDValue, 1.0)
        trace(self, "Turret: " + currRef + " has SpaceshipCrew value: " + currRef.GetValue(SpaceshipCrew))

        i += 1
    endwhile
EndFunction

Function DeployTurrets()
    int i = 0
    int iCount = EthereaTurrets.GetCount()

    while i < iCount
        SpaceshipReference currRef = EthereaTurrets.GetAt(i) as SpaceshipReference
        (currRef as UC06_TurretOnlineScript).SetTurretOnline()
        trace(self, "Turret: " + currRef + " has SpaceshipCrew value: " + currRef.GetValue(SpaceshipCrew) + " and is in player friend faction: " + currRef.IsInFaction(PlayerFriendFaction))
        i += 1
    endwhile
EndFunction

Function DisableTurrets()
    int i = 0
    int iCount = EthereaTurrets.GetCount()

    while i < iCount
        SpaceshipReference currRef = EthereaTurrets.GetAt(i) as SpaceshipReference
        currRef.SetUnconscious(true)
        currRef.AddToFaction(PlayerFriendFaction)
        trace(self, "Turret: " + currRef + " has SpaceshipCrew value: " + currRef.GetValue(SpaceshipCrew) + " and is in player friend faction: " + currRef.IsInFaction(PlayerFriendFaction))

        i += 1
    endwhile
EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC06", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction