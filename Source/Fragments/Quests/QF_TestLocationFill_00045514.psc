;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_TestLocationFill_00045514 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
MQ104A.SetObjectiveCompleted(70)

;if the player already discovered the planet trait, skip ahead
If Alias_PlanetExploredTrait.GetLocation() == None
  MQ104A.SetObjectiveDisplayed(71)
Else
  MQ104A.SetObjectiveDisplayed(73)
EndIf
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
Game.GetPlayer().WaitFor3DLoad()
Utility.Wait(0.25)
MQ_TempleTutorialMSG.Show()
Utility.Wait(0.25)
MQ104A.SetObjectiveCompleted(71)
MQ104A.SetObjectiveDisplayed(72)
MQ104A.SetObjectiveDisplayed(74)

MQ104A.SetStage(305)

kmyquest.ShowHelpMessage("OutpostTutorial")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0032_Item_00
Function Fragment_Stage_0032_Item_00()
;BEGIN CODE
MQ104A.SetObjectiveCompleted(74)
MQ104A.SetObjectiveDisplayed(75)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
MQ104A.SetObjectiveCompleted(74)
MQ104A.SetObjectiveCompleted(75)
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
MQ104A.SetObjectiveCompleted(72)
MQ104A.SetObjectiveDisplayed(73)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetStage(40)
MQ104A.SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
MQ104A.SetStage(600)
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
