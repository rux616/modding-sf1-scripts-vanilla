Scriptname NativeTerminal:TrapScript extends TerminalMenu
{handles traps via native terminal}

Keyword property LinkTerminalTrap auto const mandatory

Group autofillProperties
    ActorValue property NativeTerminalTrap_AnyActive auto const mandatory
    { autofill }
EndGroup

; enums
int property menuItemID_TurnOn = 1 auto const
int property menuItemID_TurnOff = 2 auto const

; script variables
bool anyActive = false  ; set to true if any traps are active

; check linked refs to set up conditional actor values for what options the menu should show
Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    debug.trace(self + " OnTerminalMenuEnter " + akTerminalRef)
    UpdateAllTerminalVariables(akTerminalRef)
EndEvent

function UpdateAllTerminalVariables(ObjectReference akTerminalRef)
    debug.trace(self + " UpdateAllTerminalVariables " + akTerminalRef)
    ; handle things linked either way
    TrapBase[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalTrap) as TrapBase[]
    TrapBase[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalTrap) as TrapBase[]

    ; these will be set to true by UpdateTerminalVariablesForArray if any traps fall into these categories
    anyActive = false  ; set to true if any traps are active

    if linkedRefChain.Length > 0
        UpdateTerminalVariablesForArray(linkedRefChain)
    EndIf
    if linkedRefChildren.Length > 0
        UpdateTerminalVariablesForArray(linkedRefChildren)
    EndIf
    debug.trace(self + " actor values set:")
    debug.trace(self + "   NativeTerminalTrap_AnyActive: " + anyActive)

    akTerminalRef.SetValue(NativeTerminalTrap_AnyActive, anyActive as int)
endFunction

function UpdateTerminalVariablesForArray(TrapBase[] trapArray)
    debug.trace(self + " UpdateTerminalVariablesForArray " + trapArray)
    int i = 0
    while i < trapArray.Length
        TrapBase theTrap = trapArray[i]
        debug.trace(self + "  checking " + theTrap)
        if theTrap.bActive
            anyActive = true
        endif
        i += 1
    EndWhile
EndFunction

Event OnTerminalMenuItemRun(int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    debug.trace(self + " OnTerminalMenuItemRun auiMenuItemID=" + auiMenuItemID + " akTerminalBase=" + akTerminalBase)
    ; handle things linked either way
    TrapBase[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalTrap) as TrapBase[]
    TrapBase[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalTrap) as TrapBase[]
    if linkedRefChain.Length > 0
        HandleMenuItem(auiMenuItemID, linkedRefChain, akTerminalRef)
    EndIf
    if linkedRefChildren.Length > 0
        HandleMenuItem(auiMenuItemID, linkedRefChildren, akTerminalRef)
    EndIf
EndEvent

function HandleMenuItem(int auiMenuItemID, TrapBase[] trapArray, ObjectReference akTerminalRef)
    if auiMenuItemID == menuItemID_TurnOn
        int i = 0
        While i < trapArray.Length
            trapArray[i].SetActive(true)
            i += 1
        EndWhile
        ; update terminal variables
        UpdateAllTerminalVariables(akTerminalRef)
    elseif auiMenuItemID == menuItemID_TurnOff
        int i = 0
        While i < trapArray.Length
            trapArray[i].SetActive(false)
            i += 1
        EndWhile
        ; update terminal variables
        UpdateAllTerminalVariables(akTerminalRef)
    EndIf
EndFunction