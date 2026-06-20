;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Scenes:SF_SFFL_MS01_Quest_d3500_Ope_02026C66 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
if !GetOwningQuest().GetStageDone(2720) && !GetOwningQuest().GetStageDone(2730) && !GetOwningQuest().GetStageDone(2727)
    SFFL_MS01_Quest_d3500_OpeningStatement.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property SFFL_MS01_Quest_d3500_OpeningStatement Auto Const Mandatory
