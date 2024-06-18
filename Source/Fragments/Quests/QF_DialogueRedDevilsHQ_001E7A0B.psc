;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueRedDevilsHQ_001E7A0B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(UC03_RedDevilsHQKey, abSilent=true)
ObjectReference MMRef = Alias_HQMapMarker.GetRef()
MMRef.Enable()
MMREf.SetMarkerVisibleOnStarMap(true)


;Get Jakob in the right place and sandboxing
UC04_JakobSandboxing_PostUC03.SetValue(1)
Alias_Jakob.GetRef().MoveTo(UC07_JakobTeleportMarker)

;Get Kaiser in the right place and sandboxing
UC09_KaiserSandboxing_PostUC08.SetValue(1)
Actor KaiACT = Alias_Kaiser.GetActorRef()
KaiACT.MoveTo(UC09_KaiserTeleportMarker)
KaiACT.Enable()

;Get Hadrian in the right place and sandboxing
UC05_HadrianSandboxing_PostUC05.SetValue(1)
Actor HadACT = Alias_Hadrian.GetActorRef()
HadACT.MoveTo(UC07_JakobTeleportMarker)
HadACT.Enable()

UC08.SetStage(150)
Utility.Wait(1.0)
UC08.SetStage(1000)
UC09.Start()
Utility.Wait(1.0)
UC09.SetStage(500)
SetStage(7)
SetStage(10)
SetStage(20)
SetStage(30)
SetStage(35)
DialogueUCNewAtlantisUCFaction.SetStage(550)
DialogueUCNewAtlantisUCFaction.SetStage(600)
DialogueUCNewAtlantisUCFaction.SetObjectiveDisplayed(550, false, false)

;Allow random conversations in the space
UC_RHQ_RCAllowed.SetValue(1)

if !UCR04.IsRunning()
  Game.GetPlayer().MoveTo(UCR04_DebugMarker)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
UC07.SetStage(1)

;Allow random conversations in the space
UC_RHQ_RCAllowed.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
UC07.SetStage(9)
UC07.SetStage(1000)
UC08.SetStage(150)

;Allow random conversations in the space
UC_RHQ_RCAllowed.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
SetStage(12)
SetStage(32)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(UC03_RedDevilsHQKey, abSilent=true)
ObjectReference MMRef = Alias_HQMapMarker.GetRef()
MMRef.Enable()
MMREf.SetMarkerVisibleOnStarMap(true)

;Get Jakob in the right place and sandboxing
UC04_JakobSandboxing_PostUC03.SetValue(1)
Alias_Jakob.GetRef().MoveTo(UC07_JakobTeleportMarker)

;Get Kaiser in the right place and sandboxing
UC09_KaiserSandboxing_PostUC08.SetValue(1)
Actor KaiACT = Alias_Kaiser.GetActorRef()
KaiACT.MoveTo(UC09_KaiserTeleportMarker)
KaiACT.Enable()

;Get Hadrian in the right place and sandboxing
UC05_HadrianSandboxing_PostUC05.SetValue(1)
Actor HadACT = Alias_Hadrian.GetActorRef()
HadACT.MoveTo(UC07_JakobTeleportMarker)
HadACT.Enable()

UC08.SetStage(150)
Utility.Wait(1.0)
UC08.SetStage(1000)
UC09.Start()
Utility.Wait(1.0)
UC09.SetStage(500)
SetStage(7)
SetStage(10)
SetStage(20)
SetStage(30)
SetStage(35)
SetStage(500)
DialogueUCNewAtlantisUCFaction.SetStage(550)
DialogueUCNewAtlantisUCFaction.SetStage(600)
DialogueUCNewAtlantisUCFaction.SetObjectiveDisplayed(550, false, false)

if !UCR04.IsRunning()
  Game.GetPlayer().MoveTo(RHQ_ExtDebugMarker)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
(Alias_RHQ_FloorMarker_Ext.GetRef() as LoadElevatorFloorScript).SetAccessible(true)
(Alias_RHQ_FloorMarker_Int.GetRef() as LoadElevatorFloorScript).SetAccessible(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_ExteriorGuard.GetRef().Enable()
Alias_ShipServices.GetRef().Enable()
Alias_RHQEnableMarker_General_Stage01_PostUC06.GetRef().Enable()
Alias_RHQEnableMarker_General_Stage01_PostUC06_Objects.GetRef().Disable()
Alias_RHQEnableMarker_General_Stage01_PostUC06_DeepMines.GetRef().Disable()
Alias_RHQEnableMarker_General_Stage01_PostUC06_Freight.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
Alias_RHQEnableMarker_FCObservers_Stage01_PostUC06.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_RHQEnableMarker_General_Stage02_LateUC07.GetRef().Enable()
Alias_RHQEnableMarker_Aliens_Stage02_LateUC07.GetRef().Enable()
Alias_ExteriorMarine.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
Alias_RHQEnableMarker_General_Stage03_PostUC09.GetRef().Enable()
Alias_RHQEnableMarker_Aliens_Stage03_PostUC09.GetRef().Enable()
Alias_RHQEnableMarker_FreightElevator_Stage03_PostUC09.GetRef().Enable()
Alias_RHQEnableMarker_Mine_Stage03_PostUC09.GetRef().Enable()
SetStage(35)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0032_Item_00
Function Fragment_Stage_0032_Item_00()
;BEGIN CODE
Alias_RHQEnableMarker_FCObservers_Stage03_PostUC09.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
Alias_LandingCellNameOverride.ForceLocationTo(Alias_LC028FreightElevatorLoc.GetLocation())
Alias_InteriorCellNameOverride.ForceLocationTo(Alias_POI064RedDevilsHQ.GetLocation())
(Alias_RHQElevatorManager.GetRef() as LoadElevatorManagerScript).SetFirstFloorName(UC_RHQ_TMDNameOverride)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
UCR04_MiscPointer.Start()
CREW_EliteCrew_Hadrian.SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Also turn off the misc pointer here if the player hasn't already
DialogueUCNewAtlantisUCFaction.SetStage(650)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
UCR04.SetStage(350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0401_Item_00
Function Fragment_Stage_0401_Item_00()
;BEGIN CODE
SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;Turn off random conversations until the intro scene is done
UC_RHQ_RCAllowed.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0505_Item_00
Function Fragment_Stage_0505_Item_00()
;BEGIN CODE
DialogueRedDevilsHQ_000_Hadrian_IntroScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN AUTOCAST TYPE RHQ_QuestScript
Quest __temp = self as Quest
RHQ_QuestScript kmyQuest = __temp as RHQ_QuestScript
;END AUTOCAST
;BEGIN CODE
;Intro scene complete. Get random conversations back on
UC_RHQ_RCAllowed.SetValue(1)

;Stagger getting everyone back to their positions
kmyquest.StaggerEVP(Alias_IntroSceneNPCs)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
;If UC08's going and we haven't skipped ahead of it, close out Gualter's obj
if UC08.IsRunning() && !UC08.GetStageDone(165) && !UC08.GetStageDone(1000)
  UC08.SetStage(151)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property UCR04 Auto Const Mandatory

GlobalVariable Property UC04_JakobSandboxing_PostUC03 Auto Const Mandatory

ReferenceAlias Property Alias_Jakob Auto Const Mandatory

ObjectReference Property UC07_JakobTeleportMarker Auto Const Mandatory

GlobalVariable Property UC09_KaiserSandboxing_PostUC08 Auto Const Mandatory

ReferenceAlias Property Alias_Kaiser Auto Const Mandatory

ObjectReference Property UCR04_DebugMarker Auto Const Mandatory

Quest Property UC09 Auto Const Mandatory

ObjectReference Property UC09_KaiserTeleportMarker Auto Const Mandatory

Quest Property DialogueUCNewAtlantisUCFaction Auto Const Mandatory

Scene Property DialogueRedDevilsHQ_000_Hadrian_IntroScene Auto Const Mandatory

ReferenceAlias Property Alias_RHQEnableMarker_General_Stage01_PostUC06 Auto Const Mandatory

ReferenceAlias Property Alias_ExteriorGuard Auto Const Mandatory

ReferenceAlias Property Alias_RHQEnableMarker_FCObservers_Stage01_PostUC06 Auto Const Mandatory

ReferenceAlias Property Alias_RHQEnableMarker_General_Stage02_LateUC07 Auto Const Mandatory

ReferenceAlias Property Alias_RHQEnableMarker_General_Stage03_PostUC09 Auto Const Mandatory

ReferenceAlias Property Alias_RHQEnableMarker_FCObservers_Stage03_PostUC09 Auto Const Mandatory

ReferenceAlias Property Alias_RHQEnableMarker_Aliens_Stage02_LateUC07 Auto Const Mandatory

ReferenceAlias Property Alias_RHQEnableMarker_Aliens_Stage03_PostUC09 Auto Const Mandatory

ReferenceAlias Property Alias_Hadrian Auto Const Mandatory

GlobalVariable Property UC05_HadrianSandboxing_PostUC05 Auto Const Mandatory

Quest Property UC09_PostQuestline_HadrianScene Auto Const Mandatory

Key Property UC03_RedDevilsHQKey Auto Const Mandatory

Quest Property UC07 Auto Const Mandatory

Quest Property UC08 Auto Const Mandatory

GlobalVariable Property UC_RHQ_RCAllowed Auto Const Mandatory

Quest Property CREW_EliteCrew_Hadrian Auto Const Mandatory

Quest Property UCR04_MiscPointer Auto Const Mandatory

ReferenceAlias Property Alias_ExteriorMarine Auto Const Mandatory

ReferenceAlias Property Alias_RHQEnableMarker_General_Stage01_PostUC06_Objects Auto Const Mandatory

ObjectReference Property RHQ_ExtDebugMarker Auto Const

ReferenceAlias Property Alias_RHQEnableMarker_General_Stage01_PostUC06_DeepMines Auto Const Mandatory

ReferenceAlias Property Alias_RHQEnableMarker_General_Stage01_PostUC06_Freight Auto Const Mandatory

ReferenceAlias Property Alias_RHQEnableMarker_FreightElevator_Stage03_PostUC09 Auto Const Mandatory

ReferenceAlias Property Alias_RHQEnableMarker_Mine_Stage03_PostUC09 Auto Const Mandatory

RefCollectionAlias Property Alias_IntroSceneNPCs Auto Const Mandatory

ReferenceAlias Property Alias_ShipServices Auto Const Mandatory

ReferenceAlias Property Alias_HQMapMarker Auto Const Mandatory

LocationAlias Property Alias_LC028FreightElevatorLoc Auto Const Mandatory

LocationAlias Property Alias_LandingCellNameOverride Auto Const Mandatory

LocationAlias Property Alias_InteriorCellNameOverride Auto Const Mandatory

LocationAlias Property Alias_POI064RedDevilsHQ Auto Const Mandatory

ReferenceAlias Property Alias_RHQElevatorManager Auto Const Mandatory

Message Property UC_RHQ_TMDNameOverride Auto Const Mandatory

ReferenceAlias Property Alias_RHQ_FloorMarker_Int Auto Const Mandatory

ReferenceAlias Property Alias_RHQ_FloorMarker_Ext Auto Const Mandatory
