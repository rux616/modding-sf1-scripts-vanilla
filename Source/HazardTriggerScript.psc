Scriptname HazardTriggerScript extends ObjectReference const
{Script for a hazard-like trigger that casts a spell at any actors in the trigger.}

Spell property TriggerSpell Auto Const Mandatory
{The spell to cast on any actors in the trigger.}

float property TriggerSpellDelay = 1.0 Auto Const
{DEFAULT: 1. Timer delay between castings of the spell.}

Event OnTriggerEnter(ObjectReference akActionRef)
	StartTimer(TriggerSpellDelay)
EndEvent

Event OnTimer(int timerID)
		ObjectReference[] triggerRefs = GetAllRefsInTrigger()
		if (triggerRefs.Length > 0)
			int i = 0
			While (i < triggerRefs.Length)
				TriggerSpell.Cast(Self, triggerRefs[i])
				i = i + 1
			EndWhile
			StartTimer(TriggerSpellDelay)
		EndIf
EndEvent