;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS06_00258694 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Complete the quest up until the point where you need to make a choice.
SetStage(100)
SetStage(200)
SetStage(300)
SetStage(400)
SetStage(500)
SetStage(600)
SetStage(700)

;Set some stages on DialogueECSConstant
DialogueECSConstant.SetStage(1)
DialogueECSConstant.SetStage(100)
DialogueECSConstant.SetStage(110)

;Stop MS06Intro
MS06Intro.Stop()

Game.GetPlayer().MoveTo(Alias_Oliver.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN AUTOCAST TYPE MS06_QuestScript
Quest __temp = self as Quest
MS06_QuestScript kmyQuest = __temp as MS06_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.DebugGiveResources()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetStage(1605)
Alias_Diana.GetRef().MoveTo(Alias_DianaInitParadisoMarker.GetRef())
Alias_Bomani.GetRef().MoveTo(Alias_BomaniInitParadisoMarker.GetRef())
Alias_Mabhuti.GetRef().MoveTo(Alias_MabhutiInitParadisoMarker.GetRef())
Alias_Colonist01.GetRef().MoveTo(Alias_Colonist01InitParadisoMarker.GetRef())
Alias_Colonist02.GetRef().MoveTo(Alias_Colonist02InitParadisoMarker.GetRef())
Alias_Colonist03.GetRef().MoveTo(Alias_Colonist03InitParadisoMarker.GetRef())
Utility.Wait(3)
SetStage(1610)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
If DialogueECSConstant.GetStageDone(110)
	SetStage(500)
Else
	SetObjectiveDisplayed(100)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0106_Item_00
Function Fragment_Stage_0106_Item_00()
;BEGIN CODE
SetStage(101)
SetStage(102)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
If !IsObjectiveCompleted(100)
	SetObjectiveCompleted(100)
EndIf

SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0301_Item_00
Function Fragment_Stage_0301_Item_00()
;BEGIN CODE
If !IsObjectiveCompleted(100)
	SetObjectiveCompleted(100)
EndIf
If !IsObjectiveCompleted(200)
	SetObjectiveDisplayed(200, False)
EndIf

SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
If IsObjectiveDisplayed(300)
	SetObjectiveCompleted(300)
EndIf
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;If the player got this quest by going to the ECS Constant first, then
;don't complete objective 400 since it shouldn't have been displayed.
If IsObjectiveDisplayed(400)
	SetObjectiveCompleted(400)
EndIf
SetObjectiveDisplayed(500)

;Remove the name override that was set in MS06Intro
Alias_ECSConstantShip.GetRef().SetOverrideName(None)
Alias_OrbitMapMarker.GetRef().SetLinkedRef(Alias_ECSConstantName.GetRef(), MapMarkerLinkedRefNameOverride)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)
SetObjectiveDisplayed(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0605_Item_00
Function Fragment_Stage_0605_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(MS06_ECSForeknowledgeAV, 1)

;If the player already spoke to Jiro, set the stage to speak with Oliver,
;Otherwise, set the stage to speak with Jiro (alternate).
If GetStageDone(200)
	SetStage(700)
Else
	SetStage(650)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600)

If !GetStageDone(700)
	SetObjectiveDisplayed(650)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0690_Item_00
Function Fragment_Stage_0690_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(690)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0691_Item_00
Function Fragment_Stage_0691_Item_00()
;BEGIN CODE
SetObjectiveCompleted(690)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600)

If GetStageDone(650)
	SetObjectiveCompleted(650)
EndIf

SetObjectiveDisplayed(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0999_Item_00
Function Fragment_Stage_0999_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(MS06_ResourceList_Slate)
SetObjectiveCompleted(700)
SetObjectiveDisplayed(999)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
;Set the name of the Map Marker back from when it was set in Stage 500 
Alias_OrbitMapMarker.GetRef().SetLinkedRef(Alias_PorrimaIIOrbitName.GetRef(), MapMarkerLinkedRefNameOverride)

If GetStageDone(1710) || GetStageDone(2410)
	DialogueECSConstantRoaming.Start()
EndIf


;Stop MS06Intro
MS06Intro.SetStage(1000)

Game.GetPlayer().SetValue(MS06_EndForeknowledgeAV, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE MS06_QuestScript
Quest __temp = self as Quest
MS06_QuestScript kmyQuest = __temp as MS06_QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(999)
SetObjectiveDisplayed(1010)
SetObjectiveDisplayed(1020)
SetObjectiveDisplayed(1030)
SetObjectiveDisplayed(1040)
kmyQuest.RegisterPlayerforInventoryFilter()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1050_Item_00
Function Fragment_Stage_1050_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1050)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1060_Item_00
Function Fragment_Stage_1060_Item_00()
;BEGIN AUTOCAST TYPE MS06_QuestScript
Quest __temp = self as Quest
MS06_QuestScript kmyQuest = __temp as MS06_QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(1050)
kmyQuest.ConstantGiveResources()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1070_Item_00
Function Fragment_Stage_1070_Item_00()
;BEGIN AUTOCAST TYPE MS06_QuestScript
Quest __temp = self as Quest
MS06_QuestScript kmyQuest = __temp as MS06_QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(1050)
kmyQuest.ConstantGiveGoods()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1000)
SetObjectiveCompleted(1010)
SetObjectiveCompleted(1020)
SetObjectiveCompleted(1030)
SetObjectiveCompleted(1040)
SetObjectiveDisplayed(1500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1600_Item_00
Function Fragment_Stage_1600_Item_00()
;BEGIN AUTOCAST TYPE defaultpassengerquestscript
Quest __temp = self as Quest
defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(1500)
SetObjectiveDisplayed(1600)

DialogueECSConstant.SetStage(1600)

kmyquest.AddPassenger(Alias_Diana)
kmyquest.AddPassenger(Alias_Bomani)
kmyquest.AddPassenger(Alias_Mabhuti)
kmyquest.AddPassenger(Alias_Colonist01)
kmyquest.AddPassenger(Alias_Colonist02)
kmyquest.AddPassenger(Alias_Colonist03)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1600_Item_01
Function Fragment_Stage_1600_Item_01()
;BEGIN AUTOCAST TYPE MS06_QuestScript
Quest __temp = self as Quest
MS06_QuestScript kmyQuest = __temp as MS06_QuestScript
;END AUTOCAST
;BEGIN CODE
;Remove the resources
kmyQuest.RemoveResources()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1601_Item_00
Function Fragment_Stage_1601_Item_00()
;BEGIN CODE
Alias_Passengers.RemoveFromFaction(ECSConstantSecurityFaction)
Alias_Passengers.RemoveFromFaction(CrimeFactionECSConstant)
Alias_Passengers.AddToFaction(CrimeFactionParadiso)
Alias_Passengers.AddToFaction(ParadisoFaction)

Int i
Int iCount = Alias_Passengers.GetCount()
While i < iCount
	Actor myPassenger = Alias_Passengers.GetAt(i) as Actor
	myPassenger.SetCrimeFaction(CrimeFactionParadiso)
	myPassenger.SetGhost()
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1605_Item_00
Function Fragment_Stage_1605_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1600)
SetObjectiveDisplayed(1605)

Int i
Int iCount = Alias_Passengers.GetCount()
While i < iCount
	Actor myPassenger = Alias_Passengers.GetAt(i) as Actor
	myPassenger.SetGhost(false)
	i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1610_Item_00
Function Fragment_Stage_1610_Item_00()
;BEGIN CODE
MS06_1610_FerryLandingScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1700_Item_00
Function Fragment_Stage_1700_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1605)
SetObjectiveDisplayed(1700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1710_Item_00
Function Fragment_Stage_1710_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1700)

;GEN-524074: Removing the "Melt down the reactor" path objective 
;if the player's finished the quest another way
if IsObjectiveDisplayed(3100)
  SetObjectiveCompleted(3100)
endif

