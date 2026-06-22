Scriptname LegendaryMagicEffectEventSenderScript extends ActiveMagicEffect
{Sends event through LegendaryItemQuestScript when magic effect starts and finishes

kArgs[0] = base MagicEffect this script is attached to
kArgs[1] = Target Actor
kArgs[2] = Caster Actor / Aggressor Actor (OnHit)
kArgs[3] = EventType?  (LegendaryItemQuestScript) iEventType_Starting, iEventType_Finishing, iEventType_OnHit
kArgs[4] = EventArg1
kArgs[5] = EventArg2
kArgs[6] = EventArg3
}

Group AutofillProperties
LegendaryItemQuestScript Property LegendaryItemQuest const auto mandatory
{Autofill}
EndGroup

Group FillThisWithThisMagicEffect
MagicEffect Property ThisMagicEffect const auto 
{Fill this property with the MagicEffect base form you have attached this script to.

Why? Because esoteric timing issues:
If you kill an actor in the same moment it applies the effect, 
the active magic effect no longer exists, so GetBaseObject() fails.
And this script needs a pointer to the magic effect in question to pass along in a function call,
so we store it in the property.
}

EndGroup

Group Options

bool property SendOnEffectStartEvent = true const auto
{Default: true
Should we send an event when the magic effect is applied?}

bool property SendOnEffectStartFinish = false const auto
{Default: false
Should we send an event when the magic effect finishes?
Only should be true for things with a duration.}

bool Property SendOnHitEvent = false const auto
{Default: false
Should we register for OnHit events? 
Only should be true for things with a duration}

EndGroup

Group EventArgs
Form Property EventArg1 const auto
{Sent as kArgs[4]}

Form Property EventArg2 const auto
{Sent as kArgs[5]}

Form Property EventArg3 const auto
{Sent as kArgs[6]}

EndGroup



Function SendLegendaryMagicEffectEvent(Actor akTarget, Actor akCaster, int EventType)
	;isEffectStarting: false = finishing
	
	var[] kArgs = new var[7]

	kArgs[0] = ThisMagicEffect ;the MagicEffect this script is on
	kArgs[1] = akTarget
	kArgs[2] = akCaster
	kArgs[3] = EventType ;see  LegendaryItemQuestScript.iEventType_Starting, iEventType_Finishing, iEventType_OnHit
	kArgs[4] = EventArg1
	kArgs[5] = EventArg2
	kArgs[6] = EventArg3

	debug.trace(self + "SendLegendaryMagicEffectEvent() kArgs: " + kArgs)

	LegendaryItemQuest.SendLegendaryMagicEffectEvent(kArgs)

EndFunction

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	Actor targetActor = akTarget as Actor
	If targetActor
		debug.trace(self + "OnEffectStart() akTarget: " + akTarget + ", akCaster: " + akCaster)
		
		if SendOnHitEvent
			RegisterForHitEvent(akTarget, akAggressorFilter = akCaster)
		endif

		if SendOnEffectStartEvent
			debug.trace(self + "OnEffectStart() calling SendLegendaryMagicEffectEvent()")
			SendLegendaryMagicEffectEvent(targetActor, akCaster, EventType = LegendaryItemQuest.iEventType_Starting)
		endif
	EndIf
endEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	Actor targetActor = akTarget as Actor
	If targetActor
		debug.trace(self + "OnEffectFinish() akTarget: " + akTarget + ", akCaster: " + akCaster)
		
		if SendOnEffectStartFinish
			debug.trace(self + "OnEffectFinish() calling SendLegendaryMagicEffectEvent()")
			SendLegendaryMagicEffectEvent(targetActor, akCaster, EventType = LegendaryItemQuest.iEventType_Finishing)
		endif

		UnregisterForAllHitEvents()
	EndIf
endEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	debug.trace(self + "OnHit() akTarget: " + akTarget + ", akAggressor: " + akAggressor)
	SendLegendaryMagicEffectEvent(akTarget as Actor, akAggressor as Actor, EventType = LegendaryItemQuest.iEventType_OnHit)

	if SendOnHitEvent
		RegisterForHitEvent(akTarget, akAggressorFilter = akAggressor)
	endif
EndEvent 
