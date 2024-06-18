;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_TestLC051GuardSpeechChall_0027B16C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
Alias_NPC.GetActorRef().SetValue(aggression, 2)
Alias_NPC.GetActorRef().AddtoFaction(PlayerEnemyFaction)
Alias_NPC.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_NPC Auto Const Mandatory

ActorValue Property Aggression Auto Const

Faction Property PlayerEnemyFaction Auto Const
