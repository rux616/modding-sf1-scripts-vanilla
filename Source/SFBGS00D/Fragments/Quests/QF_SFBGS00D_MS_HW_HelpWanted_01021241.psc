;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFBGS00D_MS_HW_HelpWanted_01021241 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Alias_ShinarPlanetLocation.GetLocation().AddKeyword(SFFL_MS01_ShinarPlanetKeyword)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Alias_BarPatron.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SFBGS00D_MS01_HelpWanted_StartScene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SFBGS00D_MS01_HelpWanted.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property SFBGS00D_MS01_HelpWanted_StartScene01 Auto Const Mandatory

Quest Property SFBGS00D_MS01_HelpWanted Auto Const Mandatory

ReferenceAlias Property Alias_BarPatron Auto Const Mandatory

RefCollectionAlias Property Alias_NewBabylonResidents Auto Const Mandatory

RefCollectionAlias Property Alias_NewBabylonResidentsFinalList Auto Const Mandatory

LocationAlias Property Alias_ShinarPlanetLocation Auto Const Mandatory

Keyword Property SFFL_MS01_ShinarPlanetKeyword Auto Const Mandatory
