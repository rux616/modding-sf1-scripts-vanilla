Scriptname FXScripts:EffectSequenceOnActivate extends ObjectReference Default Const
{For any activator that you want to play a single animation each time it's activated.}

Group Required_Properties

	string property SequenceName = "Play01" auto const
	{Effect Sequence to play when this is activated.}

EndGroup


Event OnActivate(ObjectReference akActionRef)
	    playAnimation(SequenceName)
EndEvent