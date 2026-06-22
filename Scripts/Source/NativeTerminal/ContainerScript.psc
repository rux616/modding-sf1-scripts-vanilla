Scriptname nativeTerminal:ContainerScript extends TerminalMenu
{handles containers via native terminal}

Keyword property LinkTerminalContainer auto const mandatory

Group autofillProperties
    ActorValue property NativeTerminalContainer_AnyLocked auto const mandatory
    { autofill }

    ActorValue property NativeTerminalContainer_Count auto const mandatory
    { autofill }

    ActorValue property NativeTerminalContainer_AnySafe auto const mandatory
    { autofill }

    Keyword property LootSafeKeyword auto const mandatory
    { autofill }
EndGroup

; enums
int property menuItemID_Unlock01 = 1 auto const
int property menuItemID_Unlock02 = 2 auto const
int property menuItemID_Unlock03 = 3 auto const
int property menuItemID_Unlock04 = 4 auto const

; script variables
bool anyLocked = false  ; set to true if any are locked
int containerCount = 0 ; count of containers
bool anySafe = false ; set to true if any safes found

; check linked refs to set up conditional actor values for what options the menu should show
Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    debug.trace(self + " OnTerminalMenuEnter " + akTerminalRef)
    UpdateAllTerminalVariables(akTerminalRef)
EndEvent

function UpdateAllTerminalVariables(ObjectReference akTerminalRef)
    debug.trace(self + " UpdateAllTerminalVariables " + akTerminalRef)
    ; handle things linked either way
    ObjectReference[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalContainer)
    ObjectReference[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalContainer)

    ; these will be set to true by UpdateTerminalVariablesForArray if any traps fall into these categories
    anyLocked = false  ; set to true if any cases are locked
    anySafe = false ; set to true if any safes found
    containerCount = 0 ; count of containers

    if linkedRefChain.Length > 0
        UpdateTerminalVariablesForArray(linkedRefChain)
    EndIf
    if linkedRefChildren.Length > 0
        UpdateTerminalVariablesForArray(linkedRefChildren)
    EndIf
    debug.trace(self + " actor values set:")
    debug.trace(self + "   NativeTerminalContainer_AnyLocked: " + anyLocked)
    debug.trace(self + "   NativeTerminalContainer_AnySafe: " + anySafe)
    debug.trace(self + "   NativeTerminalContainer_Count: " + containerCount)

    akTerminalRef.SetValue(NativeTerminalContainer_AnyLocked, anyLocked as int)
    akTerminalRef.SetValue(NativeTerminalContainer_AnySafe, anySafe as int)
    akTerminalRef.SetValue(NativeTerminalContainer_Count, containerCount)
endFunction

function UpdateTerminalVariablesForArray(ObjectReference[] ContainerArray)
    debug.trace(self + " UpdateTerminalVariablesForArray " + ContainerArray)
    int i = 0
    while i < ContainerArray.Length
        ObjectReference theContainer = ContainerArray[i]
        debug.trace(self + "  checking " + theContainer)
        if theContainer.IsLocked()
            anyLocked = true
        endif
        if theContainer.HasKeyword(LootSafeKeyword)
            anySafe = true
        EndIf

        containerCount += 1
        i += 1
    EndWhile
EndFunction

Event OnTerminalMenuItemRun(int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    debug.trace(self + " OnTerminalMenuItemRun auiMenuItemID=" + auiMenuItemID + " akTerminalBase=" + akTerminalBase)
    ; handle things linked either way
    ObjectReference[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalContainer)
    ObjectReference[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalContainer)
    if linkedRefChain.Length > 0
        HandleMenuItem(auiMenuItemID, linkedRefChain, akTerminalRef)
    EndIf
    if linkedRefChildren.Length > 0
        HandleMenuItem(auiMenuItemID, linkedRefChildren, akTerminalRef)
    EndIf
EndEvent

function HandleMenuItem(int auiMenuItemID, ObjectReference[] refArray, ObjectReference akTerminalRef)
    debug.trace(self + " HandleMenuItem " + auiMenuItemID)
    if auiMenuItemID == menuItemID_Unlock01 || auiMenuItemID == menuItemID_Unlock02 || auiMenuItemID == menuItemID_Unlock03 || auiMenuItemID == menuItemID_Unlock04
        int i = 0
        While i < refArray.Length
            refArray[i].Unlock()
            i += 1
        EndWhile
        ; update terminal variables
        UpdateAllTerminalVariables(akTerminalRef)
    EndIf
EndFunction

