Scriptname SFBGS00D:SFFL_AnchorpointRishiTerminalScript extends TerminalMenu
{A script to allow text replacement in the terminal menus.}

GlobalVariable Property SFFL_AsteroidManorCostGlobal Auto Const Mandatory

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
   akTerminalRef.AddTextReplacementValue("AsteroidManorCost", SFFL_AsteroidManorCostGlobal.GetValueInt())
endEvent