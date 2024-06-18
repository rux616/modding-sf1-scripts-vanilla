;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BE_Player_DerelictShip_Sc_0002BF40 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
ObjectReference[] myMarkers = Alias_ItemSpawnMarkers.GetArray()
int x = Utility.RandomInt(0,1)
if x == 0 && SE_GenericDerelict_IDCardGlobal.GetValueInt() == 0
    SetStage(3)
else
    SetStage(2)
endif

;temporarily calling both stages for playtest
SetStage(3)
SetStage(2)

pAlarm.Play(Game.GetPlayer())

int i = 3
while i < myCorpses.Length
    myCorpses[i].AddItem(LL_SE_GenericDerelict_GenericNotes)
    i += 1
endwhile

int d = 0
while d < myMarkers.Length
    myMarkers[i].PlaceAtme(LL_SE_GenericDerelict_GenericNotes)
    d += 1
endwhile

SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
ObjectReference[] myContainers = Alias_Containers.GetArray()
Alias_CorpseKeyRef.ForceRefTo(myCorpses[2])

ObjectReference myNPC = Alias_CorpseKeyRef.GetRef()
ObjectReference lootkey = myNPC.PlaceLockedRefKeyAtMe(myContainers[0])

myContainers[0].Lock(true)
myCorpses[2].AddItem(lootkey)
myCorpses[2].AddItem(LL_SE_GenericDerelict_LockedLootNote)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
Alias_GeneTagRef.ForceRefTo(myCorpses[0])

int x = Utility.RandomInt(1,4)
if x == 0 && SE_GenericDerelict_IDCardGlobal.GetValueInt() == 0  
elseif x == 1
    Alias_GeneTagRef.GetRef().AddAliasedItem(SE_GenericDerelict_IDCardNote01, Alias_IDCard01)
elseif x == 2
    Alias_GeneTagRef.GetRef().AddAliasedItem(SE_GenericDerelict_IDCardNote02, Alias_IDCard02)
elseif x == 3
    Alias_GeneTagRef.GetRef().AddAliasedItem(SE_GenericDerelict_IDCardNote03, Alias_IDCard03)
else
    Alias_GeneTagRef.GetRef().AddAliasedItem(SE_GenericDerelict_IDCardNote04, Alias_IDCard04)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
SE_GenericDerelict_BlackBoxQuest.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN AUTOCAST TYPE bescript
Quest __temp = self as Quest
bescript kmyQuest = __temp as bescript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetShipHazard(hazardExtremeCold)
ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
Alias_ExtraNote.ForceRefTo(myCorpses[1])
Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_ExtremeColdNotes)

ObjectReference[] myContainers = Alias_Containers.GetArray()
myContainers[1].AddAliasedItem(Mfg_Tier01_ReactiveGauge, Alias_RepairItem)
myContainers[1].Lock(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_01
Function Fragment_Stage_0005_Item_01()
;BEGIN AUTOCAST TYPE bescript
Quest __temp = self as Quest
bescript kmyQuest = __temp as bescript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetShipHazard(hazardNoOxygen)

Alias_EnemyShipInteriorLocation.GetLocation().AddKeyword(ENV_Loc_NotSealedEnvironment)

ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
Alias_ExtraNote.ForceRefTo(myCorpses[1])
Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_NoOxygenNotes)

ObjectReference[] myContainers = Alias_Containers.GetArray()
myContainers[1].AddAliasedItem(Mfg_Tier01_StructuralFrame, Alias_RepairItem)
myContainers[1].Lock(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_02
Function Fragment_Stage_0005_Item_02()
;BEGIN AUTOCAST TYPE bescript
Quest __temp = self as Quest
bescript kmyQuest = __temp as bescript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetShipHazard(hazardRadiation)
ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
Alias_ExtraNote.ForceRefTo(myCorpses[1])
Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_RadiationNotes)

ObjectReference[] myContainers = Alias_Containers.GetArray()
myContainers[1].AddAliasedItem(Mfg_Tier02_ControlRod, Alias_RepairItem)
myContainers[1].Lock(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_03
Function Fragment_Stage_0005_Item_03()
;BEGIN AUTOCAST TYPE bescript
Quest __temp = self as Quest
bescript kmyQuest = __temp as bescript
;END AUTOCAST
;BEGIN CODE
int biohazard = utility.randomint(0,1)
if biohazard == 1
    kmyQuest.SetShipHazard(hazardExtremeHeat)
else
    kmyQuest.SetShipHazard(hazardSteamHeat)
endif
ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
Alias_ExtraNote.ForceRefTo(myCorpses[1])
Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_ExtremeHeatNotes)

