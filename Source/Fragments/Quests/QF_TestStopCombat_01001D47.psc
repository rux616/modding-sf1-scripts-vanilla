;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_TestStopCombat_01001D47 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
alias_EclipticEnemy.GetActorRef().StopCombat()
alias_CitizenFriend.GetActorRef().StopCombat()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_EclipticEnemy Auto Const Mandatory

ReferenceAlias Property Alias_CitizenFriend Auto Const Mandatory