ECS_EndState.SetValue(1)
DialogueParadiso.SetStage(2000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1711_Item_00
Function Fragment_Stage_1711_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
;Game.GetPlayer().AddItem(Alias_ConstantSchematics.GetRef())
SetObjectiveCompleted(700)
SetObjectiveDisplayed(2000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2100_Item_00
Function Fragment_Stage_2100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2000)
SetObjectiveDisplayed(2100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2111_Item_00
Function Fragment_Stage_2111_Item_00()
;BEGIN AUTOCAST TYPE MS06_QuestScript
Quest __temp = self as Quest
MS06_QuestScript kmyQuest = __temp as MS06_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.RemoveCredits(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2121_Item_00
Function Fragment_Stage_2121_Item_00()
;BEGIN AUTOCAST TYPE MS06_QuestScript
Quest __temp = self as Quest
MS06_QuestScript kmyQuest = __temp as MS06_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.RemoveCredits(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2200_Item_00
Function Fragment_Stage_2200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2100)
SetObjectiveDisplayed(2200)
Game.GetPlayer().AddItem(Alias_GravDriveManual.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2300_Item_00
Function Fragment_Stage_2300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2200)
SetObjectiveDisplayed(2300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2400_Item_00
Function Fragment_Stage_2400_Item_00()
;BEGIN CODE
Alias_Amin.GetRef().Say(MS06_2400_Amin_AllSetTopic)
SetObjectiveCompleted(2300)
SetObjectiveDisplayed(2400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2410_Item_00
Function Fragment_Stage_2410_Item_00()
;BEGIN AUTOCAST TYPE defaultpassengerquestscript
Quest __temp = self as Quest
defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(2400)

;GEN-524074: Removing the "Melt down the reactor" path objective 
;if the player's finished the quest another way
if IsObjectiveDisplayed(3100)
  SetObjectiveCompleted(3100)
endif

ECS_EndState.SetValue(2)

;Tell the dialogue quest that the quest finished with Option B
DialogueECSConstant.SetStage(2000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2411_Item_00
Function Fragment_Stage_2411_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_3100_Item_00
Function Fragment_Stage_3100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(3100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_3150_Item_00
Function Fragment_Stage_3150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(3100)
SetObjectiveDisplayed(3150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_3200_Item_00
Function Fragment_Stage_3200_Item_00()
;BEGIN AUTOCAST TYPE MS06_QuestScript
Quest __temp = self as Quest
MS06_QuestScript kmyQuest = __temp as MS06_QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveFailed(100)
SetObjectiveFailed(200)
SetObjectiveFailed(300)
SetObjectiveFailed(400)
SetObjectiveFailed(500)
SetObjectiveFailed(600)
SetObjectiveFailed(650)
SetObjectiveFailed(700)
SetObjectiveFailed(999)
SetObjectiveFailed(1010)
SetObjectiveFailed(1020)
SetObjectiveFailed(1030)
SetObjectiveFailed(1040)
SetObjectiveFailed(1050)
SetObjectiveFailed(1500)
SetObjectiveFailed(1600)
SetObjectiveFailed(1700)
SetObjectiveFailed(2000)
SetObjectiveFailed(2100)
SetObjectiveFailed(2200)
SetObjectiveFailed(2300)
SetObjectiveFailed(2400)
SetObjectiveCompleted(3150)
SetObjectiveDisplayed(3200)

;Turns off lights, turns on Klaxon lights and sound. 
;Generally gets the ship ready to self-destruct.
kmyQuest.SetECSConstantSelfDestruct()

Alias_StorageRoomCombatMarker.GetRef().Enable()

Alias_SecurityGuards.RemoveFromFaction(GuardFaction)
Alias_SecurityGuardsHostile.AddRefCollection(Alias_SecurityGuards)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_3200_Item_01
Function Fragment_Stage_3200_Item_01()
;BEGIN AUTOCAST TYPE defaultpassengerquestscript
Quest __temp = self as Quest
defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
;END AUTOCAST
;BEGIN CODE
Int i = 0
Int iCount = PassengerArray.Length
Location myECSLocation = Alias_ECSConstant.GetLocation()
While i < iCount
	Actor myPassenger = PassengerArray[i].GetActorRef()
	kmyquest.RemovePassengerActor(myPassenger)
	ObjectReference myFailsafeMarker = Alias_PassengerFailsafeMarker.GetRef()
	If !myPassenger.IsInLocation(myECSLocation)
		myPassenger.MoveTo(myFailsafeMarker)
	EndIf
	i += 1
EndWhile
;/
kmyquest.RemovePassengerActor(Alias_Diana.GetActorRef())
kmyquest.RemovePassengerActor(Alias_Bomani.GetActorRef())
kmyquest.RemovePassengerActor(Alias_Mabhuti.GetActorRef())
kmyquest.RemovePassengerActor(Alias_Colonist01.GetActorRef())
kmyquest.RemovePassengerActor(Alias_Colonist02.GetActorRef())
kmyquest.RemovePassengerActor(Alias_Colonist03.GetActorRef())
/;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_3250_Item_00
Function Fragment_Stage_3250_Item_00()
;BEGIN AUTOCAST TYPE MS06_QuestScript
Quest __temp = self as Quest
MS06_QuestScript kmyQuest = __temp as MS06_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ECSConstantExplode()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_3300_Item_00
Function Fragment_Stage_3300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(3200)
SetObjectiveDisplayed(3300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_3300_Item_01
Function Fragment_Stage_3300_Item_01()
;BEGIN CODE
SetObjectiveCompleted(3200)
SetStage(3330)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_3310_Item_00
Function Fragment_Stage_3310_Item_00()
;BEGIN CODE
SetObjectiveCompleted(3300)
ECS_EndState.SetValue(3)

;Set up the free hotel room rental
PD_Hotel_RoomCost_Daily.SetValue(0)
PD_Hotel_RoomCost_Weekly.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_3311_Item_00
Function Fragment_Stage_3311_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_3320_Item_00
Function Fragment_Stage_3320_Item_00()
;BEGIN CODE
SetObjectiveCompleted(3300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_3321_Item_00
Function Fragment_Stage_3321_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_3330_Item_00
Function Fragment_Stage_3330_Item_00()
;BEGIN CODE
FailAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_3331_Item_00
Function Fragment_Stage_3331_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Player Auto Const Mandatory

Quest Property DialogueECSConstant Auto Const Mandatory

Book Property MS06_ConstantSchematics Auto Const Mandatory

ReferenceAlias Property Alias_Diana Auto Const Mandatory

ReferenceAlias Property Alias_Bomani Auto Const Mandatory

ReferenceAlias Property Alias_Mabhuti Auto Const Mandatory

ReferenceAlias Property Alias_Colonist01 Auto Const Mandatory

ReferenceAlias Property Alias_Colonist02 Auto Const Mandatory

ReferenceAlias Property Alias_Colonist03 Auto Const Mandatory

ReferenceAlias Property Alias_DianaInitParadisoMarker Auto Const Mandatory

ReferenceAlias Property Alias_BomaniInitParadisoMarker Auto Const Mandatory

ReferenceAlias Property Alias_MabhutiInitParadisoMarker Auto Const Mandatory

ReferenceAlias Property Alias_Colonist01InitParadisoMarker Auto Const Mandatory

ReferenceAlias Property Alias_Colonist02InitParadisoMarker Auto Const Mandatory

ReferenceAlias Property Alias_Colonist03InitParadisoMarker Auto Const Mandatory

Scene Property MS06_1610_FerryLandingScene Auto Const Mandatory

Book Property MS06_GravDriveManual Auto Const Mandatory

ReferenceAlias Property Alias_ConstantSchematics Auto Const Mandatory

ReferenceAlias Property Alias_GravDriveManual Auto Const Mandatory

Book Property MS06_ResourceList_Slate Auto Const Mandatory

Quest Property MS06Intro Auto Const Mandatory

RefCollectionAlias Property Alias_SecurityGuards Auto Const Mandatory

RefCollectionAlias Property Alias_SecurityGuardsHostile Auto Const Mandatory

ReferenceAlias Property Alias_Amin Auto Const Mandatory

Topic Property MS06_2400_Amin_AllSetTopic Auto Const Mandatory

ReferenceAlias Property Alias_Oliver Auto Const Mandatory

GlobalVariable Property ECS_EndState Auto Const Mandatory

ReferenceAlias Property Alias_ECSConstantShip Auto Const Mandatory

ReferenceAlias Property Alias_OrbitMapMarker Auto Const Mandatory

ActorValue Property MS06_ECSForeknowledgeAV Auto Const Mandatory

ActorValue Property MS06_EndForeknowledgeAV Auto Const Mandatory

Message Property MS06_ECSConstantOrbitalNameMSG Auto Const Mandatory

ReferenceAlias Property Alias_ECSConstantName Auto Const Mandatory

Keyword Property MapMarkerLinkedRefNameOverride Auto Const Mandatory

ReferenceAlias Property Alias_PorrimaIIOrbitName Auto Const Mandatory

Quest Property DialogueParadiso Auto Const Mandatory

GlobalVariable Property PD_Hotel_RoomCost_Daily Auto Const Mandatory

GlobalVariable Property PD_Hotel_RoomCost_Weekly Auto Const Mandatory

Faction Property CrimeFactionECSConstant Auto Const Mandatory

Faction Property GuardFaction Auto Const Mandatory

ReferenceAlias Property Alias_StorageRoomCombatMarker Auto Const Mandatory

RefCollectionAlias Property Alias_Lights Auto Const Mandatory

ReferenceAlias Property Alias_KlaxonSoundMarker Auto Const Mandatory

Quest Property DialogueECSConstantRoaming Auto Const Mandatory

RefCollectionAlias Property Alias_Klaxons Auto Const Mandatory

RefCollectionAlias Property Alias_Passengers Auto Const Mandatory

Faction Property ECSConstantSecurityFaction Auto Const Mandatory

Faction Property CrimeFactionParadiso Auto Const Mandatory

Faction Property ParadisoFaction Auto Const Mandatory

LocationAlias Property Alias_ECSConstant Auto Const Mandatory

ReferenceAlias Property Alias_PassengerFailsafeMarker Auto Const Mandatory

ReferenceAlias[] Property PassengerArray Const Auto Mandatory
