Scriptname TestOpenCloseSyncScript extends ObjectReference Const

function ToggleState()
	int currentState = GetOpenState()
	SetOpen(currentState >= 3)
EndFunction

function SetState(bool bOpenMe)
	SetOpen(bOpenMe)
endFunction