;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_ER_Ghost_SupportQues_0014332E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_RobotEnableMarker.GetRef().Enable()
Alias_PirateEnableMarkers.DisableAll()

;Make sure this node never needs to be eval'ed again
StoryManager_EleosRetreatLoad.SetValue(1)

;Tag the dungeon location to not reset
Alias_DR007ListeningPostLocation.GetLocation().SetNeverResets()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_RobotEnableMarker Auto Const Mandatory

RefCollectionAlias Property Alias_PirateEnableMarkers Auto Const Mandatory

GlobalVariable Property StoryManager_EleosRetreatLoad Auto Const Mandatory

LocationAlias Property Alias_DR007ListeningPostLocation Auto Const Mandatory
