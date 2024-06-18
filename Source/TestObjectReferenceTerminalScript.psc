Scriptname TestObjectReferenceTerminalScript extends ObjectReference Const
{testing getting terminal events on an ObjectReference script}

Event OnTerminalMenuItemRun(int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    debug.trace(self + " OnTerminalMenuItemRun auiMenuItemID=" + auiMenuItemID + " akTerminalBase=" + akTerminalBase + " akTerminalRef=" + akTerminalRef)
EndEvent
;/
Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    debug.trace(self + " OnTerminalMenuEnter akTerminalBase=" + akTerminalBase + " akTerminalRef=" + akTerminalRef)
endEvent
/;
