;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DBTestPCMAI_Quest_0046C1B7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_NearbyPackin.GetRef().SetValue(DBTestPCMPackinVisitedAV, 1)
Alias_NearbyPackin.RefillAlias()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_NearbyPackin Auto Const Mandatory

ActorValue Property DBTestPCMPackinVisitedAV Auto Const Mandatory
