;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SQ_OutpostAttackSpecial_S_00349C9C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE SQ_OutpostAttackHumansScript
Quest __temp = self as Quest
SQ_OutpostAttackHumansScript kmyQuest = __temp as SQ_OutpostAttackHumansScript
;END AUTOCAST
;BEGIN CODE
kmyquest.StartAttack(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
