Scriptname AttachAshPile extends ActiveMagicEffect

{Scripted effect for on death ash pile}

import debug
import FormList

;======================================================================================;
;  PROPERTIES  /
;=============/

float property fDelay = 0.75 auto const
									{time to wait before Spawning Ash Pile}
; float property fDelayAlpha = 1.65 auto
; 									{time to wait before Setting alpha to zero.}
float property fDelayEnd = 1.65 auto const
									{time to wait before Removing Base Actor}
float property ShaderDuration = 0.00 auto const
									{Duration of Effect Shader.}
Activator property AshPileObject auto const
									{The object we use as a pile.}
EffectShader property MagicEffectShader auto const
									{The Effect Shader we want.}
Bool property bSetAlphaZero = True auto const
									{When done, set the Actor Alpha to zero.}

Bool property bSetAlphaToZeroEarly = False Auto const
									{Use this if we want to set the actor to invisible somewhere before the effect shader is done.}
bool  property onEffectStartOveride = FALSE auto const

;======================================================================================;
;  VARIABLES   /
;=============/

actor Victim


;======================================================================================;
;   EVENTS     /
;=============/



Event OnInit()
	Victim = GetTargetActor()
EndEvent


Event OnEffectStart(ObjectReference Target, Actor Caster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	if victim && victim.IsEssential() == False
		if onEffectStartOveride == TRUE
			victim.SetCriticalStage(victim.CritStage_DisintegrateStart)
			if	MagicEffectShader != none
				MagicEffectShader.play(victim, ShaderDuration)
			endif
			StartTimer(fDelay, 1)
		endif
	EndIf
EndEvent

Event OnDying(ObjectReference Killer)
	if victim && victim.IsEssential() == False
		if onEffectStartOveride == FALSE

			victim.SetCriticalStage(victim.CritStage_DisintegrateStart)
			if	MagicEffectShader != none
				MagicEffectShader.play(victim, ShaderDuration)
			endif
			StartTimer(fDelay, 1)
		EndIf
	EndIf
EndEvent

Event OnTimer(int aiTimerID)		
  If aiTimerID == 1
		Victim.AttachAshPile(AshPileObject)
		StartTimer(fDelayEnd, 2)
  EndIf

   If aiTimerID == 2
		if	MagicEffectShader != none
			MagicEffectShader.stop(Victim)
		endif
		if bSetAlphaZero == True
			victim.SetAlpha (0.0,True)
		endif
		victim.SetCriticalStage(Victim.CritStage_DisintegrateEnd)
		;trace("ASHPILE:::: We did actually finish this stuff")
  EndIf
EndEvent

; Event OnEffectFinish(ObjectReference Target, Actor Caster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	
; 	trace("ASHPILE:::: The effect was removed, I'm betting early")
; EndEvent
