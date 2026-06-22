Scriptname UCR04QuestScript extends Quest

Group Aliases
    RefCollectionAlias Property Enemies Mandatory Const Auto
    {Ref collection for the enemies we'll have in this quest}

    RefCollectionAlias Property UnsampledEnemies Mandatory Const Auto
    {Ref collection that contains only enemies that haven't yet had their samples removed}

    RefCollectionAlias Property SpawnMarkers Mandatory Const Auto
    {Ref collection holding the spawn markers for the aliens}

    RefCollectionAlias Property CreatureSamples Mandatory Const Auto
    {Holding collection for the creature sample items}

    RefCollectionAlias Property ActiveCreatureSamples Mandatory Const Auto
    {Collection used for the creature sample items that are now available for collection}

    ReferenceAlias Property PatrolingEnemy Mandatory Const Auto
    {Alias to get one of the critters patroling}

    ReferenceAlias Property Player Mandatory Const Auto
    {Player quest alias}

    ReferenceAlias Property LegendaryAlias Mandatory Const Auto
    {Alias we shove a critter into if we want to make it Legendary}

    ReferenceAlias Property PatrolStartMarker Mandatory Const Auto
    {Alias for a patrol path marker}

    RefCollectionAlias Property PatrolingEnemies Mandatory Const Auto
    {Ref collection to get the NPCs into a patrolling group}
EndGroup

Group Globals
    GlobalVariable Property UCR04_MinSamplesRequired Mandatory Const Auto
    {Minimum samples required on this quest}

    GlobalVariable Property UCR04_MaxSamplesRequired Mandatory Const Auto
    {Max number of samples required on this quest}

    GlobalVariable Property UCR04_SamplesTotalRequired Mandatory Const Auto
    {Ultimate number of samples the player needs to collect}

    GlobalVariable Property UCR04_SamplesHarvested Mandatory Const Auto
    {Tracking global for how many samples the player has collected}

    GlobalVariable Property UCR04_RequireOutOfCombatHarvesting Mandatory Const Auto
    {Global used to toggle whether or not the player needs to be in combat to harvest from the critters. Set to ONE by default.}

    GlobalVariable Property UCR04_LegendaryCritterChance Mandatory Const Auto
    {Percent change 0-100 that this quest will spawn a legendary critter}

    GlobalVariable Property UCR04_MaxPatrollingEnemies Mandatory Const Auto
    {Max number of NPCs we want patrolling together}

    GlobalVariable Property UCR04_MinPatrollingEnemies Mandatory Const Auto
    {Min number of NPCs we want patrolling together}

    GlobalVariable Property UCR04_TotalPatrollingEnemies Mandatory Const Auto
    {Final count of how many NPCs we want patrolling together}
EndGroup

Group ObjectiveIndicesAndStages
    int Property SampleCollectObj = 100 Auto Const
    {Objective index telling the player to collect samples}

    int Property NonLethalObj = 111 Auto Const
    {Objective index telling the player they can do it non-lethaly}
EndGroup

Group Misc
    LocationRefType Property REScenePatrolStartLocRef Mandatory Const Auto
    {Loc ref used to designate a marker starting a patrol path}

    Keyword Property UCR04SpecimenTarget Mandatory Const Auto
    {Keyword used to find proper specimen targets}

    MiscObject Property UCR04_SpecimenSample Mandatory Const Auto
    {The samples the player is hunting}

    Message Property NotAllowedDuringCombat Mandatory Const Auto
    {Message to throw when the player tries to harvest material from their target while it's in combat}

    Perk Property UCR04_Critters_ReduceIncomingDamage_c75 Mandatory Const Auto
    {Damage reduction perk to make these critters a little tougher}

    ActorValue Property Confidence Mandatory Const Auto
    {Confidence actor value}

    int Property MinConfidenceValue = 3 Const Auto
    {Baseline confidence value we want to give these creatures}

    UCParentFactionQuestScript Property DialogueUCFactionAlwaysOn Mandatory Const Auto
    {Parent quest for all things UC. Used to manage the custom events for the sample harvesting}
EndGroup

Function PrepQuest()
    trace(self, "UCR04: Prepping quest.")

    ;Figure out how many samples we need this time
    int iSampleAmount = Utility.RandomInt(UCR04_MinSamplesRequired.GetValueInt(), UCR04_MaxSamplesRequired.GetValueInt())

    if iSampleAmount < 1
        iSampleAmount = 1
    elseif iSampleAmount > Enemies.GetCount()
        iSampleAmount = Enemies.GetCount()
    endif

    ;Reset the "Samples Harvested" global
    UCR04_SamplesHarvested.SetValue(0)

    trace(self, "Number of samples to collect: " + iSampleAmount)

    ;Get all the critters in place
    SpawnEnemies(iSampleAmount)

    ;Update the objective with the appropriate data and get it onscreen
    UCR04_SamplesTotalRequired.SetValue(iSampleAmount)
    trace(self, "Updating UCR04_SamplesTotalRequired to: " + UCR04_SamplesTotalRequired.GetValue())
    (Player as UCR04_PlayerAliasScript).ReadyPlayerAliasScript(UCR04_SamplesTotalRequired.GetValueInt())
    UpdateCurrentInstanceGlobal(UCR04_SamplesHarvested)
    UpdateCurrentInstanceGlobal(UCR04_SamplesTotalRequired)

    ;Register for the custom event
    RegisterForCustomEvent(DialogueUCFactionAlwaysOn, "UCR04SampleCollected")

    SetObjectiveDisplayed(NonLethalObj)
    SetObjectiveDisplayedAtTop(SampleCollectObj)
    trace(self, "Prep complete!")
EndFunction

 Function SpawnEnemies(int iNumofSamples)
    trace(self, "SpawnEnemies()")
    int i = 0
    int iCount = Enemies.GetCount()

    trace(self, "Enemies in ref collection: " + iCount)

    ;Randomize the number of enemies
    int iRand = Utility.RandomInt(0, 2)
    int iFinalCount = iCount - iRand
    iCount = iFinalCount
    trace(self, "Number of enemies to spawn: " + iCount)

    if iCount < iNumofSamples
        iCount = iNumofSamples
    endif

    ;Check to see if we're going to have a legendary critter
    int iLegendChange = Utility.RandomInt(0, 100)
    trace(self, "Test for a Legendary enemy! Roll is: " + iLegendChange + ". Threshold is: " + UCR04_LegendaryCritterChance.GetValueInt())

    if iLegendChange <= UCR04_LegendaryCritterChance.GetValueInt()
        ;Increment the count by one so we're not setting up too many enemies
        i += 1
        PrepEnemy(LegendaryAlias.GetActorRef())
    endif

    ;Check to see how many patrollers we're going to have
    UCR04_TotalPatrollingEnemies.SetValue(0.0)
    int iPatrollerCount = Utility.RandomInt(UCR04_MinPatrollingEnemies.GetValueInt(), UCR04_MaxPatrollingEnemies.GetValueInt())
    UCR04_TotalPatrollingEnemies.SetValue(iPatrollerCount)
    trace(self, "Patroller count: " + iPatrollerCount + ". UCR04_TotalPatrollingEnemies is: " + UCR04_TotalPatrollingEnemies.GetValueInt())

    Actor currEnemy

    while i < iCount
        currEnemy = Enemies.GetAt(i) as Actor
        trace(self, "currEnemy: " + currEnemy)

        PrepEnemy(currEnemy)
        i += 1
    endwhile

    trace(self, "Enemy prep complete!")
 EndFunction

Function PrepEnemy(Actor akEnemyToPrep)
    ObjectReference currSpawn
    ObjectReference currSample

    int iSpawnIndex = Utility.RandomInt(0, SpawnMarkers.GetCount() - 1)
    currSpawn = SpawnMarkers.GetAt(iSpawnIndex)
    trace(self, "currSpawn: " + currSpawn)
    akEnemyToPrep.MoveTo(currSpawn)

    trace(self, "Enemies in PatrolingEnemies: " + PatrolingEnemies.GetCount() + ". Max Count: " + UCR04_MaxPatrollingEnemies.GetValueInt())
    if PatrolStartMarker.GetRef() != none && PatrolingEnemies.GetCount() < UCR04_TotalPatrollingEnemies.GetValueInt()
        PatrolingEnemies.AddRef(akEnemyToPrep)
        trace(self, "Enemy is now patroller: " + PatrolingEnemies)
    endif

    currSample = CreatureSamples.GetAt(0)
    trace(self, "currSample: " + currSample)
    ActiveCreatureSamples.AddRef(currSample)
    akEnemyToPrep.AddItem(currSample)
    CreatureSamples.RemoveRef(currSample)
    trace(self, "akEnemyToPrep has how many samples: " + akEnemyToPrep.GetItemCount(currSample) + ". ActiveSamples count: " + ActiveCreatureSamples.GetCount())

    UnsampledEnemies.AddRef(akEnemyToPrep)
    akEnemyToPrep.AddPerk(UCR04_Critters_ReduceIncomingDamage_c75)
    if akEnemyToPrep.GetValue(Confidence) < MinConfidenceValue
        akEnemyToPrep.SetValue(Confidence, MinConfidenceValue)
    endif

    akEnemyToPrep.Enable()
    trace(self, "currEnemy enabled: " + akEnemyToPrep.IsDisabled())
    currSample.Enable()
    trace(self, "currSample enabled: " + currSample.IsDisabled())
    akEnemyToPrep.EvaluatePackage()
EndFunction

Event UCParentFactionQuestScript.UCR04SampleCollected(UCParentFactionQuestScript akSender, var[] akArgs)
    Actor akTargetCreature = akArgs[0] as Actor
	trace(self, " akTargetCreature " + akTargetCreature + " received.")
;Function PerkEntrySampleCollection(Actor akTargetCreature)
    trace(self, "Perk activated. Target creature: " + akTargetCreature)
    if akTargetCreature.HasKeyword(UCR04SpecimenTarget)
        trace(self, "Target creature: " + akTargetCreature + " has the keyword.")

        if !akTargetCreature.IsInCombat() || UCR04_RequireOutOfCombatHarvesting.GetValueInt() <= 0
            UnsampledEnemies.RemoveRef(akTargetCreature)
            int SpecimenCount = akTargetCreature.GetItemCount(UCR04_SpecimenSample)
            trace(self, "This specimen has: " + SpecimenCount + " samples on it.")
            akTargetCreature.RemoveItem(UCR04_SpecimenSample, SpecimenCount)
            trace(self, "Now, post-removal, it has: " + akTargetCreature.GetItemCount(UCR04_SpecimenSample))
            Actor PlayACT = Game.GetPlayer()

            int i = 0
            int iCount = SpecimenCount

            while i < iCount
                PlayACT.AddAliasedItem(UCR04_SpecimenSample, ActiveCreatureSamples)
                trace(self, "Adding: " + UCR04_SpecimenSample + " to player. They now have: " + PlayACT.GetItemCount(UCR04_SpecimenSample))

                i += 1
            endwhile
        else
            NotAllowedDuringCombat.Show()
        endif
    endif
EndEvent

Event OnQuestShutdown()
    UnregisterForCustomEvent(DialogueUCFactionAlwaysOn, "UCR04SampleCollected")
EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UCR04", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction
