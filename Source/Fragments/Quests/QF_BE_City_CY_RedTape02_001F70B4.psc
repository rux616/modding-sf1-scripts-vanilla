;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BE_City_CY_RedTape02_001F70B4 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_Corpse.GetActorRef().Kill()
City_CY_RedTape02.SetStage(610)

Alias_AllCrew.EvaluateAll()
Alias_Captain.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE BECityCYRedTape02QuestScript
Quest __temp = self as Quest
BECityCYRedTape02QuestScript kmyQuest = __temp as BECityCYRedTape02QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartCountdown()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0031_Item_00
Function Fragment_Stage_0031_Item_00()
;BEGIN AUTOCAST TYPE BECityCYRedTape02QuestScript
Quest __temp = self as Quest
BECityCYRedTape02QuestScript kmyQuest = __temp as BECityCYRedTape02QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StopCountdown()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0032_Item_00
Function Fragment_Stage_0032_Item_00()
;BEGIN CODE
BE_City_CY_RedTape02_Captain_0020_ForceGreet.Stop()
Alias_Captain.GetRef().Say(BE_City_CY_RedTape02_Captain_TimesUpTopic)
Utility.Wait(5)
SetStage(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0033_Item_00
Function Fragment_Stage_0033_Item_00()
;BEGIN CODE
BE_City_CY_RedTape02_Captain_0020_ForceGreet.Stop()
SetStage(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetStage(50)
Game.GetPlayer().AddItem(Alias_Note.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0041_Item_00
Function Fragment_Stage_0041_Item_00()
;BEGIN AUTOCAST TYPE BECityCYRedTape02QuestScript
Quest __temp = self as Quest
BECityCYRedTape02QuestScript kmyQuest = __temp as BECityCYRedTape02QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.RemoveShipParts()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0042_Item_00
Function Fragment_Stage_0042_Item_00()
;BEGIN AUTOCAST TYPE BECityCYRedTape02QuestScript
Quest __temp = self as Quest
BECityCYRedTape02QuestScript kmyQuest = __temp as BECityCYRedTape02QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.RemoveShipParts()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
City_CY_RedTape02.SetStage(616)
City_CY_RedTape02.SetStage(620)
City_CY_RedTape02.SetStage(700)
Alias_Captain.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
Alias_AllCrew.RemoveFromFaction(CityCYRedTape02CrimsonFleetNeutralFaction)
Actor myCaptain = Alias_Captain.GetActorRef()
myCaptain.RemoveFromFaction(CityCYRedTape02CrimsonFleetNeutralFaction)

Alias_AllCrew.EvaluateAll()
myCaptain.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
If GetStageDone(150)
	City_CY_RedTape02.SetStage(615)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
If GetStageDone(100)
	City_CY_RedTape02.SetStage(615)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
City_CY_RedTape02.SetStage(620)
City_CY_RedTape02.SetStage(630)
City_CY_RedTape02_Blackmail.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0201_Item_00
Function Fragment_Stage_0201_Item_00()
;BEGIN CODE
City_CY_RedTape02.SetStage(620)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE BECityCYRedTape02QuestScript
Quest __temp = self as Quest
BECityCYRedTape02QuestScript kmyQuest = __temp as BECityCYRedTape02QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ShipUndock()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property City_CY_RedTape02 Auto Const Mandatory

ReferenceAlias Property Alias_EnemyShip Auto Const Mandatory

ActorValue Property SpaceshipCrew Auto Const Mandatory

RefCollectionAlias Property Alias_AllCrew Auto Const Mandatory

ReferenceAlias Property Alias_Captain Auto Const Mandatory

Faction Property CityCYRedTape02CrimsonFleetNeutralFaction Auto Const Mandatory

Topic Property BE_City_CY_RedTape02_Captain_TimesUpTopic Auto Const Mandatory

ReferenceAlias Property Alias_Note Auto Const Mandatory

Quest Property City_CY_RedTape02_Blackmail Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

ActorValue Property SpaceshipGravJumpFuel Auto Const Mandatory

Scene Property BE_City_CY_RedTape02_Captain_0020_ForceGreet Auto Const Mandatory

Scene Property BE_City_CY_RedTape02_Captain_0020_TimesUp Auto Const Mandatory

ActorValue Property City_CY_RedTape02_Foreknowledge_PirateAV Auto Const Mandatory

Potion Property ShipRepairKit Auto Const Mandatory

ReferenceAlias Property Alias_Corpse Auto Const Mandatory
