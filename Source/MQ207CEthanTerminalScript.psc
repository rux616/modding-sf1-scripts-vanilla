Scriptname MQ207CEthanTerminalScript extends TerminalScript
{Variant terminal script for Ethan's Terminal in MQ207C, which Ethan 'uses' as part of the entry scene.}

Auto State ScriptControl
	Event OnCellLoad()
		PlayAnimation("Play01")
	EndEvent

	Function CheckOpenState()
		;Do nothing.
	EndFunction
EndState

Function EndScriptControl()
	GotoState("")
EndFunction