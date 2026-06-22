;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_BryanB_TerrormorphVSSc_0007C704 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
; if we're on Kreet, flag the Kreet encounter as done
OE_KreetTerrormorphDone.SetValue(1)
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
;Alias_Homesteader_Leader.GetRef().AddItem(Alias_Object_Key.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
setstage(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;SetObjectiveCompleted(150)
;SetObjectiveDisplayed(400)
;SetObjectiveDisplayed(450)

SetStage(300)
SetStage(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
setstage(450)
setstage(460)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
If GetStageDone(400)
   SetStage(460)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0460_Item_00
Function Fragment_Stage_0460_Item_00()
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
;SetObjectiveCompleted(500)

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

ReferenceAlias Property Alias_Player Auto Const Mandatory

RefCollectionAlias Property Alias_HomesteaderSurvivors Auto Const Mandatory

ReferenceAlias Property Alias_Container_Reward Auto Const Mandatory

ReferenceAlias Property Alias_Marker_Center Auto Const Mandatory

ReferenceAlias Property Alias_Homesteader_Leader Auto Const Mandatory

ReferenceAlias Property Alias_Object_Key Auto Const Mandatory

LeveledItem Property LL_OE_AlternativeReward Auto Const Mandatory

Keyword Property OE_PackageCheck_Keyword Auto Const Mandatory

GlobalVariable Property OE_KreetTerrormorphDone Auto Const Mandatory

ReferenceAlias Property Alias_Trigger Auto Const Mandatory

LocationAlias Property Alias_OE_Location Auto Const Mandatory
