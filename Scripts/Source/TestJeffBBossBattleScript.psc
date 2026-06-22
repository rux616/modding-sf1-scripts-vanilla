Scriptname TestJeffBBossBattleScript extends Actor

CustomEvent ScaleBoss
CustomEvent StartTeleporting
CustomEvent StopTeleporting

Float Property ScaleThreshold = 0.85 Auto Const
Float Property StartTeleportThreshold = 0.50 Auto Const

;******************************************************

Float myTotalHealth
Bool doneScaling = FALSE

;******************************************************

Event OnLoad()
   ; myBoss = self as Actor
    myTotalHealth = getValue(game.GetHealthAV())
    RegisterForHitEvent(self, game.GetPlayer())
EndEvent

;******************************************************

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, \
  bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
    if(akAggressor == game.GetPlayer())
    	if (getValue(game.GetHealthAV()) <= (myTotalHealth * ScaleThreshold) && doneScaling == FALSE)
    		;% health reached for scaling, send custom event
    		doneScaling = TRUE
    		SendCustomEvent("ScaleBoss")
    		RegisterForHitEvent(self, game.GetPlayer())
    	elseif(getValue(game.GetHealthAV()) <= (myTotalHealth * StartTeleportThreshold))
    		;% health reached for teleporting, send custom event
    		SendCustomEvent("StartTeleporting")
    	else
    		RegisterForHitEvent(self, game.GetPlayer())
    	EndIf
    EndIf
EndEvent

;******************************************************

Event onDeath(ObjectReference akKiller)
   	SendCustomEvent("StopTeleporting")
EndEvent

;******************************************************