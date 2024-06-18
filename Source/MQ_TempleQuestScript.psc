Scriptname MQ_TempleQuestScript extends Quest

Quest Property StarbornTempleQuest Mandatory Const Auto

LocationAlias Property TempleLocation01 Mandatory Const Auto
LocationAlias Property TempleLocation02 Mandatory Const Auto
LocationAlias Property TempleLocation03 Mandatory Const Auto
LocationAlias Property TempleLocation04 Mandatory Const Auto
LocationAlias Property TempleLocation05 Mandatory Const Auto
LocationAlias Property TempleLocation06 Mandatory Const Auto
LocationAlias Property TempleLocation07 Mandatory Const Auto

ReferenceAlias Property TemplePowerTrigger01 Mandatory Const Auto
ReferenceAlias Property TemplePowerTrigger02 Mandatory Const Auto
ReferenceAlias Property TemplePowerTrigger03 Mandatory Const Auto
ReferenceAlias Property TemplePowerTrigger04 Mandatory Const Auto
ReferenceAlias Property TemplePowerTrigger05 Mandatory Const Auto
ReferenceAlias Property TemplePowerTrigger06 Mandatory Const Auto
ReferenceAlias Property TemplePowerTrigger07 Mandatory Const Auto

Int Property StageAcquiredPower01=110 Const Auto
Int Property StageAcquiredPower02=120 Const Auto
Int Property StageAcquiredPower03=130 Const Auto
Int Property StageAcquiredPower04=140 Const Auto
Int Property StageAcquiredPower05=150 Const Auto
Int Property StageAcquiredPower06=160 Const Auto
Int Property StageAcquiredPower07=170 Const Auto

Int Property ArtifactNumber01=4 Const Auto
Int Property ArtifactNumber02=5 Const Auto
Int Property ArtifactNumber03=6 Const Auto
Int Property ArtifactNumber04=8 Const Auto
Int Property ArtifactNumber05=9 Const Auto
Int Property ArtifactNumber06=11 Const Auto
Int Property ArtifactNumber07=12 Const Auto

Int Property Artifact04Obj=40 Const Auto
Int Property Artifact05Obj=50 Const Auto
Int Property Artifact06Obj=60 Const Auto
Int Property Artifact07Obj=70 Const Auto

Int Property WaitForVladObj=200 Const Auto
Int Property CheckOnVladObj=210 Const Auto

Location Property StarstationTheEyeLocation Mandatory Const Auto
Location Property CityNewAtlantisLodgeLocation Mandatory Const Auto

GlobalVariable Property MQTempleQuest_HaveTempleObj Mandatory Const Auto

Function CheckForTemples()
    ;fire off the right objective
    Int PlayerHasNeededArtifact
    PlayerHasNeededArtifact = (StarbornTempleQuest as StarbornTempleQuestScript).CheckPlayerArtifactForPower()

    If PlayerHasNeededArtifact > -1
        SetObjectiveDisplayed(WaitForVladObj, abdisplayed=false)
        SetObjectiveDisplayed(CheckOnVladObj, abforce=True)
    Else
        SetObjectiveDisplayed(WaitForVladObj, abforce=true)
    EndIf
EndFunction

Function VladimirGivesObjective()
    SetObjectiveDisplayed(CheckOnVladObj, abdisplayed=False)
    Int myArtifactNumber
    myArtifactNumber = (StarbornTempleQuest as StarbornTempleQuestScript).CheckPlayerArtifactForPower()
    If myArtifactNumber == ArtifactNumber04
        SetObjectiveDisplayed(Artifact04Obj)
    ElseIf  myArtifactNumber == ArtifactNumber05
        SetObjectiveDisplayed(Artifact05Obj)
    ElseIf  myArtifactNumber == ArtifactNumber06
        SetObjectiveDisplayed(Artifact06Obj)
    ElseIf  myArtifactNumber == ArtifactNumber07
        SetObjectiveDisplayed(Artifact07Obj)
    EndIf

    ;Vladimir no longer has a Top Level to ask about Temples until current objective is done (set in quest stage)
    MQTempleQuest_HaveTempleObj.SetValueInt(1)
