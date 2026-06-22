Scriptname DefaultRefAmbushTrigger2 extends ObjectReference
{Alternate ambush trigger system for locations with complex ambush needs.}

Group OptionalProperties
	bool property TriggerIfAnyLinkedActorEntersCombat = True Auto Const
	{Default=True. If True, trigger the ambush when any actor managed by this trigger enters combat.}

	bool property TriggerIfAnyLinkedActorIsHit = False Auto Const
	{Default=False. If True, trigger the ambush when any actor managed by this trigger is hit.}

	Faction property FactionToApplyInAmbush Auto Const
	{Default=None. If set, this faction will be added to the actors controlled by this trigger while they are in ambush, and removed when they emerge.}

	float property InitialAmbushDelay = 0.0 Auto Const
	{Default=0. If set, the delay between the event that triggers the ambush and the first creature released from it.}

	float property MinAmbushDelay = 0.0 Auto Const
	{Default=0. If set, the minimum delay between releasing actors controlled by this trigger.}

	float property MaxAmbushDelay = 0.25 Auto Const
	{Default=0.25. If set, the maximum delay between releasing actors controlled by this trigger.}
EndGroup

Group AutofillProperties
	ActorValue property AmbushTriggered Auto Const Mandatory
	Keyword property LinkAmbushTrigger Auto Const Mandatory
	Keyword property LinkAmbushSequence Auto Const Mandatory
	Keyword property DMP_AmbushMarker Auto Const Mandatory
EndGroup


Auto State Waiting
	Event OnCellLoad()
		Actor[] myActors = GetAmbushTriggerActors()
		if (myActors.Length > 0)
			int i = 0
			While (i < myActors.Length)
				if (TriggerIfAnyLinkedActorEntersCombat)
					RegisterForRemoteEvent(myActors[i], "OnCombatStateChanged")
				EndIf
				if (TriggerIfAnyLinkedActorIsHit)
					RegisterForHitEvent(myActors[i])
				EndIf
				if (FactionToApplyInAmbush != None)
					if (myActors[i].GetLinkedRef(DMP_AmbushMarker) != None)
						myActors[i].AddToFaction(FactionToApplyInAmbush)
					EndIf
				EndIf
				i = i + 1
			EndWhile
		EndIf
	EndEvent

	Event OnTriggerEnter(ObjectReference akActionRef)
		GoToState("Triggered")
	EndEvent

	Event Actor.OnCombatStateChanged(Actor akSource, ObjectReference akTarget, int aeCombatState)
		TriggerAmbushForActor(akSource)
		GoToState("Triggered")
	EndEvent

	Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, \
		bool abBashAttack, bool abHitBlocked, string asMaterialName)
		TriggerAmbushForActor(akSource as Actor)
		GoToState("Triggered")
	EndEvent

	Function TriggerAmbush()
		GoToState("Triggered")
	EndFunction
EndState


State Triggered
	Event OnBeginState(string asOldState)
		UnregisterForAllEvents()
		Actor[] myActors = GetAmbushTriggerActors()
		int i = 0
		While (i < myActors.Length)
			if (i == 0)
				if (InitialAmbushDelay > 0)
					Utility.Wait(InitialAmbushDelay)
				EndIf
			ElseIf (MaxAmbushDelay > 0) ;&& (i > 0)
				Utility.Wait(Utility.RandomFloat(MinAmbushDelay, MaxAmbushDelay))
			EndIf
			TriggerAmbushForActor(myActors[i])
			i = i + 1
		EndWhile
	EndEvent
EndState


Actor[] Function GetAmbushTriggerActors()
	Actor[] mySequence = GetLinkedRefChain(LinkAmbushSequence) as Actor[]
	if ((mySequence == None) || (mySequence.Length == 0))
		Actor[] myChildren = GetRefsLinkedToMe(LinkAmbushTrigger) as Actor[]
		if ((myChildren == None) || (myChildren.Length == 0))
			Debug.Trace("WARN: " + Self + " has no linked actors.", 1)
			return new Actor[0]
		Else
			return myChildren
		EndIf
	Else
		Actor[] myChildren = GetRefsLinkedToMe(LinkAmbushTrigger) as Actor[]
		int i = 0
		While (i < myChildren.Length)
			if (mySequence.Find(myChildren[i]) < 0)
				mySequence.Add(myChildren[i])
			EndIf
			i = i + 1
		EndWhile
		return mySequence
	EndIf
EndFunction


;Empty state functions.
Event Actor.OnCombatStateChanged(Actor akSource, ObjectReference akTarget, int aeCombatState)
	TriggerAmbushForActor(akSource)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, \
	bool abBashAttack, bool abHitBlocked, string asMaterialName)
	TriggerAmbushForActor(akSource as Actor)
EndEvent

Function TriggerAmbush()
EndFunction

Function TriggerAmbushForActor(Actor actorToTrigger)
	Debug.Trace("Triggered " + actorToTrigger)
	if (FactionToApplyInAmbush != None)
		actorToTrigger.RemoveFromFaction(FactionToApplyInAmbush)
	EndIf
	actorToTrigger.SetValue(AmbushTriggered, 1)
	actorToTrigger.EvaluatePackage()
EndFunction
