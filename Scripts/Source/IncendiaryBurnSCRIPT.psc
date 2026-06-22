Scriptname IncendiaryBurnSCRIPT extends ActiveMagicEffect
{If hit with enough incendiaty ammo over a period of time you will burn}

import debug
import FormList

ACTORVALUE PROPERTY Incendiary AUTO

;Different frozen states
KEYWORD PROPERTY IncendiaryState01 AUTO
KEYWORD PROPERTY IncendiaryState02 AUTO

BOOL PROPERTY RANK2 = FALSE AUTO
{Should we apply the burn effect?}

SPELL PROPERTY pCryoFreezeSpell AUTO
{The Cryo freeze spell}

FLOAT PROPERTY ShaderDuration = 10.00 auto 
{shatter shader duration}

KEYWORD PROPERTY pOnFireState AUTO
{on fire property}

INT bulletTimer = 10

; the victim
ACTOR victim

EVENT OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    
    victim = akTarget as Actor
	If victim

		;if the incendiary value is above a threshold, set onfire
		IF(!RANK2 && victim.getValue(Incendiary) < 5)

			;increase the "fire" value by one
			victim.modValue(Incendiary, 1)
			startTimer(1, bulletTimer)

		ELSEIF(RANK2 && victim.getValue(Incendiary) >= 5)
			victim.addKeyword(pOnFireState)

		ENDIF
	EndIf
	
ENDEVENT

Event OnTimer(int aiTimerID)

	; are we the bullet timer?
    if aiTimerID == bulletTimer
    
    	;the bullet effect expired before we hit Rank 2
    	IF(!RANK2 && victim.getValue(Incendiary) < 5)
    		victim.damageValue(Incendiary, victim.getValue(Incendiary))

    	ENDIF

    endif

EndEvent

EVENT OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	
	IF(victim && RANK2)
		
		;when we're done burning, set us back to 0
		victim.damageValue(Incendiary, victim.getValue(Incendiary) - 3)
		victim.removeKeyword(pOnFireState)
	ENDIF

ENDEVENT