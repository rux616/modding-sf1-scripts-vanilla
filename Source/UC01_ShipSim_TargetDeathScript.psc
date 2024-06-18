Scriptname UC01_ShipSim_TargetDeathScript extends ReferenceAlias

Event OnDeath(ObjectReference akKiller)
       (GetOwningQuest() as UC01_ShipSimulationQuestScript).EnemyDefeated()
EndEvent
