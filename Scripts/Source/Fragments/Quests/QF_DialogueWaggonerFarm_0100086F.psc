;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueWaggonerFarm_0100086F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
actor Player = Game.GetPlayer()

Player.setvalue(pPlayerMetAV_MollyWaggoner, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
actor Player = Game.GetPlayer()

Player.setvalue(PlayerMetAV_WaylonWaggoner, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorValue Property pPlayerMetAV_MollyWaggoner Auto Const Mandatory

ActorValue Property PlayerMetAV_WaylonWaggoner Auto Const Mandatory
