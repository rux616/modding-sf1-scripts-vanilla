;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SFBGS003_MiscPointer_02000CF2 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Actor myPlayer = Game.GetPlayer()
myPlayer.AddPerk(Trait_KidStuff)
myPlayer.AddPerk(Trait_StarterHome)
myPlayer.AddPerk(BackgroundBountyHunter)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Actor myInevitable = Alias_Inevitable.GetActorRef()
ObjectReference myMarker = Alias_InevitableTAHQExtMarker.GetRef()

myInevitable.MoveTo(myMarker)
Alias_InevitableFurnitureStand.GetRef().MoveTo(myMarker)

SetStage(99)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
If GetStageDone(301) || GetStageDone(400)
Else
	SetObjectiveDisplayed(100)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE SFBGS003MiscPointerQuestScript
Quest __temp = self as Quest
SFBGS003MiscPointerQuestScript kmyQuest = __temp as SFBGS003MiscPointerQuestScript
;END AUTOCAST
;BEGIN CODE
If IsObjectiveDisplayed(100)
	SetObjectiveCompleted(100)
EndIf
If !GetStageDone(301)
	SetObjectiveDisplayed(200)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Alias_Inevitable.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0301_Item_00
Function Fragment_Stage_0301_Item_00()
;BEGIN CODE
If !IsObjectiveCompleted(100)
	SetObjectiveDisplayed(100, False)
EndIf
If IsObjectiveCompleted(100)
	SetObjectiveCompleted(200)
EndIf
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(400)
Alias_Inevitable.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()
SFBGS003_SFTA00.Start()

;Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_InevitableTAHQExtMarker Auto Const Mandatory

ReferenceAlias Property Alias_Inevitable Auto Const Mandatory

ReferenceAlias Property Alias_InevitableFurnitureStand Auto Const Mandatory

Message Property SFBGS003_MiscPointer_TEMP_WantedPosterDisplayMSG Auto Const Mandatory

Quest Property SFBGS003_SFTA00 Auto Const Mandatory

Perk Property Trait_KidStuff Auto Const Mandatory

Perk Property TRAIT_StarterHome Auto Const Mandatory

Perk Property BackgroundBountyHunter Auto Const Mandatory
