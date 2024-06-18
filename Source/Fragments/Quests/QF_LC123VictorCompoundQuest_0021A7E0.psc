;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_LC123VictorCompoundQuest_0021A7E0 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
If GetStageDone(5) == 1
LC123VictorCompoundQuest_CoraCommentScene1.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
If GetStageDone(5) == 1
LC123VictorCompoundQuest_CoraCommentScene4.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
If GetStageDone(5) == 1
LC123VictorCompoundQuest_CoraCommentScene2.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
If GetStageDone(5) == 1
LC123VictorCompoundQuest_CoraCommentScene3.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property LC123CoraMessage1 Auto Const

Message Property LC123CoraMessage2 Auto Const

Scene Property LC123VictorCompoundQuest_CoraCommentScene1 Auto Const

Scene Property LC123VictorCompoundQuest_CoraCommentScene2 Auto Const

Scene Property LC123VictorCompoundQuest_CoraCommentScene3 Auto Const

Scene Property LC123VictorCompoundQuest_CoraCommentScene4 Auto Const
