Scriptname rq_scancreaturesscript extends RQScript

struct herdSize
    Keyword herdSizeKeyword
    int extraSpawnCount
    float rewardMult ; smaller reward for herd creatures since they're easier to find
endStruct

Group Scan_Properties
    int Property ObjectiveToDisplayForScanning = 100 Const Auto
    { Objective for scanning }

    int Property StageToSetIfScannedDead = 150 Const Auto
    { Stage to set when scanning a target that is dead) }

    int Property SpawnStage = 200 Const Auto
    { Spawn some targets at this stage to ensure some exist (the stage when player is given the objective) }

    int Property StageToSetOnCompletelyScanned = 300 Const Auto
    { Stage to set when scanning target base object's GetPercentageKnown() >= 1 }

    GlobalVariable Property PercentageScannedTextDisplay Mandatory Const Auto
    { Quest instance global to use to display percentage in quest objective }

    GlobalVariable property CreditsRewardRadiantQuestLarge const mandatory Auto
    { base value for quest reward }

    GlobalVariable property RQ_ScanQuestReward const mandatory Auto
    { actual value for quest reward - modified by herd size (solitary creatures are much harder to find)}

    ReferenceAlias property Alias_CenterMarker Mandatory Const Auto
    { The center marker of the area to spawn predators and prey }

    RefCollectionAlias Property ScanTargets Mandatory Const Auto
    { Ref Collection that will hold targets; currently spawned }

    ReferenceAlias Property SpawnAt Mandatory Const Auto
    { Where to spawn Targets at }

    int property SpawnAmountMinBase = 1 auto Const
    int property SpawnAmountMaxBase = 3 auto const

    herdSize[] property HerdSizeSpawnCount const auto
    { array matching herd size keyword with extra spawn count }
endGroup

ActorBase ScanTargetBase
int iDebugNextTarget

Function QuestStartedSpecific()
    Trace(self, "QuestStartedSpecific()")

    ; initialize reward global
    RQ_ScanQuestReward.SetValue(CreditsRewardRadiantQuestLarge.GetValueInt())

    if InitializeScanTarget()
        RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerScannedObject")
        RegisterForRemoteEvent(Game.GetPlayer(), "OnKill")
    Else
        Trace(self, "QuestStartedSpecific() - no scan target found, shutting down.")
        Shutdown()
    endif
EndFunction

Event OnStageSet(int auiStageID, int auiItemID)
    Trace(self, "OnStageSet() auiStageID: " + auiStageID)

    if auiStageID == SpawnStage
        Trace(self, "OnStageSet() Spawning Targets")

        SpawnTargetRefs()
    endif
EndEvent

event Actor.OnPlayerScannedObject(Actor akSender, ObjectReference akScannedRef)
    TryToUpdatePercentKnown(akScannedRef)
EndEvent

event Actor.OnKill(Actor akSender, ObjectReference akVictim)
    ; @TODO: Remove after GEN-533042 is complete
    TryToUpdatePercentKnown(akVictim)
EndEvent

function TryToUpdatePercentKnown(ObjectReference akTargetReference) private
    ; Progress the quest if the player increases scan progress by scanning or killing creatures of this type.
    Actor actorRef = akTargetReference as Actor
    if actorRef
        ActorBase scannedActorBase = actorRef.GetMatchingPlanetActorBase()

        Trace(self, "TryToUpdatePercentKnown() akSender: " + akTargetReference + ", scannedActorBase=" + scannedActorBase)

        if scannedActorBase == ScanTargetBase
            UpdatePercentKnown(actorRef)
        endif
    endif
endFunction

bool Function InitializeScanTarget()
    Trace(self, "InitializeScanTarget() ")
    bool initialized = false

    ;get a random actor base from the ones allowed in this biome (ones that still have some discovering to do)
    ObjectReference spawnAtRef = SpawnAt.GetReference()
    ActorBase[] allowedBases = spawnAtRef.GetBiomeActors(afMaxPercentageKnown = 0.5)
    
    Trace(self, "InitializeScanTarget() allowedBases: " + allowedBases)

    if allowedBases.Length == 0
        Trace(self, "InitializeScanTarget() no valid biome actors. Shutdown quest.")
    else
        int iRandom = Utility.RandomInt(0, allowedBases.Length - 1)
        ScanTargetBase = allowedBases[iRandom]

        Trace(self, "InitializeScanTarget() ScanTargetBase: " + ScanTargetBase)

        ; spawn one so we can initialize the objective
        ObjectReference spawnedRef = spawnAtRef.PlaceAtMe(ScanTargetBase, akAliasToFill = ScanTargets)

        Trace(self, "InitializeScanTarget() spawnedRef: " + spawnedRef + " ScanTargets.GetCount()=" + ScanTargets.GetCount())

        float percentageKnown = spawnedRef.GetPercentageKnown()
        Trace(self, "InitializeScanTarget() percentageKnown : " + percentageKnown)
        UpdatePercentKnown(spawnedRef, false)

        initialized = true
    endif
    return initialized
EndFunction

function UpdatePercentKnown(Objectreference scannedRef, bool removeRefFromTargetsCollection=true)
    float percentageKnown = scannedRef.GetPercentageKnown()

    Trace(self, "UpdatePercentKnown for scannedRef: " + scannedRef + ", percentageKnown: " + percentageKnown)

    ;update text display global
    int precentAsInt = (percentageKnown * 100) as int
    
    PercentageScannedTextDisplay.SetValue(precentAsInt)
    UpdateCurrentInstanceGlobal(PercentageScannedTextDisplay)

    Actor scannedActorRef = (scannedRef as actor)
    if scannedActorRef && scannedActorRef.IsDead()
        SetStage(StageToSetIfScannedDead)
    endif

    if percentageKnown >= 1 
        ;completed
        Trace(self, "UpdatePercentKnown() setting StageToSetOnCompletelyScanned: " + StageToSetOnCompletelyScanned)
        SetStage(StageToSetOnCompletelyScanned)
    endif

    ; remove from targets collection
    if removeRefFromTargetsCollection
        ScanTargets.RemoveRef(scannedRef)
    endif
endFunction

;to be on the safe side, we will always have the quest spawn some creatures so we know some exist nearby and we can put QTs on at least these ones
Function SpawnTargetRefs()
    ObjectReference spawnAtRef = SpawnAt.GetReference()
    ObjectReference spawnedRef = ScanTargets.GetAt(0)

    Trace(self, "SpawnTargetRefs() spawnAtRef: " + spawnAtRef)

    int minSpawnCount = SpawnAmountMinBase
    int maxSpawnCount = SpawnAmountMaxBase

    ; run through herd keyword list to see if we need to add more
    int h = 0
    bool foundHerd = false
    while h < HerdSizeSpawnCount.Length && foundHerd == false
        herdSize theHerdSize = HerdSizeSpawnCount[h]
        foundHerd = spawnedRef.HasKeyword(theHerdSize.herdSizeKeyword)
        if foundHerd
            trace(self, " found herd size data for target creature: " + theHerdSize)
            trace(self, " modifying reward by herd size reward mult=" + theHerdSize.rewardMult)
            minSpawnCount += theHerdSize.extraSpawnCount
            maxSpawnCount += theHerdSize.extraSpawnCount
            ; modify reward
            RQ_ScanQuestReward.SetValueInt(Math.Floor(CreditsRewardRadiantQuestLarge.GetValue() * theHerdSize.rewardMult))
        endif
        h += 1
    endWhile

    int amountToSpawn = Utility.RandomInt(minSpawnCount, maxSpawnCount)

    Trace(self, "SpawnTargetRefs() ScanTargetBase: " + ScanTargetBase + " , additional amountToSpawn: " + amountToSpawn + ", spawnAtRef: " + spawnAtRef)

    if amountToSpawn > 0
        ObjectReference[] spawnedRefs = new ObjectReference[0]

        int i = 0
        While (i < amountToSpawn)
            spawnedRefs.Add(spawnAtRef.PlaceAtMe(ScanTargetBase))
            i += 1
        EndWhile

        Trace(self, "SpawnTargetRefs() spawnedRefs: " + spawnedRefs)

        ScanTargets.AddArray(spawnedRefs)
    EndIf
EndFunction

 
Function DebugMoveToNextTarget()
	Game.GetPlayer().MoveTo(ScanTargets.GetAt(iDebugNextTarget))

	iDebugNextTarget = iDebugNextTarget + 1 % ScanTargets.GetCount()
EndFunction
