;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS003:Fragments:Quests:QF_SFBGS003_ScannerBountyD_020026B1_1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_BountyTarget.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_BountyTarget.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
SetStage(240) ; Just in case
SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN CODE
Alias_BountyTarget.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
Alias_BountyTarget.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0475_Item_00
Function Fragment_Stage_0475_Item_00()
;BEGIN AUTOCAST TYPE SFBGS003_SQ_Bounty_QuestScript
Quest __temp = self as Quest
SFBGS003_SQ_Bounty_QuestScript kmyQuest = __temp as SFBGS003_SQ_Bounty_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.AttackPlayer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetStage(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetStage(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_01
Function Fragment_Stage_0850_Item_01()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_02
Function Fragment_Stage_0850_Item_02()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
CompleteAllObjectives()
SetStage(999)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0999_Item_00
Function Fragment_Stage_0999_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BountyAmount Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

ReferenceAlias Property Alias_BountyTarget Auto Const Mandatory
