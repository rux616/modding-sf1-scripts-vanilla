Scriptname DialogueShipServicesScript extends Quest

SQ_PlayerShipScript property SQ_PlayerShip auto const mandatory
{ autofill }

GlobalVariable property ShipServicesFuelCurrent auto const mandatory
{ will be current fuel on player's ship }

GlobalVariable property ShipServicesFuelAmount auto const mandatory
{ will be amount of fuel player needs to buy to top up }

GlobalVariable property ShipServicesFuelCost auto const mandatory
{ will be cost of fuel amount needed }

ActorValue property SpaceshipGravJumpFuel auto const mandatory
{ AV on ship that tracks fuel amount/capacity }

MiscObject property InorgCommonHelium3 auto const mandatory
{ use to get price }

Float property FuelCostMult = 1.0 auto const
{ multiplier on base value of He3 }

ActorValue Property Health Auto Const Mandatory
{ autofill }

GlobalVariable Property ShipServicesRepairCost Auto Const Mandatory
{ will be cost to fully repair ship }

; update globals used for refueling dialogue
Function UpdateFuelGlobals()
    ; get base fuel cost
    float fuelCostPerUnit = InorgCommonHelium3.GetGoldValue()
    ; TODO - modify based on player Commerce skill multiplier (will be an AV on the player)
    ; GEN-347874

    SpaceshipReference playerShipRef = SQ_PlayerShip.PlayerShip.GetShipRef()
    float fuelCurrent = 0.0
    float fuelAmount = 0.0
    float fuelCost = 0.0

    if playerShipRef
        fuelCurrent = playerShipRef.GetValue(SpaceshipGravJumpFuel)
        fuelAmount = playershipRef.GetBaseValue(SpaceshipGravJumpFuel) - fuelCurrent
        fuelCost = Math.Round(fuelAmount *  fuelCostPerUnit)
        debug.trace(self + " UpdateFuelGlobals: fuelCurrent=" + fuelCurrent + ", fuelAmount=" + fuelAmount + ", fuelCost=" + fuelCost)
    endif
    ShipServicesFuelCurrent.SetValue(fuelCurrent)
    ShipServicesFuelAmount.SetValue(fuelAmount)
    ShipServicesFuelCost.SetValue(fuelCost)
    UpdateCurrentInstanceGlobal(ShipServicesFuelCurrent)
    UpdateCurrentInstanceGlobal(ShipServicesFuelAmount)
    UpdateCurrentInstanceGlobal(ShipServicesFuelCost)
endFunction

Function RefuelPlayerShip()
    SpaceshipReference playerShipRef = SQ_PlayerShip.PlayerShip.GetShipRef()
    if playerShipRef
        ; remove credits
        Game.GetPlayer().RemoveItem(Game.GetCredits(), ShipServicesFuelCost.GetValueInt())
        ; restore fuel to max
        playerShipRef.RestoreValue(SpaceshipGravJumpFuel, ShipServicesFuelAmount.GetValue())
        ; update globals after refueling
        UpdateFuelGlobals()
    endif
EndFunction

Function RepairPlayerShip()
	SpaceshipReference PlayerShipRef = SQ_PlayerShip.PlayerShip.GetShipRef()
	if PlayerShipRef
		; remove credits
		Game.GetPlayer().RemoveItem(Game.GetCredits(), ShipServicesRepairCost.GetValueInt())
		; restore ship health
		PlayerShipRef.RestoreValue(Health, 99999)
	endif
EndFunction

