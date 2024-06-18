;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BE_Player_DerelictShip_Ca_0001EAE4 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
Alias_EnemyShipInteriorLocation.GetLocation().AddKeyword(LocTypeBEDerelict)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_01
Function Fragment_Stage_0000_Item_01()
;BEGIN CODE
SetObjectiveDisplayed(11)
Alias_EnemyShipInteriorLocation.GetLocation().AddKeyword(LocTypeBEDerelict)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
ObjectReference[] Turrets = Alias_GenericTurrets.GetArray()
ObjectReference[] Robots = Alias_GenericRobots.GetArray()

int x = Utility.RandomInt(0,1)
if x == 0 && SE_GenericDerelict_IDCardGlobal.GetValueInt() == 0
    SetStage(3)
else
    ;SetStage(2)
    ;PLAYTEST - temporarily forcing ID card stage until locked container functionality is in
    SetStage(3)
endif
Alias_Captain.GetActorRef().SnapIntoInteraction(Alias_CaptainSpawnMarker.GetRef())
Alias_Terminal.GetRef().SetLinkedRef(Turrets[0], LinkTerminalTurret, abPromoteParentRefr = false)
Alias_Terminal.GetRef().SetLinkedRef(Robots[0], LinkTerminalRobot, abPromoteParentRefr = false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
ObjectReference[] myContainers = Alias_Containers.GetArray()
int y = Utility.RandomInt(0, myContainers.Length-1)
int z = Utility.RandomInt(0, myCorpses.Length-1)
Alias_CorpseKeyRef.ForceRefTo(myCorpses[z])

ObjectReference myNPC = Alias_CorpseKeyRef.GetRef()
ObjectReference lootkey = myNPC.PlaceLockedRefKeyAtMe(myContainers[y])

myContainers[y].Lock(true)
myCorpses[z].AddItem(lootkey)
myCorpses[z].AddItem(LL_SE_GenericDerelict_LockedLootNote)

;Set Hazard
SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
int z = Utility.RandomInt(0, myCorpses.Length-1)
Alias_GeneTagRef.ForceRefTo(myCorpses[z])

if !SE_Derelict_IDCardQuest.IsRunning()
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
endif

int i = 1
while i < myCorpses.Length
    if (myCorpses[i].GetItemCount(ObjectTypeDataSlate) == 0)
        myCorpses[i].AddItem(LL_SE_GenericDerelict_GenericNotes)
    endif
    i += 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_01
Function Fragment_Stage_0003_Item_01()
;BEGIN CODE
;Set Hazard
SetStage(5)
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
int biohazard = utility.randomint(0,2)
if biohazard == 0
    kmyQuest.SetShipHazard(hazardExtremeCold)
elseif biohazard == 1
    kmyQuest.SetShipHazard(hazardExtremeColdBlast)
else
    kmyQuest.SetShipHazard(hazardExtremeColdLeak)
endif
kmyQuest.SetShipHazard(hazardExtremeCold)
ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
int z = Utility.RandomInt(0, myCorpses.Length-1)
Alias_ExtraNote.ForceRefTo(myCorpses[z])
Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_ExtremeColdNotes)

ObjectReference[] myContainers = Alias_Containers.GetArray()
int i = Utility.RandomInt(0, myContainers.Length-1)
myContainers[i].AddAliasedItem(Mfg_Tier01_ReactiveGauge, Alias_RepairItem)
myContainers[i].Lock(true)
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
int z = Utility.RandomInt(0, myCorpses.Length-1)
Alias_ExtraNote.ForceRefTo(myCorpses[z])
Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_NoOxygenNotes)

ObjectReference[] myContainers = Alias_Containers.GetArray()
int i = Utility.RandomInt(0, myContainers.Length-1)
myContainers[i].AddAliasedItem(Mfg_Tier01_StructuralFrame, Alias_RepairItem)
myContainers[i].Lock(true)
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
int z = Utility.RandomInt(0, myCorpses.Length-1)
Alias_ExtraNote.ForceRefTo(myCorpses[z])
Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_RadiationNotes)

