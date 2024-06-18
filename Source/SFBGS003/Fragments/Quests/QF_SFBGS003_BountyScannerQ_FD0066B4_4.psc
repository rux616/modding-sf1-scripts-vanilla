;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS003:Fragments:Quests:QF_SFBGS003_BountyScannerQ_FD0066B4_4 Extends Quest Hidden Const

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

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
SetStage(240)
SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
SetStage(240) ; Just in case
SetStage(600)
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

;BEGIN FRAGMENT Fragment_Stage_0425_Item_00
Function Fragment_Stage_0425_Item_00()
;BEGIN AUTOCAST TYPE sfbgs003_sq_bounty_questscript
Quest __temp = self as Quest
sfbgs003_sq_bounty_questscript kmyQuest = __temp as sfbgs003_sq_bounty_questscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.NPCFlees()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0475_Item_00
Function Fragment_Stage_0475_Item_00()
;BEGIN AUTOCAST TYPE sfbgs003_sq_bounty_questscript
Quest __temp = self as Quest
sfbgs003_sq_bounty_questscript kmyQuest = __temp as sfbgs003_sq_bounty_questscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.AttackPlayer()
Alias_BountyTarget.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN AUTOCAST TYPE sfbgs003_sq_bounty_questscript
Quest __temp = self as Quest
sfbgs003_sq_bounty_questscript kmyQuest = __temp as sfbgs003_sq_bounty_questscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.NPCSurrendered()
SetStage(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
If GetStageDone(30)
   SetStage(800)
Else 
   SetStage(900)
   SetObjectiveFailed(100)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN AUTOCAST TYPE sfbgs003_sq_bounty_questscript
Quest __temp = self as Quest
sfbgs003_sq_bounty_questscript kmyQuest = __temp as sfbgs003_sq_bounty_questscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.RewardBountyCredits()
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
