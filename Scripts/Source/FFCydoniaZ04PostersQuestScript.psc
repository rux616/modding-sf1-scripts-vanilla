Scriptname FFCydoniaZ04PostersQuestScript extends Quest

GlobalVariable Property GameDaysPassed Mandatory Const Auto
GlobalVariable Property FFCydoniaZ04_Visit01_Time Mandatory Const Auto
GlobalVariable Property FFCydoniaZ04_TimeToPass Mandatory Const Auto
Int Property EndQuestStage = 1000 Const Auto

Int iStageDoneTotal = 0


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

	Int TurnOffStageDone = -1
	{OPTIONAL - If stage TurnOffStageDone is set, this script's functionality is ignored}

	bool CheckPlayerShip = true
	{ if true (default), also check when player's ship changes location }

	bool RequireExactLocation = true
	{ if true (default), set stage when player enters/exits the exact target location
	  if false, set stage when player enters/exits target location or a child of the target location
	}

    GlobalVariable Visit02Time
    {The Global to set and check against the global time in the game for the purpose of enabling more posters }

    RefCollectionAlias RefCollectionAliasToEnable
    {If set, Enable this RefCollectionAlias}

endStruct

ChangeLocationStage[] property ChangeLocationStages auto Const
{ array of stage/location data }

SQ_PlayerShipScript property SQ_PlayerShip auto const mandatory
{ autofill }

Event OnQuestInit()
	; register for events
	RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
	RegisterForRemoteEvent(SQ_PlayerShip.PlayerShip, "OnLocationChange")
    
    ; stamp the time value for the first period of time after the player completes the quest
    FFCydoniaZ04_Visit01_Time.SetValue(Utility.GetCurrentGameTime() + (FFCydoniaZ04_TimeToPass.GetValue()))
endEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
    debug.trace(self + " OnLocationChange " + akSender + " akOldLoc=" + akOldLoc + " akNewLoc=" + akNewLoc)
	; watch for player to change location
	if akSender == Game.GetPlayer()
		CheckLocationStages(akOldLoc, akNewLoc, false)
	endif
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSender, Location akOldLoc, Location akNewLoc)
    debug.trace(self + " OnLocationChange " + akSender + " akOldLoc=" + akOldLoc + " akNewLoc=" + akNewLoc)
	; watch for player ship to change location
	if akSender == SQ_PlayerShip.PlayerShip
		CheckLocationStages(akOldLoc, akNewLoc, true)
	endif
EndEvent

Function CheckLocationStages(Location akOldLoc, Location akNewLoc, bool isPlayerShip)
		; check stage array for this location
		int i = 0
		while i < changeLocationStages.Length
			ChangeLocationStage changeLocData = changeLocationStages[i]
			if changeLocData.TargetLocation
				if changeLocData.Visit02Time == None || GameDaysPassed.GetValue() >= changeLocData.Visit02Time.GetValue()
                    CheckLocation(changeLocData.TargetLocation, changeLocData, akOldLoc, akNewLoc, isPlayerShip)
                endIf
			endif

			if changeLocData.TargetLocationAlias
                if changeLocData.Visit02Time == None || GameDaysPassed.GetValue() >= changeLocData.Visit02Time.GetValue()
				    Location targetLocation = changeLocData.TargetLocationAlias.GetLocation()
				    CheckLocation(targetLocation, changeLocData, akOldLoc, akNewLoc, isPlayerShip)
                endIf
			endif
			i += 1
		endwhile
EndFunction

function CheckLocation(Location targetLocation, ChangeLocationStage changeLocData, Location akOldLoc, Location akNewLoc, bool isPlayerShip)
	; is this a valid location?
	Location locationToCheck
	Location otherLocation

	if changeLocData.setStageOnEnterLocation
		locationToCheck = akNewLoc
		otherLocation = akOldLoc
	Else
		locationToCheck = akOldLoc
		otherLocation = akNewLoc
	EndIf

    debug.trace(self + " CheckLocation targetLocation=" + targetLocation + " locationToCheck=" + locationToCheck + " " + targetLocation + ".IsChild(" + locationToCheck + ")=" + targetLocation.IsChild(locationToCheck))

	if targetLocation == locationToCheck || (changeLocData.RequireExactLocation == false && targetLocation.IsChild(locationToCheck) && targetLocation.IsChild(otherLocation) == false)
	    debug.trace(self + "    Valid location - check stages")
		; valid location - check if ship
		if (isPlayerShip == false || changeLocData.CheckPlayerShip)
			; valid location - check stages
			if GetStageDone(changeLocData.StageToSet) == false && ( changeLocData.PrereqStage == -1 || GetStageDone(changeLocData.PrereqStage) ) && ( changeLocData.TurnOffStageDone == -1 || !GetStageDone(changeLocData.TurnOffStageDone) )
				; passes stage checks
                SetStage(changeLocData.StageToSet)
                ; enable the posters, if set
                if changeLocData.RefCollectionAliasToEnable != None
                    changeLocData.RefCollectionAliasToEnable.EnableAll()
                endIf
                ; increment the StageDoneTotal so we know when all stages are done
                iStageDoneTotal += 1
                ; set the next time to check
                if changeLocData.Visit02Time != None
                    (changeLocData.Visit02Time).SetValue(Utility.GetCurrentGameTime() + (FFCydoniaZ04_TimeToPass.GetValue()))
                endIf
                ; if all stages have been set to done, set the EndQuestStage to shut down the quest
                if iStageDoneTotal == changeLocationStages.Length
                    SetStage(EndQuestStage)
                endIf
			endif
		endif
	endif
endFunction