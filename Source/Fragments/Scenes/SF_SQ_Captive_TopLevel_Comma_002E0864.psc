;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_SQ_Captive_TopLevel_Comma_002E0864 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN AUTOCAST TYPE SQ_CaptiveScript
SQ_CaptiveScript kmyQuest = GetOwningQuest() as SQ_CaptiveScript
;END AUTOCAST
;BEGIN CODE
kmyquest.CaptiveFollowerFollowSceneEnded()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
