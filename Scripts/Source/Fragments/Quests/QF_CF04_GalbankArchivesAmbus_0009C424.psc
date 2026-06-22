;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CF04_GalbankArchivesAmbus_0009C424 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;On startup, reset the location and enemies to make sure they're
;appropriately leveled.
CityNewAtlantisGalBankArchivesLocation.Reset()
Alias_GalbankEclipticBoss.TryToReset()
Alias_GalbankEclipticActors.ResetAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE CF04GalbankArchivesAmbushQuestScript
Quest __temp = self as Quest
CF04GalbankArchivesAmbushQuestScript kmyQuest = __temp as CF04GalbankArchivesAmbushQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.OnGalbankArchivesTriggerEntered()
CF04.SetStage(350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
CF04.SetStage(370)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property CF04 Auto Const Mandatory

RefCollectionAlias Property Alias_GalbankEclipticActors Auto Const

ReferenceAlias Property Alias_GalbankEclipticBoss Auto Const Mandatory

Location Property CityNewAtlantisGalBankArchivesLocation Auto Const Mandatory
