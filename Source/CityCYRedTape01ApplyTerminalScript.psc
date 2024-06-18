Scriptname CityCYRedTape01ApplyTerminalScript extends TerminalMenu

TerminalMenu Property SY_Deimos_SalesSubTerminal_Assistant_Submit_Genesis Auto Const Mandatory
Int Property PlayerNameBodyTextIndex = 0 Const Auto


Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    akTerminalRef.AddTextReplacementData("PlayerLabel", Game.GetPlayer().GetBaseObject())
    TerminalScript myTerminalRef = akTerminalRef as TerminalScript
    Form[] textReplacementArray = New Form[0]
    textReplacementArray.Add(Game.GetPlayer())
    SY_Deimos_SalesSubTerminal_Assistant_Submit_Genesis.AddDynamicBodyTextItem(myTerminalRef, PlayerNameBodyTextIndex, 1, textReplacementArray)
EndEvent
