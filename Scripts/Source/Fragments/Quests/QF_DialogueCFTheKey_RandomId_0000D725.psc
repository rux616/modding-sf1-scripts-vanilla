;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueCFTheKey_RandomId_0000D725 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
ObjectReference Pirate01 = Alias_Pirat01.GetRef()
ObjectReference Pirate02 = Alias_Pirat02.GetRef()

Pirate01.DisableNoWait()
Pirate02.DisableNoWait()
Pirate01.Delete()
Pirate02.Delete()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Pirat01 Auto Const Mandatory

ReferenceAlias Property Alias_Pirat02 Auto Const Mandatory
