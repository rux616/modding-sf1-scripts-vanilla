Scriptname CF07_PlayerAliasScript extends ReferenceAlias

ActorValue Property CF07_ShipBuilderCheck_ComSpike Auto Const Mandatory
ActorValue Property CF07_ShipBuilderCheck_ConGrid Auto Const Mandatory
ReferenceAlias Property CF07_PlayerShip Auto Const Mandatory
Quest Property CF07 Mandatory Const Auto

;This is checking for two particular ship modules to be added to the Player's ship in the build menu
;CF06_ConductionGrid_ShipModule and CF05_Comspike_ShipModule - each adds 1 to their own CF07_ShipBuilderCheck
Event OnPlayerModifiedShip(SpaceshipReference akShip)
    If akShip.GetValue(CF07_ShipBuilderCheck_ComSpike) >= 1 && akShip.GetValue(CF07_ShipBuilderCheck_ConGrid) >= 1
        CF07.SetStage(40)
    EndIf
EndEvent