Scriptname LegendaryMagicEffectEventListenScript extends ActiveMagicEffect
{Listens to events from LegendaryItemQuestScript originating from LegendaryMagicEffectEventSenderScript

Extend this script, and reimplement "HandleEvent()" function
}

LegendaryItemQuestScript Property LegendaryItemQuest const auto mandatory
{Autofill}

MagicEffect Property MagicEffectEventSender const auto 
{Which Magic Effect is the LegendaryMagicEffectEventSenderScript we are listening for attached?
This script will ignore all events where this does != kArgs[0](the base MagicEffect of the sending ActiveMagicEffect)
}



Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	RegisterForCustomEvent(LegendaryItemQuest, "LegendaryMagicEffectEvent")
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	UnregisterForCustomEvent(LegendaryItemQuest, "LegendaryMagicEffectEvent")
endEvent


Event LegendaryItemQuestScript.LegendaryMagicEffectEvent(LegendaryItemQuestScript akSender, Var[] kArgs)
	debug.trace(self + "LegendaryMagicEffectEvent from akSender: " + akSender)
	;kArgs[0] = base MagicEffect this script is attached to
	;kArgs[1] = Target Actor
	;kArgs[2] = Caster Actor / Aggressor Actor (OnHit)
	;kArgs[3] = EventType?  iEventType_Starting, iEventType_Finishing, iEventType_OnHit
	;kArgs[4] = EventArg1
	;kArgs[5] = EventArg2
	;kArgs[6] = EventArg3

	;Only handle events send by MagicEffects we care about:
	if kArgs[0] as MagicEffect == MagicEffectEventSender
		
		;Only handle events where the the caster/aggressor of the sending magic effect event is the target of this listener magic effect
		if GetTargetActor() == kArgs[2] as Actor
			HandleEvent(kArgs[0] as MagicEffect, kArgs[1] as Actor, kArgs[2] as Actor, kArgs[3] as int, kArgs[4], kArgs[5], kArgs[6])
		else
			debug.trace(self + "LegendaryMagicEffectEvent() ignoring event from magiceffect cast by(" + kArgs[2] + ")  because it's not == to my GetTargetActor(): " + GetTargetActor())	
		endif

	else
		debug.trace(self + "LegendaryMagicEffectEvent() ignoring event(" + kArgs[0] + ") since it's not coming from the magic effect I care about: " +  MagicEffectEventSender)
	endif

EndEvent

Function HandleEvent(MagicEffect EventMagicEffect, Actor TargetActor, Actor CasterActor, int EventType, Var EventArg1, Var EventArg2, Var EventArg3)
	;REIMPLEMENT THIS IN EXTENDED SCRIPTS

	debug.trace(self + "HandleEvent()")
	debug.trace(self + "EventMagicEffect: " + EventMagicEffect)
	debug.trace(self + "TargetActor: " + TargetActor)
	debug.trace(self + "CasterActor: " + CasterActor)
	debug.trace(self + "EventType: " + EventType)
	debug.trace(self + "EventArg1: " + EventArg1)
	debug.trace(self + "EventArg2: " + EventArg2)
	debug.trace(self + "EventArg3: " + EventArg3)


EndFunction