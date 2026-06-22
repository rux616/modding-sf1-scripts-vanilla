;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueFCNeon_PlayerHome_00370965 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; Purchase the house.
PlayerHouseSystem.PurchaseHouse(FCNeon_SleepcrateHomeGlobal, FCNeon_SleepcratePlayerHomeKey)

SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
if GetStageDone(40)
    Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
; Purchase the house.
PlayerHouseSystem.PurchaseHouse(FCNeon_TradeTowerHomeGlobal, FCNeon_TradeTowerPlayerHomeKey)

SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
if GetStageDone(20)
    Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Key Property FCNeon_TradeTowerPlayerHomeKey Auto Const Mandatory

Key Property FCNeon_SleepcratePlayerHomeKey Auto Const Mandatory

SQ_PlayerHouseScript Property PlayerHouseSystem Auto Const Mandatory

GlobalVariable Property FCNeon_SleepcrateHomeGlobal Auto Const Mandatory

GlobalVariable Property FCNeon_TradeTowerHomeGlobal Auto Const Mandatory
