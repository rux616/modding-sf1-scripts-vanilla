Scriptname LC107HullBreachVFXScript extends ObjectReference
{Script for the Hull Breach VFX in LC107.}

Event OnLoad()
	if (Is3DLoaded())
		PlayAnimation("Reset")
	EndIf
EndEvent