Scriptname LC107HullBreachTriggerScript extends ObjectReference
{Script for the Hull Breach Triggers in LC107.}

Group TriggerProperties
	float property MinTimeBeforeSubsequentBreach Auto Const
	float property MaxTimeBeforeSubsequentBreach Auto Const
EndGroup


Auto State Waiting
	Event OnTriggerEnter(ObjectReference akTriggerRef)
		TriggerBreaches()
	EndEvent

	Function TriggerBreaches()
		GoToState("Done")
		LC107HullBreachScript[] linkedBreaches = GetLinkedRefChain() as LC107HullBreachScript[]
		Var[] akArgs = new Var[1]
		akArgs[0] = False
		float delayBeforeNextBreach = 0

		int i = 0
		While (i < linkedBreaches.Length)
			if (delayBeforeNextBreach > 0)
				Utility.Wait(delayBeforeNextBreach)
			EndIf
			if (linkedBreaches[i] != None)
				linkedBreaches[i].CallFunctionNoWait("TriggerBreach", akArgs)
				if (MinTimeBeforeSubsequentBreach > 0)
					delayBeforeNextBreach = Utility.RandomFloat(MinTimeBeforeSubsequentBreach, MaxTimeBeforeSubsequentBreach)
				EndIf
			EndIf
			i = i + 1
		EndWhile
	EndFunction
EndState

State Done
EndState


Function TriggerBreaches()
EndFunction