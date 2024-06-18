Scriptname TestZachDungeonAction extends ObjectReference

Keyword Property SpawnLink Mandatory Const Auto
ActorBase Property EnemyType Mandatory Const Auto
Int Property MaxEnemies Mandatory Const Auto

ObjectReference property OptionAMarker Mandatory const auto
ObjectReference property OptionBMarker Mandatory const auto

ObjectReference property SpawnPoint Mandatory const auto


int hasRun = 0

Event OnTriggerEnter(ObjectReference akActionRef)
    
    if (hasRun == 0)
        SetLevelState()
        SpawnEnemies()
        ;hasrun = 1
    endif

EndEvent

Function SpawnEnemies()

    ObjectReference[] Spawnpoints = self.GetLinkedRefChain(SpawnLink)
    int numEnemies = Utility.RandomInt(1,MaxEnemies)
    int i = 0
        While (i < numEnemies)            
            int l = Spawnpoints.length
            int r = Utility.RandomInt(0,(l-1))
            ObjectReference m = Spawnpoints[r]
            
            SpawnPoint.PlaceActorAtMe(EnemyType,1)
            Spawnpoints.Remove(r)
            i += 1
        EndWhile
EndFunction

Function SetLevelState()

    OptionAMarker.Enable()
    OptionBMarker.Enable()

    if (Utility.RandomInt(0,1) == 1)
        OptionAMarker.Disable()
    endif

    if (Utility.RandomInt(0,1) == 1)
        OptionBMarker.Disable()
    endif

EndFunction