;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ_PirateConversation01_0005434B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
MQ_PirateConversation01Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;Alias_MQ_PirateScene01A.GetActorRef().SetValue(Aggression, 2)
;Alias_MQ_PirateScene01B.GetActorRef().SetValue(Aggression, 2)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property MQ_PirateConversation01Scene Auto Const Mandatory

ReferenceAlias Property Alias_MQ_PirateScene01A Auto Const Mandatory

ReferenceAlias Property Alias_MQ_PirateScene01B Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory
