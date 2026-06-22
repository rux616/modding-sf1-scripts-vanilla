;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFNewHomesteadR04Misc_0014629A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE FFNewHomesteadR04MiscQuestScript
Quest __temp = self as Quest
FFNewHomesteadR04MiscQuestScript kmyQuest = __temp as FFNewHomesteadR04MiscQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.RegisterIce()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Turbine01 Auto Const Mandatory

ReferenceAlias Property Alias_Turbine02 Auto Const Mandatory

ReferenceAlias Property Alias_IceMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_IceMarker02 Auto Const Mandatory

ReferenceAlias Property Alias_IceMarker03 Auto Const Mandatory

ReferenceAlias Property Alias_IceMarker04 Auto Const Mandatory

ReferenceAlias Property Alias_IceMarker05 Auto Const Mandatory

ReferenceAlias[] Property QuestTurbines Auto Const

RefCollectionAlias Property Alias_AllTurbines Auto Const Mandatory

ReferenceAlias Property Alias_Turbine03 Auto Const Mandatory
