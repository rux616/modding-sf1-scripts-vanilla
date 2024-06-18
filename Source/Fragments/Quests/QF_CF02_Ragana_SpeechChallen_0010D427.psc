;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CF02_Ragana_SpeechChallen_0010D427 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Alias_NPC.ForceRefTo(Alias_Ragana.GetShipRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_NPC Auto Const Mandatory

ReferenceAlias Property Alias_Ragana Auto Const Mandatory
