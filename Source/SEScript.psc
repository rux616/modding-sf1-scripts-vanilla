Scriptname SEScript extends rescript

group SE_Properties
	ReferenceAlias Property PlayerShip auto const Mandatory
	{ player ship alias }

	LocationAlias property OrbitLocation auto const Mandatory
	{ orbit location for this SE }

	bool Property StopQuestWhenPlayerLeavesSystem = True auto
	{Default = true, once player leaves system, quest should stop }

	LocationAlias Property LocationShutdownOnExit auto const
	{OPTIONAL: shutdown this quest when player ship exits this location }

	bool Property SetStageOnInSameLocation = false Auto const
	{Set a stage when the player is in the same location as this SE}

	bool Property UseGlobalHailTimer = false Auto const
	{If you want this script to handle triggering the hail for this SE}

	GlobalVariable Property SEGlobalHailTimer Const Auto mandatory
	{Global variable for the initial hail}

	int Property HailTimerModifier = 0 Const Auto
	{Increases or decreases the default SeGlobalHailTimer by HailTimerModifier seconds}

	int Property HailingStage = 50 Const Auto
	{Stage that starts the hail}
	
	int Property HailingDoneStage = 100 Const Auto
	{Stage that tracks if the hailing scene has already been run}

	int Property stageToSetOnInSameLocation Const Auto
	{stage to set when the ship is in this location}

	ReferenceAlias Property HailingShip auto const
	{ hailing ship alias }

	bool Property enableMapMarkerOnStart Const Auto
	{enable mapmarker for POI SEs so the banner doesn't show on arrival for player SEs}

	int Property FallBackTimerAdded = 5 Const Auto
	{Additional buffer time for backup timer for the automatic hail.}

	bool Property setCooldownOnShutdown = false Const Auto
	{if true, will set cooldown timer on quest stoppage. For Player encounters where change location cooldown is invalid}

endGroup

int GlobalHailTimerID = 1
int FallbackHailTimerID = 2


Event OnQuestStarted()
	debug.trace(self + "OnQuestStarted: registering for OnLocationChange event for " + PlayerShip.GetRef())
	if LocationShutdownOnExit || StopQuestWhenPlayerLeavesSystem || UseGlobalHailTimer
		RegisterForRemoteEvent(PlayerShip, "OnLocationChange")
		RegisterForRemoteEvent(PlayerShip, "OnShipGravJump")
	endif
	; we don't care about OnStoryScript event
	bFinishedOnStoryEvent = true
	
	if enableMapMarkerOnStart
		MapMarker.GetRef().Enable()
	endif	

	if CheckLocation() && UseGlobalHailTimer
		RegisterForMenuOpenCloseEvent("FaderMenu")
		StartFallbackHailTimer()
	EndIf

    Parent.OnQuestStarted()
EndEvent

; OVERRIDE parent - we don't have a trigger to set
Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, \
  int aiValue1, int aiValue2)
  ; do nothing - just override
endEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSender, Location akOldLoc, Location akNewLoc)
	debug.trace(self + " OnLocationChange: akOldLoc=" + akOldLoc + " akNewLoc=" + akNewLoc)
	bool shouldShutdown = false
	; have we arrived in the OrbitLocation
	if setCooldownOnLoad
		Location orbitLoc = OrbitLocation.GetLocation()
		if akNewLoc == orbitLoc || orbitLoc.IsChild(akNewLoc)
			debug.trace(self + " OnLocationChange: arrived in orbit location " + orbitLoc + " - set cooldown")
			SetCooldown()
		endif
	endif

	if SetStageOnInSameLocation
		Location orbitLoc = OrbitLocation.GetLocation()
		if akNewLoc == orbitLoc || orbitLoc.IsChild(akNewLoc)
			SetStage(stageToSetOnInSameLocation)
		endif
	EndIf

	; have we left the shutdown location?
	if LocationShutdownOnExit
		Location shutdownLocation = LocationShutdownOnExit.GetLocation()
		debug.trace(self + " OnLocationChange: shutdownLocation=" + shutdownLocation)
		if shutdownLocation
			; we've left if:
			; * we're not in any location
			; OR
			; * we're in a location that is not the shutdown location or a child of it
			if akNewLoc == NONE || akNewLoc != shutdownLocation || shutdownLocation.IsChild(akNewLoc) == false
				debug.trace(self + " OnLocationChange: player not in shutdownLocation " + shutdownLocation + ": calling shutdown")
				shouldShutdown = true
			endif
		endif
	EndIf

	if shouldShutdown == false && StopQuestWhenPlayerLeavesSystem
		; has player left system?
		Location myOrbitLocation = OrbitLocation.GetLocation()
		if myOrbitLocation && akNewLoc && myOrbitLocation.HasCommonParent(akNewLoc, RE_Parent.LocTypeStarSystem) == false
			; player is in different system - shut down
			debug.trace(self + " OnLocationChange: player not in same system as " + myOrbitLocation + ": calling shutdown")
			shouldShutdown = true
		endif
	EndIf

	debug.trace(self + " OnLocationChange: shouldShutdown=" + shouldShutdown)
	if shouldShutdown
		Shutdown()
	endif
	
	if CheckLocation() && UseGlobalHailTimer
		;run again on location change for POI SEs
		RegisterForMenuOpenCloseEvent("FaderMenu")
		StartFallbackHailTimer()
	EndIf
