Scriptname LC030CellBlockActivatorScript extends ObjectReference
{Script for the Cell Block switches in LC030.}

Group ObjectProperties
	int property CellBlockID Auto Const Mandatory
	int property SwitchReadyStage = 410 Auto Const
	int property SwitchUsedStage = 420 Auto Const
EndGroup

Group AutofillProperties
	Quest property LC030 Auto Const Mandatory
	Message property LC030_SwitchNotReadyMessage Auto Const Mandatory
	Message property LC030_SwitchAlreadyUsedMessage Auto Const Mandatory
EndGroup


Auto State Waiting
	Event OnActivate(ObjectReference akActivator)
		GotoState("Busy")
		if (akActivator == Game.GetPlayer())
			if (!LC030.GetStageDone(SwitchReadyStage + CellBlockID))
				LC030_SwitchNotReadyMessage.Show()
				GotoState("Waiting")
			ElseIf (LC030.GetStageDone(SwitchUsedStage + CellBlockID))
				LC030_SwitchAlreadyUsedMessage.Show()
				GotoState("Waiting")
			Else
				((Self as ObjectReference) as GenericSwitchScript).SetColor("White")
				LC030.SetStage(SwitchUsedStage + CellBlockID)
				GotoState("Done")
			EndIf
		EndIf
	EndEvent
EndState

State Busy
	;Do nothing.
EndState

State Done
	;Do nothing.
EndState