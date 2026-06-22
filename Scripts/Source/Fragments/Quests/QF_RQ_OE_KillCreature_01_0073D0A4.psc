;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RQ_OE_KillCreature_01_0073D0A4 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE RQScript
Quest __temp = self as Quest
RQScript kmyQuest = __temp as RQScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(100)
kmyquest.SetDialogueAV_PrimaryObjectiveKnown()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE RQScript
Quest __temp = self as Quest
RQScript kmyQuest = __temp as RQScript
;END AUTOCAST
;BEGIN CODE
if !IsObjectiveDisplayed(100)
    ; Player killed creature before learning about the quest; shutdown
    SetStage(990)
else
    SetObjectiveCompleted(100)
    SetObjectiveDisplayed(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0390_Item_00
Function Fragment_Stage_0390_Item_00()
;BEGIN AUTOCAST TYPE RQScript
Quest __temp = self as Quest
RQScript kmyQuest = __temp as RQScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(200)
kmyquest.SetDialogueAV_PrimaryObjectiveSuccess()
SetStage(990)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0999_Item_00
Function Fragment_Stage_0999_Item_00()
;BEGIN CODE
SetStage(990)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_CenterMarker Auto Const Mandatory

ReferenceAlias Property Alias_Victim Auto Const Mandatory

ReferenceAlias Property Alias_Item Auto Const Mandatory

RefCollectionAlias Property Alias_Passengers Auto Const Mandatory

RefCollectionAlias Property Alias_Actors Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShipPassengerMarker Auto Const Mandatory

ActorValue Property RQ_AV_PrimaryObjectiveFailed Auto Const Mandatory

ActorValue Property RQ_AV_PrimaryObjectiveKnown Auto Const Mandatory

Potion Property Aid_MedPack Auto Const
