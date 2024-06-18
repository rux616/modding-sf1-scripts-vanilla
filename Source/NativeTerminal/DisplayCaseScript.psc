Scriptname NativeTerminal:DisplayCaseScript extends TerminalMenu
{handles display cases via native terminal}

Keyword property LinkTerminalDisplayCase auto const mandatory

Group autofillProperties
    Keyword property DisplayCaseTypeWeaponCase auto const mandatory
    { autofill }

    Keyword property DisplayCaseTypeWeaponRack auto const mandatory
    { autofill }

    ActorValue property NativeTerminalDisplayCase_AnyLocked auto const mandatory
    { autofill }

    ActorValue property NativeTerminalDisplayCase_AnyWeaponCase auto const mandatory
    { autofill }

    ActorValue property NativeTerminalDisplayCase_AnyWeaponRack auto const mandatory
    { autofill }

    ActorValue property NativeTerminalDisplayCase_Count auto const mandatory
    { autofill }
EndGroup

; enums
int property menuItemID_Unlock01 = 1 auto const
int property menuItemID_Unlock02 = 2 auto const

; script variables
bool anyLocked = false  ; set to true if any display cases are locked
bool anyWeaponCase = false ; set to true if any weapon cases found
bool anyWeaponRack = false ; set to true if any weapon racks found
int caseCount = 0 ; count of display cases

; check linked refs to set up conditional actor values for what options the menu should show
Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    debug.trace(self + " OnTerminalMenuEnter " + akTerminalRef)
    UpdateAllTerminalVariables(akTerminalRef)
EndEvent

function UpdateAllTerminalVariables(ObjectReference akTerminalRef)
    debug.trace(self + " UpdateAllTerminalVariables " + akTerminalRef)
    ; handle things linked either way
    ObjectReference[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalDisplayCase)
    ObjectReference[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalDisplayCase)

    ; these will be set to true by UpdateTerminalVariablesForArray if any traps fall into these categories
    anyLocked = false  ; set to true if any cases are locked
    anyWeaponCase = false ; set to true if any weapon cases found
    anyWeaponRack = false ; set to true if any weapon racks found
    caseCount = 0 ; count of display cases

    if linkedRefChain.Length > 0
        UpdateTerminalVariablesForArray(linkedRefChain)
    EndIf
    if linkedRefChildren.Length > 0
        UpdateTerminalVariablesForArray(linkedRefChildren)
    EndIf
    debug.trace(self + " actor values set:")
    debug.trace(self + "   NativeTerminalDisplayCase_AnyLocked: " + anyLocked)
    debug.trace(self + "   NativeTerminalDisplayCase_AnyWeaponCase: " + anyWeaponCase)
    debug.trace(self + "   NativeTerminalDisplayCase_AnyWeaponRack: " + anyWeaponRack)
    debug.trace(self + "   NativeTerminalDisplayCase_Count: " + caseCount)

    akTerminalRef.SetValue(NativeTerminalDisplayCase_AnyLocked, anyLocked as int)
    akTerminalRef.SetValue(NativeTerminalDisplayCase_AnyWeaponCase, anyWeaponCase as int)
    akTerminalRef.SetValue(NativeTerminalDisplayCase_AnyWeaponRack, anyWeaponRack as int)
    akTerminalRef.SetValue(NativeTerminalDisplayCase_Count, caseCount)
endFunction

function UpdateTerminalVariablesForArray(ObjectReference[] displayCaseArray)
    debug.trace(self + " UpdateTerminalVariablesForArray " + displayCaseArray)
    int i = 0
    while i < displayCaseArray.Length
        ObjectReference theCase = displayCaseArray[i]
        debug.trace(self + "  checking " + theCase)
        if theCase.IsLocked()
            anyLocked = true
        endif
        if theCase.HasKeyword(DisplayCaseTypeWeaponCase)
            anyWeaponCase = true
        elseif theCase.HasKeyword(DisplayCaseTypeWeaponRack)
            anyWeaponRack = true
        EndIf
        caseCount += 1
        i += 1
    EndWhile
EndFunction

Event OnTerminalMenuItemRun(int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    debug.trace(self + " OnTerminalMenuItemRun auiMenuItemID=" + auiMenuItemID + " akTerminalBase=" + akTerminalBase)
    ; handle things linked either way
    ObjectReference[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalDisplayCase)
    ObjectReference[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalDisplayCase)
    if linkedRefChain.Length > 0
        HandleMenuItem(auiMenuItemID, linkedRefChain, akTerminalRef)
    EndIf
    if linkedRefChildren.Length > 0
        HandleMenuItem(auiMenuItemID, linkedRefChildren, akTerminalRef)
    EndIf
EndEvent

function HandleMenuItem(int auiMenuItemID, ObjectReference[] refArray, ObjectReference akTerminalRef)
    debug.trace(self + " HandleMenuItem " + auiMenuItemID)
    if auiMenuItemID == menuItemID_Unlock01 || auiMenuItemID == menuItemID_Unlock02
        int i = 0
        While i < refArray.Length
            refArray[i].Unlock()
            refArray[i].SetOpen(true)
            i += 1
        EndWhile
        ; update terminal variables
        UpdateAllTerminalVariables(akTerminalRef)
    EndIf
EndFunction