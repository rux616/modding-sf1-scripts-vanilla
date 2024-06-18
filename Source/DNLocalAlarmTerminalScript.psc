Scriptname DNLocalAlarmTerminalScript extends TerminalMenu
{Native terminal script for terminals that control DNLocalAlarmScript alarm systems.}

Keyword property DNLocalAlarmTerminalLinkKeyword Auto Const Mandatory

;Local variables.
int menuItemID_Disarm = 1 Const


Event OnTerminalMenuItemRun(int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    ObjectReference[] linkedRefChain = akTerminalRef.GetLinkedRefChain(DNLocalAlarmTerminalLinkKeyword)
    ObjectReference[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(DNLocalAlarmTerminalLinkKeyword)
    if (linkedRefChain.Length > 0)
        HandleMenuItem(auiMenuItemID, akTerminalBase, linkedRefChain as DNLocalAlarmScript[])
    EndIf
    if (linkedRefChildren.Length > 0)
        HandleMenuItem(auiMenuItemID, akTerminalBase, linkedRefChildren as DNLocalAlarmScript[])
    EndIf
EndEvent

Function HandleMenuItem(int auiMenuItemID, TerminalMenu akTerminalBase, DNLocalAlarmScript[] alarmArray)
    if (auiMenuItemID == menuItemID_Disarm)
        int i = 0
        Debug.Trace(self + " disarming alarms")
        While (i < alarmArray.Length)
            Debug.Trace(self + " disarming " + alarmArray[i])
            alarmArray[i].Disarm()
            i = i + 1
        EndWhile
    EndIf
EndFunction