Scriptname MQ101ShipRepairScript extends ActiveMagicEffect

Quest Property MQ101 Auto Const

Auto State WaitingForTrigger
	Event OnEffectStart(ObjectReference akShipTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
		If MQ101.GetStageDone(525)
			gotoState("hasbeentriggered")
			MQ101.SetStage(530)
		EndIf
	EndEvent
EndState

State HasBeenTriggered
	;empty state
EndState