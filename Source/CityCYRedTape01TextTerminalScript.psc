Scriptname CityCYRedTape01TextTerminalScript extends ObjectReference Const


Event OnTerminalMenuItemRun(int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    AddTextReplacementData("PlayerLabel", Game.GetPlayer())
EndEvent
