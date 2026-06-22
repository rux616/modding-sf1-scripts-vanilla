Scriptname SFBGS00D:SQ_StarbornContainerScript extends Quest

Struct IngredientDatum
    MiscObject ContainerIngredient
    int RequiredAmount
EndStruct

Group Ingredients
    IngredientDatum[] Property IngredientData Mandatory Const Auto
    {Data for ingredients needed to build the container}
EndGroup

Group Autofill
    ReferenceAlias Property StarbornContainer Mandatory Auto Const
    {Starborn container in the player's room in the Lodge}
    ReferenceAlias Property StarbornContainerTrigger Mandatory Const Auto
    {Trigger volume the player activates to try to build the container.}
    ReferenceAlias Property StarbornContainerSlate Mandatory Const Auto
    {Slate the player must read to enable the trigger volume for building the container.}
    ReferenceAlias Property LodgeLamp Mandatory Const Auto
    {Static lamp that we disable to make space for the container}
    ReferenceAlias Property StarbornContainerSoundMarker01 Mandatory Const Auto
    {Sound marker for container sounds. Enabled and disabled with the container.}
    WwiseEvent Property WwiseEvent_SFBGS00D_StarbornContainer_Build Mandatory Const Auto
    {Sound to play when building the container.}
    WwiseEvent Property WwiseEvent_SFBGS00D_StarbornContainer_Upgrade Mandatory Const Auto
    {Sound to play when upgrading the container.}
    GlobalVariable Property StarbornContainerBuildCostEssenceGV Mandatory Const Auto
    {Quantum Essence cost to build the container.}
    GlobalVariable Property StarbornContainerBuildStartingCapacityGV Mandatory Const Auto
    {Base capacity for the container before upgrades.}
    GlobalVariable Property StarbornContainerUpgradeCostGV Mandatory Const Auto
    {Quantum Essence cost to upgrade the container.}
    GlobalVariable Property StarbornContainerUpgradeCapacityGV Mandatory Const Auto
    {How much the container capacity increases per upgrade.}
    GlobalVariable Property StarbornContainerMaxCapacityGV Mandatory Const Auto
    {Maximum possible capacity for the container after upgrades. Cannot be upgraded past this.}
    Message Property StarbornContainerSlateMsg Mandatory Const Auto
    {Message telling the player they obtained the schematics.}
    Message Property StarbornContainerConfirmBuildMsg Mandatory Const Auto
    {Message box confirming ingredient use for building the container.}
    Message Property StarbornContainerConfirmUpgradeMsg Mandatory Const Auto
    {Message box confirming Quantum Essence use for building the container.}
    Message Property StarbornContainerUpgradeMissingResourcesMsg Mandatory Const Auto
    {Message box that shows the player how much Quantum Essence they are missing for container upgrade.}
    Message Property StarbornContainerBuildMissingResourcesMsg Mandatory Const Auto
    {Message box that shows the player how many resources they are missing for building the container.}
    Message Property StarbornContainerUpgradedMsg Mandatory Const Auto
    {Message telling the player the upgraded capacity of the container.}
    Message Property StarbornContainerMaxCapacityMsg Mandatory Const Auto
    {Message telling the player the container is at maximum capacity and cannot be upgraded.}
    Message Property StarbornContainerTutorialMsg Mandatory Const Auto
    {Message box tutorial when the player activates the container for the first time.}
    Quest Property MQ305 Mandatory Const Auto
    {One Giant Leap quest, used to start this quest when player builds Armillary for the first time.}
    Perk Property Perk_StarbornContainer Mandatory Const Auto
    {Perk that allows the player to upgrade the container via activation.}
EndGroup

Group ActorValues
    ActorValue Property QuantumEssenceAV Mandatory Auto Const
    {Used for building and upgrading the container.}
    ActorValue Property CarryWeightAV Mandatory Auto Const
    {Used for changing the container's capacity}
    ActorValue Property PlayerStarbornContainerAV Mandatory Const Auto
    {Multipurpose AV. Used for storing the container's capacity in StarbornSaveActorValues. Also used to check If the player has built the container.}
EndGroup

Group QuestStages
    int Property MQ305ArmillaryCompleteStage Mandatory Const Auto
    {MQ305 stage when the player builds the Armillary for the first time.}
    int Property ReadSlateStage Mandatory Const Auto
    {SQ stage for starting this quest.}
    int Property BuildContainerStage Mandatory Const Auto
    {SQ stage to enable the build container trigger volume.}
    int Property QuestCompletedStage Mandatory Const Auto
    {SQ stage for completing this quest when the container is built.}
    int Property ContainerBuiltStage Mandatory Const Auto
    {SQ stage set when player loads a new universe and has already built the container.}
EndGroup

;Local variables
int ingredientData0 = 0 Const ;needed for Show() args
int ingredientData1 = 1 Const
int ingredientData2 = 2 Const
bool showTutorial = false
int AchievementID_QuantumHoarder = 82 Const


Event OnStageSet(int auiStageID, int auiItemID)
    If auiStageID == BuildContainerStage
        StarbornContainerSlateMsg.Show()
        StarbornContainerTrigger.GetRef().EnableNoWait()
        RegisterForRemoteEvent(StarbornContainerTrigger, "OnActivate")
    EndIf
EndEvent

Event Quest.OnStageSet(Quest akSource, int auiStageID, int auiItemID)
    If akSource == MQ305 && auiStageID == MQ305ArmillaryCompleteStage
        PrepareSlate()
    EndIf
EndEvent

Event ReferenceAlias.OnActivate(ReferenceAlias akSender, ObjectReference akActionRef)
    If akActionRef == Game.GetPlayer()
        If akSender == StarbornContainerTrigger
            TryToBuildStarbornContainer()
        EndIf

        If akSender == StarbornContainer && showTutorial
            StarbornContainerTutorialMsg.Show(StarbornContainerUpgradeCostGV.GetValue(), StarbornContainerUpgradeCapacityGV.GetValue(), StarbornContainerMaxCapacityGV.GetValue())
            showTutorial = false
        EndIf
    EndIf
EndEvent

Function TryToStartQuest() ;called in "run on start" stage on quest
    Actor PlayerRef = Game.GetPlayer()

    If PlayerRef.GetValue(PlayerStarbornContainerAV) != 0 ;has the player already built the container
        StarbornContainerSlate.GetRef().DisableNoWait()
        LodgeLamp.GetRef().DisableNoWait()
        StarbornContainer.GetRef().SetValue(CarryWeightAV, PlayerRef.GetValue(PlayerStarbornContainerAV))
        SetStage(ContainerBuiltStage)
        showTutorial = false
        If StarbornContainer.GetRef().GetItemCount() > 0
            Game.AddAchievement(AchievementID_QuantumHoarder)
        EndIf
    Else
        StarbornContainer.GetRef().DisableNoWait()
        StarbornContainerSoundMarker01.GetRef().DisableNoWait()
        showTutorial = true
        If MQ305.GetStageDone(MQ305ArmillaryCompleteStage)
            PrepareSlate()
        Else
            RegisterForRemoteEvent(MQ305, "OnStageSet")
        EndIf
    EndIf
EndFunction

Function PrepareSlate()
    StarbornContainerSlate.GetRef().EnableNoWait(true)
    self.SetStage(ReadSlateStage)
EndFunction

Function TryToBuildStarbornContainer()
    Actor PlayerRef = Game.GetPlayer()

    If HasStarbornContainerIngredients()
        int iButton = StarbornContainerConfirmBuildMsg.Show(PlayerRef.GetValue(QuantumEssenceAV), StarbornContainerBuildCostEssenceGV.GetValue(), PlayerRef.GetItemCount(IngredientData[ingredientData0].ContainerIngredient), PlayerRef.GetItemCount(IngredientData[ingredientData1].ContainerIngredient), PlayerRef.GetItemCount(IngredientData[ingredientData2].ContainerIngredient))
        If iButton == 0
            BuildStarbornContainer()
        EndIf
    Else
        StarbornContainerBuildMissingResourcesMsg.Show(PlayerRef.GetValue(QuantumEssenceAV), StarbornContainerBuildCostEssenceGV.GetValue(), PlayerRef.GetItemCount(IngredientData[ingredientData0].ContainerIngredient), PlayerRef.GetItemCount(IngredientData[ingredientData1].ContainerIngredient), PlayerRef.GetItemCount(IngredientData[ingredientData2].ContainerIngredient))

    EndIf
EndFunction

Function BuildStarbornContainer()
    Actor PlayerRef = Game.GetPlayer()

    RemoveIngredients()

    StarbornContainer.GetRef().SetValue(CarryWeightAV, StarbornContainerBuildStartingCapacityGV.GetValueInt())
    PlayerRef.SetValue(PlayerStarbornContainerAV, StarbornContainerBuildStartingCapacityGV.GetValue())

    StarbornContainerTrigger.GetRef().DisableNoWait()

    RegisterForRemoteEvent(StarbornContainer, "OnActivate")

    PlayerRef.AddPerk(Perk_StarbornContainer, false)

    LodgeLamp.GetRef().DisableNoWait()
    StarbornContainer.GetRef().EnableNoWait()
    StarbornContainerSoundMarker01.GetRef().EnableNoWait()
    int instance = WwiseEvent_SFBGS00D_StarbornContainer_Build.Play(PlayerRef)

    SetStage(QuestCompletedStage)
EndFunction

Function RemoveIngredients()
    Actor PlayerRef = Game.GetPlayer()

    PlayerRef.SetValue(QuantumEssenceAV, (PlayerRef.GetValue(QuantumEssenceAV) - StarbornContainerBuildCostEssenceGV.GetValue()))

    int ingredientIndex = 0
    While ingredientIndex < IngredientData.Length
        PlayerRef.RemoveItem(IngredientData[ingredientIndex].ContainerIngredient, IngredientData[ingredientIndex].RequiredAmount)
        ingredientIndex += 1
    EndWhile
EndFunction

Function TryToUpgradeStarbornContainer()
    Actor PlayerRef = Game.GetPlayer()

    If PlayerRef.GetValue(QuantumEssenceAV) < StarbornContainerUpgradeCostGV.GetValue()
        StarbornContainerUpgradeMissingResourcesMsg.Show(PlayerRef.GetValue(QuantumEssenceAV), StarbornContainerUpgradeCostGV.GetValue())
    Else
        int iButton = StarbornContainerConfirmUpgradeMsg.Show(StarbornContainerUpgradeCostGV.GetValue(), StarbornContainerUpgradeCapacityGV.GetValue(), PlayerRef.GetValue(QuantumEssenceAV), StarbornContainerUpgradeCostGV.GetValue(), StarbornContainer.GetRef().GetValue(CarryWeightAV))
        If iButton == 0
            UpgradeStarbornContainer()
        EndIf
    EndIf
EndFunction

Function UpgradeStarbornContainer()
    Actor PlayerRef = Game.GetPlayer()
    
    int starbornContainerIncreasedCapacity = StarbornContainer.GetRef().GetValueInt(CarryWeightAV) + StarbornContainerUpgradeCapacityGV.GetValueInt()
    
    If starbornContainerIncreasedCapacity > StarbornContainerMaxCapacityGV.GetValueInt()
        StarbornContainerMaxCapacityMsg.Show(StarbornContainerMaxCapacityGV.GetValue())
    Else
        PlayerRef.SetValue(QuantumEssenceAV, (PlayerRef.GetValue(QuantumEssenceAV) - StarbornContainerUpgradeCostGV.GetValue())) 
        StarbornContainer.GetRef().SetValue(CarryWeightAV, starbornContainerIncreasedCapacity)
        PlayerRef.SetValue(PlayerStarbornContainerAV, starbornContainerIncreasedCapacity)

        WwiseEvent_SFBGS00D_StarbornContainer_Upgrade.Play(StarbornContainer.GetRef())

        StarbornContainerUpgradedMsg.Show(StarbornContainer.GetRef().GetValue(CarryWeightAV))

        If StarbornContainer.GetRef().GetValueInt(CarryWeightAV) >= StarbornContainerMaxCapacityGV.GetValueInt()
            StarbornContainerMaxCapacityMsg.Show(StarbornContainerMaxCapacityGV.GetValue())
        EndIf
    EndIf
EndFunction

bool Function HasStarbornContainerIngredients()
    Actor PlayerRef = Game.GetPlayer()
    
    If PlayerRef.GetValue(QuantumEssenceAV) < StarbornContainerBuildCostEssenceGV.GetValue()
        Return false
    EndIf
    
    int ingredientIndex = 0
    While ingredientIndex < IngredientData.Length
        If PlayerRef.GetItemCount(IngredientData[ingredientIndex].ContainerIngredient) < IngredientData[ingredientIndex].RequiredAmount
            Return false 
        EndIf
        ingredientIndex += 1
    EndWhile

    Return true
EndFunction