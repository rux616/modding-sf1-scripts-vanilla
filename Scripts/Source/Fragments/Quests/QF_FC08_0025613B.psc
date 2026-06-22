;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FC08_0025613B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; Update the global variable to control Blake and Emma's packaging
FCQuests_MeetingRoomPackages.SetValue(1)

; Move Blake into position
Alias_Daniel.GetRef().MoveTo(FC03_DebriefScene_CarsonMarker)

; Move Emma into position
Alias_EmmaWilcox.GetRef().MoveTo(FC03_DebriefScene_BlakeMarker)

; Move the player into position
Alias_Player.GetRef().MoveTo(FC02_EmmaHannahSceneMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetActive()
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
; Start debrief scene
FC08_DebriefIntroScene.Start()

SetObjectiveCompleted(100)
SetObjectiveDisplayed(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
FC08_DebriefScene01.Start()

SetObjectiveCompleted(120)
SetObjectiveDisplayed(140)

FC08_DebriefSceneHellosBlocked.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
FC08_DebriefScene02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0135_Item_00
Function Fragment_Stage_0135_Item_00()
;BEGIN CODE
FC08_DebriefScene03.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0138_Item_00
Function Fragment_Stage_0138_Item_00()
;BEGIN CODE
; Move Alex
Alias_Alex.GetActorRef().MoveTo(FC03_Stage600_EmmaMarker)

SetStage(140)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
FC08_DebriefInterruptScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
Alias_PaxtonHull.GetRef().Enable()

SetObjectiveCompleted(140)
SetObjectiveDisplayed(180)

FC08_DebriefSceneHellosBlocked.SetValue(0)

SArcturus_PArcturusII_Surface.EnableSpaceTravel(FC08, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Update the global variable to control Blake and Emma's packaging
FCQuests_MeetingRoomPackages.SetValue(0)

; Start the space encounter quest
FC08_SpaceEnc01.Start()

SetObjectiveCompleted(180)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Set in script on FirstShips ref collection alias

;Enable mech factory map marker and add it to the map
Alias_MechFactoryMapMarker.GetRef().Enable()
Alias_MechFactoryMapMarker.GetRef().AddToMapScanned(True)

SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)

SArcturus_PArcturusII_Surface.EnableSpaceTravel(FC08, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(400)

;Enable marker for the First in the exterior is enabled
Alias_HideoutEnableMarker.GetRef().Enable()

Utility.Wait(5)
SetObjectiveDisplayed(200, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(400)
SetObjectiveDisplayed(500)

SetStage(610)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
FC08_TauntScene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
Alias_MechFactoryExteriorMainDoor.GetRef().SetOpen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0620_Item_00
Function Fragment_Stage_0620_Item_00()
;BEGIN CODE
FC08_TauntScene02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0640_Item_00
Function Fragment_Stage_0640_Item_00()
;BEGIN CODE
FC08_TauntScene03.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0660_Item_00
Function Fragment_Stage_0660_Item_00()
;BEGIN CODE
FC08_TauntScene04.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)
SetObjectiveDisplayed(600)
SetObjectiveDisplayed(650)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0740_Item_00
Function Fragment_Stage_0740_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600)

if GetStageDone(750)
  SetStage(800)
endif

Actor PaxtonHull = Alias_PaxtonHull.GetActorRef()

PaxtonHull.SetNoBleedoutRecovery(true)
PaxtonHull.RemoveFromFaction(TheFirstFaction)
PaxtonHull.StopCombat()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
SetObjectiveCompleted(650)

if GetStageDone(740)
  SetStage(800)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(700)

Actor PaxtonHull = Alias_PaxtonHull.GetActorRef()

PaxtonHull.AllowBleedoutDialogue(true)
PaxtonHull.StopCombat()
;PaxtonHull.SheatheWeapon()
PaxtonHull.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0825_Item_00
Function Fragment_Stage_0825_Item_00()
;BEGIN CODE
Alias_PaxtonHull.GetActorRef().SetNoBleedoutRecovery(false)
Alias_PaxtonHull.GetActorRef().ResetHealthAndLimbs()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
;Add the proof slate to the player's inventory

Alias_Player.GetActorRef().AddItem(Alias_EvidenceSlate.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
SetObjectiveCompleted(700)
SetObjectiveDisplayed(800)

Actor PaxtonHull = Alias_PaxtonHull.GetActorRef()

PaxtonHull.SetNoBleedoutRecovery(false)
PaxtonHull.AllowBleedoutDialogue(false)
PaxtonHull.SetEssential(false)
PaxtonHull.AddToFaction(TheFirstFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
; set the quest completion actor value
Alias_Player.GetActorRef().SetValue(FC08_Completed, 1)

CompleteAllObjectives()
FC09.Start()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property FC08_SpaceEnc01 Auto Const Mandatory

Scene Property FC08_DebriefIntroScene Auto Const Mandatory

Scene Property FC08_DebriefScene01 Auto Const Mandatory

Scene Property FC08_DebriefScene02 Auto Const Mandatory

ReferenceAlias Property Alias_Daniel Auto Const Mandatory

ObjectReference Property FC03_DebriefScene_CarsonMarker Auto Const Mandatory

ObjectReference Property FC03_DebriefScene_BlakeMarker Auto Const Mandatory

ReferenceAlias Property Alias_EmmaWilcox Auto Const Mandatory

ReferenceAlias Property Alias_Player Auto Const Mandatory

ObjectReference Property FC02_EmmaHannahSceneMarker Auto Const Mandatory

Scene Property FC08_TauntScene01 Auto Const Mandatory

Scene Property FC08_TauntScene02 Auto Const Mandatory

Scene Property FC08_TauntScene03 Auto Const Mandatory

Scene Property FC08_TauntScene04 Auto Const Mandatory

ReferenceAlias Property Alias_MechFactoryMapMarker Auto Const Mandatory

ReferenceAlias Property Alias_PaxtonHull Auto Const Mandatory

ReferenceAlias Property Alias_EvidenceSlate Auto Const Mandatory

Faction Property TheFirstFaction Auto Const Mandatory

Scene Property FC08_DebriefScene03 Auto Const Mandatory

Scene Property FC08_DebriefInterruptScene Auto Const Mandatory

ObjectReference Property FC03_Stage600_EmmaMarker Auto Const Mandatory

ReferenceAlias Property Alias_Alex Auto Const Mandatory

ReferenceAlias Property Alias_MechFactoryExteriorMainDoor Auto Const Mandatory

Quest Property AutumnEliteCrewQuest Auto Const

Quest Property FC09 Auto Const Mandatory

Quest Property FC_EvidenceSlateHolderQuest Auto Const Mandatory

ActorValue Property FC08_Completed Auto Const Mandatory

GlobalVariable Property FCQuests_MeetingRoomPackages Auto Const Mandatory

ReferenceAlias Property Alias_HideoutEnableMarker Auto Const Mandatory

GlobalVariable Property FC08_DebriefSceneHellosBlocked Auto Const Mandatory

Location Property SArcturus_PArcturusII_Surface Auto Const Mandatory

Quest Property FC08 Auto Const Mandatory
