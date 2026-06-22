Scriptname LC107HullBreachExplosionSourceScript extends ObjectReference
{Script for the Hull Breach Explosion Source Markers in LC107.}

Group RefProperties
	int property ExplosionSize = 5 Auto Const
	{Index into LC107's HullBreachExplosions array.}
EndGroup

Group AutofillProperties CollapsedOnRef
	LC107QuestScript property LC107 Auto Const Mandatory
EndGroup

Auto State Waiting
	Function TriggerBreach()
		GoToState("Done")
		LC107.TriggerExplosion(ExplosionSize, ExplosionSize, Self)
	EndFunction
EndState

State Done
EndState


Function TriggerBreach()
EndFunction