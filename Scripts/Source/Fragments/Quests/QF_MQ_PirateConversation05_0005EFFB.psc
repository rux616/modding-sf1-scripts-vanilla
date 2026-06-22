;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ_PirateConversation05_0005EFFB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
MQ_PirateConversation05Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property MQ_PirateConversation05Scene Auto Const Mandatory

ReferenceAlias Property Alias_MQ_PirateScene05A Auto Const Mandatory

ReferenceAlias Property Alias_MQ_PirateScene05B Auto Const Mandatory

ReferenceAlias Property Alias_MQ_PirateScene05C Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory
