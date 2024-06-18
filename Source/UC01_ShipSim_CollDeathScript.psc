Scriptname UC01_ShipSim_CollDeathScript extends RefCollectionAlias

GlobalVariable Property UC01_ShipSim_CurrentWaveEnemyCountDefeated Mandatory Const Auto
{Global used to display how many enemies the player's knocked out in this wave}

int Property EnemyCountObj = 300 Const Auto
{Objective to update as the player defeats enemies}

Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
    RemoveRef(akSenderRef)

    UC01_ShipSimulationQuestScript OQ = GetOwningQuest() as UC01_ShipSimulationQuestScript
    if GetCount() <= 0
       UC01_ShipSim_CurrentWaveEnemyCountDefeated.SetValue(0)
       OQ.UpdateCurrentInstanceGlobal(UC01_ShipSim_CurrentWaveEnemyCountDefeated)
       OQ.EnemyDefeated()
    else
        UC01_ShipSim_CurrentWaveEnemyCountDefeated.Mod(1)
        OQ.UpdateCurrentInstanceGlobal(UC01_ShipSim_CurrentWaveEnemyCountDefeated)
        OQ.SetObjectiveDisplayedAtTop(EnemyCountObj)
    endif

     ;GEN-481048 - disable the ship after a few seconds
     Utility.Wait(3.0)
     akSenderRef.Disable()
EndEvent