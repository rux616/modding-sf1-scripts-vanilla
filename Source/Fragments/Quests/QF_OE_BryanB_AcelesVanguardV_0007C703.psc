;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_BryanB_AcelesVanguardV_0007C703 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
If Alias_Object_Key.GetRef()
   SetStage(125)
Else 
   Alias_Container_Reward.GetRef().SetLockLevel(50)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
Alias_Homesteader_Leader.GetRef().AddItem(Alias_Object_Key.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
if GetStageDone(125)
   Game.GetPlayer().AddItem(Alias_Object_Key.GetRef())
Else 
   Game.GetPlayer().AddItem(LL_OE_AlternativeReward)
EndIf 

Alias_Container_Reward.GetRef().SetFactionOwner(None)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_5000_Item_00
Function Fragment_Stage_5000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9999_Item_00
Function Fragment_Stage_9999_Item_00()
;BEGIN AUTOCAST TYPE oescript
Quest __temp = self as Quest
oescript kmyQuest = __temp as oescript
;END AUTOCAST
;BEGIN CODE
;(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Predator_Spawn Auto Const Mandatory

RefCollectionAlias Property Alias_PredatorGroup_Spawn Auto Const Mandatory

ReferenceAlias Property Alias_Player Auto Const Mandatory

RefCollectionAlias Property Alias_HomesteaderSurvivors Auto Const Mandatory

ReferenceAlias Property Alias_Container_Reward Auto Const Mandatory

ReferenceAlias Property Alias_Marker_Center Auto Const Mandatory

ReferenceAlias Property Alias_Homesteader_Leader Auto Const Mandatory

ReferenceAlias Property Alias_Object_Key Auto Const Mandatory

LeveledItem Property LL_OE_AlternativeReward Auto Const Mandatory

Keyword Property OE_PackageCheck_Keyword Auto Const Mandatory
