Scriptname SQ_NeonAuroraCheckScript extends Quest
{watch for player to have or pick up Aurora while in Neon}

Location property CityNeonLocation auto const Mandatory

Keyword property LocTypeSettlement auto const mandatory

Potion property Drug_Aurora auto const mandatory

ReferenceAlias property ActiveCompanion auto const mandatory
{ companion alias - from SQ_Companion }

ReferenceAlias property PlayerShip auto const mandatory
{ current ship - from SQ_PlayerShip }

ReferenceAlias property Player auto const mandatory
{ player alias }

ActorValue property AuroraBlockingFastTravel auto const mandatory
{ use to give custom fast travel blocked message for this situation }

InputEnableLayer myEnableLayer

int CheckForAuroraTimerID = 1 Const

Event OnQuestInit()
    debug.trace(self + "OnQuestInit")
    myEnableLayer = InputEnableLayer.Create()
	RegisterForRemoteEvent(PlayerShip, "OnLocationChange")
    StartAuroraCheck(true)
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSender, Location akOldLoc, Location akNewLoc)
	debug.trace(self + "OnLocationChange akoldloc=" + akOldLoc + " aknewloc=" + akNewLoc)
	; if exiting Neon, do Aurora check
	bool newLocationInNeon = akNewLoc.IsSameLocation(CityNeonLocation, LocTypeSettlement)
	if newLocationInNeon == false
        debug.trace(self + " player ship is no longer in Neon - shut down quest")
        StartAuroraCheck(false)
	endif
endEvent

function StartAuroraCheck(bool bStart)
    debug.trace(self + "StartAuroraCheck " + bStart)

    Actor playerRef = Game.GetPlayer()
    Actor companionRef = ActiveCompanion.GetActorRef()

    if bStart
        CheckForAurora()
        AddInventoryEventFilter(Drug_Aurora)
        RegisterForRemoteEvent(Player, "OnItemAdded")
        RegisterForRemoteEvent(Player, "OnItemRemoved")
        RegisterForRemoteEvent(ActiveCompanion, "OnItemAdded")
        RegisterForRemoteEvent(ActiveCompanion, "OnItemRemoved")
    Else
        BlockFastTravel(playerRef, false)
        myEnableLayer.Delete()
        myEnableLayer = NONE
        Stop()
    endif
EndFunction

Event ReferenceAlias.OnItemAdded(ReferenceAlias akSource, Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
    ; run short timer
    StartTimer(0.5, CheckForAuroraTimerID)
endEvent

Event ReferenceAlias.OnItemRemoved(ReferenceAlias akSource, Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, int aiTransferReason)
    ; run short timer
    StartTimer(0.5, CheckForAuroraTimerID)
endEvent

Event OnTimer(int aiTimerID)
    if aiTimerID == CheckForAuroraTimerID
        CheckForAurora()
    endif
EndEvent

Guard CheckForAuroraGuard ProtectsFunctionLogic

Function CheckForAurora()
    debug.trace(self + " CheckForAurora")
    LockGuard CheckForAuroraGuard
        Actor playerRef = Game.GetPlayer()
        Actor companionRef = ActiveCompanion.GetActorRef()
        ; does player or companion have Aurora, if so turn off fast travel
        if playerRef.GetItemCount(Drug_Aurora) > 0 || (companionRef && companionRef.GetItemCount(Drug_Aurora) > 0)
            debug.trace(self + " player or companion has Aurora - disable fast travel")
            BlockFastTravel(playerRef, true)
        Else
            debug.trace(self + " nobody carrying Aurora - enable fast travel")
            BlockFastTravel(playerRef, false)
        endif
    endLockGuard
EndFunction

function BlockFastTravel(Actor playerRef, bool shouldBlock=true)
    if shouldBlock
        myEnableLayer.EnableFastTravel(false)
        playerRef.SetValue(AuroraBlockingFastTravel, 1)
    Else
        myEnableLayer.EnableFastTravel(true)
        playerRef.SetValue(AuroraBlockingFastTravel, 0)
    endif
EndFunction