;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF__01002E39 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
MQ401EyeScanMSG.Show()
Utility.Wait(0.1)
SetObjectiveCompleted(5)
SetObjectiveDisplayed(10)
MQ_TurnOnTemples.SetValueInt(1)
Alias_EyeScanner.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

MQ_TurnOnTemples.SetValueInt(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_01
Function Fragment_Stage_0010_Item_01()
;BEGIN CODE
;if Vladimir is disabled, point to the Eye trigger
Alias_EyeScanner.GetRef().Enable()
SetObjectiveDisplayed(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE defaulttutorialquestscript
Quest __temp = self as Quest
defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
;END AUTOCAST
;BEGIN CODE
;kmyquest.ShowHelpMessage("OutpostTutorial")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN AUTOCAST TYPE MQ_Temple_SubScript
Quest __temp = self as Quest
MQ_Temple_SubScript kmyQuest = __temp as MQ_Temple_SubScript
;END AUTOCAST
;BEGIN CODE
kmyquest.TempleDiscovered()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Stop()

;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_01
Function Fragment_Stage_0060_Item_01()
;BEGIN CODE
CompleteAllObjectives()
Stop()

;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_AnomalyMapMarker Auto Const Mandatory

Message Property MQ_TempleTutorialMSG Auto Const Mandatory

Quest Property MQ104A Auto Const Mandatory

LocationAlias Property Alias_PlanetExploredTrait Auto Const Mandatory

ReferenceAlias Property Alias_TempleMapMarker Auto Const Mandatory

GlobalVariable Property MQTempleQuest_HaveTempleObj Auto Const Mandatory

GlobalVariable Property MQ_TurnOnTemples Auto Const Mandatory

ReferenceAlias Property Alias_EyeScanner Auto Const Mandatory

ReferenceAlias Property Alias_VladimirSall Auto Const Mandatory

Message Property MQ401EyeScanMSG Auto Const Mandatory
