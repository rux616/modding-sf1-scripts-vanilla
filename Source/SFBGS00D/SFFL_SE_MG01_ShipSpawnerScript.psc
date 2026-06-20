Scriptname SFBGS00D:SFFL_SE_MG01_ShipSpawnerScript extends Quest
{This function will spawn NPCs via triggers and interactions }
function ActivateAttackingShip(float timeToWait, ReferenceAlias EnemyShipAlias, ReferenceAlias PlayerShipAlias)
    Utility.Wait(timeToWait)
    SpaceshipReference EnemyShip = EnemyShipAlias.GetShipRef()
    if EnemyShip
        EnemyShip.EnableWithGravJump()
        EnemyShip.StartCombat(PlayerShipAlias.GetShipRef())
    endif
endFunction