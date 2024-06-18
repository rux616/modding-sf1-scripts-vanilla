Scriptname OE_CECSuperfan_PlayerScript extends ReferenceAlias

Float Property StopBelowPercentHealth = 0.75 Const Auto
{If the Player's health reaches this percent, they lose the fight. Range: 0.01 - 0.99}
int Property StageToSet = 400 Const Auto 
{Stage to set when the Player loses.}
ReferenceAlias Property ShipA Mandatory Const Auto hidden
{Autofill}

Actor PlayerREF  
Float LowHealth

Event OnAliasInit()
    PlayerREF = Self.GetActorRef()

    RegisterForHitEvent(self)
    

    LowHealth = PlayerREF.GetValue( Game.GetHealthAV() ) 
    LowHealth *= StopBelowPercentHealth
    Debug.Trace("OE_AustinF_CECSuperfan: LowHealth set: " + LowHealth)    
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
    Quest QO = GetOwningQuest()
    Float PlayerHealth = PlayerREF.GetValue(Game.GetHealthAV())

    ; Check if the NPC wins/Player loses. (First to hit a threshold percent loses.)
    If PlayerHealth <= LowHealth 
        Debug.Trace(akTarget + "'s health: " + PlayerHealth + " is below the threshold: " + LowHealth)
        QO.SetStage(StageToSet)
    Else 
        Debug.Trace(akTarget + " was hit by " + akAggressor + " with " + akSource)
    EndIf

    RegisterForHitEvent(self)
EndEvent

