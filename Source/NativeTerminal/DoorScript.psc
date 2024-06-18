Scriptname NativeTerminal:DoorScript extends TerminalMenu
{handles doors via native terminal}

Keyword property LinkTerminalDoor auto const mandatory

Group autofillProperties
    Keyword property IsLoadDoor auto const mandatory
    { autofill }

    ActorValue property NativeTerminalDoor_HasDoors auto const mandatory
    { autofill }

    ActorValue property NativeTerminalDoor_HasLoadDoors auto const mandatory
    { autofill }

    ActorValue property NativeTerminalDoor_AnyClosed auto const mandatory
    { autofill }

    ActorValue property NativeTerminalDoor_AnyLocked auto const mandatory
    { autofill }

    ActorValue property NativeTerminalDoor_Count auto const mandatory
    { autofill }
EndGroup

; enums
int property menuItemID_Open01 = 1 auto const
int property menuItemID_Open02 = 2 auto const
int property menuItemID_Unlock01 = 3 auto const
int property menuItemID_Unlock02 = 4 auto const
int property menuItemID_Close01 = 5 auto const
int property menuItemID_Close02 = 6 auto const

; script variables
bool anyClosed = false  ; set to true if any doors are closed
bool anyLocked = false  ; set to true if any doors are locked
bool hasLoadDoors = false ; set to true if linked to any load doors
bool hasDoors = false ; set to true if linked to any interior (animating) doors
int doorCount = 0 ; how many doors are linked to me?

; check linked refs to set up conditional actor values for what options the menu should show
Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    debug.trace(self + " OnTerminalMenuEnter " + akTerminalRef)
    UpdateAllTerminalVariables(akTerminalRef)
EndEvent

function UpdateAllTerminalVariables(ObjectReference akTerminalRef)
    debug.trace(self + " UpdateAllTerminalVariables " + akTerminalRef)
    ; handle things linked either way
    ObjectReference[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalDoor)
    ObjectReference[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalDoor)

    ; these will be set to true by UpdateTerminalVariablesForArray if any doors fall into these categories
    hasDoors = false ; set to true if linked to any interior (animating) doors
    hasLoadDoors = false ; set to true if linked to any load doors
    anyClosed = false  ; set to true if any doors are closed
    anyLocked = false  ; set to true if any doors are locked
    doorCount = 0

    if linkedRefChain.Length > 0
        UpdateTerminalVariablesForArray(linkedRefChain)
    EndIf
    if linkedRefChildren.Length > 0
        UpdateTerminalVariablesForArray(linkedRefChildren)
    EndIf
    debug.trace(self + " actor values set:")
    debug.trace(self + "   NativeTerminalDoor_HasDoors: " + hasDoors)
    debug.trace(self + "   NativeTerminalDoor_HasLoadDoors: " + hasLoadDoors)
    debug.trace(self + "   NativeTerminalDoor_AnyClosed: " + anyClosed)
    debug.trace(self + "   NativeTerminalDoor_AnyLocked: " + anyLocked)
    debug.trace(self + "   NativeTerminalDoor_Count: " + doorCount)

    akTerminalRef.SetValue(NativeTerminalDoor_HasDoors, hasDoors as int)
    akTerminalRef.SetValue(NativeTerminalDoor_HasLoadDoors, hasLoadDoors as int)
    akTerminalRef.SetValue(NativeTerminalDoor_AnyClosed, anyClosed as int)
    akTerminalRef.SetValue(NativeTerminalDoor_AnyLocked, anyLocked as int)
    akTerminalRef.SetValue(NativeTerminalDoor_Count, doorCount)

endFunction

function UpdateTerminalVariablesForArray(ObjectReference[] doorArray)
    debug.trace(self + " UpdateTerminalVariablesForArray " + doorArray)
    int i = 0
    while i < doorArray.Length
        ObjectReference theDoor = doorArray[i]
        doorCount += 1
        debug.trace(self + "  checking " + theDoor)
        if theDoor.HasKeyword(IsLoadDoor)
            hasLoadDoors = true
        Else
            hasDoors = true
        endif

        if theDoor.GetOpenState() >= 3
            anyClosed = true
        EndIf

        if theDoor.IsLocked()
            anyLocked = true
        EndIf
        i += 1
    EndWhile
EndFunction

Event OnTerminalMenuItemRun(int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    debug.trace(self + " OnTerminalMenuItemRun auiMenuItemID=" + auiMenuItemID + " akTerminalBase=" + akTerminalBase)
    ; handle things linked either way
    ObjectReference[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalDoor)
    ObjectReference[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalDoor)
    if linkedRefChain.Length > 0
        HandleMenuItem(auiMenuItemID, linkedRefChain, akTerminalRef)
    EndIf
    if linkedRefChildren.Length > 0
        HandleMenuItem(auiMenuItemID, linkedRefChildren, akTerminalRef)
    EndIf
EndEvent

function HandleMenuItem(int auiMenuItemID, ObjectReference[] doorArray, ObjectReference akTerminalRef)
    if auiMenuItemID == menuItemID_Open01 || auiMenuItemID == menuItemID_Open02
        int i = 0
        While i < doorArray.Length
            doorArray[i].SetOpen(True)
            doorArray[i].Unlock()
            i += 1
        EndWhile
        ; update terminal variables
        UpdateAllTerminalVariables(akTerminalRef)
    elseif auiMenuItemID == menuItemID_Unlock01 || auiMenuItemID == menuItemID_Unlock02
        int i = 0
        While i < doorArray.Length
            doorArray[i].Unlock()
            i += 1
        EndWhile
        ; update terminal variables
        UpdateAllTerminalVariables(akTerminalRef)
    elseif auiMenuItemID == menuItemID_Close01 || auiMenuItemID == menuItemID_Close02
        int i = 0
        While i < doorArray.Length
            doorArray[i].SetOpen(false)
            i += 1
        EndWhile
        ; update terminal variables
        UpdateAllTerminalVariables(akTerminalRef)
    EndIf
EndFunction