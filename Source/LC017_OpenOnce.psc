Scriptname LC017_OpenOnce extends ObjectReference Const

Keyword Property LinkToPowerSource Mandatory Const Auto

Event OnActivate(ObjectReference akActionRef)
    if(GetLinkedRef(LinkToPowerSource).IsPowered())
        GetLinkedRef().SetOpen()
    EndIf
EndEvent