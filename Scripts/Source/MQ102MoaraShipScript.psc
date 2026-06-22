Scriptname MQ102MoaraShipScript extends ReferenceAlias

Int Property DisabledEngineStage = 640 Auto Const 
ActorValue Property SpaceshipMainEnginePower Mandatory Const Auto

Event OnShipSystemDamaged(ActorValue akSystem, int aBlocksLost, bool aElectromagneticDamage, bool aFullyDamaged)
    If akSystem == (SpaceshipMainEnginePower) && (aFullyDamaged)
        GetOwningQuest().SetStage(DisabledEngineStage)
    EndIf
EndEvent