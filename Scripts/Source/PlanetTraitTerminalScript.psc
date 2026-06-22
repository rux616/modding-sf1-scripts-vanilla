Scriptname PlanetTraitTerminalScript extends ObjectReference conditional
{for now (?) holds data used by PlanetTraitTerminalMenuScript}

Keyword property traitKeywordToDiscover auto hidden

Planet property planetToCheck auto hidden

bool property traitDataAwarded = false auto hidden conditional

Event OnTerminalMenuItemRun(int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    debug.trace(self + " OnTerminalMenuItemRun auiMenuItemID=" + auiMenuItemID + " akTerminalBase=" + akTerminalBase + " akTerminalRef=" + akTerminalRef)
EndEvent

