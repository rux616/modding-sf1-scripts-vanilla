;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DialogueCydonia_Mitch_Top_0023E970 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_06_End
Function Fragment_Phase_06_End()
;BEGIN CODE
;We start the quest here instead of a stage, because the quest is repeatable.
;The Top Level dialogue is conditioned to not display if the player is already on the quest, 
;so we can't get multiple instances of the quest running.
FFCydoniaR03QuestStartKeyword.SendStoryEventAndWait()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property FFCydoniaR03 Auto Const Mandatory

Keyword Property FFCydoniaR03QuestStartKeyword Auto Const Mandatory
