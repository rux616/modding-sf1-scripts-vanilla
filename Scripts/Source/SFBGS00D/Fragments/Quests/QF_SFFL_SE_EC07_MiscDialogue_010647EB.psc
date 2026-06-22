;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_SE_EC07_MiscDialogue_010647EB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Alias_RubyKrause.GetActorRef().Enable(false)
Alias_HannahFrye.GetActorRef().Enable(false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_RubyKrause Auto Const Mandatory

ReferenceAlias Property Alias_HannahFrye Auto Const Mandatory
