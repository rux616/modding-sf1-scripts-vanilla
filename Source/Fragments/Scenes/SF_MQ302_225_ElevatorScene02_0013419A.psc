;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ302_225_ElevatorScene02_0013419A Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN AUTOCAST TYPE LC165QuestScript
LC165QuestScript kmyQuest = GetOwningQuest() as LC165QuestScript
;END AUTOCAST
;BEGIN CODE
;Lock player movement for the elevator scene.
kMyQuest.SetPlayerControlsEnabled(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE LC165QuestScript
LC165QuestScript kmyQuest = GetOwningQuest() as LC165QuestScript
;END AUTOCAST
;BEGIN CODE
;Unlock player movement.
kMyQuest.SetPlayerControlsEnabled(True)
;PlayElevator02 has already disabled the moving
;elevator and swapped to the static version.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN AUTOCAST TYPE LC165QuestScript
LC165QuestScript kmyQuest = GetOwningQuest() as LC165QuestScript
;END AUTOCAST
;BEGIN CODE
Actor allyRef = kMyQuest.Ally.GetActorRef()
if (allyRef != None)
     allyRef.MoveToPackageLocation()
EndIf

Actor companionRef = kMyQuest.Companion.GetActorRef()
if (companionRef != None)
     companionRef.MoveToPackageLocation()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_End
Function Fragment_Phase_03_End()
;BEGIN AUTOCAST TYPE LC165QuestScript
LC165QuestScript kmyQuest = GetOwningQuest() as LC165QuestScript
;END AUTOCAST
;BEGIN CODE
;Send the elevator down.
kMyQuest.PlayElevator02NoWait()

;Allow the shifting process to finish.
kMyQuest.SetStage(992)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
