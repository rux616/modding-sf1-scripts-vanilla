;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_COM_Barrett_Story_SG01_001C6E1C Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_22_End
Function Fragment_Phase_22_End()
;BEGIN AUTOCAST TYPE com_companionquestscript
com_companionquestscript kmyQuest = GetOwningQuest() as com_companionquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.StoryGateSceneCompleted()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment