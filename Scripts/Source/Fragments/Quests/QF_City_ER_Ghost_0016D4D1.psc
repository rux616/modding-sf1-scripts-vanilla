;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_ER_Ghost_0016D4D1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
DialogueEleosRetreat.SetStage(25)
DialogueEleosRetreat.SetStage(40)
DialogueEleosRetreat.SetStage(50)
DialogueEleosRetreat_OpeningScene.Stop()
Game.GetPlayer().Moveto(Alias_DR007DebugMarker01.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
DialogueEleosRetreat.SetStage(25)
DialogueEleosRetreat.SetStage(40)
DialogueEleosRetreat.SetStage(50)
DialogueEleosRetreat_OpeningScene.Stop()
Game.GetPlayer().Moveto(Alias_DR007DebugMarker01.GetRef())
Game.GetPlayer().AddItem(Alias_Slate.GetRef())
SetStage(300)
Game.GetPlayer().Moveto(City_ER_Ghost_DebugMarker02)
Utility.Wait(1.0)
SetObjectiveCompleted(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(ER_Ghost_TrackerSlate, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)
SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
if !GetStageDone(300)
  SetObjectiveCompleted(100)
  SetObjectiveDisplayed(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE uc09questscript
Quest __temp = self as Quest
uc09questscript kmyQuest = __temp as uc09questscript
;END AUTOCAST
;BEGIN CODE
kmyquest.GetNPCsInPlace()

Alias_Petra.GetRef().MoveTo(ER_Ghost_Scene300_Marker_Petra)
Alias_Sloan.GetRef().MoveTo(ER_Ghost_Scene300_Marker_Petra)
Alias_Nevan.GetRef().MoveTo(ER_Ghost_Scene300_Marker_Petra)

SetObjectiveCompleted(100)
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0305_Item_00
Function Fragment_Stage_0305_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(305)
Game.GetPlayer().RemoveItem(Alias_Slate.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
City_ER_Exorcism.Start()
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property ER_DEBUG_Ghost_Enemies Auto Const Mandatory

ObjectReference Property DR007MapMarkerHeadingRef Auto Const Mandatory

ObjectReference Property City_ER_Ghost_DebugMarker02 Auto Const Mandatory

ReferenceAlias Property Alias_Slate Auto Const Mandatory

Quest Property City_ER_Exorcism Auto Const Mandatory

ReferenceAlias Property Alias_DR007DebugMarker01 Auto Const Mandatory

Book Property ER_Ghost_TrackerSlate Auto Const Mandatory

Quest Property DialogueEleosRetreat Auto Const Mandatory

Scene Property DialogueEleosRetreat_OpeningScene Auto Const Mandatory

ReferenceAlias Property Alias_Sloan Auto Const Mandatory

ReferenceAlias Property Alias_Nevan Auto Const Mandatory

ReferenceAlias Property Alias_Petra Auto Const Mandatory

ObjectReference Property ER_Ghost_Scene300_Marker_Petra Auto Const Mandatory
