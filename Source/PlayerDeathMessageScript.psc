Scriptname PlayerDeathMessageScript extends ActiveMagicEffect

Event OnEffectStart(ObjectReference akVictim, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	RegisterForHitEvent(game.GetPlayer())
EndEvent

Event OnHit(objectReference akTarget, objectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
    
    objectReference PlayerRef = game.GetPlayer()

    if akTarget == game.GetPlayer(); && (Tutorial as TutorialScript).bLowHealthMessageDone == false
    	if PlayerRef.GetValuePercentage(Health) < Damaged && PlayerRef.GetValue(Health) > 0
            ;debug.messagebox("Setting MBBlock in OnHit")
            MessageBoxTutorialBlocked.SetValue(1)
    		PlayerDeathMessage.Show()
    		UnregisterForHitEvent(Game.GetPlayer())
    		game.GetPlayer().RemoveSpell(abDeathMessage)
            Utility.Wait(MessageBoxTutorialWait.GetValue())
            MessageBoxTutorialBlocked.SetValue(0)
    	else
    		RegisterForHitEvent(game.GetPlayer())
    	endif
    endif
EndEvent	

ActorValue Property Health Auto Const

Float Property Damaged Auto Const

Message Property PlayerDeathMessage Auto Const

SPELL Property abDeathMessage Auto Const

GlobalVariable Property MessageBoxTutorialBlocked Auto Const

GlobalVariable Property MessageBoxTutorialWait Auto Const

Quest Property Tutorial Auto Const
