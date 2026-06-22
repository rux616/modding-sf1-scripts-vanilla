Scriptname MQ403QuestScript extends Quest

Quest Property StarbornTempleQuest Mandatory Const Auto

LocationAlias Property TempleLocation01 Mandatory Const Auto
LocationAlias Property TempleLocation02 Mandatory Const Auto
LocationAlias Property TempleLocation03 Mandatory Const Auto
LocationAlias Property TempleLocation04 Mandatory Const Auto
LocationAlias Property TempleLocation05 Mandatory Const Auto
LocationAlias Property TempleLocation06 Mandatory Const Auto
LocationAlias Property TempleLocation07 Mandatory Const Auto
LocationAlias Property TempleLocation08 Mandatory Const Auto
ReferenceAlias Property TemplePowerTrigger01 Mandatory Const Auto
ReferenceAlias Property TemplePowerTrigger02 Mandatory Const Auto
ReferenceAlias Property TemplePowerTrigger03 Mandatory Const Auto
ReferenceAlias Property TemplePowerTrigger04 Mandatory Const Auto
ReferenceAlias Property TemplePowerTrigger05 Mandatory Const Auto
ReferenceAlias Property TemplePowerTrigger06 Mandatory Const Auto
ReferenceAlias Property TemplePowerTrigger07 Mandatory Const Auto
ReferenceAlias Property TemplePowerTrigger08 Mandatory Const Auto
Int Property StageAcquiredPower01=210 Const Auto
Int Property StageAcquiredPower02=220 Const Auto
Int Property StageAcquiredPower03=230 Const Auto
Int Property StageAcquiredPower04=240 Const Auto
Int Property StageAcquiredPower05=250 Const Auto
Int Property StageAcquiredPower06=260 Const Auto
Int Property StageAcquiredPower07=270 Const Auto
Int Property StageAcquiredPower08=280 Const Auto

Int Property ArtifactNumber01=0 Const Auto
Int Property ArtifactNumber02=4 Const Auto
Int Property ArtifactNumber03=5 Const Auto
Int Property ArtifactNumber04=6 Const Auto
Int Property ArtifactNumber05=8 Const Auto
Int Property ArtifactNumber06=9 Const Auto
Int Property ArtifactNumber07=11 Const Auto
Int Property ArtifactNumber08=12 Const Auto

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
    (StarbornTempleQuest as StarbornTempleQuestScript).SetArtifactAndPower(ArtifactNumber08, TempleLocation08.GetLocation())
    ;listen for when the player acquires the power
    RegisterForCustomEvent((TemplePowerTrigger01.GetRef() as SBPowerCollectionActivatorScript), "PowerAcquiredEvent")
    RegisterForCustomEvent((TemplePowerTrigger02.GetRef() as SBPowerCollectionActivatorScript), "PowerAcquiredEvent")
    RegisterForCustomEvent((TemplePowerTrigger03.GetRef() as SBPowerCollectionActivatorScript), "PowerAcquiredEvent")
    RegisterForCustomEvent((TemplePowerTrigger04.GetRef() as SBPowerCollectionActivatorScript), "PowerAcquiredEvent")
    RegisterForCustomEvent((TemplePowerTrigger05.GetRef() as SBPowerCollectionActivatorScript), "PowerAcquiredEvent")
    RegisterForCustomEvent((TemplePowerTrigger06.GetRef() as SBPowerCollectionActivatorScript), "PowerAcquiredEvent")
    RegisterForCustomEvent((TemplePowerTrigger07.GetRef() as SBPowerCollectionActivatorScript), "PowerAcquiredEvent")
    RegisterForCustomEvent((TemplePowerTrigger08.GetRef() as SBPowerCollectionActivatorScript), "PowerAcquiredEvent")
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
    ElseIf (akSender == TemplePowerTrigger08.GetRef()) && (GetStageDone(StageAcquiredPower08) == False)
        SetStage(StageAcquiredPower08)
    EndIf
EndEvent