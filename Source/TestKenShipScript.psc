Scriptname TestKenShipScript extends SpaceshipReference Const

Event OnShipLanding(bool abComplete)
  if abComplete
    ;Debug.Trace(Self + " completed landing! ramp state is " + IsRampDown())
  else
	;Debug.Trace(Self + " initiated landing. Ramp state is " + IsRampDown())
  endIf
endEvent

Event OnShipRampDown()
	;Debug.Trace(Self + "'s ramp is now connect to navmesh")
	;Debug.Trace(Self + " ramp state is now " + IsRampDown())
endEvent

Function TestDisableWithTakeOff()
	;debug.trace("disabling with take off this ship!")
	DisableWithTakeOffOrLanding()
	;debug.trace("done disabling " + Self + " with a takeoff animation!")
EndFunction

Function TestDisableTakeOffNoWait()
	;debug.trace("disabling with take off this ship NO WAIT!")
	DisableWithTakeOffOrLandingNoWait()
	;debug.trace("done disabling " + Self + " with a takeoff animation NO WAIT!")
EndFunction

Function TestDisableWithGrav()
	;debug.trace("disabling with grav this ship!")
	DisableWithGravJump()
	;debug.trace("done disabling " + Self + " with a grav jump!")
EndFunction

Function TestDisableGravJumpNoWait()
	;debug.trace("disabling with grav this ship NO WAIT!")
	DisableWithGravJumpNoWait()
	;debug.trace("done disabling " + Self + " with grav NO WAIT!")
EndFunction

Function TestEnableWithLanding()
	;debug.trace("enable with landing this ship")
	EnableWithLanding()
	;debug.trace("done enabling " + Self + " with landing")
EndFunction

Function TestEnableWithLandingNoWait()
	;debug.trace("enable with landing this ship NO WAIT")
	EnableWithLandingNoWait()
	;debug.trace("done enabling " + Self + " with landing NO WAIT")
EndFunction

Function TestEnable()
	;debug.trace("Testingo enableo of " + Self + " with fade in")
	Enable(true)
	;debug.trace("testing of enable with fade COMPLETED")
EndFunction

Function TestEnableNoWait()
	;debug.trace("testing of enable wITHOUT WAITING START")
	EnableNoWait()
	;debug.trace("testing of enable without waits COMPLETED")
EndFunction

Function TestDisable()
	;debug.trace("testing of disable WITH FADE START")
	Disable(true)
	;debug.trace("testing of disable with fade COMPLETED")
EndFunction

Function TestDisableNoWait()
	;debug.trace("testing of disable WITHOUT WAITING START")
	DisableNoWait()
	;debug.trace("testing of disable wITHOUT waiting COMPLETE")
EndFunction

Function TestGetPlanet()
	Planet planetAt = GetCurrentPlanet()
	;debug.trace("Hey " + Self + " is at planet " + planetAt)
EndFunction