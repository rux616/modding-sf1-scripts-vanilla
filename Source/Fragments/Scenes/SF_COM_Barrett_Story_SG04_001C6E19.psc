;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_COM_Barrett_Story_SG04_001C6E19 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_20_End
Function Fragment_Phase_20_End()
;BEGIN AUTOCAST TYPE com_companionquestscript
com_companionquestscript kmyQuest = GetOwningQuest() as com_companionquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.StoryGateSceneCompleted()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
