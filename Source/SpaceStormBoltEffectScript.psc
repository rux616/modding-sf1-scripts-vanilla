Scriptname SpaceStormBoltEffectScript extends ActiveMagicEffect
{Script for SpaceStormBoltVFXEffect, the space storm bolt strike effect.}

ReferenceAlias property PlayerShip Auto Const Mandatory
ReferenceAlias property PlayerShipPilotSeat Auto Const Mandatory

float CONST_CameraShakeStrength_Min_InPilotSeat = 0.2 Const
float CONST_CameraShakeStrength_Max_InPilotSeat = 0.6 Const

float CONST_ControllerShakeStrength_Min_InPilotSeat = 0.2 Const
float CONST_ControllerShakeStrength_Max_InPilotSeat = 0.6 Const

float CONST_ShakeDuration_Min_InPilotSeat = 0.5 Const
float CONST_ShakeDuration_Max_InPilotSeat = 0.9 Const


float CONST_CameraShakeStrength_Min_NotInPilotSeat = 0.01 Const
float CONST_CameraShakeStrength_Max_NotInPilotSeat = 0.1 Const

float CONST_ControllerShakeStrength_Min_NotInPilotSeat = 0.01 Const
float CONST_ControllerShakeStrength_Max_NotInPilotSeat = 0.1 Const

float CONST_ShakeDuration_Min_NotInPilotSeat = 0.3 Const
float CONST_ShakeDuration_Max_NotInPilotSeat = 0.6 Const

float CONST_IgnoreChance_NotInPilotSeat = 0.5 Const


Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	float cameraShakeStrength
	float controllerShakeStrength
	float shakeDuration
	if (akTarget == PlayerShip.GetRef())
		if (Game.GetPlayer().GetFurnitureUsing() == PlayerShipPilotSeat.GetRef())
			cameraShakeStrength = Utility.RandomFloat(CONST_CameraShakeStrength_Min_NotInPilotSeat, CONST_CameraShakeStrength_Max_NotInPilotSeat)
			controllerShakeStrength = Utility.RandomFloat(CONST_ControllerShakeStrength_Min_NotInPilotSeat, CONST_ControllerShakeStrength_Max_NotInPilotSeat)
			shakeDuration = Utility.RandomFloat(CONST_ShakeDuration_Min_NotInPilotSeat, CONST_ShakeDuration_Max_NotInPilotSeat)
		ElseIf (Utility.RandomFloat(0, 1) < CONST_IgnoreChance_NotInPilotSeat)
			;Do nothing.
		Else
			cameraShakeStrength = Utility.RandomFloat(CONST_CameraShakeStrength_Min_InPilotSeat, CONST_CameraShakeStrength_Max_InPilotSeat)
			controllerShakeStrength = Utility.RandomFloat(CONST_ControllerShakeStrength_Min_InPilotSeat, CONST_ControllerShakeStrength_Max_InPilotSeat)
			shakeDuration = Utility.RandomFloat(CONST_ShakeDuration_Min_InPilotSeat, CONST_ShakeDuration_Max_InPilotSeat)
		EndIf

		if (shakeDuration > 0)
			Game.ShakeController(controllerShakeStrength, controllerShakeStrength, shakeDuration)
			Game.ShakeCamera(None, cameraShakeStrength, shakeDuration)
		EndIf
	EndIf
EndEvent