ObjectReference[] myContainers = Alias_Containers.GetArray()
int i = Utility.RandomInt(0, myContainers.Length-1)
myContainers[i].AddAliasedItem(Mfg_Tier02_ControlRod, Alias_RepairItem)
myContainers[i].Lock(true)
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
int z = Utility.RandomInt(0, myCorpses.Length-1)
Alias_ExtraNote.ForceRefTo(myCorpses[z])
Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_ExtremeHeatNotes)

ObjectReference[] myContainers = Alias_Containers.GetArray()
int k = Utility.RandomInt(0, myContainers.Length-1)
myContainers[k].AddAliasedItem(Mfg_Tier02_ControlRod, Alias_RepairItem)
myContainers[k].Lock(true)
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
int z = Utility.RandomInt(0, myCorpses.Length-1)
Alias_ExtraNote.ForceRefTo(myCorpses[z])
Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_CorrosiveNotes)

ObjectReference[] myContainers = Alias_Containers.GetArray()
int k = Utility.RandomInt(0, myContainers.Length-1)
myContainers[k].AddAliasedItem(Mfg_Tier02_SemimetalWafer, Alias_RepairItem)
myContainers[k].Lock(true)
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
int z = Utility.RandomInt(0, myCorpses.Length-1)
Alias_ExtraNote.ForceRefTo(myCorpses[z])
Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_ToxicGasNotes)

ObjectReference[] myContainers = Alias_Containers.GetArray()
int k = Utility.RandomInt(0, myContainers.Length-1)
myContainers[k].AddAliasedItem(Mfg_Tier03_PowerCircuit, Alias_RepairItem)
myContainers[k].Lock(true)
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
SE_DerelictGeneric_MissionHazardGlobal.SetValue(6)

ObjectReference[] MarkersRef = Alias_CrewSpawnMarkers.GetArray()
ObjectReference[] myTurretMarkers = Alias_turretSpawnMarkers.GetArray()

int q = 0
while q < myTurretMarkers.Length
    ObjectReference turretRef = myTurretMarkers[q].PlaceAtMe(LvlTurretShort_aggro)
    Alias_GenericTurrets.AddRef(turretRef)
    q += 1
endWhile

ObjectReference[] myTurrets = Alias_GenericTurrets.GetArray()
ObjectReference TerminalRef = Alias_Terminal.GetRef()

int r = 0
int w = 1
while r < myTurrets.Length
    (myTurrets[r] as Actor).SetUnconscious(true)
    if w < myTurrets.Length
        myTurrets[r].SetLinkedRef(myTurrets[w], LinkTerminalTurret, abPromoteParentRefr = false)
    endif
    r += 1
    w += 1
endwhile


int iMaxSpawn = Utility.RandomInt(4,8)
int k = Utility.RandomInt(0,5)
int i = 0

if k == 0
    while i < iMaxSpawn && i < MarkersRef.Length
        ObjectReference CreatureRef = MarkersRef[i].PlaceAtMe(SEDerelict_LChar_HexapodAGlider)
        Alias_GenericCreatures.AddRef(CreatureRef)
        ObjectReference ShipModuleRef = MarkersRef[i].GetLinkedRef(LinkShipModule)
        CreatureRef.SetLinkedRef(ShipModuleRef, LinkShipModule, abPromoteParentRefr = false)
        i += 1
    endwhile
elseif k == 1
    while i < iMaxSpawn && i < MarkersRef.Length
        ObjectReference CreatureRef = MarkersRef[i].PlaceAtMe(SEDerelict_LChar_MantidACockroach)
        Alias_GenericCreatures.AddRef(CreatureRef)
        ObjectReference ShipModuleRef = MarkersRef[i].GetLinkedRef(LinkShipModule)
        CreatureRef.SetLinkedRef(ShipModuleRef, LinkShipModule, abPromoteParentRefr = false)
        i += 1
    endwhile
