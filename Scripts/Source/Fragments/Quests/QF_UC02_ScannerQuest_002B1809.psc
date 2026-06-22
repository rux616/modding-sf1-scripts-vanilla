;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_UC02_ScannerQuest_002B1809 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Alias_Terrormorph.GetRef().Enable()
Game.GetPlayer().Moveto(DebugMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
UC02_LivestockTrackerEnabled.SetValue(1)

if UC02.IsRunning()
  (UC02 as UC02_QuestScript).ToggleRestoreTrackerObj(false)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN AUTOCAST TYPE uc02_scannerquestscript
Quest __temp = self as Quest
uc02_scannerquestscript kmyQuest = __temp as uc02_scannerquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.WWiseEventInstanceID = WWiseScannerEvent.Play(Alias_Terrormorph.GetRef())

if UC02.GetStageDone(601)
  kmyquest.DisplayDistanceMessage()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE uc02_scannerquestscript
Quest __temp = self as Quest
uc02_scannerquestscript kmyQuest = __temp as uc02_scannerquestscript
;END AUTOCAST
;BEGIN CODE
UC02_TrackerQuest_100_Scene.Stop()
WWiseEvent.StopInstance(kmyquest.WWiseEventInstanceID)
UC02_LivestockTrackerEnabled.SetValue(0)
if UC02.IsRunning()
  (UC02 as UC02_QuestScript).ToggleRestoreTrackerObj(true)
endif
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DebugMarker Auto Const

ReferenceAlias Property Alias_Terrormorph Auto Const Mandatory

Scene Property UC02_TrackerQuest_100_Scene Auto Const Mandatory

GlobalVariable Property UC02_LivestockTrackerEnabled Auto Const Mandatory

Message Property UC02_DEBUG_Stopped Auto Const Mandatory

Message Property UC02_DEBUG_Started Auto Const Mandatory

WwiseEvent Property WWiseScannerEvent Auto Const

Float Property WwiseEventInstanceID Auto Const

Quest Property UC02 Auto Const Mandatory
