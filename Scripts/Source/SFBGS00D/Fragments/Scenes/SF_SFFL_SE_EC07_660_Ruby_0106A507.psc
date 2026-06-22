;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Scenes:SF_SFFL_SE_EC07_660_Ruby_0106A507 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_05_Begin
Function Fragment_Phase_05_Begin()
;BEGIN CODE
if (SFFL_SE_EC07.IsObjectiveDisplayed(700))
    SFFL_SE_EC07.SetObjectiveFailed(700)
elseif (SFFL_SE_EC07.IsObjectiveDisplayed(660))
    SFFL_SE_EC07.SetObjectiveFailed(660)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property SFFL_SE_EC07 Auto Const Mandatory
