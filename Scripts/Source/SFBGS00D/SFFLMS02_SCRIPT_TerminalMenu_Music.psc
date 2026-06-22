Scriptname SFBGS00D:SFFLMS02_SCRIPT_TerminalMenu_Music extends ObjectReference Const

TerminalMenu Property SFFL_MS02_TerminalMenu_Music Mandatory Const Auto

Event OnTerminalMenuItemRun(int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)



    If akTerminalBase == SFFL_MS02_TerminalMenu_Music
        If auiMenuItemID == 0
            GetLinkedRef().Disable()
        Else
        GetLinkedRef().Enable()
        EndIf
    EndIf
EndEvent