elseif k == 2
    while i < iMaxSpawn && i < MarkersRef.Length
        ObjectReference CreatureRef = MarkersRef[i].PlaceAtMe(SEDerelict_LChar_MantidACoralbug)
        Alias_GenericCreatures.AddRef(CreatureRef)
        ObjectReference ShipModuleRef = MarkersRef[i].GetLinkedRef(LinkShipModule)
        CreatureRef.SetLinkedRef(ShipModuleRef, LinkShipModule, abPromoteParentRefr = false)
        i += 1
    endwhile
elseif k == 3
    while i < iMaxSpawn && i < MarkersRef.Length
        ObjectReference CreatureRef = MarkersRef[i].PlaceAtMe(SEDerelict_LChar_MantidAHookneck)
        Alias_GenericCreatures.AddRef(CreatureRef)
        ObjectReference ShipModuleRef = MarkersRef[i].GetLinkedRef(LinkShipModule)
        CreatureRef.SetLinkedRef(ShipModuleRef, LinkShipModule, abPromoteParentRefr = false)
        i += 1
    endwhile
elseif k == 4
    while i < iMaxSpawn && i < MarkersRef.Length
        ObjectReference CreatureRef = MarkersRef[i].PlaceAtMe(SEDerelict_LChar_OctopedeAExocrawler)
        Alias_GenericCreatures.AddRef(CreatureRef)
        ObjectReference ShipModuleRef = MarkersRef[i].GetLinkedRef(LinkShipModule)
        CreatureRef.SetLinkedRef(ShipModuleRef, LinkShipModule, abPromoteParentRefr = false)
        i += 1
    endwhile
elseif k == 5
    while i < iMaxSpawn && i < MarkersRef.Length
        ObjectReference CreatureRef = MarkersRef[i].PlaceAtMe(SEDerelict_LChar_OctopedeAMaggotCrab)
        Alias_GenericCreatures.AddRef(CreatureRef)
        ObjectReference ShipModuleRef = MarkersRef[i].GetLinkedRef(LinkShipModule)
        CreatureRef.SetLinkedRef(ShipModuleRef, LinkShipModule, abPromoteParentRefr = false)
        i += 1
    endwhile
endif

ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
int z = Utility.RandomInt(0, myCorpses.Length-1)
Alias_ExtraNote.ForceRefTo(myCorpses[z])
Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_CreaturesNotes)

ObjectReference[] myContainers = Alias_Containers.GetArray()
int x = Utility.RandomInt(0, myContainers.Length-1)
myContainers[x].AddAliasedItem(Mfg_Tier03_CommRelay, Alias_RepairItem)
myContainers[x].Lock(true)

TerminalRef.SetLinkedRef(myTurrets[0], LinkTerminalTurret, abPromoteParentRefr = false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_07
Function Fragment_Stage_0005_Item_07()
;BEGIN AUTOCAST TYPE bescript
Quest __temp = self as Quest
bescript kmyQuest = __temp as bescript
;END AUTOCAST
;BEGIN CODE
SE_DerelictGeneric_MissionHazardGlobal.SetValue(7)

ObjectReference[] myMarkers = Alias_CrewSpawnMarkers.GetArray()
ObjectReference[] myRobots = Alias_GenericRobots.GetArray()
ObjectReference[] myTurretMarkers = Alias_turretSpawnMarkers.GetArray()

int q = 0
while q < myTurretMarkers.Length
    ObjectReference turretRef = myTurretMarkers[q].PlaceAtMe(LvlTurretShort_aggro)
    Alias_GenericTurrets.AddRef(turretRef)
    q += 1
endWhile

ObjectReference[] myTurrets = Alias_GenericTurrets.GetArray()
ObjectReference TerminalRef = Alias_Terminal.GetRef()

int r = 0
int w = 1
while r < myTurrets.Length
    (myTurrets[r] as Actor).SetUnconscious(true)
    if w < myTurrets.Length
        myTurrets[r].SetLinkedRef(myTurrets[w], LinkTerminalTurret, abPromoteParentRefr = false)
    endif
    r += 1
    w += 1
endwhile

int iMaxSpawn = Utility.RandomInt(4,8)
int i = 0
while i < myMarkers.Length && myRobots.Length < iMaxSpawn 
    ObjectReference Robot = myMarkers[i].PlaceAtMe(LvlRobotModelA_Combat)
    ObjectReference ShipModuleRef = myMarkers[i].GetLinkedRef(LinkShipModule)
    Robot.SetLinkedRef(ShipModuleRef, LinkShipModule, abPromoteParentRefr = false)
    Alias_Robots.AddRef(Robot)
    i += 4
endwhile

ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
int z = Utility.RandomInt(0, myCorpses.Length-1)
Alias_ExtraNote.ForceRefTo(myCorpses[z])
Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_AIMalfunctionNotes)

