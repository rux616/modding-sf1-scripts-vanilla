;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DNMQ101_0002465E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;make sure all miners and pirates are set to be suspicious so they don't play the wrong detection lines
Alias_VecteraExteriorMiners.SetValue(Suspicious, 2)
Alias_PirateRefCollection.SetValue(Suspicious, 2)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_VecteraExteriorMiners Auto Const Mandatory

ActorValue Property Suspicious Auto Const Mandatory

RefCollectionAlias Property Alias_PirateRefCollection Auto Const Mandatory
