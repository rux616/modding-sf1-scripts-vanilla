ScriptName DefaultReleaseToHavokScript extends ObjectReference Default
{Releases an object to Havok OnHit or OnActivate.}

Group Properties
	bool property HavokOnHit = True Auto Const
	{Default: TRUE. Should we release the object to Havok when it's hit?}

	bool property HavokOnActivate = True Auto Const
	{Default: TRUE. Should we release the object to Havok when it's activated?}

	bool property ReleaseAllLinkedHavokPartners = True Auto Const
	{Default: TRUE.
	 If True, release all objects linked to or from this object with LinkHavokPartner to Havok. Assumes this object is part of a simple chain; branching is NOT supported.
	 If False, release only objects linked from this object with LinkHavokPartner to Havok.}

	Keyword property LinkHavokPartner Auto Const
	{The chain of objects linked with this keyword will be released to Havok when this object is released.}
EndGroup


Auto State Waiting
	Event OnLoad()
		if (HavokOnHit)
			RegisterForHitEvent(Self)
		ElseIf (!HavokOnActivate) ;&& !HavokOnHit
			DefaultScriptFunctions.Warning(Self, "WARNING: DefaultReleaseToHavokScript on " + Self + " is not set to Havok on Hit or Activate, and so will do nothing.")
		EndIf
	EndEvent

	Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
		if (HavokOnHit)
			ReleaseToHavok()
		EndIf
	EndEvent

	Event OnActivate(ObjectReference triggerRef)
		if (HavokOnActivate)
			ReleaseToHavok()
		EndIf
	EndEvent

	Function ReleaseToHavok()
		GoToState("Released")
		ObjectReference current = Self
		if (ReleaseAllLinkedHavokPartners)
			;If ReleaseAllLinkedHavokPartners, find the head of the chain.
			ObjectReference[] currentLinkChain = new ObjectReference[1]
			currentLinkChain[0] = current
			ObjectReference[] currentParents = GetRefsLinkedToMe(LinkHavokPartner)
			While ((currentParents.Length > 0) && (currentLinkChain.Find(currentParents[0]) < 0))
				current = currentParents[0]
				currentLinkChain.Add(current)
				currentParents = current.GetRefsLinkedToMe(LinkHavokPartner)
			EndWhile
		EndIf
		;Release the topmost ref in the chain.
		current.SetMotionType(Motion_Dynamic)
		;Release all of its children.
		ObjectReference[] myLinkChain = current.GetLinkedRefChain(LinkHavokPartner)
		int i = 0
		While (i < myLinkChain.Length)
			current = myLinkChain[i] as DefaultReleaseToHavokScript
			if (current != None)
				current.SetMotionType(Motion_Dynamic)
			EndIf
			i = i + 1
		EndWhile
	EndFunction
EndState

State Released
	;Do nothing.
EndState


;Empty State functions.
Function ReleaseToHavok()
EndFunction