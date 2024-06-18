ScriptName TestHardReversalScript2 extends ObjectReference
{sets an actor value on actor that enters}

ActorValue property myAV Auto Const Mandatory	
{First Actor Value to set.}

float property myAV_Value Auto Const Mandatory
{First Actor Value's new value.}

;**************************************

Event OnTriggerEnter(ObjectReference akActionRef)
	if (akActionRef != Game.GetPlayer())
		Actor myActor = akActionRef as Actor
		myActor.SetValue(myAV, myAV_Value)
		myActor.EvaluatePackage()
	EndIf
EndEvent

;**************************************