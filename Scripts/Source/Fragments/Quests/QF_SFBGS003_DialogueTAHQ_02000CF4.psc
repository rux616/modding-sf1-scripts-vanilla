;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SFBGS003_DialogueTAHQ_02000CF4 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Actor myPlayer = Game.GetPlayer()
myPlayer.AddPerk(Trait_KidStuff)
myPlayer.AddPerk(Trait_StarterHome)
myPlayer.AddPerk(BackgroundBountyHunter)
myPlayer.MoveTo(Alias_AgentNo1.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
DialogueTAHQ_IntroScene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0051_Item_00
Function Fragment_Stage_0051_Item_00()
;BEGIN CODE
Alias_Roach.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;On the misc pointer quest, set the stage to accept the bounty.
SFBGS003_MiscPointer.SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0305_Item_00
Function Fragment_Stage_0305_Item_00()
;BEGIN CODE
Alias_Inevitable.GetActorRef().SetOverrideName(NONE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9999_Item_00
Function Fragment_Stage_9999_Item_00()
;BEGIN CODE
(SFBGS003_TrackersAllianceSupportQuest as SFBGS003TASupportQuestScript).SetPlayerTrackerName()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property SFBGS003_TrackersAllianceSupportQuest Auto Const Mandatory

Message[] Property PlayerTrackerNameData Auto Const Mandatory

Perk Property Trait_KidStuff Auto Const Mandatory

Perk Property BackgroundBountyHunter Auto Const Mandatory

Perk Property TRAIT_StarterHome Auto Const Mandatory

Scene Property DialogueTAHQ_IntroScene01 Auto Const Mandatory

Quest Property SFBGS003_MiscPointer Auto Const Mandatory

ReferenceAlias Property Alias_AgentNo1 Auto Const Mandatory

ReferenceAlias Property Alias_Roach Auto Const Mandatory

ReferenceAlias Property Alias_Inevitable Auto Const Mandatory
