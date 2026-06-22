Scriptname TestTrackTargetOnHitScript extends Actor

Projectile Property TestTrackingProjectile Mandatory Const Auto

EffectShader Property ShipShieldMembraneFXS Mandatory Const Auto


Event OnLoad()
    Utility.Wait(3)
    AddInventoryEventFilter(none)
	RegisterForHitEvent(self)
    GotoState("WaitingForHit")
EndEvent

STATE WaitingForHit

    Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
        If (akProjectile == TestTrackingProjectile)
            GotoState("WaitingForDeath")
        EndIf
    EndEvent

EndState

State WaitingForDeath

    Event OnDying(ObjectReference akKiller)
        If (self.GetItemCount(none) > 0)
            ShipShieldMembraneFXS.Play(self)
        EndIf
            GotoState("WaitingForCorpseLoot")
    EndEvent
    
EndState

State WaitingForCorpseLoot

    Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, int aiTransferReason)
        ShipShieldMembraneFXS.Stop(self)
    EndEvent

EndState
            
        