Scriptname SE_AF07Script extends Quest

ReferenceAlias property PlayerShip Auto Const Mandatory
ReferenceAlias property EnemyShip Auto Const Mandatory
SpaceshipBase property LvlShip_Ecliptic_A_Fighter Auto Const Mandatory
Scene Property SE_AF07_001_SpawnScene Auto Const Mandatory

int currSpawned
 
Function StartWaves()
  SpaceshipReference currShip = EnemyShip.GetShipRef()
  currShip.EnableWithGravJump()
  SE_AF07_001_SpawnScene.start()
  StartTimer(Utility.RandomInt(15,20))
EndFunction
 
Event OnTimer(int aiTimerID)		
    Debug.Trace(self + "Timer ended")
    
    ; Check if max amount of ships have been spawned, if not reset timer
    ;if GetStage() < 100 && currSpawned <= 4
        SpaceshipReference ship = PlayerShip.GetShipRef()
        SpaceshipReference enemyShipRef = ship.PlaceShipNearMe(LvlShip_Ecliptic_A_Fighter, ship.CONST_NearPosition_ForwardWide, ship.CONST_NearDistance_Close, ship.CONST_NearFacing_Direct)
        currSpawned += 1
        SpaceshipReference enemyShipRef02 = ship.PlaceShipNearMe(LvlShip_Ecliptic_A_Fighter, ship.CONST_NearPosition_ForwardWide, ship.CONST_NearDistance_Close, ship.CONST_NearFacing_Direct)
    ;EndIf
EndEvent
