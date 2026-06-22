Scriptname BECityCYRedTape02QuestScript extends Quest

Int Property TimesUpStage = 32 Const Auto
Int Property GaveFuelStage = 41 Const Auto
Int Property SabotagedFuelStage = 42 Const Auto
ActorValue Property ShipSystemEngineHealth Mandatory Const Auto
Potion Property ShipRepairKit Mandatory Const Auto
ReferenceAlias Property PlayerShip Mandatory Const Auto
ReferenceAlias Property EnemyShip Mandatory Const Auto
Topic Property BE_City_CY_RedTape02_Ship_JumpTopic Mandatory Const Auto
Int CountdownTimerID = 1
Float Property CountdownTimerLength = 20.0 Const Auto
Int UndockTimerID = 2
Float Property UndockTimerLength = 5.0 Const Auto


Function StartCountdown()
    StartTimer(CountdownTimerLength, CountdownTimerID)
EndFunction

Function StopCountdown()
    CancelTimer(CountdownTimerID)
EndFunction

Function ShipUndock()
    If GetStageDone(GaveFuelStage) || GetStageDone(SabotagedFuelStage)
        StartTimer(UndockTimerLength, UndockTimerID)
    EndIf
EndFunction

Function ShipGoodbye()
    SpaceshipReference myEnemyShip = EnemyShip.GetShipRef()
    myEnemyShip.Say(BE_City_CY_RedTape02_Ship_JumpTopic)
    If GetStageDone(GaveFuelStage)
        myEnemyShip.EnablePartRepair(ShipSystemEngineHealth, true)
        myEnemyShip.RestoreValue(ShipSystemEngineHealth, 100000)
        myEnemyShip.DisableWithGravJump()
    ElseIf GetStageDone(SabotagedFuelStage)
        myEnemyShip.Kill()
    EndIf
EndFunction


Function RemoveShipParts()
    Actor myPlayer = Game.GetPlayer()
    SpaceshipReference myShip = PlayerShip.GetShipReference()

    If myPlayer.GetItemCount(ShipRepairKit) >= 1
        myPlayer.RemoveItem(ShipRepairKit, 1)
    ElseIf myShip.GetItemCount(ShipRepairKit) >= 1
        myShip.RemoveItem(ShipRepairKit, 1)
    EndIf
EndFunction


Event OnTimer(int aiTimerID)
    If aiTimerID == CountdownTimerID
        SetStage(TimesUpStage)
    ElseIf aiTimerID == UndockTimerID
        ShipGoodbye()
    EndIf
EndEvent