;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueWaggonerFarm_Intr_002CC108 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Set when the player enters the trigger volume

DialogueWaggonerFarm_IntroScene_Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
WaylonWaggoner.GetActorRef().EvaluatePackage()
MikaelaWaggoner.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DialogueWaggonerFarm_IntroScene_Scene Auto Const Mandatory

ReferenceAlias Property WaylonWaggoner Auto Const
ReferenceAlias Property MikaelaWaggoner Auto Const

