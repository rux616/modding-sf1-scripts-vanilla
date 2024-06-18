;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_COM_Andreja_QuestEvent_Un_000EBC5A Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_14_End
Function Fragment_Phase_14_End()
;BEGIN AUTOCAST TYPE com_companionquestscript
com_companionquestscript kmyQuest = GetOwningQuest() as com_companionquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.TalkAboutQuestEventSceneEnded(COM_WantsToTalk_UnitedColonies)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorValue Property COM_WantsToTalk_UnitedColonies Auto Const Mandatory