ObjectReference[] myContainers = Alias_Containers.GetArray()
myContainers[1].AddAliasedItem(Mfg_Tier02_ControlRod, Alias_RepairItem)
myContainers[1].Lock(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_04
Function Fragment_Stage_0005_Item_04()
;BEGIN AUTOCAST TYPE bescript
Quest __temp = self as Quest
bescript kmyQuest = __temp as bescript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetShipHazard(hazardCorrosiveGas)

ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
Alias_ExtraNote.ForceRefTo(myCorpses[1])
Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_CorrosiveNotes)

ObjectReference[] myContainers = Alias_Containers.GetArray()
myContainers[1].AddAliasedItem(Mfg_Tier01_AusteniticManifold, Alias_RepairItem)
myContainers[1].Lock(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_05
Function Fragment_Stage_0005_Item_05()
;BEGIN AUTOCAST TYPE bescript
Quest __temp = self as Quest
bescript kmyQuest = __temp as bescript
;END AUTOCAST
;BEGIN CODE
int biohazard = utility.randomint(0,1)
if biohazard == 1
    kmyQuest.SetShipHazard(hazardToxicGas)
else
    kmyQuest.SetShipHazard(hazardSpores)
endif

ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
Alias_ExtraNote.ForceRefTo(myCorpses[1])
Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_ToxicGasNotes)

ObjectReference[] myContainers = Alias_Containers.GetArray()
myContainers[1].AddAliasedItem(Mfg_Tier02_ControlRod, Alias_RepairItem)
myContainers[1].Lock(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_06
Function Fragment_Stage_0005_Item_06()
;BEGIN AUTOCAST TYPE bescript
Quest __temp = self as Quest
bescript kmyQuest = __temp as bescript
;END AUTOCAST
;BEGIN CODE
ObjectReference[] myMarkers = Alias_CrewSpawnMarkers.GetArray()

int i = 0
while i < myMarkers.Length
    myMarkers[i].PlaceAtMe(creatures)
    i += 1
endwhile

ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
Alias_ExtraNote.ForceRefTo(myCorpses[1])
Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_CreaturesNotes)

ObjectReference[] myContainers = Alias_Containers.GetArray()
myContainers[1].AddAliasedItem(Mfg_Tier03_Quasineutralizer, Alias_RepairItem)
myContainers[1].Lock(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_07
Function Fragment_Stage_0005_Item_07()
;BEGIN CODE
ObjectReference[] myMarkers = Alias_CrewSpawnMarkers.GetArray()

int i = 0
while i < myMarkers.Length
    ObjectReference Robot = myMarkers[i].PlaceAtMe(LvlRobotModelA_Combat)
    Alias_Robots.AddRef(Robot)
    i += 2
endwhile

ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
Alias_ExtraNote.ForceRefTo(myCorpses[1])
Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_AIMalfunctionNotes)

