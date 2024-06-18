;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFNeonZ06_QuestIntroTimer_001CEDC2 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DialogueFCNeon_TimerScript
Quest __temp = self as Quest
DialogueFCNeon_TimerScript kmyQuest = __temp as DialogueFCNeon_TimerScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Wait24()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
pDialogueFCNeon.SetStage(294)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDialogueFCNeon Auto Const Mandatory
