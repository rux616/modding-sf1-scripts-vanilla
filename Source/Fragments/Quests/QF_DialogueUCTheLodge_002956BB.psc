;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueUCTheLodge_002956BB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
MQ_TutorialQuest_Misc05.SetStage(10)
MQ_TutorialQuest_Misc06.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
MQ_TutorialQuest_Misc02.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0042_Item_00
Function Fragment_Stage_0042_Item_00()
;BEGIN CODE
Alias_Vasco.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
FFLodge_MB.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Vasco Auto Const Mandatory

Quest Property FFLodge_MB Auto Const Mandatory

Quest Property MQ_TutorialQuest_Misc02 Auto Const Mandatory

Quest Property MQ_TutorialQuest_Misc05 Auto Const Mandatory

Quest Property MQ_TutorialQuest_Misc06 Auto Const Mandatory
