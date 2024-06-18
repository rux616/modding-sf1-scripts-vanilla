Scriptname LegendaryAutoHealScript extends ActiveMagicEffect

GlobalVariable Property LegendaryAutoHealMinPercent Auto Const
GlobalVariable Property LegendaryAutoHealDelay Auto Const
ActorValue Property Health Auto
Potion Property Aid_MedPack Auto Const

Float myHealth
Actor myActor
int HealDelayID = 58618

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	myActor = akTarget as Actor
	RegisterForHitEvent(myActor)	
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	UnregisterForAllHitEvents()
EndEvent

Event OnHit(objectReference akTarget, objectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	myHealth = myActor.GetValuePercentage(Health) as float
	;debug.trace(self + "Health percentage =" + myHealth)
	
	;If the health is below threshold and inventory has aid, use a aid
	if (myHealth < LegendaryAutoHealMinPercent.GetValue() && myActor.GetItemCount(Aid_MedPack) > 0)
		myActor.EquipItem(Aid_MedPack)
		;Run a timer for the next registered hit so we don't trigger multiple aid close together
		StartTimer(LegendaryAutoHealDelay.GetValue(), HealDelayID)
	else
		RegisterForHitEvent(myActor)
	endif
EndEvent

Event OnTimer(Int aiTimerID)
	if aiTimerID == HealDelayID 
		RegisterForHitEvent(myActor)
	endif
EndEvent