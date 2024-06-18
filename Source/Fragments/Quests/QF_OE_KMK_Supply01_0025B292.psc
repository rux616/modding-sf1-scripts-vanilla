;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_KMK_Supply01_0025B292 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Alias_NPC01.GetRef().SetValue(RQ_AV_Hello, 1) ; set generic hellos
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
; update globals used for dialogue
int baseAmount = OE_KMK_Supply01Amount.GetValueInt()
int halfAmount = baseAmount/2
int thirdAmount = baseAmount/3
OE_KMK_Supply01AmountHalf.SetValue(halfAmount)
OE_KMK_Supply01AmountThird.SetValue(thirdAmount)

UpdateCurrentInstanceGlobal(OE_KMK_Supply01AmountHalf)
UpdateCurrentInstanceGlobal(OE_KMK_Supply01AmountThird)

; rewards
int baseReward = OE_KMK_Supply01RewardActual.GetValueInt()
int halfReward = baseReward/2
int thirdReward = baseReward/3
OE_KMK_Supply01RewardHalf.SetValue(halfReward)
OE_KMK_Supply01RewardThird.SetValue(thirdReward)

UpdateCurrentInstanceGlobal(OE_KMK_Supply01RewardHalf)
UpdateCurrentInstanceGlobal(OE_KMK_Supply01RewardThird)
UpdateCurrentInstanceGlobal(OE_KMK_Supply01RewardActual)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE MissionSupplyScript
Quest __temp = self as Quest
MissionSupplyScript kmyQuest = __temp as MissionSupplyScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.UpdateSupplyAmount(OE_KMK_Supply01AmountHalf.GetValueInt())
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE MissionSupplyScript
Quest __temp = self as Quest
MissionSupplyScript kmyQuest = __temp as MissionSupplyScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.UpdateSupplyAmount(OE_KMK_Supply01AmountThird.GetValueInt())
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE MissionSupplyScript
Quest __temp = self as Quest
MissionSupplyScript kmyQuest = __temp as MissionSupplyScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10)
Alias_NPC01.GetRef().SetValue(RQ_AV_Hello, 2) ; set generic hellos
kmyQuest.MissionAccepted(true)
Alias_MapMarker.GetRef().SetMarkerVisibleOnStarMap(true) ; so player can return here
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
Alias_NPC01.GetRef().SetValue(RQ_AV_Hello, 3) ; set generic hellos
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_NPC_Group00 Auto Const Mandatory

ReferenceAlias Property Alias_NPC01 Auto Const Mandatory

ActorValue Property RQ_AV_Hello Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory

GlobalVariable Property OE_KMK_Supply01Amount Auto Const Mandatory

GlobalVariable Property OE_KMK_Supply01AmountHalf Auto Const Mandatory

GlobalVariable Property OE_KMK_Supply01AmountThird Auto Const Mandatory

GlobalVariable Property OE_KMK_Supply01RewardHalf Auto Const Mandatory

GlobalVariable Property OE_KMK_Supply01RewardThird Auto Const Mandatory

GlobalVariable Property OE_KMK_Supply01RewardActual Auto Const Mandatory
