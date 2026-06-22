Scriptname FXScripts:FXResourceCollectionVisuals extends ActiveMagicEffect
{Script for play a visual effect that connects one actor to another.}


;======================================================================================;
;  PROPERTIES  /
;=============/
ImageSpaceModifier property TrapImod auto
{IsMod applied when we trap a soul}
VisualEffect property TargetVFX auto
{Visual Effect on Target aiming at Caster}
VisualEffect property CasterVFX auto
{Visual Effect on Caster aming at Target}
Float property AbsorbFXDuration = 10.0 auto 
ActorValue property VFXTargetDistance Auto
float Property ResampleDelay = 0.5 Auto Const 

;======================================================================================;
;  VARIABLES   /
;=============/
;bool DeadAlready = FALSE
bool bStopEffects = False
int ResampleTimer = 1235
;======================================================================================;
;  EVENTS      /
;=============/


Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	;if bIsEnchantmentEffect == False
    ;   Actor TargetActor = GetTargetActor()
	;	DeadAlready = TargetActor.IsDead()
	;endif
	if akTarget
        TargetVFX.Play(akTarget,AbsorbFXDuration,akCaster)              ; Play TargetVFX and aim them at the player
        ;CasterVFX.Play(akCaster,AbsorbFXDuration,akTarget)
        UpdateTargetDistance(akTarget,akCaster)
		StartTimer(ResampleDelay, ResampleTimer)
	endif
EndEvent


Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	if akTarget
        TargetVFX.Stop(akTarget)              ; Play TargetVFX and aim them at the player
        ;CasterVFX.Stop(akCaster)
	endif
	bStopEffects = True
endEvent

Event OnTimer(int aiTimerID)
	if !bStopEffects
		if aiTimerID == ResampleTimer
			if GetElapsedTime() < 5.0
				GetTargetActor()
				UpdateTargetDistance(GetTargetActor(),GetCasterActor())
				StartTimer(ResampleDelay, ResampleTimer)
			endif
		endif
	EndIf
EndEvent

Function UpdateTargetDistance(ObjectReference akTarget, Actor akCaster)
    float Dist = akCaster.GetDistance(akTarget)
    akTarget.SetValue(VFXTargetDistance, Dist)
EndFunction