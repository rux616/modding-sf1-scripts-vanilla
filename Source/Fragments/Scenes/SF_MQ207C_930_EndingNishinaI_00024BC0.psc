;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ207C_930_EndingNishinaI_00024BC0 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN AUTOCAST TYPE mq207cshiftingquestscript
mq207cshiftingquestscript kmyQuest = GetOwningQuest() as mq207cshiftingquestscript
;END AUTOCAST
;BEGIN CODE
kMyQuest.PlaySpecialEndingFadeIn()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
