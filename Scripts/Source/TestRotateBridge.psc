Scriptname TestRotateBridge extends ObjectReference
{Placeholder for rotating bridge}

Keyword Property LinkCustom01 Mandatory Const Auto ;Original Closed Rotation
Keyword Property LinkCustom02 Mandatory Const Auto ;Destination Rotation
Keyword Property LinkCustom03 Mandatory Const Auto ;Link Chain to Segments
Keyword Property LinkCustom04 Mandatory Const Auto ;Link Other Activators
Keyword Property LinkCustom05 Mandatory Const Auto ;Original Closed Position Navmesh Blocker
Keyword Property LinkCustom06 Mandatory Const Auto ;Destination Open Position Navmesh Blocker
Keyword Property LinkCustom07 Mandatory Const Auto ;Desination Collision for navmesh generation (deleted on load)
float Property RotationSpeed = 10.0 Const Auto


;This is the original position
Auto State Closed
    Event OnLoad()
        GetLinkedRef(LinkCustom07).Disable() ;Disable invisible collision for navmesh building.
        GetLinkedRef(LinkCustom06).Disable() ;Unblock Original Position Navmesh
        GetLinkedRef(LinkCustom05).Enable() ;Block Destination Position Navmesh
        ObjectReference[] BridgeSegments = GetLinkedRefChain(LinkCustom03)
        int index = 0
        While (index < BridgeSegments.Length)
            BridgeSegments[index].TranslateToRef(BridgeSegments[index].GetLinkedRef(LinkCustom01), 0.0, 0.0)
            index += 1
        EndWhile
    EndEvent

    Event OnActivate(ObjectReference akActionRef)
        GotoState("Moving")

        ;Send Activate to Linked Controls.
        GetLinkedRef(LinkCustom04).Activate(self)

        ObjectReference[] BridgeSegments = GetLinkedRefChain(LinkCustom03)
        int index = 0
        While (index < BridgeSegments.Length)
            BridgeSegments[index].TranslateToRef(BridgeSegments[index].GetLinkedRef(LinkCustom02), 1.0, RotationSpeed)
            index += 1
        EndWhile
        GotoState("Open")
        GetLinkedRef(LinkCustom06).Enable() ;Block Original Position Navmesh
        GetLinkedRef(LinkCustom05).Disable() ;Unblock Destination Position Navmesh
    EndEvent
EndState

State Moving
    ;Nothing
EndState

;This is the destination position
State Open
    Event OnActivate(ObjectReference akActionRef)
        GotoState("Moving")

        ;Send Activate to Linked Controls.
        GetLinkedRef(LinkCustom04).Activate(self)

        ObjectReference[] BridgeSegments = GetLinkedRefChain(LinkCustom03)
        int index = (BridgeSegments.Length)
        While (index > 0)
            index -= 1
            BridgeSegments[index].TranslateToRef(BridgeSegments[index].GetLinkedRef(LinkCustom01), 1.0, RotationSpeed) 
        EndWhile
    GotoState("Closed")
    GetLinkedRef(LinkCustom05).Enable() ;Block Desitnation Position Navmesh
    GetLinkedRef(LinkCustom06).Disable() ;Unblock Original Position Navmesh
    EndEvent
EndState