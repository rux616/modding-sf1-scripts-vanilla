Scriptname JetSlowTimeScript extends ActiveMagicEffect

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	Actor PlayerREF = Game.GetPlayer()
	UIJet.play(PlayerREF)
	PlayerRef.SayCustom(PlayerConsumeJet)
	;If SlowTime != None
	;	SlowTime.Cast(akCaster)
	;Endif

	; This effect can stop/start when going into VATS, so make sure to stop the fade in/out imods if they're present
	;FadeOutImod.Remove()
	;FadeInImod.popto(FadeInImod)
	;utility.wait(0.35)
	;ImodEffect.ApplyCrossFade(1.0)
EndEvent

;Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	;FadeOutImod.popto()	
	;ImodEffect.Remove()

	; PopTo itself to kill previous instances if the effect was stopped/started
	;FadeOutImod.popto(FadeOutImod)
;EndEvent

;SPELL Property SlowTime Auto Const

;MagicEffect Property SlowTimeEffect Auto Const

;Perk Property NerdRage03 Auto Const

;ImageSpaceModifier Property FadeInImod Auto Const

;ImageSpaceModifier Property ImodEffect Auto Const

;ImageSpaceModifier Property FadeOutImod Auto Const

WwiseEvent Property UIJet Auto Const Mandatory

Keyword Property PlayerConsumeJet Auto Const

;;;NOTE:  Moved the Imod controls to another, more generic scritpt.