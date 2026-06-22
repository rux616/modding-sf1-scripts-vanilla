Scriptname MapMarkerLocationCooldownScript extends ObjectReference Const
{script sets a cooldown global when the player discovers this location}

GlobalVariable property LocationCooldown auto const mandatory
{ holds the cooldown time for this location - this needs to be on a cooldown condition for this location in the PCM }

float property cooldownDays = 2.0 auto const
{ how many days before allowing the PCM to place this location again? }

Event OnMapMarkerDiscovered()
    debug.trace(self + " OnMapMarkerDiscovered - set cooldown")
    LocationCooldown.SetValue(Utility.GetCurrentGameTime() + cooldownDays)
endEvent