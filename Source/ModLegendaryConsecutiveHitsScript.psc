Scriptname ModLegendaryConsecutiveHitsScript extends LegendaryMagicEffectEventListenScript 

;Reminder there are properties and variables defined on the parent script

Actor LastConsecutiveHitActor
int ConsecutiveHitCount

;Reminder - Parent script manages making sure the Magic Effect and Caster are the ones we are interested in.
Function HandleEvent(MagicEffect EventMagicEffect, Actor TargetActor, Actor CasterActor, int EventType, Var EventArg1, Var EventArg2, Var EventArg3)
	debug.trace(self + "HandleEvent()")
	debug.trace(self + "EventMagicEffect: " + EventMagicEffect)
	debug.trace(self + "TargetActor: " + TargetActor)
	debug.trace(self + "CasterActor: " + CasterActor)
	debug.trace(self + "EventType: " + EventType)
	debug.trace(self + "EventArg1: " + EventArg1)
	debug.trace(self + "EventArg2: " + EventArg2)
	debug.trace(self + "EventArg3: " + EventArg3)


	;EventArgs are set on LegendaryMagicEffectEventSenderScript
	;on the the magic effect: ModLegendaryOnHitEffect_ConsecutiveHits_Sender

	;EventArg1 = HasLegendary_Weapon_DamageConsecutiveHits (keyword)
	;EventArg2 = ModLegendaryWeaponConsecutiveHits (ActorValue)
	;EventArg3 = unset

	ActorValue ModLegendaryWeaponConsecutiveHits = EventArg2 as ActorValue

	Actor myActor = GetTargetActor()
	If myActor
		if EventType == LegendaryItemQuest.iEventType_Starting || EventType == LegendaryItemQuest.iEventType_OnHit
			;Check if Target is lastHitActor
			if TargetActor == LastConsecutiveHitActor
				;increase count
				debug.trace(self + "HandleEvent() Effect starting/On Hit, TargetActor = LastConsecutiveHitActor, so increasing ModLegendaryWeaponConsecutiveHits on " + myActor)
				myActor.SetValue(ModLegendaryWeaponConsecutiveHits, myActor.GetValue(ModLegendaryWeaponConsecutiveHits) + 1)

			else ;someone newly hit
				;reset count
				debug.trace(self + "HandleEvent() Effect starting, TargetActor != LastConsecutiveHitActor, so reseting ModLegendaryWeaponConsecutiveHits on " + myActor)
				myActor.SetValue(ModLegendaryWeaponConsecutiveHits, 0)
			endif

			LastConsecutiveHitActor = TargetActor

		elseif EventType == LegendaryItemQuest.iEventType_Finishing
			if TargetActor == LastConsecutiveHitActor
				;reset count
				debug.trace(self + "HandleEvent() Effect finishing, TargetActor == LastConsecutiveHitActor, so reseting ModLegendaryWeaponConsecutiveHits on " + myActor)
				myActor.SetValue(ModLegendaryWeaponConsecutiveHits, 0)

			endif
		endif
	EndIf
EndFunction


