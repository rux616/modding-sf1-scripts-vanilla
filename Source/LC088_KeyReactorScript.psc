Scriptname LC088_KeyReactorScript extends ReactorFloorMidA01Script
{Script for the Reactors in LC088_Key.}

Group AutofillProperties
	LC088_KeyQuestScript property LC088_Key Auto Const Mandatory
EndGroup

;Local variables.
int reactorID

Function RegisterForReactorEvent(int newReactorID)
	reactorID = newReactorID
	RegisterForCustomEvent(LC088_Key, "LC088ReactorStateChangeEvent")
EndFunction

Event LC088_KeyQuestScript.LC088ReactorStateChangeEvent(LC088_KeyQuestScript akSender, Var[] akArgs)
	int eventReactorID = akArgs[0] as int
	if (eventReactorID == reactorID)
		SetReactorState(akArgs[1] as int, True)
	EndIf
EndEvent