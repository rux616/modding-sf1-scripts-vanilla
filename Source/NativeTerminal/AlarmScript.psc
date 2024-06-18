Scriptname NativeTerminal:AlarmScript extends TerminalMenu
{handles alarms via native terminal}

Keyword property LinkTerminalAlarm auto const mandatory

Group autofillProperties
    ActorValue property NativeTerminalAlarm_AnyOn auto const mandatory
    { autofill }

    ActorValue property NativeTerminalAlarm_AnyEnabled auto const mandatory
    { autofill }
EndGroup

; enums
int property menuItemID_TurnOn = 1 auto const
int property menuItemID_TurnOff = 2 auto const
int property menuItemID_Disable = 3 auto const
int property menuItemID_Enable = 4 auto const

; script variables
bool anyOn = false  ; set to true if any alarms are on
bool anyEnabled = false  ; set to true if any alarms are enabled

; check linked refs to set up conditional actor values for what options the menu should show
Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    debug.trace(self + " OnTerminalMenuEnter " + akTerminalRef)
    UpdateAllTerminalVariables(akTerminalRef)
EndEvent

function UpdateAllTerminalVariables(ObjectReference akTerminalRef)
    debug.trace(self + " UpdateAllTerminalVariables " + akTerminalRef)
    ; handle things linked either way
    SQ_AlarmActivatorScript[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalAlarm) as SQ_AlarmActivatorScript[]
    SQ_AlarmActivatorScript[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalAlarm) as SQ_AlarmActivatorScript[]

    ; these will be set to true by UpdateTerminalVariablesForArray if any alarms fall into these categories
    anyOn = false  ; set to true if any alarms are on
    anyEnabled = false  ; set to true if any alarms are enabled

    if linkedRefChain.Length > 0
        UpdateTerminalVariablesForArray(linkedRefChain)
    EndIf
    if linkedRefChildren.Length > 0
        UpdateTerminalVariablesForArray(linkedRefChildren)
    EndIf
    debug.trace(self + " actor values set:")
    debug.trace(self + "   NativeTerminalAlarm_AnyOn: " + anyOn)
    debug.trace(self + "   NativeTerminalAlarm_AnyEnabled: " + anyEnabled)

    akTerminalRef.SetValue(NativeTerminalAlarm_AnyOn, anyOn as int)
    akTerminalRef.SetValue(NativeTerminalAlarm_AnyEnabled, anyEnabled as int)

endFunction

function UpdateTerminalVariablesForArray(SQ_AlarmActivatorScript[] alarmArray)
    debug.trace(self + " UpdateTerminalVariablesForArray " + alarmArray)
    int i = 0
    while i < alarmArray.Length
        SQ_AlarmActivatorScript theAlarm = alarmArray[i]
        debug.trace(self + "  checking " + theAlarm)
        if theAlarm.GetAlarmDisabled() == false
            anyEnabled = true
        endif
        if theAlarm.GetOpenState() >= 3
            anyOn = true
        EndIf
        i += 1
    EndWhile
EndFunction

Event OnTerminalMenuItemRun(int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    debug.trace(self + " OnTerminalMenuItemRun auiMenuItemID=" + auiMenuItemID + " akTerminalBase=" + akTerminalBase)
    ; handle things linked either way
    SQ_AlarmActivatorScript[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalAlarm) as SQ_AlarmActivatorScript[]
    SQ_AlarmActivatorScript[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalAlarm) as SQ_AlarmActivatorScript[]
    if linkedRefChain.Length > 0
        HandleMenuItem(auiMenuItemID, linkedRefChain, akTerminalRef)
    EndIf
    if linkedRefChildren.Length > 0
        HandleMenuItem(auiMenuItemID, linkedRefChildren, akTerminalRef)
    EndIf
EndEvent

function HandleMenuItem(int auiMenuItemID, SQ_AlarmActivatorScript[] alarmArray, ObjectReference akTerminalRef)
    if auiMenuItemID == menuItemID_TurnOn
        int i = 0
        While i < alarmArray.Length
            alarmArray[i].TurnOnAlarm(true)
            i += 1
        EndWhile
        ; update terminal variables
        UpdateAllTerminalVariables(akTerminalRef)
    elseif auiMenuItemID == menuItemID_TurnOff
        int i = 0
        While i < alarmArray.Length
            alarmArray[i].TurnOnAlarm(false)
            i += 1
        EndWhile
        ; update terminal variables
        UpdateAllTerminalVariables(akTerminalRef)
    elseif auiMenuItemID == menuItemID_Disable
        int i = 0
        While i < alarmArray.Length
            alarmArray[i].DisableAlarm(true)
            i += 1
        EndWhile
        ; update terminal variables
        UpdateAllTerminalVariables(akTerminalRef)
    elseif auiMenuItemID == menuItemID_Enable
        int i = 0
        While i < alarmArray.Length
            alarmArray[i].DisableAlarm(false)
            i += 1
        EndWhile
        ; update terminal variables
        UpdateAllTerminalVariables(akTerminalRef)
    EndIf
EndFunction