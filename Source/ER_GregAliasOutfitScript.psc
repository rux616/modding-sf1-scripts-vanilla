Scriptname ER_GregAliasOutfitScript extends ReferenceAlias

GlobalVariable Property ER_QuestlineComplete Mandatory Const Auto
{Used to check if the ER questline is completed}

Outfit Property Outfit_Clothes_Security_Guard_01_NoHelmet Mandatory Const Auto
{Outfit for Greg to wear post-questline}

Event OnLoad()
    if ER_QuestlineComplete.GetValue() >= 1.0
        GetActorRef().SetOutfit(Outfit_Clothes_Security_Guard_01_NoHelmet)
    endif
EndEvent