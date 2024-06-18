Scriptname LC088_KeyJasminesRobotScript extends ObjectReference
{Move Jasmine's Robot back to its mark following the cell reset for CF08. Lowest-risk fix for this.}

Quest property LC088_Key Auto Const Mandatory
Keyword property LC088_Key_LinkStartMarkerKeyword Auto Const Mandatory

Auto State Initial
	Event OnCellLoad()
	    if (LC088_Key.IsRunning())
	    	GotoState("Done")
			MoveTo(GetLinkedRef(LC088_Key_LinkStartMarkerKeyword))
		EndIf
	EndEvent
EndState

State Done
EndState