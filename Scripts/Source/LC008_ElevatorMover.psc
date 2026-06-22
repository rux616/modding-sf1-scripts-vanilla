Scriptname LC008_ElevatorMover extends ObjectReference Const

Keyword Property LinkCustom01 Const Auto
{End Position}
Keyword Property LinkCustom02 Const Auto
{Start Position}
Keyword Property LinkCustom03 Mandatory Const Auto
{Door to Slayton}
float Property TranslationSpeed = 1.0 Const Auto

Event OnActivate(ObjectReference akActionRef)
    ObjectReference StartPosition = GetLinkedRef(LinkCustom02)
    self.SetPosition(StartPosition.GetPositionX(), StartPosition.GetPositionY(), StartPosition.GetPositionZ())
    self.TranslateToRef(GetLinkedRef(LinkCustom01), TranslationSpeed)
EndEvent

Event OnTranslationComplete()
    ;Open the Elevator Doors
    self.GetLinkedRef(LinkCustom03).SetOpen(true)
EndEvent
