Scriptname LC082_BrigManagerRefScript extends ObjectReference
{Script for the LC082 Brig Manager ref. Initializes the Brig when its cell loads for the first time.}

Group AutofillProperties
	LC082_BrigQuestScript property LC082 Auto Const Mandatory
EndGroup

;Local variables.
bool initialized


Auto State Waiting
	Event OnCellLoad()
		GoToState("Initialized")
		initialized = True
		LC082.InitBrig()
	EndEvent
EndState

State Initialized
	;Do nothing.
EndState

bool Function HasInitilized()
	return initialized
EndFunction