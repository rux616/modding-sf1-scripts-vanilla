;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Scenes:SF_SFFL_MS01_Quest_e2940_Zen_02027653 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
Quest pQuest = GetOwningQuest()
if !pQuest.GetStageDone(2585) && pQuest.GetStageDone(2905) && pQuest.GetStageDone(2730) && pQuest.GetStageDone(2949) && pQuest.GetStageDone(2949)
    SFFL_MS01_Quest_e2920_ZenaVoteCarusoShot.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property SFFL_MS01_Quest_e2920_ZenaVoteCarusoShot Auto Const Mandatory