ObjectReference[] myContainers = Alias_Containers.GetArray()
int k = Utility.RandomInt(0, myContainers.Length-1)
myContainers[k].AddAliasedItem(Mfg_Tier03_CommRelay, Alias_RepairItem)
myContainers[k].Lock(true)

TerminalRef.SetLinkedRef(myTurrets[0], LinkTerminalTurret, abPromoteParentRefr = false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_08
Function Fragment_Stage_0005_Item_08()
;BEGIN AUTOCAST TYPE BE_DerelictScript
Quest __temp = self as Quest
BE_DerelictScript kmyQuest = __temp as BE_DerelictScript
;END AUTOCAST
;BEGIN CODE
ObjectReference[] myMarkers = Alias_CrewSpawnMarkers.GetArray()
ObjectReference[] myTurretMarkers = Alias_turretSpawnMarkers.GetArray()

int q = 0
while q < myTurretMarkers.Length && q < MaxSpawn
    ObjectReference turretRef = myTurretMarkers[q].PlaceAtMe(LvlTurretShort_aggro)
    Alias_GenericTurrets.AddRef(turretRef)
    q += 1
endWhile

ObjectReference[] myTurrets = Alias_GenericTurrets.GetArray()
ObjectReference TerminalRef = Alias_Terminal.GetRef()

int i = 0
int w = 1
while i < myTurrets.Length
    (myTurrets[i] as Actor).SetUnconscious(false)
    if w < myTurrets.Length
        myTurrets[i].SetLinkedRef(myTurrets[w], LinkTerminalTurret, abPromoteParentRefr = false)
    endif
    i += 1
    w += 1
endwhile

ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()
int z = Utility.RandomInt(0, myCorpses.Length-1)
Alias_ExtraNote.ForceRefTo(myCorpses[z])
Alias_ExtraNote.GetRef().AddItem(LL_SE_GenericDerelict_AIMalfunctionNotes)

ObjectReference[] myContainers = Alias_Containers.GetArray()
int k = Utility.RandomInt(0, myContainers.Length-1)
myContainers[k].AddAliasedItem(Mfg_Tier03_CommRelay, Alias_RepairItem)
myContainers[k].Lock(true)

TerminalRef.SetLinkedRef(myTurrets[0], LinkTerminalTurret, abPromoteParentRefr = false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_09
Function Fragment_Stage_0005_Item_09()
;BEGIN CODE
SetStage(13)
SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_10
Function Fragment_Stage_0005_Item_10()
;BEGIN CODE
ObjectReference[] myTurrets = Alias_GenericTurrets.GetArray()

int i = 0
while i < myTurrets.Length
    myTurrets[i].DisableNoWait()
    i += 1
endwhile
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
Alias_CaptainsLocker.GetRef().Lock(true)

ObjectReference[] myMarkers = Alias_ItemSpawnMarkers.GetArray()
;Adding slates to ship item markers
int d = 0
while d < myMarkers.Length
    Alias_mySlates.AddRef(myMarkers[d].PlaceAtme(LL_SE_GenericDerelict_GenericNotes_ChanceNone))
    d += 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
SE_GenericDerelict_UniqueEntry01Global.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
SE_GenericDerelict_WillbyGlobal.SetValue(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN CODE
ObjectReference[] myContainers = Alias_Containers.GetArray()
ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()

int d = 0
while d < myCorpses.Length
    Alias_MinerCrew.AddRef(myCorpses[d])
    ;(myCorpses[d] as Actor).SetOutfit(Outfit_Miner_All)
    if (myCorpses[d].GetItemCount(ObjectTypeDataSlate) == 0)
        myCorpses[d].AddItem(LL_SE_GenericDerelict_GenericNotes)
    endif
    d += 1
endwhile

int i = 0
while i < myContainers.Length
    myContainers[i].AddItem(LL_Loot_IcyAsteroid, 1)
    myContainers[i].AddItem(LL_Loot_RockyAsteroid, 1)
    i += 1
endwhile

ObjectReference MinerRef = Alias_Captain.GetRef()
Alias_MinerCrew.RemoveRef(MinerRef)
Alias_MinerCaptainName.ForceRefTo(MinerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_01
Function Fragment_Stage_0013_Item_01()
;BEGIN CODE
ObjectReference[] myContainers = Alias_Containers.GetArray()
ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()

int d = 0
while d < myCorpses.Length
    Alias_ScientistCrew.AddRef(myCorpses[d])
    ;myCorpses[d].AddItem(LL_Loot_Corpse_Scientist)
    (myCorpses[d] as Actor).SetOutfit(Outfit_Clothes_Science_Random_NoRyujin)
    if (myCorpses[d].GetItemCount(ObjectTypeDataSlate) == 0)
        myCorpses[d].AddItem(LL_SE_GenericDerelict_GenericNotes)
    endif
    d += 1
endwhile

BE_GenericDerelicCrewGlobal.SetValue(d)

ObjectReference ScientistRef = Alias_Captain.GetRef()
Alias_ScientistCrew.RemoveRef(ScientistRef)
Alias_ScientistCaptainName.ForceRefTo(ScientistRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_02
Function Fragment_Stage_0013_Item_02()
;BEGIN CODE
ObjectReference[] myContainers = Alias_Containers.GetArray()
ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()

int d = 0
while d < myCorpses.Length
    Alias_SurveyorCrew.AddRef(myCorpses[d])
    if (myCorpses[d].GetItemCount(ObjectTypeDataSlate) == 0)
        myCorpses[d].AddItem(LL_SE_GenericDerelict_GenericNotes)
        ;(myCorpses[d] as Actor).SetOutfit(Outfit_Miner_All)
    endif
    d += 1
endwhile

BE_GenericDerelicCrewGlobal.SetValue(d)

ObjectReference SurveyorRef = Alias_Captain.GetRef()
Alias_SurveyorCrew.RemoveRef(SurveyorRef)
Alias_SurveyorCaptainName.ForceRefTo(SurveyorRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_03
Function Fragment_Stage_0013_Item_03()
;BEGIN CODE
ObjectReference[] myContainers = Alias_Containers.GetArray()
ObjectReference[] myCorpses = Alias_GenericCorpses.GetArray()

int d = 0
while d < myCorpses.Length
    Alias_CargoCrew.AddRef(myCorpses[d])
    if (myCorpses[d].GetItemCount(ObjectTypeDataSlate) == 0)
        myCorpses[d].AddItem(LL_SE_GenericDerelict_GenericNotes)
        ;(myCorpses[d] as Actor).SetOutfit(Outfit_Miner_All)
    endif
    d += 1
endwhile

BE_GenericDerelicCrewGlobal.SetValue(d)

ObjectReference CargoRef = Alias_Captain.GetRef()
Alias_CargoCrew.RemoveRef(CargoRef)
Alias_CargoCaptainName.ForceRefTo(CargoRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_04
Function Fragment_Stage_0013_Item_04()
;BEGIN CODE
Actor CaptainRef = Alias_Captain.GetActorRef()
RE_Parent.KillWithForceNoWait(CaptainRef)
CaptainRef.SetOutfit(Outfit_Clothes_Ship_Captain_Hat)

BE_GenericDerelicCrewGlobal.SetValue(Alias_GenericCorpses.GetCount() + 1)
UpdateCurrentInstanceGlobal(BE_GenericDerelicCrewGlobal)

Alias_Terminal.GetRef().EnableNoWait()
Alias_ConsoleTerminals.EnableAll()
Alias_ConsoleTerminals_Engineering.EnableAll()
Alias_DockingTerminal.GetRef().EnableNoWait()
Alias_CargoTerminal.GetRef().EnableNoWait()
Alias_CrewTerminal.GetRef().EnableNoWait()
Alias_ScienceTerminal.GetRef().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0014_Item_00
Function Fragment_Stage_0014_Item_00()
;BEGIN CODE
Alias_Robots.KillAll()
SE_GenericDerelict_HazardFixed.SetValue(1)
SetObjectiveCompleted(11)
if !GetStageDone(15)
    SetObjectiveDisplayed(15)
endif
if !GetStageDone(20)
    SetObjectiveDisplayed(20)
endif
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
SpaceshipReference myShip = Alias_enemyShip.GetShipRef()
Alias_PilotSeat.GetRef().BlockActivation(False, False)
Alias_PilotSeat.Clear()
myShip.RestoreValue(Health, 50000)
myShip.RestoreValue(ShipSystemGravDriveHealth, 50000)
myShip.RestoreValue(ShieldHealth, 50000)
myShip.RestoreValue(ShipSystemShieldsHealth, 50000)
myShip.RestoreValue(ShipSystemEngineHealth, 50000)
kmyQuest.SetShipGravity(1)
SetObjectiveCompleted(10)
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_01
Function Fragment_Stage_0015_Item_01()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Mfg_Tier01_ReactiveGauge)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_02
Function Fragment_Stage_0015_Item_02()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Mfg_Tier01_StructuralFrame)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_03
Function Fragment_Stage_0015_Item_03()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Mfg_Tier02_ControlRod)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_04
Function Fragment_Stage_0015_Item_04()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Mfg_Tier02_IsotopicCoolant)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_05
Function Fragment_Stage_0015_Item_05()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Mfg_Tier02_SemimetalWafer)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_06
Function Fragment_Stage_0015_Item_06()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Mfg_Tier03_PowerCircuit)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_07
Function Fragment_Stage_0015_Item_07()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Mfg_Tier03_CommRelay)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0016_Item_00
Function Fragment_Stage_0016_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0017_Item_00
Function Fragment_Stage_0017_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
if !GetStageDone(15)
    SetObjectiveDisplayed(15)
