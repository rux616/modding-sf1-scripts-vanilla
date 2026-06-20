;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_AnchorpointZ03_0203D1DE Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

Alias_MilesCutler.GetRef().MoveTo(Alias_CaptiveMarker.GetRef())
Alias_MilesCutler.GetRef().Enable()
Alias_MilesCutler.GetActorRef().SetRestrained()
Alias_Cutty.GetActorRef().EvaluatePackage()

; Close out the misc objective to talk to Cutty
SFFL_DialogueAnchorpoint.SetStage(600)

SFFL_DialogueAnchorpoint.SetStage(850)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
Alias_MilesCutler.GetActorRef().EvaluatePackage()

SetObjectiveCompleted(10)
SetObjectiveDisplayed(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_MilesCutler.GetActorRef().SetRestrained(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(15)
SetObjectiveDisplayed(20)

Alias_MilesCutler.GetActorRef().EvaluatePackage()
Alias_CaptiveMarker.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SFFL_DialogueAnchorpoint.SetStage(1000)

CompleteALlObjectives()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_01
Function Fragment_Stage_1000_Item_01()
;BEGIN CODE
CompleteALlObjectives()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_MilesCutler Auto Const Mandatory

Quest Property SFFL_DialogueAnchorpoint Auto Const Mandatory

ReferenceAlias Property Alias_CaptiveMarker Auto Const Mandatory

ReferenceAlias Property Alias_Cutty Auto Const Mandatory
