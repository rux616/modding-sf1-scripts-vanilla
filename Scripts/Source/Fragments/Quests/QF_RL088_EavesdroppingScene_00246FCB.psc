;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RL088_EavesdroppingScene_00246FCB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE RL088Script
Quest __temp = self as Quest
RL088Script kmyQuest = __temp as RL088Script
;END AUTOCAST
;BEGIN CODE
;Start Initial Grav Change
kmyQuest.StartGravityCountdown(7,7)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
