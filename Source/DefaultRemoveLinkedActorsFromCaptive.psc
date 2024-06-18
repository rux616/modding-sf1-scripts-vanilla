Scriptname DefaultRemoveLinkedActorsFromCaptive extends ObjectReference Hidden

Keyword Property RemoveLinkedCaptiveKeyword Auto Const Mandatory
Faction Property CaptiveFaction Auto Const Mandatory

auto STATE WaitingForTrigger

	Event OnTriggerEnter(ObjectReference akActionRef)
		GoToState("Done")
	    Actor[] CaptiveActors

	    CaptiveActors = self.GetActorsLinkedToMe( RemoveLinkedCaptiveKeyword, None )

		int maxSize = CaptiveActors.Length
		int count = 0
		while (count < maxSize)
			Actor CaptiveActor = CaptiveActors[count]
			CaptiveActor.RemoveFromFaction(CaptiveFaction)
			CaptiveActor.EvaluatePackage()
			count += 1
		endwhile
	EndEvent

EndSTATE


STATE Done

EndSTATE