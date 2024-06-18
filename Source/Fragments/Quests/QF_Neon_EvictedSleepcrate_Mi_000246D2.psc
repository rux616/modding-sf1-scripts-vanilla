;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Neon_EvictedSleepcrate_Mi_000246D2 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;take money, show objective, and mod global
;Alias_Door1.GetRef().Unlock()
Game.GetPlayer().AddItem(Neon_EvictedSleepcrate_Key01)
pNeon_EvictedSleepcrate_Global.Mod(1)
Game.GetPlayer().RemoveItem(Credits, NPCDemandMoney_Small.GetValueInt())
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)

;check if player has gone to other sleepcrates. If so, stop the quest.

if (GetStageDone(40) == 1 && GetStageDone(60) == 1 && GetStageDone(80) == 1)
  SetStage(1000)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;take money, show objective, and mod global
;Alias_Door2.GetRef().Unlock()
Game.GetPlayer().AddItem(Neon_EvictedSleepcrate_Key02)
pNeon_EvictedSleepcrate_Global.Mod(1)
Game.GetPlayer().RemoveItem(Credits, NPCDemandMoney_Small.GetValueInt())
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
setobjectivecompleted(30)

if (GetStageDone(20) == 1 && GetStageDone(60) == 1 && GetStageDone(80) == 1)
  SetStage(1000)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;take money, show objective, and mod global
;Alias_Door3.GetRef().Unlock()
Game.GetPlayer().AddItem(Neon_EvictedSleepcrate_Key03)
pNeon_EvictedSleepcrate_Global.Mod(1)
Game.GetPlayer().RemoveItem(Credits, NPCDemandMoney_Small.GetValueInt())
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)

;check if player has gone to other sleepcrates. If so, stop the quest.

if (GetStageDone(20) == 1 && GetStageDone(40) == 1 && GetStageDone(80) == 1)
  SetStage(1000)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
;take money, show objective, and mod global
;Alias_Door4.GetRef().Unlock()
Game.GetPlayer().AddItem(Neon_EvictedSleepcrate_Key04)
pNeon_EvictedSleepcrate_Global.Mod(1)
Game.GetPlayer().RemoveItem(Credits, NPCDemandMoney_Small.GetValueInt())
SetObjectiveDisplayed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
SetObjectiveCompleted(70)

;check if player has gone to other sleepcrates. If so, stop the quest.

if (GetStageDone(20) == 1 && GetStageDone(40) == 1 && GetStageDone(60) == 1)
  SetStage(1000)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Door1 Auto Const Mandatory

ReferenceAlias Property Alias_Door2 Auto Const Mandatory

ReferenceAlias Property Alias_Door3 Auto Const Mandatory

ReferenceAlias Property Alias_Door4 Auto Const Mandatory

GlobalVariable Property pNeon_EvictedSleepcrate_Global Auto Const Mandatory

MiscObject Property Credits Auto Const

Key Property Neon_EvictedSleepcrate_Key01 Auto Const

Key Property Neon_EvictedSleepcrate_Key02 Auto Const

Key Property Neon_EvictedSleepcrate_Key03 Auto Const

Key Property Neon_EvictedSleepcrate_Key04 Auto Const

GlobalVariable Property NPCDemandMoney_Small Auto Const Mandatory
