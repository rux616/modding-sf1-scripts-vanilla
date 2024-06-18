;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFLodge03_00184510 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_Sam.GetActorReference().EvaluatePackage()
Alias_Matteo.GetActorReference().EvaluatePackage()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Matteo Auto Const Mandatory

ReferenceAlias Property Alias_Sam Auto Const Mandatory
