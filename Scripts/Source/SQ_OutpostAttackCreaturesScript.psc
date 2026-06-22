Scriptname SQ_OutpostAttackCreaturesScript extends SQ_OutpostAttackScript

struct AttackCreatureData
    RefCollectionAlias collectionAlias ; collection holding spawned creatures of a specific type (e.g. Biome_PredatorHerdSmall)
    int minSpawnCount = 0 ; if > 0, randomly enable between minSpawnCount and the number in collectionAlias
endStruct


group AttackCreaturesGroup
    AttackCreatureData[] property Creatures auto mandatory const
    { array of spawned creatures of various types (Biome_PredatorSolitary, Biome_PredatorHerdSmall, etc.)
        Not all of the ref collections will necessarily have anything in them, depending on the types of creatures that exist on this planet
    }
endGroup

; override parent function
Function HandleQuestStarted()
    ; randomly pick a ref collection to be the Attackers
    int[] randomArray = new int[Creatures.Length]
    int i = 0
    while i < randomArray.Length
        randomArray[i] = i
        i += 1
    endWhile

    bool found = false
    while randomArray.Length > 0 && found == false
        int randomArrayIndex = Utility.RandomInt(0, randomArray.Length-1)
        int creaturesIndex = randomArray[randomArrayIndex] ; get index from randomly picked element of randomArray
        AttackCreatureData theCreatureData = Creatures[creaturesIndex]

        if theCreatureData.collectionAlias.GetCount() > 0
            debug.trace(self + " found creatures in " + theCreatureData.collectionAlias + " - use as attackers")
            found = true
            ; how many to use?
            int spawnCount = Utility.RandomInt(theCreatureData.minSpawnCount, theCreatureData.collectionAlias.GetCount())
            debug.trace(self + " spawn roll between " + theCreatureData.minSpawnCount + " and " + theCreatureData.collectionAlias.GetCount() + ": " + spawnCount + " to spawn")
            ; remove any that we don't want
            while theCreatureData.collectionAlias.GetCount() > spawnCount && theCreatureData.collectionAlias.GetCount() > 0
                theCreatureData.collectionAlias.RemoveRef(theCreatureData.collectionAlias.GetAt(0))
            EndWhile
            Attackers.AddRefCollection(theCreatureData.collectionAlias)
        Else
            randomArray.Remove(randomArrayIndex)
        endif
    EndWhile

    if found
        Attackers.EnableAll()
    Else
        debug.trace(self + " no creatures spawned - shut down attack quest")
        Stop()
    endif
EndFunction


