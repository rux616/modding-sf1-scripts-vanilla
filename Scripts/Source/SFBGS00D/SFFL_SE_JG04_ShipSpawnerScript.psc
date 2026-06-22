Scriptname SFBGS00D:SFFL_SE_JG04_ShipSpawnerScript extends Quest
{Holds a Function (ActivateAttackingShip()) that jumps ships in with a delay.}

function ActivateAttackingShip(float timeToWait, ReferenceAlias EnemyShipAlias, ReferenceAlias PlayerShipAlias)
    Utility.Wait(timeToWait)
    SpaceshipReference EnemyShip = EnemyShipAlias.GetShipRef()
    if EnemyShip
        EnemyShip.EnableWithGravJump()
        EnemyShip.StartCombat(PlayerShipAlias.GetShipRef())
    endif
endFunction
