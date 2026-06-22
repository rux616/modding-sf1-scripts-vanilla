Scriptname TestDarylTriggerScript extends ObjectReference Const

ObjectReference Property EnemySpawnPoint Mandatory Const Auto
ObjectReference Property EnemySpawnButton Mandatory Const Auto
ActorBase Property EnemyToSpawn Mandatory Const Auto

Event OnLoad()
    debug.Trace(self + "|OnLoad(): Started")
    RegisterForRemoteEvent(EnemySpawnButton, "OnActivate")
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
    debug.Trace(self + "|OnTriggerEnter(): Started") 
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
    debug.Trace(self + "|OnTriggerLeave(): Started") 
EndEvent


Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
    debug.Trace(self + "|OnActivate(): Started")
    EnemySpawnPoint.PlaceActorAtMe(EnemyToSpawn)
EndEvent