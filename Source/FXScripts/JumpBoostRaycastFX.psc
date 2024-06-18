Scriptname FXScripts:JumpBoostRaycastFX extends ActiveMagicEffect
{Test script for ship landing effects.}

ImpactDataSet Property BoosterImpactEffect Auto Const Mandatory
{The impact set that will be spawned from the ship thrusters.}

float Property ImpactRecastDelay = 0.1 Auto Const 
float Property ImpactRange = 6.0 Auto Const 

;Activator Property BoostpackActive Auto Const

bool bPlayImpactEffects = false
int ImpactTimer = 10
int SafetyTimer = 20
float SafetyTimerDuration = 10.0


Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    RegisterForAnimationEvent(akTarget, "StartImpactFX")
    RegisterForAnimationEvent(akTarget, "StopImpactFX")
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    bPlayImpactEffects = False
    UnRegisterForAnimationEvent(akTarget, "StartImpactFX")
    UnRegisterForAnimationEvent(akTarget, "StopImpactFX")
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    ;debug.Trace("SourceRef is " + akSource + " and Event is " + asEventName)
    if asEventName == "StartImpactFX"
        bPlayImpactEffects = true
        ;debug.trace("Starting Timer for ImpactFX Animation")
        akSource.PlayImpactEffect(BoosterImpactEffect, "C_BackPack", 0.0, 0.0, -1.0, ImpactRange, true, false)
        CancelTimer(SafetyTimer)
        StartTimer(SafetyTimerDuration, SafetyTimer)
        StartTimer(ImpactRecastDelay, ImpactTimer)
    EndIf

    if asEventName == "StopImpactFX"
        ;debug.trace("Finished ImpactFX Sequence")
        bPlayImpactEffects = False
        CancelTimer(ImpactTimer)
    EndIf
EndEvent

Event OnTimer(int aiTimerID)
    if aiTimerID == ImpactTimer
        if bPlayImpactEffects == True
            GetTargetActor().PlayImpactEffect(BoosterImpactEffect, "C_BackPack", 0.0, 0.0, -1.0, ImpactRange, true, false)
            StartTimer(ImpactRecastDelay, ImpactTimer)
        endif
    endif
    if aiTimerID == SafetyTimer
            bPlayImpactEffects = False
            CancelTimer(ImpactTimer)
    endif
EndEvent
