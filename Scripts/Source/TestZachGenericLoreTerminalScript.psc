Scriptname TestZachGenericLoreTerminalScript extends TerminalMenu

Formlist Property TestZachGenericLoreFormList Auto Const Mandatory

TerminalMenu Property TestZachGenericLoreTerminal_SingleEntry_CF01_Genesis Mandatory Const Auto

Message Property testZachGenericLoreMessage Mandatory Const Auto 

;Event OnTerminalMenuItemRun(int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
;    debug.trace(self + " OnTerminalMenuItemRun auiMenuItemID=" + auiMenuItemID + " akTerminalBase=" + akTerminalBase + " akTerminalRef=" + akTerminalRef)
;EndEvent

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    
    Debug.Trace("Player entering menu " + akTerminalBase + " on " + akTerminalRef)
    Form[] textReplacementArray = New Form[0]
    ;akTerminalRef.AddTextReplacementData("Lore", testZachGenericLoreMessage)  

    
   	self.AddDynamicMenuItem(akTerminalRef, 0, 1, TextReplacementArray as Form[])
    self.AddDynamicBodyTextItem(akTerminalRef, 0, 1, TextReplacementArray as Form[])

endEvent