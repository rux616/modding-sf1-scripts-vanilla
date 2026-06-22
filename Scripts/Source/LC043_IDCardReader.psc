Scriptname LC043_IDCardReader extends IDCardReader
{Variant ID Card Reader for LC043, with support for variations needed by the quest.}

Group LC043IDCardReaderProperties
    bool property ShouldAlwaysDeny = False Auto Const
    {If True, this ID Card Reader will always display IDCardReaderFailMissingPrereqMessage, and will never open its door.}

    bool property ShouldOnlyOpen = False Auto Const
    {If True, this ID Card Reader will only open its door, not close it.}

    bool property ShouldForceOpenDockingPortDoor = False Auto Const
    {If True, if our door is a Docking Port door, open it.}
EndGroup

Function IDReaderOpenDoor(bool shouldBeOpen=true)
    if (ShouldAlwaysDeny)
        IDCardReaderFailMissingPrereqMessage.Show()
    ElseIf (ShouldOnlyOpen)
        if (shouldBeOpen)
            ObjectReference doorLink = GetLinkedRef(LinkIDReader) 
            int openState = doorLink.GetOpenState()
            if (openState == 3 || openState == 4) ; Closed or Closing
                doorLink.SetOpen(true)
            EndIf
        EndIf
    ElseIf (ShouldForceOpenDockingPortDoor)
        DefaultMultiStateActivator doorLink = GetLinkedRef(LinkIDReader) as DefaultMultiStateActivator
        if (doorLink != None)
            doorLink.SetOpen(True)
            doorLink.SetAnimationState("Green")
        EndIf
    Else
        Parent.IDReaderOpenDoor(shouldBeOpen)
    EndIf
EndFunction