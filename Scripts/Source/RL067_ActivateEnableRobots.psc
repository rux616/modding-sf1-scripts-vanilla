Scriptname RL067_ActivateEnableRobots extends ObjectReference

Actor[] Property SpawnedRobot Mandatory Auto
Bool Property DoEnable Mandatory Auto
Bool Property DoAggro Mandatory Auto

Faction Property PirateFaction Auto Const
Faction Property PirateEnemyFaction Auto Const









 Event OnActivate(ObjectReference akActionRef)
    Utility.wait(2.0)
      int index = 0
        While (index < SpawnedRobot.Length)

            if(DoEnable == True)
                SpawnedRobot[index].Enable()
            EndIf
            If(DoAggro == True)
                SpawnedRobot[index].SetValue( Game.GetAggressionAV(), 2)
                SpawnedRobot[index].RemoveFromFaction(PirateFaction)
                SpawnedRobot[index].AddToFaction(PirateEnemyFaction)
            EndIf
      
            index += 1
        EndWhile
EndEvent




  
  
      