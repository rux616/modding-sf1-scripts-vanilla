Scriptname TestExtendBridge extends ObjectReference
{Placeholder for extending bridge}

Keyword Property LinkCustom01 Mandatory Const Auto ;Original Closed Position
{LinkRef from Segments to the position marker for the Closed/Retracted Position}
Keyword Property LinkCustom02 Mandatory Const Auto ;Keyword for Segment Open Position
{LinkRef from Segments to the position marker for the Open/Extended Position}
Keyword Property LinkCustom03 Mandatory Const Auto ;Link Chain to Segments
{LinkRef Chain through all the moving segments in the system}
Keyword Property LinkCustom04 Mandatory Const Auto ;Link Other Activators
{Link to other activators in the system}
Keyword Property LinkCustom05 Mandatory Const Auto ;Link to Navmesh Collision
{Link to Navcut collision volume}
float Property TranslationSpeed = 1.0 Const Auto
bool Property StartOpen = false Const Auto
{Start in the Open/Extended position}
bool Property BlockNavOnExtendedState = false Const Auto
{Open is the Extended State, Closed is the Retracted State}



;This is the retracted/closed position
Auto State Closed

    ;/Event OnBeginState(string asOldState)
        if(BlockNavOnOpenState) ;I want navmesh blocked during the open state so disable the blocker in the closed state.
            GetLinkedRef(LinkCustom05).Disable()
        endif
    EndEvent
    /;
    Event OnLoad()
        ObjectReference[] BridgeSegments = GetLinkedRefChain(LinkCustom03)
        if(!StartOpen)
            int index = 0
            While (index < BridgeSegments.Length)
                BridgeSegments[index].TranslateToRef(BridgeSegments[index].GetLinkedRef(LinkCustom01), 100.0)
                index += 1
            EndWhile
        Else
            GetLinkedRef(LinkCustom05).Disable() ; Unblock Navmesh
            int index = 0
            While (index < BridgeSegments.Length)
                BridgeSegments[index].TranslateToRef(BridgeSegments[index].GetLinkedRef(LinkCustom02), 100.0)
                index += 1
            EndWhile
        EndIf
    EndEvent

    Event OnActivate(ObjectReference akActionRef)
        GotoState("Moving")
        Debug.Trace("This is a test to see if the debugger works.")
        ;Send Activate to Linked Controls.
        GetLinkedRef(LinkCustom04).Activate(self)

        ObjectReference[] BridgeSegments = GetLinkedRefChain(LinkCustom03)
        int index = 0
        While (index < BridgeSegments.Length)
            BridgeSegments[index].TranslateToRef(BridgeSegments[index].GetLinkedRef(LinkCustom02), TranslationSpeed)
            index += 1
        EndWhile
        GotoState("Open")
        GetLinkedRef(LinkCustom05).Disable() ; Unblock Navmesh
    EndEvent
EndState

State Moving
   ;/ Event OnBeginState(string asOldState)
        GetLinkedRef(LinkCustom05).Enable() ;Enable Navmesh blocking in the moving state
    EndEvent
    /;
EndState

;This is the extended/open position
State Open
    Event OnActivate(ObjectReference akActionRef)
        GotoState("Moving")
            GetLinkedRef(LinkCustom05).Enable() ; Block Navmesh
        ;Send Activate to Linked Controls.
        GetLinkedRef(LinkCustom04).Activate(self)

        ObjectReference[] BridgeSegments = GetLinkedRefChain(LinkCustom03)
        int index = (BridgeSegments.Length)
        While (index > 0)
            index -= 1
            BridgeSegments[index].TranslateToRef(BridgeSegments[index].GetLinkedRef(LinkCustom01), TranslationSpeed) 
        EndWhile
    GotoState("Closed")
    EndEvent
EndState











;/
bool isOpen = false

Event OnLoad()
    if(GetLinkedRef(LinkCustom04))
        RegisterForRemoteEvent(GetLinkedRef(LinkCustom04), "OnActivate")
    EndIf
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
    StartOpening()
EndEvent

Event OnActivate(ObjectReference akActionRef)
    StartOpening()
EndEvent

Event ObjectReference.OnTranslationAlmostComplete(ObjectReference akSender)
    ;activate next bridge section.
    if(GetLinkedRef(LinkCustom03))
        GetLinkedRef(LinkCustom03).Activate(self)
    EndIf
EndEvent

Event ObjectReference.OnTranslationComplete(ObjectReference akSender)
    ;Rotate into position.
    GetLinkedRef(LinkCustom01).TranslateToRef(self, RotationSpeed)
    ;Change State
    ;GotoState("Open")
EndEvent

Function StartOpening()
    RegisterForRemoteEvent(GetLinkedRef(LinkCustom01), "OnTranslationAlmostComplete")
    RegisterForRemoteEvent(GetLinkedRef(LinkCustom01), "OnTranslationComplete")
    GetLinkedRef(LinkCustom01).TranslateToRef(self.GetLinkedRef(LinkCustom02), TranslationSpeed)
EndFunction


; TranslateToRef

;/ Get starting Translation and Rotation, save these.
Get marker translation and rotation.
On open move to the markers, on close move to saved position.
Get chain of platforms,
Move from start to end, on open, move from end to start on close.

Event OnTranslationAlmostComplete()
Start the next translation in the order.
/;