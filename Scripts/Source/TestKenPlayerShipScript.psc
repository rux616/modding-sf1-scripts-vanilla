Scriptname TestKenPlayerShipScript extends Quest
ReferenceAlias Property PlayerShipAlias Auto

Event OnQuestInit()
	debug.trace(self + "OnQuestInit")
	Actor PlayerREF = Game.GetPlayer()
	RegisterForRemoteEvent(PlayerREF, "OnExitShipInterior")
	RegisterForRemoteEvent(PlayerREF, "OnSit")
	RegisterForRemoteEvent(PlayerREF, "OnLocationChange")
EndEvent

Event Actor.OnSit(Actor akSender, ObjectReference akFurniture)
	debug.trace(self + " OnSit " + akSender + " in " + akFurniture)
	;whenever the player sits in the pilot seat, set this ship to be the current ship
	SpaceshipReference newShip = Game.GetPlayer().GetCurrentShipRef()
	debug.trace(self + " Forcing player ship to " + newShip)
	PlayerShipAlias.ForceRefTo(newShip)
	RegisterForRemoteEvent(newShip, "OnLocationChange")
EndEvent

Event Actor.OnEnterShipInterior(Actor akSender, ObjectReference akShip)
	debug.trace(self + " OnEnterShipInterior " + akShip)
	if akShip == Game.GetPlayerHomeSpaceShip()
		debug.trace(self + " ResetPlayerShip " + akShip)
		PlayerShipAlias.ForceRefTo(akShip)
	endif
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	debug.trace(self + " player change location from " + akOldLoc + " to " + akNewLoc )
EndEvent

Event SpaceshipReference.OnLocationChange(SpaceshipReference akSender, Location akOldLoc, Location akNewLoc)
	debug.trace(self + " " + akSender + " change location from " + akOldLoc + " to " + akNewLoc)
EndEvent

function SpawnShip()
	SpaceshipReference playerShipRef = PlayerShipAlias.GetShipRef()
	float[] placePosition = new float[3]
	placePosition[0] = 0.0
	placePosition[1] = 100.0
	placePosition[2] = 0.0
	Form PirateShipBase = Game.GetForm(0x0038becf)
	SpaceshipReference myNewShip = playerShipRef.PlaceShipAtMe(PirateShipBase, 4, true, false, false, false, placePosition, PirateShipAlias)
	debug.trace(" Created ship " + myNewShip)
	;PirateShipAlias.ForceRefTo(myNewShip)
endFunction
ReferenceAlias Property PirateShipAlias Auto

function SpawnShipOnLand()
	ObjectReference LandMarkerRef = LandMarkerAlias.GetReference()
	float[] placePosition = new float[3]
	placePosition[0] = 0.0
	placePosition[1] = 0.0
	placePosition[2] = 0.0
	Form PirateShipBase = Game.GetForm(0x0003fb1e)
	SpaceshipReference myNewShip = LandMarkerRef.PlaceShipAtMe(PirateShipBase, 4, true, false, true, false, placePosition, PirateShipAlias)
	debug.trace(" Create ship " + myNewShip + " on the ground")
endFunction
ReferenceAlias Property LandMarkerAlias Auto
Cell Property cellToSpawn Auto Const Mandatory

function SpawnCell()
	SpaceshipReference playerShipRef = PlayerShipAlias.GetShipRef()
	Cell newCell = playerShipRef.PlaceCellAtMe(cellToSpawn)
	debug.trace(" Created cell " + newCell)
endFunction