Scriptname MQ204VladimirScript extends ReferenceAlias

ObjectReference Property MQ204VladimirInjuredMarker Mandatory Const Auto
Keyword Property AnimFlavorWounded Mandatory Const Auto

Event OnGetUp(ObjectReference akFurniture)
    If akFurniture == MQ204VladimirInjuredMarker
        Self.GetActorRef().ChangeAnimFlavor(AnimFlavorWounded)
    EndIf
EndEvent