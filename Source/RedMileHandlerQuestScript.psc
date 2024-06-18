Scriptname RedMileHandlerQuestScript extends Quest

GlobalVariable Property PlayerCompletedRedMile Mandatory Const Auto
LocationAlias Property RedMile Mandatory Const Auto
RefCollectionAlias Property Markers Mandatory Const Auto
RefCollectionAlias Property Phase2Markers Mandatory Const Auto
RefCollectionAlias Property Creatures Mandatory Const Auto
ActorBase Property PCM_Porrima_Porrima_III_Predator01 Mandatory Const Auto

Function RespawnCreatures(Int aiPhase = 0)
    Int i = 0
    Int iCount

    If aiPhase <= 0
        iCount = Markers.GetCount()
        ;First remove all the old creatures from the ref collection alias so we can add new ones.
        Cleanup()
    Else 
        iCount = Phase2Markers.GetCount()
    EndIf


    While i < iCount
        ObjectReference myMarker
        If aiPhase <= 0
            myMarker = Markers.GetAt(i)
        Else
            myMarker = Phase2Markers.GetAt(i)
        EndIf
        
        ;Assign a value, determined by a weighted random int, to be used with PlaceActorAtMe to determine difficulty. 
        ;Gradually increase the difficulty at certain intervals after running the course a number of times, so it keeps challenging the player.
        Int iRandom = Utility.RandomInt(1, 100)
        Int iSpawnMod
        
        Float fNumTimesCompleted = PlayerCompletedRedMile.GetValue()
        ;25% Easy, 40% Medium, 10% Hard, 5% Boss, 20% None
        If fNumTimesCompleted < 5
            If iRandom <= 25
                iSpawnMod = 0
            ElseIf iRandom > 25 && iRandom <= 65
                iSpawnMod = 1
            ElseIf iRandom > 55 && iRandom <= 75
                iSpawnMod = 2
            ElseIf iRandom > 75 && iRandom <= 80
                iSpawnMod = 3
            Else
                iSpawnMod = 4
            EndIf

        ;15% Easy, 50% Medium, 15% Hard, 5% Boss, 15% None
        ElseIf fNumTimesCompleted >= 5 && fNumTimesCompleted < 12
            If iRandom <= 15
                iSpawnMod = 0
            ElseIf iRandom > 15 && iRandom <= 65
                iSpawnMod = 1
            ElseIf iRandom > 65 && iRandom <= 80
                iSpawnMod = 2
            ElseIf iRandom > 80 && iRandom <= 85
                iSpawnMod = 3
            Else
                iSpawnMod = 4
            EndIf

        ;10% Easy, 30% Medium, 40% Hard, 10% Boss, 10% None
        ElseIf fNumTimesCompleted >= 12 && fNumTimesCompleted < 20
            If iRandom <= 10
                iSpawnMod = 0
            ElseIf iRandom > 10 && iRandom <= 40
                iSpawnMod = 1
            ElseIf iRandom > 40 && iRandom <= 80
                iSpawnMod = 2
            ElseIf iRandom > 80 && iRandom <= 90
                iSpawnMod = 3
            Else
                iSpawnMod = 4
            EndIf

        ;0% Easy, 25% Medium, 60% Hard, 10% Boss, 5% None
        ElseIf fNumTimesCompleted >= 20 && fNumTimesCompleted < 25
            If iRandom <= 25
                iSpawnMod = 1
            ElseIf iRandom > 25 && iRandom <= 85
                iSpawnMod = 2
            ElseIf iRandom > 85 && iRandom <= 95
                iSpawnMod = 3
            Else
                iSpawnMod = 4
            EndIf

        ;0% Easy, 0% Medium, 80% Hard, 15% Boss, 5% None
        Else
            If iRandom <= 80
                iSpawnMod = 2
            ElseIf iRandom > 80 && iRandom <= 95
                iSpawnMod = 3
            Else
                iSpawnMod = 4
            EndIf
        EndIf

        ;Now that we have a weighted random int, place the actor at the marker (i), and add it to the Creatures Ref Collection.

        Location myLoc = RedMile.GetLocation()
        ObjectReference myCreature = myMarker.PlaceActorAtMe(PCM_Porrima_Porrima_III_Predator01, iSpawnMod, myLoc) as ObjectReference
        Creatures.AddRef(myCreature)
        i += 1
    EndWhile 

EndFunction


;Deletes and removes all creatures existing currently, usually left over from previous Red Mile runs.
Function Cleanup()
    Int i = 0
    Int iCount = Creatures.GetCount()
    
    While i < iCount
        ObjectReference myCreature = Creatures.GetAt(i)
        myCreature.Disable()
        myCreature.Delete()
        i += 1
    EndWhile

    Creatures.RemoveAll()
EndFunction