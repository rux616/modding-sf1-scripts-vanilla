Scriptname DefaultAttachModToAlias extends Quest default
{Attaches mods to the object of a Reference Alias that will be used for quest reward items.}

ObjectMod[] Property RewardMods Mandatory Const Auto
{Mods to attach to the reward item}

ReferenceAlias Property RewardAlias Mandatory Const Auto
{Reference Alias for the quest reward item}

ReferenceAlias Property RewardContainer Const Auto
{If the reward is in a container's inventory, what is that container}

Event OnQuestInit()
    AttachMods()
EndEvent

Function AttachMods()
    ObjectReference reward = RewardAlias.GetRef()
    Form rewardBase = reward.GetBaseObject()
    ObjectReference optionalContainer = RewardContainer.GetRef()
    int i = 0

    if optionalContainer != None
        while i < RewardMods.Length
            optionalContainer.AttachModToInventoryItem(rewardBase, RewardMods[i])
            i += 1
        EndWhile
    Else
        while i < RewardMods.Length
            Reward.AttachMod(RewardMods[i])
            i += 1
        EndWhile
    EndIf
EndFunction

