Scriptname MQTutorialQuestPlayerScript extends ReferenceAlias

ReferenceAlias Property PlayerShip Mandatory Const Auto
Int Property EnterPlayerShipStage=10 Const Auto

Event OnEnterShipInterior(ObjectReference akShip)
    If (akShip == PlayerShip.GetRef())
        GetOwningQuest().SetStage(EnterPlayerShipStage)
    EndIf
EndEvent