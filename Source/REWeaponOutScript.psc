Scriptname REWeaponOutScript extends Quest

int WeaponOutTimerID = 10
float WeaponOutTimerLength = 3.0

CustomEvent OnWeaponAway ;custom event to break AI out of 'Warn' interrupt

;requires '((self as Quest) as REWeaponOutScript).Startup()' on starting quest stage
Function StartUp()
	debug.trace(self + "starting WeaponOutTimer")
	StartTimer(WeaponOutTimerLength, WeaponOutTimerID)
EndFunction

Event OnTimer(int aiTimerID)
	if aiTimerID == WeaponOutTimerID
		debug.trace(self + "checking weapon status.")
		;check if the player has a weapon drawn
		if !Game.GetPlayer().IsWeaponDrawn()
			debug.trace(self + "Weapon is away.")
			;break AI out of Warn
			SendCustomEvent("OnWeaponAway")
		endif
		;start the loop again, timer is killed when quest ends
		StartTimer(WeaponOutTimerLength, WeaponOutTimerID)
	endif
EndEvent