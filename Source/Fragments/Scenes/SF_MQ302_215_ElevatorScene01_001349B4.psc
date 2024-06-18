;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ302_215_ElevatorScene01_001349B4 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE LC165QuestScript
LC165QuestScript kmyQuest = GetOwningQuest() as LC165QuestScript
;END AUTOCAST
;BEGIN CODE
;Unlock player movement.
kMyQuest.SetPlayerControlsEnabled(True)
;Disable the first elevator.
kMyQuest.DisableElevator01()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN AUTOCAST TYPE LC165QuestScript
LC165QuestScript kmyQuest = GetOwningQuest() as LC165QuestScript
;END AUTOCAST
;BEGIN CODE
;Lock player movement for the elevator scene.
;(Movement is unlocked OnSceneEnd.)
kMyQuest.SetPlayerControlsEnabled(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_End
Function Fragment_Phase_03_End()
;BEGIN AUTOCAST TYPE LC165QuestScript
LC165QuestScript kmyQuest = GetOwningQuest() as LC165QuestScript
;END AUTOCAST
;BEGIN CODE
;Set up the elevators.
kMyQuest.SetupElevators()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_06_End
Function Fragment_Phase_06_End()
;BEGIN AUTOCAST TYPE LC165QuestScript
LC165QuestScript kmyQuest = GetOwningQuest() as LC165QuestScript
;END AUTOCAST
;BEGIN CODE
;Start the elevator animation.
kMyQuest.PlayElevator01NoWait()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
