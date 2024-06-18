Scriptname TestExplodingBarrel extends ObjectReference
{A script to prototype the functionality of an exploding barrel.}

Explosion Property Test_Fire_Sm_Explosion Auto Const
Weapon Property UnarmedHuman Auto Const
Form Property FireMed01 Const Auto
Form Property ENV_GasVentHazard_Heat_Small Const Auto
bool readyToExplode = false
bool punctured = false
bool exploded = false
ObjectReference FireFX
ObjectReference FireHazard
Form Property Test_Hazard_Pool_Fire Const Auto
int remainingFuel = 3

Event OnLoad()
	if Is3DLoaded()
		RegisterForHitEvent(self)
	EndIf
EndEvent

Event OnUnload()
	UnregisterForAllHitEvents()
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
  bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
    debug.trace(self + " On Hit registered")
    ; Check for the weapon type somehow.
    debug.trace(self + " Source = " + akSource)
    debug.trace(self + " Bash Attack = " + abBashAttack)
    debug.trace(self + " Aggressor = " + akAggressor)
    debug.trace(self + " Projectile = " + akProjectile)

    if(abBashAttack || akSource == UnarmedHuman as Form)
        debug.trace(self + " bash attack registered.")
        ;Checking for Bash Attack does not seem to work.
    Else
        if (readyToExplode)
                if(!exploded)
                    Explode()
                endif
        elseif(punctured)
            ;Catch on Fire
            FireFX = self.PlaceAtMe(FireMed01)
            FireHazard = self.PlaceAtMe(ENV_GasVentHazard_Heat_Small)
            StartTimer(3, 0) ;Onfire, going to explode
            readyToExplode = true
        Else
            StartTimer(3, 1)
            punctured = true
        EndIf

    endif
    ; Check if the barrel is punctured.
RegisterForHitEvent(self)


EndEvent

Event OnTimer(int aiTimerID)
    if(aiTimerID == 0)
        if(!exploded)
            Explode()
        endif
    elseif (aiTimerID == 1)
        if(!exploded && remainingFuel > 0 && punctured)
            LeakFuel()
        EndIf
    EndIf


EndEvent

Function Explode()
    exploded = true
    self.PlaceAtMe(Test_Fire_Sm_Explosion)
    UnregisterForAllHitEvents()
    FireFX.Disable()
    FireHazard.Disable()
    self.Disable()
EndFunction

Function LeakFuel()
    self.PlaceAtMe(Test_Hazard_Pool_Fire)
    remainingFuel = remainingFuel - 1
    StartTimer(3, 1)
EndFunction
