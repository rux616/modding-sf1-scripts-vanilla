;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Trait_RaisedEnlightenedBo_0000637D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;enable the lootboxes if player has the trait
if ( Game.GetPlayer().HasPerk(TRAIT_RaisedEnlightened))
  RaisedEnlightenedLootboxEnabler.Enable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
;DISABLE/LOCK THE LOOTBOXES AFTER THE PLAYER REMOVES THE TRAIT
RaisedEnlightenedLootboxEnabler.Disable()
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
STOP()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference[] Property EnlightenedLootboxes Auto Const

Perk Property TRAIT_RaisedEnlightened Auto Const Mandatory

ObjectReference Property RaisedEnlightenedLootboxEnabler Auto Const