EndFunction

Event OnQuestInit()
    ;Assign the correct Power to each Temple Location
    ;set the Temple to use this specific Artifact
    (StarbornTempleQuest as StarbornTempleQuestScript).SetArtifactAndPower(ArtifactNumber01, TempleLocation01.GetLocation())
    (StarbornTempleQuest as StarbornTempleQuestScript).SetArtifactAndPower(ArtifactNumber02, TempleLocation02.GetLocation())
    (StarbornTempleQuest as StarbornTempleQuestScript).SetArtifactAndPower(ArtifactNumber03, TempleLocation03.GetLocation())
    (StarbornTempleQuest as StarbornTempleQuestScript).SetArtifactAndPower(ArtifactNumber04, TempleLocation04.GetLocation())
    (StarbornTempleQuest as StarbornTempleQuestScript).SetArtifactAndPower(ArtifactNumber05, TempleLocation05.GetLocation())
    (StarbornTempleQuest as StarbornTempleQuestScript).SetArtifactAndPower(ArtifactNumber06, TempleLocation06.GetLocation())
    (StarbornTempleQuest as StarbornTempleQuestScript).SetArtifactAndPower(ArtifactNumber07, TempleLocation07.GetLocation())
    ;listen for when the player acquires the power
    RegisterForCustomEvent((TemplePowerTrigger01.GetRef() as SBPowerCollectionActivatorScript), "PowerAcquiredEvent")
    RegisterForCustomEvent((TemplePowerTrigger02.GetRef() as SBPowerCollectionActivatorScript), "PowerAcquiredEvent")
    RegisterForCustomEvent((TemplePowerTrigger03.GetRef() as SBPowerCollectionActivatorScript), "PowerAcquiredEvent")
    RegisterForCustomEvent((TemplePowerTrigger04.GetRef() as SBPowerCollectionActivatorScript), "PowerAcquiredEvent")
    RegisterForCustomEvent((TemplePowerTrigger05.GetRef() as SBPowerCollectionActivatorScript), "PowerAcquiredEvent")
    RegisterForCustomEvent((TemplePowerTrigger06.GetRef() as SBPowerCollectionActivatorScript), "PowerAcquiredEvent")
    RegisterForCustomEvent((TemplePowerTrigger07.GetRef() as SBPowerCollectionActivatorScript), "PowerAcquiredEvent")

    ;listen for when the player enters the Eye
    RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
EndEvent

Event SBPowerCollectionActivatorScript.PowerAcquiredEvent(SBPowerCollectionActivatorScript akSender, Var[] akArgs)
    If (akSender == TemplePowerTrigger01.GetRef()) && (GetStageDone(StageAcquiredPower01) == False)
        SetStage(StageAcquiredPower01)
    ElseIf (akSender == TemplePowerTrigger02.GetRef()) && (GetStageDone(StageAcquiredPower02) == False)
        SetStage(StageAcquiredPower02)
    ElseIf (akSender == TemplePowerTrigger03.GetRef()) && (GetStageDone(StageAcquiredPower03) == False)
        SetStage(StageAcquiredPower03)
    ElseIf (akSender == TemplePowerTrigger04.GetRef()) && (GetStageDone(StageAcquiredPower04) == False)
        SetStage(StageAcquiredPower04)
    ElseIf (akSender == TemplePowerTrigger05.GetRef()) && (GetStageDone(StageAcquiredPower05) == False)
        SetStage(StageAcquiredPower05)
    ElseIf (akSender == TemplePowerTrigger06.GetRef()) && (GetStageDone(StageAcquiredPower06) == False)
        SetStage(StageAcquiredPower06)
    ElseIf (akSender == TemplePowerTrigger07.GetRef()) && (GetStageDone(StageAcquiredPower07) == False)
        SetStage(StageAcquiredPower07)
    EndIf
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
    ;whenever the player goes to the Eye or the Lodge, check for temples
    If akSender == Game.GetPlayer()
        If (akNewLoc == StarstationTheEyeLocation) || (akNewLoc == CityNewAtlantisLodgeLocation)
            CheckForTemples()
        EndIf
    Endif
EndEvent