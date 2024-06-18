Scriptname LC088_DefensiveBatteryScript extends SpaceshipReference
{Script to toggle the Defensive Batteries' Laser Fire.}
;
;Defensive Batteries will:
; - Aim for [CONST_AimingTimerDelay] seconds.
; - Continue to aim until their combat target is hit by their firing beam.
; - Fire for [CONST_FiringTimerDelay] seconds.
; -- If we lose our target for more than [CONST_FiringTimeHitCheckLapse] seconds, return to Aiming.
; -- If we finish firing, recharge for [CONST_RechargingTimerDelay] seconds, then return to Aiming.
; - Then return to aiming.

Group AutofillProperties
	ActorValue property Health Auto Const Mandatory
	ActorValue property SpaceshipWeaponGroup1SystemHealth Auto Const Mandatory
	ActorValue property SpaceshipWeaponGroup2SystemHealth Auto Const Mandatory
	Projectile property DefensiveBatteryLaserProjectile Auto Const Mandatory
EndGroup

;Local Variables
int batteryState
float firingTimeLastHitTimestamp
float baseHealth
SpaceshipReference activeCombatTarget


;Local Consts
int CONST_BatteryState_Aiming = 0 Const
int CONST_BatteryState_AimingToFire = 1 Const
int CONST_BatteryState_Firing = 2 Const
int CONST_BatteryState_Recharging = 3 Const

int CONST_AimingTimerID = 1 Const
int CONST_AimingTimerDelay = 5 Const

int CONST_FiringTimerExpireID = 2 Const
int CONST_FiringTimerExpireDelay = 15 Const
int CONST_FiringTimerLapseHitRecheckTime = 1 Const
int CONST_FiringTimerLapsedTime = 5 Const

int CONST_RechargingTimerID = 3 Const
int CONST_RechargingTimerDelay = 5 Const

int CONST_HitCheckTimerID = 4 Const
int CONST_HitCheckTimerDelay = 1 Const

int CONST_RegenHealthTimerID = 5 Const
float CONST_RegenHealthTimerDelay = 0.3 Const


Auto State Waiting
	Event OnCellLoad()
		baseHealth = GetBaseValue(Health)
		EnablePartRepair(SpaceshipWeaponGroup1SystemHealth, False)
		EnablePartRepair(SpaceshipWeaponGroup2SystemHealth, False)
		GoToState("Active")
	EndEvent
EndState

State Active
	;Do nothing.
EndState


Event OnCombatStateChanged(ObjectReference akTarget, int aeCombatState)
	if (batteryState != CONST_BatteryState_Recharging)
		SetBatteryState(CONST_BatteryState_Aiming)
	EndIf
EndEvent

Function SetBatteryState(int newState)
	batteryState = newState
	if (batteryState == CONST_BatteryState_Aiming)
		Debug.Trace("AIMING-----")
		DamageValue(SpaceshipWeaponGroup2SystemHealth, GetValue(SpaceshipWeaponGroup2SystemHealth))
		RestoreValue(SpaceshipWeaponGroup1SystemHealth, GetBaseValue(SpaceshipWeaponGroup1SystemHealth))
		StartTimer(CONST_AimingTimerDelay, CONST_AimingTimerID)
	ElseIf (batteryState == CONST_BatteryState_AimingToFire)
		Debug.Trace("AIMING TO FIRE-----")
		RestoreValue(SpaceshipWeaponGroup1SystemHealth, GetBaseValue(SpaceshipWeaponGroup1SystemHealth))
		RestoreValue(SpaceshipWeaponGroup2SystemHealth, GetBaseValue(SpaceshipWeaponGroup2SystemHealth))
		UpdateActiveCombatTarget()
		StartTimer(CONST_HitCheckTimerDelay, CONST_HitCheckTimerID)
	ElseIf (batteryState == CONST_BatteryState_Firing)
		Debug.Trace("FIRING-----")
		DamageValue(SpaceshipWeaponGroup2SystemHealth, GetValue(SpaceshipWeaponGroup2SystemHealth))
		RestoreValue(SpaceshipWeaponGroup1SystemHealth, GetBaseValue(SpaceshipWeaponGroup1SystemHealth))
		UpdateActiveCombatTarget()
		StartTimer(CONST_FiringTimerExpireDelay, CONST_FiringTimerExpireID)
	Else
		Debug.Trace("RECHARGING-----")
		DamageValue(SpaceshipWeaponGroup1SystemHealth, GetValue(SpaceshipWeaponGroup1SystemHealth))
		DamageValue(SpaceshipWeaponGroup2SystemHealth, GetValue(SpaceshipWeaponGroup2SystemHealth))
		StartTimer(CONST_RechargingTimerDelay, CONST_RechargingTimerID)
	EndIf
EndFunction

Event OnTimer(int timerID)
	if (timerID == CONST_AimingTimerID)
		SetBatteryState(CONST_BatteryState_AimingToFire)
	ElseIf (timerID == CONST_FiringTimerExpireID)
		SetBatteryState(CONST_BatteryState_Recharging)
	ElseIf (timerID == CONST_RechargingTimerID)
		SetBatteryState(CONST_BatteryState_Aiming)
	ElseIf (timerID == CONST_HitCheckTimerID)
		SpaceshipReference currentCombatTarget = GetCombatTarget()
		if (activeCombatTarget != currentCombatTarget)
			UpdateActiveCombatTarget(currentCombatTarget)
		EndIf
		float currentTime = Utility.GetCurrentRealTime()
		if (firingTimeLastHitTimestamp < currentTime)
			Debug.Trace("--TimerReset: Resetting Defensive Battery last hit timestamp.")
			firingTimeLastHitTimestamp = currentTime
		EndIf
		if ((batteryState == CONST_BatteryState_Firing) && (firingTimeLastHitTimestamp + CONST_FiringTimerLapsedTime < currentTime))
			Debug.Trace("RESET TO AIMING: Target lapsed.")
			SetBatteryState(CONST_BatteryState_Aiming)
		ElseIf ((batteryState == CONST_BatteryState_AimingToFire) || (batteryState == CONST_BatteryState_Firing))
			StartTimer(CONST_HitCheckTimerDelay, CONST_HitCheckTimerID)
		EndIf
	ElseIf (timerID == CONST_RegenHealthTimerID)
		RestoreValue(Health, baseHealth/25)
		if (GetValue(Health) < baseHealth)
			StartTimer(CONST_RegenHealthTimerDelay, CONST_RegenHealthTimerID)
		EndIf
	EndIf
EndEvent

Function UpdateActiveCombatTarget(SpaceshipReference currentCombatTarget=None)
	if (currentCombatTarget == None)
		currentCombatTarget = GetCombatTarget()
	EndIf
	if (activeCombatTarget != None)
		UnregisterForHitEvent(activeCombatTarget)
	EndIf
	activeCombatTarget = currentCombatTarget
	Debug.Trace("Active combat target now: " + activeCombatTarget)
	if (batteryState == CONST_BatteryState_Firing)
		Debug.Trace("RESET TO AIMING: Target changed.")
		SetBatteryState(CONST_BatteryState_Aiming)
	Else
		RegisterForHitEvent(activeCombatTarget, akProjectileFilter=DefensiveBatteryLaserProjectile)
	EndIf
EndFunction

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	Debug.Trace("Hit Event: " + akTarget + " " + akProjectile)
	if (akTarget == activeCombatTarget)
		if (batteryState == CONST_BatteryState_AimingToFire)
			SetBatteryState(CONST_BatteryState_Firing)
		EndIf
		if (batteryState == CONST_BatteryState_Firing)
			Utility.Wait(CONST_FiringTimerLapseHitRecheckTime)
			firingTimeLastHitTimestamp = Utility.GetCurrentRealTime()
			RegisterForHitEvent(activeCombatTarget, akProjectileFilter=DefensiveBatteryLaserProjectile)
		EndIf
	EndIf
EndEvent

Function RegenBattery()
	StartTimer(0, CONST_RegenHealthTimerID)
EndFunction