EndEvent

Event ReferenceAlias.OnShipGravJump(ReferenceAlias akSender, Location aDestination, int aState)
	debug.trace(self + " OnShipGravJump " + aState)
	if aState == 1 ; animation started
		; shut down (grav jump only happens when the player is moving to a new system)
		if StopQuestWhenPlayerLeavesSystem
			debug.trace(self + " OnShipGravJump: shutting down quest")
			Shutdown()
		endif
	endif
endEvent

Event OnQuestShutdown()
    if setCooldownOnShutdown == true
        SetCooldown()
    endif
endEvent

; remove specified item(s) from player's or player ship's inventory
; prefershipInventory:
;    True = check ship inventory first
;	 False = check player inventory first
bool Function RemoveItemFromPlayerOrShip(Form itemToRemove, int countToRemove = 1, int stageToSetOnSuccess = -1, bool preferShipInventory=true)
	SpaceshipReference playerShipRef = PlayerShip.GetShipRef()
	ObjectReference playerRef = Game.GetPlayer()

	bool success = false

	if preferShipInventory
		success = TryToRemoveItem(itemToRemove, countToRemove, playerShipRef)
	Else
		success = TryToRemoveItem(itemToRemove, countToRemove, playerRef)
	endif

	if success == false
		; try the other one
		if preferShipInventory
			success = TryToRemoveItem(itemToRemove, countToRemove, playerRef)
		Else
			success = TryToRemoveItem(itemToRemove, countToRemove, playerShipRef)
		endif
	endif

	if success && stageToSetOnSuccess > -1
		SetStage(stageToSetOnSuccess)
	EndIf
	return success
EndFunction

; remove items from specified ref if that ref has enough
bool Function TryToRemoveItem(Form itemToRemove, int countToRemove, ObjectReference refToRemoveFrom)
	bool success = false
	if refToRemoveFrom && refToRemoveFrom.GetItemCount(itemToRemove) >= countToRemove
		success = true
		refToRemoveFrom.RemoveItem(itemToRemove, countToRemove)
	endif
	return success
EndFunction

bool Function CheckLocation()

	Location orbitLoc = OrbitLocation.GetLocation()
	if Playership.GetRef().IsinLocation(orbitLoc) 
		Return true
	else
		Return false
	endif

EndFunction

Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)
    if (asMenuName== "FaderMenu")
        if (!abOpening)
	    	Debug.Trace("Loading menu is closed!")
			StartGlobalHailTimer()
			UnRegisterForMenuOpenCloseEvent("FaderMenu")
        endif
    endif

EndEvent

Function StartGlobalHailTimer()

	;primary timer
	StartTimer(SEGlobalHailTimer.GetValue() + HailTimerModifier, GlobalHailTimerID)	

EndFunction

Function StartFallbackHailTimer()

	;fallback timer in the event that we miss the fade up
	StartTimer(SEGlobalHailTimer.GetValue() + HailTimerModifier + FallBackTimerAdded, FallbackHailTimerID)	

EndFunction

Event OnTimer(int aiTimerID)		
  If (aiTimerID == GlobalHailTimerID  || aiTimerID == FallbackHailTimerID)
	if (GetStageDone(HailingDoneStage) == false && CheckLocation())
		SetStage(HailingStage)
		UnRegisterForMenuOpenCloseEvent("FaderMenu")
	endif
  EndIf
EndEvent

Function DebugPOI()

	{Debug function to cqf for testing.}

	objectreference testmapmarker = MapMarker.GetRef()
	ObjectReference XMarker = MapMarker.GetRef().GetLinkedRef()
	Game.GetPlayer().moveto(XMarker)
	
EndFunction