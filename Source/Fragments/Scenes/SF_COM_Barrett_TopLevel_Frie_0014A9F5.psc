;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_COM_Barrett_TopLevel_Frie_0014A9F5 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_05_Begin
Function Fragment_Phase_05_Begin()
;BEGIN AUTOCAST TYPE com_companionquestscript
com_companionquestscript kmyQuest = GetOwningQuest() as com_companionquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.MakeRomantic()
if GetOwningQuest().GetStageDone(1000)
    kmyquest.MakeCommitted()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property COM_AffinityLevel_3_Commitment Auto Const Mandatory

ReferenceAlias Property Alias_Barrett Auto Const Mandatory

ActorValue Property COM_StoryGatesCompleted Auto Const Mandatory
