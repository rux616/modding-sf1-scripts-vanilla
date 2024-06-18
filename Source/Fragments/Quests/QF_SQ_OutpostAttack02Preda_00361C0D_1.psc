;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SQ_OutpostAttack02Preda_00361C0D_1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE SQ_OutpostAttackScript
Quest __temp = self as Quest
SQ_OutpostAttackScript kmyQuest = __temp as SQ_OutpostAttackScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartAttack()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
