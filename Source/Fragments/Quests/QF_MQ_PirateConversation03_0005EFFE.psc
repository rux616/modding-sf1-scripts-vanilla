;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ_PirateConversation03_0005EFFE Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
MQ_PirateConversation03Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;Alias_MQ_PirateScene03A.GetActorRef().SetValue(Aggression, 2)
;Alias_MQ_PirateScene03B.GetActorRef().SetValue(Aggression, 2)
Utility.Wait(1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property MQ_PirateConversation03Scene Auto Const Mandatory

ReferenceAlias Property Alias_MQ_PirateScene03A Auto Const Mandatory

ReferenceAlias Property Alias_MQ_PirateScene03B Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory
