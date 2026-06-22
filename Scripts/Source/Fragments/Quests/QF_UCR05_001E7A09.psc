;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_UCR05_001E7A09 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_EdgeMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
if !GetStageDone(75) && Game.GetPlayer().GetParentCell() != CityNewAtlantisMASTB3SubsectionSeven
  SetStage(9000)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
if !DialogueUCFaction.GetStageDone(1020)
  DialogueUCFaction.SetStage(1020)
endif

Alias_TransferSystemTrigger.GetRef().Enable()
SetObjectiveDisplayed(75)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_TransferSystemTrigger.GetRef().Disable()
SetObjectiveCompleted(75)
SetObjectiveDisplayed(100)

if DialogueUCFaction.GetStageDone(4)
  SetActive()
endif

Game.GetPlayer().AddItem(UCR05_TargetSlate)

UCR05_100_VV_StartUp.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
UCR05_TimesCompleted.SetValue(UCR05_TimesCompleted.GetValue() + 1.0)
CompleteAllObjectives()
Stop()

;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
Alias_TransferSystemTrigger.GetRef().Disable()

if GetStageDone(75)
  SetObjectiveSkipped(75)
endif 

Stop()

;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DialogueUCFaction Auto Const Mandatory

GlobalVariable Property UCR05_TimesCompleted Auto Const Mandatory

ReferenceAlias Property Alias_EdgeMarker Auto Const Mandatory

Scene Property UCR05_100_VV_StartUp Auto Const Mandatory

ReferenceAlias Property Alias_TransferSystemTrigger Auto Const Mandatory

Book Property UCR05_TargetSlate Auto Const Mandatory

Cell Property CityNewAtlantisMASTB3SubsectionSeven Auto Const Mandatory
