Scriptname GenericMotorScript extends ObjectReference
{script for objects with powered rotating motors}

String property  MotorName const auto
float property  MotorVelocity const auto
int property  MotorRotationAxis const auto
{ 0 = x, 1 = y, 2 = z}
float property  MotorForce const auto

bool init = false

Event OnLoad()
	debug.trace(self + " OnLoad")
    if init == false
    	init = true
		float aAxisX = 0.0
		float aAxisY = 0.0
		float aAxisZ = 0.0
		if MotorRotationAxis == 0
			aAxisX = MotorVelocity
		elseif MotorRotationAxis == 1
			aAxisY = MotorVelocity
		elseif MotorRotationAxis == 2
			aAxisZ = MotorVelocity
		endif

	    ApplyFanMotor( MotorName, aAxisX, aAxisY, aAxisZ, MotorForce, false )

    endif
EndEvent

Event OnInit()
	debug.trace(self + " OnInit")

EndEvent

Event OnPowerOff()
	debug.trace(self + " onpoweroff")
    FanMotorOn(false)
EndEvent

Event OnPowerOn(ObjectReference akPowerGenerator)
	debug.trace(self + " onpoweron")
	if IsDestroyed() == false
    	FanMotorOn(true)
    endif
EndEvent

Event OnActivate(ObjectReference akActionRef)
	; run timer to turn motor on/off
	StartTimer(2.0)
EndEvent

Event OnTimer(int aiTimerID)
	; check open state, to see if motor should turn on or off
	int openState = GetOpenState()
	debug.trace(self + "OnTimer openState=" + openState)
	; if "closed" (meaning ON), and powered, start motor
	if openState >= 3 && IsPowered() == true
    	FanMotorOn(true)
    else
    ; otherwise, stop motor
    	FanMotorOn(false)
    endif
EndEvent

; Patch 1.4: handle destruction state change
Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
	if IsDestroyed()
		FanMotorOn(false)
	elseif aiCurrentStage == 0
		; I've been repaired
		; run timer to turn motor on/off
		StartTimer(2.0)
	endif
EndEvent
