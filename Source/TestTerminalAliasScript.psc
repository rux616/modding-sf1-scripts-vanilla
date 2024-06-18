Scriptname TestTerminalAliasScript extends ReferenceAlias
{testing getting terminal events on a ref alias}

Event OnTerminalMenuItemRun(int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    debug.trace(self + " OnTerminalMenuItemRun auiMenuItemID=" + auiMenuItemID + " akTerminalBase=" + akTerminalBase + " akTerminalRef=" + akTerminalRef)
EndEvent
;/
Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    debug.trace(self + " OnTerminalMenuEnter akTerminalBase=" + akTerminalBase + " akTerminalRef=" + akTerminalRef)
endEvent
/;
