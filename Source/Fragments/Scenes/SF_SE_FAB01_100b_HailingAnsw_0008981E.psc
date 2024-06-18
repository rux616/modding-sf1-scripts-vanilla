;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_SE_FAB01_100b_HailingAnsw_0008981E Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN AUTOCAST TYPE SE_FAB04_MathCount
SE_FAB04_MathCount kmyQuest = GetOwningQuest() as SE_FAB04_MathCount
;END AUTOCAST
;BEGIN CODE
kmyQuest.CountShipParts()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
