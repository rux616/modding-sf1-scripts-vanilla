;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_BryanB_ProtectHomestea_000D6440 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; how many to enable?
int maxCount = Alias_predatorgroup_spawn.GetCount()
int maxToEnable = Utility.RandomInt(2, maxCount)

int i = 0
while i < maxToEnable
  ObjectReference predatorRef = Alias_predatorgroup_spawn.GetAt(i)
  Alias_predatorgroup_Targets.AddRef(predatorRef)
  predatorRef.Enable()
  i += 1
endwhile

; make aggressive
Alias_PredatorGroup_Targets.SetValue(Game.GetAggressionAV(), 1)
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

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
setstage(450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
If !GetStageDone(475)
   Alias_Homesteader_Leader.GetRef().AddKeyword(OE_PackageCheck_Keyword)
EndIf 

int index = 0
While index < Alias_HomesteaderSurvivors.GetCount()
   If Alias_HomesteaderSurvivors.GetAt(index)
      Alias_HomesteaderSurvivors.GetAt(index).AddKeyword(OE_PackageCheck_Keyword)
   EndIf 
   index += 1
EndWhile

Alias_Homesteader_Leader.GetRef().AddItem(Alias_Object_Key.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0465_Item_00
Function Fragment_Stage_0465_Item_00()
;BEGIN CODE
setstage(460)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0475_Item_00
Function Fragment_Stage_0475_Item_00()
;BEGIN CODE
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
If Alias_Object_Key
   Game.GetPlayer().AddItem(Alias_Object_Key.GetRef())
Else 
   Game.GetPlayer().AddItem(LL_OE_AlternativeReward)
EndIf 

Alias_Container_Reward.GetRef().SetFactionOwner(None)

SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(LL_OE_AlternativeReward)
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()
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

ReferenceAlias Property Alias_Marker_TravelA03 Auto Const Mandatory

RefCollectionAlias Property Alias_PredatorGroup_Targets Auto Const Mandatory
