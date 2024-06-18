Scriptname SG01PlayerShipScript extends ReferenceAlias

ActorValue Property ShipSystem Auto Const

Event OnShipSystemDamaged(ActorValue akSystem, int aBlocksLost, bool aElectromagneticDamage, bool aFullyDamaged)

    ; When the player's engines are out - then their match is ended
    if akSystem == ShipSystem && aFullyDamaged && GetOwningQuest().GetStageDone(700)
        GetOwningQuest().SetStage(750)
    EndIf

EndEvent