ObjectReference[] myContainers = Alias_Containers.GetArray()
myContainers[1].AddAliasedItem(Mfg_Tier02_ControlRod, Alias_RepairItem)
myContainers[1].Lock(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
SE_GenericDerelict_IDCardQuest.SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
SE_GenericDerelict_IDCardQuest.SetStage(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
SE_GenericDerelict_IDCardQuest.SetStage(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
SE_GenericDerelict_IDCardQuest.SetStage(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SE_DerelictGeneric_MissionCompanyGlobal.SetValueInt(Utility.RandomInt(0,4))
SE_GenericDerelict_MissionCrewTypeGlobal.SetValue(1)
SE_DerelictGeneric_MissionHazardGlobal.SetValueInt(Utility.RandomInt(0,7))
SE_DerelictGeneric_MissionHazardCauseGlobal.SetValueInt(Utility.RandomInt(0,2))
SE_DerelictGeneric_MissionTypeGlobal.SetValueInt(Utility.RandomInt(0,1))
SE_GenericDerelict_Repaired.SetValue(0)
SE_GenericDerelict_LogsDownloaded.SetValue(0)
SE_GenericDerelict_HazardFixed.SetValue(0)
Alias_CaptainsLocker.GetRef().Lock(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0014_Item_00
Function Fragment_Stage_0014_Item_00()
;BEGIN CODE
SE_GenericDerelict_HazardFixed.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN AUTOCAST TYPE bescript
Quest __temp = self as Quest
bescript kmyQuest = __temp as bescript
;END AUTOCAST
;BEGIN CODE
ShipPowerOn.Play(Game.GetPlayer())
kmyQuest.SetShipHazard(None)
Alias_Robots.KillAll()
SE_GenericDerelict_HazardFixed.SetValue(1)
Game.GetPlayer().RemoveItem(Alias_RepairItem.GetRef())
SpaceshipReference myShip = Alias_enemyShip.GetShipRef()
Alias_PilotSeat.GetRef().RemoveKeyword(BlockPlayerActivation)
myShip.SetValue(Health, 50000)
myShip.SetValue(ShipSystemGravDriveHealth, 50000)
myShip.SetValue(ShieldHealth, 50000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE bescript
Quest __temp = self as Quest
bescript kmyQuest = __temp as bescript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().RemoveItem(ShipRepairKit)
SE_GenericDerelict_Repaired.SetValue(1)
ObjectReference TerminalRef = Alias_Terminal.GetRef()
TerminalRef.SetLinkedRef(Alias_CaptainsLocker.GetRef())
kmyQuest.SetShipGravity(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_01
Function Fragment_Stage_0020_Item_01()
;BEGIN CODE
SpaceshipReference myShip = Alias_enemyShip.GetShipRef()
Alias_PilotSeat.GetRef().RemoveKeyword(BlockPlayerActivation)
myShip.SetValue(Health, 50000)
myShip.SetValue(ShipSystemGravDriveHealth, 50000)
myShip.SetValue(ShieldHealth, 50000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
Alias_CaptainsLocker.GetRef().Lock(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetStage(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Alias_Terminal.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property SE_DerelictGeneric_MissionCompanyGlobal Auto Const Mandatory

GlobalVariable Property SE_DerelictGeneric_MissionTypeGlobal Auto Const Mandatory

GlobalVariable Property SE_DerelictGeneric_MissionHazardGlobal Auto Const Mandatory

GlobalVariable Property SE_DerelictGeneric_MissionHazardCauseGlobal Auto Const Mandatory

ReferenceAlias Property Alias_GenetagRef Auto Const Mandatory

ReferenceAlias Property Alias_CorpseKeyRef Auto Const Mandatory

LeveledItem Property LL_SE_GenericDerelict_LockedLootNote Auto Const Mandatory

LeveledItem Property LL_SE_GenericDerelict_Genetag Auto Const Mandatory

RefCollectionAlias Property Alias_GenericCorpses Auto Const Mandatory

Potion Property ShipRepairKit Auto Const Mandatory

GlobalVariable Property SE_GenericDerelict_Repaired Auto Const Mandatory

Keyword Property BlockPlayerActivation Auto Const Mandatory

ReferenceAlias Property Alias_PilotSeat Auto Const Mandatory

ReferenceAlias Property Alias_Captain Auto Const Mandatory

ReferenceAlias Property Alias_CaptainSpawnMarker Auto Const Mandatory

GlobalVariable Property SE_GenericDerelict_MissionCrewTypeGlobal Auto Const Mandatory

Hazard Property hazardToxicGas Auto Const Mandatory

Hazard Property hazardExtremeCold Auto Const Mandatory

Hazard Property hazardSpores Auto Const Mandatory

Hazard Property hazardNoOxygen Auto Const Mandatory

Hazard Property hazardRadiation Auto Const Mandatory

Hazard Property hazardExtremeHeat Auto Const Mandatory

Hazard Property hazardCorrosiveGas Auto Const Mandatory

ActorBase Property LvlRobotModelA_Combat Auto Const Mandatory

ActorBase Property creatures Auto Const Mandatory

Hazard Property hazardSteamHeat Auto Const Mandatory

LeveledItem Property LL_SE_GenericDerelict_RadiationNotes Auto Const Mandatory

LeveledItem Property LL_SE_GenericDerelict_NoOxygenNotes Auto Const Mandatory

LeveledItem Property LL_SE_GenericDerelict_ToxicGasNotes Auto Const Mandatory

LeveledItem Property LL_SE_GenericDerelict_BiohazardNotes Auto Const Mandatory

LeveledItem Property LL_SE_GenericDerelict_AIMalfunctionNotes Auto Const Mandatory

LeveledItem Property LL_SE_GenericDerelict_CorrosiveNotes Auto Const Mandatory

LeveledItem Property LL_SE_GenericDerelict_CreaturesNotes Auto Const Mandatory

LeveledItem Property LL_SE_GenericDerelict_ExtremeColdNotes Auto Const Mandatory

LeveledItem Property LL_SE_GenericDerelict_ExtremeHeatNotes Auto Const Mandatory

ActorValue Property Health Auto Const Mandatory

ReferenceAlias Property Alias_enemyShip Auto Const Mandatory

LocationAlias Property Alias_EnemyShipInteriorLocation Auto Const Mandatory

Keyword Property ENV_Loc_NotSealedEnvironment Auto Const Mandatory

RefCollectionAlias Property Alias_Containers Auto Const Mandatory

ReferenceAlias Property Alias_CaptainsLocker Auto Const Mandatory

ReferenceAlias Property Alias_Terminal Auto Const Mandatory

LeveledItem Property LL_SE_GenericDerelict_GenericNotes Auto Const Mandatory

GlobalVariable Property SE_GenericDerelict_IDCardGlobal Auto Const Mandatory

GlobalVariable Property SE_GenericDerelict_BlackboxGlobal Auto Const Mandatory

LeveledItem Property LL_SE_GenericDerelict_BlackboxData Auto Const Mandatory

Quest Property SE_GenericDerelict_IDCardQuest Auto Const Mandatory

Book Property SE_GenericDerelict_IDCardNote01 Auto Const Mandatory

Book Property SE_GenericDerelict_IDCardNote02 Auto Const Mandatory

Book Property SE_GenericDerelict_IDCardNote03 Auto Const Mandatory

Book Property SE_GenericDerelict_IDCardNote04 Auto Const Mandatory

ReferenceAlias Property Alias_IDCard02 Auto Const Mandatory

ReferenceAlias Property Alias_IDCard01 Auto Const Mandatory

ReferenceAlias Property Alias_IDCard03 Auto Const Mandatory

ReferenceAlias Property Alias_IDCard04 Auto Const Mandatory

ReferenceAlias Property Alias_Blackbox Auto Const Mandatory

MiscObject Property SE_GenericDerelict_BlackBox Auto Const Mandatory

Quest Property SE_GenericDerelict_BlackBoxQuest Auto Const Mandatory

GlobalVariable Property SE_GenericDerelict_LogsDownloaded Auto Const Mandatory

ReferenceAlias Property Alias_ExtraNote Auto Const Mandatory

RefCollectionAlias Property Alias_CrewSpawnMarkers Auto Const Mandatory

WwiseEvent Property pAlarm Auto Const Mandatory

ReferenceAlias Property Alias_ModuleCockpit Auto Const Mandatory

MiscObject Property Mfg_Tier01_AusteniticManifold Auto Const Mandatory

MiscObject Property Mfg_Tier02_ControlRod Auto Const Mandatory

MiscObject Property Mfg_Tier02_IsotopicCoolant Auto Const Mandatory

MiscObject Property Mfg_Tier01_ReactiveGauge Auto Const Mandatory

MiscObject Property Mfg_Tier01_StructuralFrame Auto Const Mandatory

MiscObject Property Mfg_Tier03_Quasineutralizer Auto Const Mandatory

RefCollectionAlias Property Alias_Robots Auto Const Mandatory

GlobalVariable Property SE_GenericDerelict_HazardFixed Auto Const Mandatory

ReferenceAlias Property Alias_RepairItem Auto Const Mandatory

ActorValue Property ShipSystemGravDriveHealth Auto Const Mandatory

ActorValue Property ShieldHealth Auto Const Mandatory

WwiseEvent Property ShipPowerOn Auto Const Mandatory

RefCollectionAlias Property Alias_ItemSpawnMarkers Auto Const Mandatory
