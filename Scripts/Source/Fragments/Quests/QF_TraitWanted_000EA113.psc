;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_TraitWanted_000EA113 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, Trait_WantedPerkRemovalCost.GetValueInt())
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
Alias_Minister.GetRef().EnableNoWait()
Alias_MinisterGuard.GetRef().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Trait_Wanted_DataSlate02)
Alias_Minister.GetRef().DisableNoWait()
Alias_MinisterGuard.GetRef().DisableNoWait()
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Game.GetPlayer().RemovePerk(Trait_Wanted)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Perk Property TRAIT_Wanted Auto Const Mandatory

GlobalVariable Property Trait_WantedPerkRemovalCost Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

ReferenceAlias Property Alias_Minister Auto Const Mandatory

Book Property Trait_Wanted_DataSlate02 Auto Const Mandatory

ReferenceAlias Property Alias_MinisterGuard Auto Const Mandatory
