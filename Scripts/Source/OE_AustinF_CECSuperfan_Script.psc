Scriptname OE_AustinF_CECSuperfan_Script extends ReferenceAlias

Faction Property PlayerEnemyFaction Auto Const
Scene Property OE_AustinF_CECSuperfan_Scene03 Const Auto
int Property StageToSet_WeaponsUsed = 170 Const Auto 
int Property StageToSet_PlayerWins = 300 Const Auto 
Float Property StopBelowPercentHealth = 0.75 Const Auto
Weapon Property UnarmedHuman  Auto  

Actor PlayerREF
Actor Superfan
Quest QO
Float LowHealth 

Event OnAliasInit()
    Superfan = self.GetActorRef()
    QO = GetOwningQuest()

    RegisterForHitEvent(self)

    LowHealth = Superfan.GetValue(Game.GetHealthAV())
    Debug.Trace(QO + " LowHealth: [" + LowHealth + "] + StopBelowPercentHealth: " + StopBelowPercentHealth + "")
    
    LowHealth = LowHealth * StopBelowPercentHealth
    Debug.Trace(QO + " LowHealth: [" + LowHealth + "]" ) 
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)

    If akSource != UnarmedHuman 
        QO.SetStage(StageToSet_WeaponsUsed)
        Debug.Trace(QO + "OnHit(). Player used a weapon. Set stage: " + StageToSet_WeaponsUsed)
    EndIf 

    If Superfan.GetValue(Game.GetHealthAV()) <= LowHealth 
        QO.SetStage(StageToSet_PlayerWins)
        Debug.Trace(QO + "OnHit(). Player used a . Set stage: " + StageToSet_PlayerWins)
    EndIf
    
    RegisterForHitEvent(self)
    Debug.Trace(QO + "OnHit(). " + akTarget + " was hit by " + akAggressor)
EndEvent