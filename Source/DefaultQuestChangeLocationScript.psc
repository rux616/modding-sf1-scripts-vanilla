Scriptname DefaultQuestChangeLocationScript extends Quest const Default
{set a stage when the player enters or exits a location}

struct ChangeLocationStage
	Int StageToSet = -1 
	{Stage to Set}
	
	Location TargetLocation
	{The location we're interested in.}

	LocationAlias TargetLocationAlias
	{The location alias we're interested in.}

	bool SetStageOnEnterLocation = true
	{ if true (default), set stage when player enters location. If false,  set stage when player exits location}

	Int PrereqStage = -1
	{OPTIONAL - Stage that must be set for this script's functionality to execute}

	Int TurnOffStage = -1
	{OPTIONAL - If stage >= TurnOffStage, this script's functionality is ignored}

	bool CheckPlayerShip = true
	{ if true (default), also check when player's ship changes location }

	bool RequireExactLocation = true
	{ if true (default), set stage when player enters/exits the exact target location
	  if false, set stage when:
	     SetStageOnEnterLocation = true: player enters target location or a child of the target location
	     SetStageOnEnterLocation = false: player exits target location or a child of the target location, and is no longer in the target location or any children
	}

endStruct

ChangeLocationStage[] property ChangeLocationStages auto Const
{ array of stage/location data }

SQ_PlayerShipScript property SQ_PlayerShip auto const mandatory
{ autofill }

int property OverridePrereqStage = -1 auto Const
{ if this is set to a value > -1, ChangeLocationStages will not be checked at all until this stage is set }

Event OnQuestInit()
	; register for events
	RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
	RegisterForRemoteEvent(SQ_PlayerShip.PlayerShip, "OnLocationChange")
endEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
    debug.trace(self + " Actor.OnLocationChange " + akSender + " akOldLoc=" + akOldLoc + " akNewLoc=" + akNewLoc)
	if OverridePrereqStage < 0 || GetStageDone(OverridePrereqStage)
		; watch for player to change location
		if akSender == Game.GetPlayer()
			debug.trace(self + " player changed location - check location stages")
			CheckLocationStages(akOldLoc, akNewLoc, false)
		endif
	endif
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSender, Location akOldLoc, Location akNewLoc)
    debug.trace(self + " ReferenceAlias.OnLocationChange " + akSender + " akOldLoc=" + akOldLoc + " akNewLoc=" + akNewLoc)
	if OverridePrereqStage < 0 || GetStageDone(OverridePrereqStage)
		; watch for player ship to change location
		if akSender == SQ_PlayerShip.PlayerShip
			debug.trace(self + " player ship changed location - check location stages")
			CheckLocationStages(akOldLoc, akNewLoc, true)
		endif
	endif
EndEvent

Function CheckLocationStages(Location akOldLoc, Location akNewLoc, bool isPlayerShip)
	debug.trace(self + " CheckLocationStages akOldLoc=" + akOldLoc + " akNewLoc=" + akNewLoc + " isPlayerShip=" + isPlayerShip)
	
	; check stage array for this location
	int i = 0
	while i < changeLocationStages.Length
		ChangeLocationStage changeLocData = changeLocationStages[i]
		if changeLocData.TargetLocation
			CheckLocation(changeLocData.TargetLocation, changeLocData, akOldLoc, akNewLoc, isPlayerShip)
		endif

		if changeLocData.TargetLocationAlias
			Location targetLocation = changeLocData.TargetLocationAlias.GetLocation()
			CheckLocation(targetLocation, changeLocData, akOldLoc, akNewLoc, isPlayerShip)
		endif
		i += 1
	endwhile
EndFunction

function CheckLocation(Location targetLocation, ChangeLocationStage changeLocData, Location akOldLoc, Location akNewLoc, bool isPlayerShip)
	debug.trace(self + " CheckLocation targetLocation=" + targetLocation + " akOldLoc=" + akOldLoc + " akNewLoc=" + akNewLoc + " isPlayerShip=" + isPlayerShip)
	; is this a valid location?
	Location locationToCheck
	Location otherLocation

	bool bIsValidLocation = false
	debug.trace(self + " setStageOnEnterLocation=" + changeLocData.setStageOnEnterLocation)
	if changeLocData.setStageOnEnterLocation
		debug.trace(self + " Checking for ENTERING a location: targetLocation=" + targetLocation + " akNewLoc=" + akNewLoc)
		if targetLocation == akNewLoc || (changeLocData.RequireExactLocation == false && targetLocation.IsChild(akNewLoc) && targetLocation.IsChild(akOldLoc) == false)
			debug.trace(self + "    Valid location")
			bIsValidLocation = true
		endif
	Else
		debug.trace(self + " Checking for LEAVING a location: targetLocation=" + targetLocation + " akOldLoc=" + akOldLoc)
		; if exact location required, only need to check if you left target location
		if changeLocData.RequireExactLocation
			bIsValidLocation = (targetLocation == akOldLoc)
		Else
			if isPlayerShip == false
				; if new location is the player's ship, we need to check the ship's location, not the player's (ship has no child relationship with the location it's in)
				if akNewLoc == SQ_PlayerShip.playerShipInteriorLocation.GetLocation()
					akNewLoc = SQ_PlayerShip.PlayerShip.GetRef().GetCurrentLocation()
					debug.trace(self + "    Player entered player ship - use ship's location as akNewLoc=" + akNewLoc)
				endif
			endif
			; valid location: new location is not a child of the target (and isn't the target itself)
			; AND
			; (
			;   old location is the target
			;   OR
			;   old location is a child of the target
			; )
			if (targetLocation != akNewLoc && targetLocation.IsChild(akNewLoc) == false) && ( targetLocation == akOldLoc || targetLocation.IsChild(akOldLoc) )
				bIsValidLocation = true
			endif
		endif
	EndIf
	debug.trace(self + "    bIsValidLocation=" + bIsValidLocation)

	if bIsValidLocation
	    debug.trace(self + "    Valid location - check stages")
		; valid location - check if ship
		if (isPlayerShip == false || changeLocData.CheckPlayerShip)
			; valid location - check stages
			if GetStageDone(changeLocData.StageToSet) == false && ( changeLocData.PrereqStage == -1 || GetStageDone(changeLocData.PrereqStage) ) && ( changeLocData.TurnOffStage == -1 || GetStage() < changeLocData.TurnOffStage )
			    debug.trace(self + "    setting stage " + changeLocData.StageToSet)
				; passes stage checks
				SetStage(changeLocData.StageToSet)
			endif
		endif
	endif
endFunction
