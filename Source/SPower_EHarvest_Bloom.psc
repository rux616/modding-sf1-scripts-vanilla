Scriptname SPower_EHarvest_Bloom extends ActiveMagicEffect

; should be a simple script, intent is to grab targets within spell's effect radius and pass a refresh to their harvestable state.
; not applying any conditions to the target group for this as it should only impact things that can already be harvested.

EVENT OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)

    akTarget.SetHarvested(false)

ENDEVENT