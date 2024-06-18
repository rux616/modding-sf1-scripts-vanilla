;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS05Intro_00299E7A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
MQ101.SetStage(1800)
MQ102.CompleteQuest()
DialogueUCTheLodge.SetStage(20)
Game.GetPlayer().MoveTo(Alias_WalterStroud.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
MS05.Start()
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ101 Auto Const

Quest Property MQ102 Auto Const

Quest Property MQ105 Auto Const

ObjectReference Property MS05StartMarker Auto Const

ReferenceAlias Property Alias_WalterStroud Auto Const Mandatory

Quest Property DialogueUCTheLodge Auto Const Mandatory

Quest Property MS05 Auto Const Mandatory
