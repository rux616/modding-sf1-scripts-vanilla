Scriptname SEScript extends rescript

group SE_Properties
	ReferenceAlias Property PlayerShip auto const Mandatory
	{ player ship alias }

	LocationAlias property OrbitLocation auto const Mandatory
	{ orbit location for this SE }

	bool Property UseCruisePOILifespanTimer = true Auto
	{If you want this script to handle automatically removing SEs from Free Lanes}

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

	float property CheckDistance = 50000.0 auto Const
	{ Used to check if the player's ship is actually at the current space encounter, distance from the player to the map marker }

endGroup

int GlobalHailTimerID = 1 Const
int FallbackHailTimerID = 2 Const
int CruisePOILifespanTimerID = 10 Const
int CruisePOILifespanTimer = 150 ;default value
bool isCruiseModeQuest = false

Event OnQuestStarted()
	debug.trace(self + "OnQuestStarted: registering for OnLocationChange event for " + PlayerShip.GetRef())
	if LocationShutdownOnExit || StopQuestWhenPlayerLeavesSystem || UseGlobalHailTimer
		RegisterForRemoteEvent(PlayerShip, "OnLocationChange")
		RegisterForRemoteEvent(PlayerShip, "OnShipGravJump")
		RegisterForRemoteEvent(PlayerShip, "OnShipCruiseArrival")
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

Event OnStoryChangeLocationEx(ObjectReference akActor, Location akOldLocation, Location akNewLocation, bool abIsSpaceCruiseEvent)
	Debug.Trace(akActor + " moved from " + akOldLocation + " to " + akNewLocation + " was from cruise mode " + abIsSpaceCruiseEvent)
	Debug.Trace(self + " CRUISE MODE - OnStoryChangeLocationEvent registered!")

	if abIsSpaceCruiseEvent == true
		;Check that this SE came from the Free Lanes Story Manager nodes
		isCruiseModeQuest = true
		if UseCruisePOILifespanTimer
			;check that this SE is flagged to use the Cruise Mode lifespan timer (default == true)
			debug.trace(self + " OnStoryChangeLocation: Starting CruisePOILifespanTimer...")
			StartSECruiseLifespanTimer()
		endif	
	endif
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
		if CheckLocation()
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
		if myOrbitLocation && akNewLoc && myOrbitLocation.HasCommonParent(akNewLoc, RE_Parent.LocTypeStarSystem) == false && akNewLoc.IsChild(myOrbitLocation) == false && myOrbitLocation.IsChild(akNewLoc) == false && myOrbitLocation != akNewLoc
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
		RegisterForRemoteEvent(PlayerShip, "OnShipCruiseArrival")
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

	Debug.Trace(self + "CheckLocation: Player location: " + PlayerShip.GetRef().GetCurrentLocation() + " - Quest location: " + orbitLoc + "Is cruise mode quest = " + isCruiseModeQuest)

	if isCruiseModeQuest == false && Playership.GetRef().IsinLocation(orbitLoc)
		Return true
	elseIf isCruiseModeQuest && MapMarker == None && Playership.GetRef().IsinLocation(orbitLoc)
		Return true
	elseIf isCruiseModeQuest && Playership.GetRef().IsinLocation(orbitLoc) && MapMarker != None && PlayerShip.GetRef().GetDistance(MapMarker.GetRef()) <= CheckDistance
		Debug.Trace(self + "Distance from player ship to map marker:" + PlayerShip.GetRef().GetDistance(MapMarker.GetRef()))
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
			UnregisterForMenuOpenCloseEvent("FaderMenu")
			UnregisterForRemoteEvent(PlayerShip, "OnShipCruiseArrival")
        endif
    endif

EndEvent

Event ReferenceAlias.OnShipCruiseArrival(ReferenceAlias akSource)
	if akSource == PlayerShip && CheckLocation()
	   	Debug.Trace("Arrived out of Cruise mode")
		;we've visited this location in cruise mode, so it shouldn't shut down from the CruisePOILifespanTimer now
		UseCruisePOILifespanTimer = false
		CancelTimer(CruisePOILifespanTimerID)
		StartGlobalHailTimer()
		UnregisterForRemoteEvent(PlayerShip, "OnShipCruiseArrival")
		UnregisterForMenuOpenCloseEvent("FaderMenu")
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

;Cruise SE Lifespan Timer Func
Function StartSECruiseLifespanTimer()
	;Start Cruise Mode lifespan timer countdown
	StartTimer(CruisePOILifespanTimer, CruisePOILifespanTimerID)	
EndFunction

Event OnTimer(int aiTimerID)		
  If (aiTimerID == GlobalHailTimerID  || aiTimerID == FallbackHailTimerID)
	if (GetStageDone(HailingDoneStage) == false && CheckLocation())
		SetStage(HailingStage)
		UnregisterForMenuOpenCloseEvent("FaderMenu")
		UnregisterForRemoteEvent(PlayerShip, "OnShipCruiseArrival")
	endif
  EndIf

  If aiTimerID == CruisePOILifespanTimerID && !MapMarker.GetRef().Is3DLoaded()
		;Cruise Mode SE Lifespan timer check - if player is not playing the SE and lifespan timer ends, shutdown.
		debug.trace(self + " CRUISE - CruisePOILifespanTimer ended, stopping Quest")
		Shutdown()
  EndIf

  If aiTimerID == CruisePOILifespanTimerID && MapMarker.GetRef().Is3DLoaded()
        ;Timer ended but the player has arrived at the SE and 3DLoaded the marker, so don't shutdown and cacncel the timer.
		debug.trace(self + " CRUISE - CruisePOILifespanTimer cancelling because player entered SE location")
        CancelTimer(CruisePOILifespanTimerID)
  EndIf
EndEvent

Function DebugPOI()

	{Debug function to cqf for testing.}

	objectreference testmapmarker = MapMarker.GetRef()
	ObjectReference XMarker = MapMarker.GetRef().GetLinkedRef()
	Game.GetPlayer().moveto(XMarker)
	
EndFunction