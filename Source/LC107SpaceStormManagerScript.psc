Scriptname LC107SpaceStormManagerScript extends ObjectReference
{Script for the LC107 Space Storm Manager object.}

Group RequiredProperties
	ReferenceAlias property PlayerShip Auto Const Mandatory
	ReferenceAlias property PlayerShipPilotSeat Auto Const Mandatory
EndGroup

Group AutofillProperties
	VisualEffect property Space_HazardLightning_BG_00 Auto Const Mandatory
EndGroup

;Local variables.
bool spaceStormIsActive

int CONST_FarTravelStateDeparture = 0 Const
int CONST_GravJumpStateAnimStarted = 1 Const

float CONST_AmbientShakeStrengthMin = 0.01 Const
float CONST_AmbientShakeStrengthMax = 0.05 Const
float CONST_AmbientShakeDurationMin = 0.2 Const
float CONST_AmbientShakeDurationMax = 0.5 Const

int CONST_AmbientShakeTimerID = 1 Const
float CONST_AmbientShakeTimerDelayMin = 3.0 Const
float CONST_AmbientShakeTimerDelayMax = 5.0 Const


Event OnCellAttach()
	StartSpaceStormVFX()
EndEvent

Event OnCellDetach()
	StopSpaceStormVFX()
EndEvent

Event ReferenceAlias.OnShipFarTravel(ReferenceAlias akSource, Location aDepartureLocation, Location aArrivalLocation, int aState)
	StopSpaceStormVFX()
EndEvent

Event ReferenceAlias.OnShipGravJump(ReferenceAlias akSource, Location aDestination, int aState)
	if (aState == CONST_GravJumpStateAnimStarted)
		StopSpaceStormVFX()
	EndIf
EndEvent


Function StartSpaceStormVFX()
	spaceStormIsActive = True
	RegisterForRemoteEvent(PlayerShip, "OnShipFarTravel")
	RegisterForRemoteEvent(PlayerShip, "OnShipGravJump")
	Space_HazardLightning_BG_00.Play(PlayerShip.GetShipRef())
	StartTimer(Utility.RandomFloat(CONST_AmbientShakeTimerDelayMin, CONST_AmbientShakeTimerDelayMax), CONST_AmbientShakeTimerID)
EndFunction

Function StopSpaceStormVFX()
	spaceStormIsActive = False
	UnregisterForRemoteEvent(PlayerShip, "OnShipFarTravel")
	UnregisterForRemoteEvent(PlayerShip, "OnShipGravJump")
	Space_HazardLightning_BG_00.Stop(PlayerShip.GetShipRef())
EndFunction

Event OnTimer(int timerID)
	if (spaceStormIsActive)
		PlayAmbientShake()
		StartTimer(Utility.RandomFloat(CONST_AmbientShakeTimerDelayMin, CONST_AmbientShakeTimerDelayMax), CONST_AmbientShakeTimerID)
	EndIf
EndEvent

Function PlayAmbientShake()
	float shakeStrength = Utility.RandomFloat(CONST_AmbientShakeStrengthMin, CONST_AmbientShakeStrengthMax)
	float shakeDuration = Utility.RandomFloat(CONST_AmbientShakeDurationMin, CONST_AmbientShakeDurationMax)
	;Game.ShakeController(shakeStrength, shakeStrength, shakeDuration)
	Game.ShakeCamera(None, shakeStrength, shakeDuration)
EndFunction