endif
if !GetStageDone(20)
    SetObjectiveDisplayed(20)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0018_Item_00
Function Fragment_Stage_0018_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
MusicOverride.Remove()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0019_Item_00
Function Fragment_Stage_0019_Item_00()
;BEGIN CODE
SetStage(15)
SetStage(20)
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
TerminalRef.SetLinkedRef(Alias_CaptainsLocker.GetRef(), abPromoteParentRefr = false)
SetObjectiveCompleted(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_01
Function Fragment_Stage_0020_Item_01()
;BEGIN CODE
SpaceshipReference myShip = Alias_enemyShip.GetShipRef()
ObjectReference PilotSeatRef = Alias_PilotSeat.GetRef()

PilotSeatRef.RemoveKeyword(BlockPlayerActivation)
PilotSeatRef.BlockActivation(false, false)
Alias_PilotSeat.Clear()
myShip.RestoreValue(Health, 50000)
myShip.RestoreValue(ShipSystemGravDriveHealth, 50000)
myShip.RestoreValue(ShieldHealth, 50000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0021_Item_00
Function Fragment_Stage_0021_Item_00()
;BEGIN CODE
Alias_GenericTurrets.KillAll()
SetStage(14)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0022_Item_00
Function Fragment_Stage_0022_Item_00()
;BEGIN CODE
ObjectReference[] myTurrets = Alias_GenericTurrets.GetArray()
ObjectReference[] myRobots = Alias_Robots.GetArray()
Alias_Terminal.GetRef().SetLinkedRef(myTurrets[0], LinkTerminalTurret, abPromoteParentRefr = false)
Alias_Terminal.GetRef().SetLinkedRef(myRobots[0], LinkTerminalRobot, abPromoteParentRefr = false)
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

;BEGIN FRAGMENT Fragment_Stage_0066_Item_00
Function Fragment_Stage_0066_Item_00()
;BEGIN CODE
FailAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SE_GenericDerelict_TerminalGlobal.SetValue(0)
SE_GenericDerelict_TerminalCrewGlobal.SetValue(0)
SE_GenericDerelict_TerminalDockingGlobal.SetValue(0)

Alias_Terminal.GetRef().DisableNoWait()
Alias_ConsoleTerminals.DisableAll()
Alias_ConsoleTerminals_Engineering.DisableAll()
Alias_DockingTerminal.GetRef().DisableNoWait()
Alias_CargoTerminal.GetRef().DisableNoWait()
Alias_CrewTerminal.GetRef().DisableNoWait()
Alias_ScienceTerminal.GetRef().DisableNoWait()
SetObjectiveFailed(10)
MusicOverride.Remove()
Stop()
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

MiscObject Property Mfg_Tier02_ControlRod Auto Const Mandatory

MiscObject Property Mfg_Tier02_IsotopicCoolant Auto Const Mandatory

MiscObject Property Mfg_Tier01_ReactiveGauge Auto Const Mandatory

MiscObject Property Mfg_Tier01_StructuralFrame Auto Const Mandatory

RefCollectionAlias Property Alias_Robots Auto Const Mandatory

GlobalVariable Property SE_GenericDerelict_HazardFixed Auto Const Mandatory

ReferenceAlias Property Alias_RepairItem Auto Const Mandatory

ActorValue Property ShipSystemGravDriveHealth Auto Const Mandatory

ActorValue Property ShieldHealth Auto Const Mandatory

WwiseEvent Property ShipPowerOn Auto Const Mandatory

RefCollectionAlias Property Alias_ItemSpawnMarkers Auto Const Mandatory

RefCollectionAlias Property Alias_MySlates Auto Const Mandatory

LeveledItem Property LL_Loot_IcyAsteroid Auto Const Mandatory

LeveledItem Property LL_Loot_RockyAsteroid Auto Const Mandatory

LeveledItem Property LL_Loot_Corpse_Scientist Auto Const Mandatory

Outfit Property Outfit_Clothes_Science_Random_NoRyujin Auto Const Mandatory

Outfit Property Outfit_Miner_All Auto Const Mandatory

LeveledItem Property LL_Weapon_Cutter Auto Const Mandatory

LeveledItem Property LL_SE_GenericDerelict_GenericNotes_ChanceNone Auto Const Mandatory

RefCollectionAlias Property Alias_MinerCrew Auto Const Mandatory

ReferenceAlias Property Alias_MinerCaptainName Auto Const Mandatory

RefCollectionAlias Property Alias_ScientistCrew Auto Const Mandatory

RefCollectionAlias Property Alias_SurveyorCrew Auto Const Mandatory

RefCollectionAlias Property Alias_CargoCrew Auto Const Mandatory

ReferenceAlias Property Alias_ScientistCaptainName Auto Const Mandatory

ReferenceAlias Property Alias_SurveyorCaptainName Auto Const Mandatory

ReferenceAlias Property Alias_CargoCaptainName Auto Const Mandatory

GlobalVariable Property BE_GenericDerelicCrewGlobal Auto Const Mandatory

GlobalVariable Property SE_GenericDerelict_TerminalGlobal Auto Const Mandatory

GlobalVariable Property SE_GenericDerelict_TerminalCrewGlobal Auto Const Mandatory

GlobalVariable Property SE_GenericDerelict_TerminalDockingGlobal Auto Const Mandatory

Keyword Property ObjectTypeDataSlate Auto Const Mandatory

RefCollectionAlias Property Alias_GenericTurrets Auto Const Mandatory

GlobalVariable Property SE_GenericDerelict_TerminalCrewEquipmentGlobal Auto Const Mandatory

GlobalVariable Property SE_GenericDerelict_TerminalVoteTallyGlobal Auto Const Mandatory

GlobalVariable Property SE_GenericDerelict_UniqueEntry01Global Auto Const Mandatory

MiscObject Property Mfg_Tier02_SemimetalWafer Auto Const Mandatory

MiscObject Property Mfg_Tier03_PowerCircuit Auto Const Mandatory

MiscObject Property Mfg_Tier03_CommRelay Auto Const Mandatory

RefCollectionAlias Property Alias_GenericCreatures Auto Const Mandatory

ActorBase Property LvlBECrew Auto Const Mandatory

LeveledActor Property SEDerelict_LChar_HexapodAGlider Auto Const Mandatory

LeveledActor Property SEDerelict_LChar_MantidACockroach Auto Const Mandatory

LeveledActor Property SEDerelict_LChar_MantidACoralbug Auto Const Mandatory

LeveledActor Property SEDerelict_LChar_MantidAHookneck Auto Const Mandatory

LeveledActor Property SEDerelict_LChar_OctopedeAExocrawler Auto Const Mandatory

LeveledActor Property SEDerelict_LChar_OctopedeAMaggotCrab Auto Const Mandatory

RefCollectionAlias Property Alias_TerminalCollection Auto Const Mandatory

Outfit Property Outfit_Clothes_Ship_Captain_Hat Auto Const Mandatory

Explosion Property BE_KT02_ExplosionHavok Auto Const Mandatory

RefCollectionAlias Property Alias_GenericRobots Auto Const Mandatory

RefCollectionAlias Property Alias_ConsoleTerminals Auto Const Mandatory

ReferenceAlias Property Alias_DockingTerminal Auto Const Mandatory

ReferenceAlias Property Alias_CrewTerminal Auto Const Mandatory

RefCollectionAlias Property Alias_ConsoleTerminals_Engineering Auto Const Mandatory

ReferenceAlias Property Alias_CargoTerminal Auto Const Mandatory

reparentscript Property RE_Parent Auto Const Mandatory

ReferenceAlias Property Alias_ScienceTerminal Auto Const Mandatory

ActorValue Property BE_SpaceshipTakenOver Auto Const Mandatory

MusicType Property MusicOverride Auto Const Mandatory

Keyword Property LinkTerminalTurret Auto Const Mandatory

Keyword Property LinkTerminalRobot Auto Const Mandatory

GlobalVariable Property SE_GenericDerelict_WillbyGlobal Auto Const Mandatory

Hazard Property hazardExtremeColdBlast Auto Const Mandatory

Hazard Property hazardExtremeColdLeak Auto Const Mandatory

ActorValue Property ShipSystemShieldsHealth Auto Const Mandatory

ActorValue Property ShipSystemEngineHealth Auto Const Mandatory

Int Property MaxSpawn Auto Const

Keyword Property LinkShipModule Auto Const Mandatory

Keyword Property LocTypeBEDerelict Auto Const Mandatory

RefCollectionAlias Property Alias_turretSpawnMarkers Auto Const Mandatory

ActorBase Property LvlTurretShort_aggro Auto Const Mandatory

RefCollectionAlias Property Alias_GenericCrew Auto Const Mandatory

Quest Property SE_Derelict_IDCardQuest Auto Const Mandatory
