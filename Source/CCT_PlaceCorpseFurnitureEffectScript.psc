Scriptname CCT_PlaceCorpseFurnitureEffectScript extends ActiveMagicEffect

Furniture property CreatureCorpseFeed auto const mandatory
{ corpse furniture to place on death if a non-flier }

Furniture property CreatureCorpseFeed_Flyer auto const mandatory
{ corpse furniture to place on death if a flier}

Keyword property ActorTypePredator auto const mandatory
{ check that killer is a predator }

ConditionForm property CCT_IsFlier auto const mandatory
{ use to test if killer is a flier }

float property fDelay = 3.0 auto const
{ wait a bit for corpse to finish settling }

float property markerOffset = -2.5 auto const
{ how far to offset feed marker so the actor isn't right on top of the corpse }

int iDelayTimerID = 1 Const
int iDelayTimerFlyerID = 2 Const

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    debug.trace(self + " OnEffectStart on " + akCaster)
    RegisterForRemoteEvent(akCaster, "OnDeath")
EndEvent

Event Actor.OnDeath(Actor akSource, ObjectReference akKiller)
    if akKiller && akKiller.HasKeyword(ActorTypePredator)
        debug.trace(self + " OnDeath " + akSource + ": running timer")
        if CCT_IsFlier.IsTrue(akKiller)
            StartTimer(fDelay, iDelayTimerFlyerID)
        else
            StartTimer(fDelay, iDelayTimerID)
        endif
    endif
EndEvent

Event OnTimer(int aiTimerID)
    Actor targetActor = GetTargetActor()
	float[] offset = new float[3]
	offset[1] = markerOffset

    if aiTimerID == iDelayTimerID
        debug.trace(self + " OnTimer " + targetActor + ": placing " + CreatureCorpseFeed)
        ObjectReference markerRef = targetActor.PlaceAtMe(CreatureCorpseFeed, akOffsetValues=offset)
    elseif aiTimerID == iDelayTimerFlyerID
        debug.trace(self + " OnTimer " + targetActor + " is a flier: placing " + CreatureCorpseFeed_Flyer)
        ObjectReference markerRef = targetActor.PlaceAtMe(CreatureCorpseFeed_Flyer, akOffsetValues=offset)
    EndIf
EndEvent
