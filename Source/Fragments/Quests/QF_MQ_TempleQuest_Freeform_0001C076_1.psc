;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ_TempleQuest_Freeform_0001C076_1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
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
kmyquest.ShowHelpMessage("OutpostTutorial")

IF Alias_TempleLocation.GetLocation() == None
  SetObjectiveDisplayed(15)
EndIF
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
SetObjectiveCompleted(15)
SetObjectiveDisplayed(10, abforce=true)

;spawn Starborn
kmyquest.SpawnStarborn()
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

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_AnomalyMapMarker Auto Const Mandatory

Message Property MQ_TempleTutorialMSG Auto Const Mandatory

LocationAlias Property Alias_PlanetExploredTrait Auto Const Mandatory

ReferenceAlias Property Alias_TempleMapMarker Auto Const Mandatory

Quest Property MQ106 Auto Const Mandatory

ReferenceAlias Property Alias_TempleStarborn Auto Const Mandatory

ReferenceAlias Property Alias_TemplePrayMarker Auto Const Mandatory

ActorBase Property LvlStarborn_Boss_Aggro Auto Const Mandatory

LocationAlias Property Alias_TempleLocation Auto Const Mandatory
