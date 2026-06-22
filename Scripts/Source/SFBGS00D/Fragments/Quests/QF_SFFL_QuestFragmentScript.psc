;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_QuestFragmentScript Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Alias_AbandonedOutpostLocation.RefillAlias()
Utility.Wait(1)
Alias_AbandonedOutpostLocation.RefillDependentAliases()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
WeatherThunderstormList.SetActive(abOverride = true, abAccelerate = true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
Weather.ReleaseOverride()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
SFBGS00D_MS_HW_HelpWanted_MiscDialogue.SetStage(10)
SFBGS00D_MS_HW_HelpWanted_MiscDialogue.SetStage(20)
SFBGS00D_MS_HW_HelpWanted_MiscDialogue.SetStage(25)
SFBGS00D_MS_HW_HelpWanted_MiscDialogue.SetStage(30)
SFBGS00D_MS_HW_HelpWanted_MiscDialogue.SetStage(40)
Game.GetPlayer().MoveTo(Alias_MapMarker.GetRef())
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
ObjectReference MagnetRef = Alias_MagnetAnimHelper.GetRef()
MagnetRef.SetAnimationVariableFloat("Speed", 0.02)
MagnetRef.SetAnimationVariableFloat("Position", 0.1)
Actor RobotRef = Alias_Robot.GetActorRef()
RobotRef.SnapIntoInteraction(Alias_Robot_Pod.GetRef())
RobotRef.BlockActivation(true, true)
ObjectReference DoorRef = Alias_Caruso_Door.GetRef()
DoorRef.SetOpen(true)
DoorRef.BlockActivation(true, true)
ObjectReference ChurchDoorRef = Alias_Yates_Door.GetRef()
ChurchDoorRef.SetLockLevel(255)
ChurchDoorRef.SetOpen(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
SFBGS00D_MS_HW_HelpWanted_MiscDialogue.SetStage(10)
SFBGS00D_MS_HW_HelpWanted_MiscDialogue.SetStage(20)
SFBGS00D_MS_HW_HelpWanted_MiscDialogue.SetStage(25)
SFBGS00D_MS_HW_HelpWanted_MiscDialogue.SetStage(30)
SFBGS00D_MS_HW_HelpWanted_MiscDialogue.SetStage(40)
Game.GetPlayer().MoveTo(Alias_MapMarker.GetRef())
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
SFBGS00D_MS_HW_HelpWanted_MiscDialogue.SetStage(10)
SFBGS00D_MS_HW_HelpWanted_MiscDialogue.SetStage(20)
SFBGS00D_MS_HW_HelpWanted_MiscDialogue.SetStage(25)
SFBGS00D_MS_HW_HelpWanted_MiscDialogue.SetStage(30)
SFBGS00D_MS_HW_HelpWanted_MiscDialogue.SetStage(40)
SetStage(20)
SetStage(100)
SFBGS00D_MS_HW_Quest_100_Scene01.Stop()
SetStage(5)
SetStage(110)
SetStage(120)
SetStage(125)
SetStage(126)
SetStage(130)
SFBGS00D_MS_HW_Quest_130_Scene03.Stop()
SetStage(140)
SetStage(170)
SetStage(260)
SetStage(1000)
;SetStage(2000)
SFBGS00D_MS_HW_Quest_140_Caruso_Greet.Stop()
SFBGS00D_MS_HW_Quest_150_Caruso_Greet.Stop()
SetStage(8)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
SetStage(170)
SetStage(260)
SetStage(1000)
Game.GetPlayer().MoveTo(Alias_NewBabylonMapMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
SetStage(7)
SetStage(2540)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
Alias_Computer.GetRef().EnableNoWait()
Alias_GraceKim.GetRef().SetLinkedRef(Alias_VendorContainerDoc.GetRef(), VendorContainerKeyword01)
Alias_Ivica.GetRef().SetLinkedRef(Alias_VendorContainer.GetRef(), VendorContainerKeyword01)
SFFL_MS01_DoctorDialogue.Start()
NewBabylonPostQuestLocationAlias.ForceLocationTo(Alias_NewBabylonLocation.GetLocation())
NewBabylonPostQuestLocationAlias.RefillDependentAliases()

ObjectReference YeatsRef = Alias_Yeats.GetRef()
ObjectReference ZenaRef = Alias_Zena.GetRef()
ObjectReference IvicaRef = Alias_Ivica.GetRef()
ObjectReference SunniRef = Alias_SunniKim.GetRef()
ObjectReference GraceRef = Alias_GraceKim.GetRef()
ObjectReference CaspianRef = Alias_Alphonse.GetRef()
ObjectReference SashaRef = Alias_Guard.GetRef()

YeatsAlias.ForceRefTo(YeatsRef)
IvicaAlias.ForceRefTo(IvicaRef)
GraceAlias.ForceRefTo(GraceRef)
SunniAlias.ForceRefTo(SunniRef)
SashaAlias.ForceRefTo(SashaRef)
CaspianAlias.ForceRefTo(CaspianRef)
ZenaAlias.ForceRefTo(ZenaRef)

Alias_BabylonResidents.AddRef(YeatsRef)
Alias_BabylonResidents.AddRef(IvicaRef)
Alias_BabylonResidents.AddRef(GraceRef)
Alias_BabylonResidents.AddRef(SunniRef)
Alias_BabylonResidents.AddRef(SashaRef)
Alias_BabylonResidents.AddRef(CaspianRef)
Alias_BabylonResidents.AddRef(ZenaRef)
Alias_BabylonResidents.AddRef(Alias_Caruso.GetRef())
;Alias_BabylonResidents.AddRef(Alias_Robot.GetRef())

Planet BabylonPlanet = Alias_NewBabylonMapMarker.GetRef().GetCurrentPlanet()
Alias_parentLocation.ForceLocationTo(BabylonPlanet.GetLocation())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
ObjectReference YeatsRef = Alias_Yeats.GetRef()
ObjectReference ZenaRef = Alias_Zena.GetRef()
ObjectReference IvicaRef = Alias_Ivica.GetRef()
ObjectReference SunniRef = Alias_SunniKim.GetRef()
ObjectReference GraceRef = Alias_GraceKim.GetRef()
ObjectReference CaspianRef = Alias_Alphonse.GetRef()
ObjectReference SashaRef = Alias_Guard.GetRef()

YeatsAlias.ForceRefTo(YeatsRef)
IvicaAlias.ForceRefTo(IvicaRef)
GraceAlias.ForceRefTo(GraceRef)
SunniAlias.ForceRefTo(SunniRef)
SashaAlias.ForceRefTo(SashaRef)
CaspianAlias.ForceRefTo(CaspianRef)
ZenaAlias.ForceRefTo(ZenaRef)

Alias_BabylonResidents.AddRef(YeatsRef)
Alias_BabylonResidents.AddRef(IvicaRef)
Alias_BabylonResidents.AddRef(GraceRef)
Alias_BabylonResidents.AddRef(SunniRef)
Alias_BabylonResidents.AddRef(SashaRef)
Alias_BabylonResidents.AddRef(CaspianRef)
Alias_BabylonResidents.AddRef(ZenaRef)
Alias_BabylonResidents.AddRef(Alias_Caruso.GetRef())
;Alias_BabylonResidents.AddRef(Alias_Robot.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
if !GetStageDone(2585) && GetStageDone(2905) && GetStageDone(2730)
    SFFL_MS01_Quest_e2920_ZenaVoteCarusoShot.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN CODE
WeatherThunderstormList.SetActive(abOverride = true, abAccelerate = true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0014_Item_00
Function Fragment_Stage_0014_Item_00()
;BEGIN CODE
WeatherThunderstormList.SetActive(abOverride = true, abAccelerate = true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0019_Item_00
Function Fragment_Stage_0019_Item_00()
;BEGIN CODE
SFBGS00D_MS_HW_Quest_Scenes_Vote_Alphonse.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
Alias_Bernhard.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
WeatherClearList.SetActive()
Game.SetLocalTime(8.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN CODE
Weather.ReleaseOverride()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveCompleted(20)
SetObjectiveSkipped(30)
if !GetStageDone(110)
    SFBGS00D_MS_HW_Quest_Scene01.Start()
    Alias_Caruso.GetRef().MoveTo(Alias_Caruso_Start.GetRef())
endif

Alias_Yeats_Activator.GetRef().SetLinkedRef(Alias_Yeats.GetRef())
Alias_LoreSlates.EnableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetObjectiveSkipped(10)
SetObjectiveSkipped(20)
SetObjectiveSkipped(30)
SetObjectiveDisplayed(110)
Alias_Yeats_Activator.GetRef().SetLinkedRef(Alias_Yeats.GetRef())
Alias_LoreSlates.EnableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
SFBGS00D_MS_HW_Quest_Scene02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110)
SetObjectiveDisplayed(130)
SFBGS00D_MS_HW_Quest_110_Scene02.Stop()
SFBGS00D_MS_HW_Quest_130_Scene03.Start()
ObjectReference DoorRef = Alias_Caruso_Door.GetRef()
DoorRef.SetOpen(true)
DoorRef.BlockActivation(false, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_MS01_QuestScript
Quest __temp = self as Quest
SFBGS00D:SFFL_MS01_QuestScript kmyQuest = __temp as SFBGS00D:SFFL_MS01_QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(130)
SetObjectiveDisplayed(150)
ObjectReference CaspianRef = Alias_Alphonse.GetRef()
ObjectReference SashaRef = Alias_Guard.GetRef()
ObjectReference GraceRef = Alias_GraceKim.GetRef()
ObjectReference SunniRef = Alias_SunniKim.GetRef()
ObjectReference IvicaRef = Alias_Ivica.GetRef()
ObjectReference ZenaRef = Alias_Zena.GetRef()
Alias_Yeats.GetRef().DisableNoWait()

CaspianRef.MoveTo(CaspianRef.GetLinkedRef(LinkCustom01))
SashaRef.MoveTo(SashaRef.GetLinkedRef(LinkCustom01))
GraceRef.MoveTo(GraceRef.GetLinkedRef(LinkCustom01))
SunniRef.MoveTo(SunniRef.GetLinkedRef(LinkCustom01))
IvicaRef.MoveTo(IvicaRef.GetLinkedRef(LinkCustom01))
ZenaRef.MoveTo(ZenaRef.GetLinkedRef(LinkCustom01))
Alias_Caruso_KitchenMarker.GetRef().DisableNoWait()
Alias_BabylonResidents.EvaluateAll()
Actor CarusoRef = Alias_Caruso.GetActorRef()
Alias_BabylonResidents.RemoveRef(CarusoRef)
CarusoRef.SetCrimeFaction(None)
CarusoRef.RemoveFromAllFactions()
CarusoRef.SetValue(Aggression, 2)
CarusoRef.SetEssential(False)
CarusoRef.AddtoFaction(PlayerEnemyFaction)
ObjectReference DoorRef = Alias_Caruso_Door.GetRef()
DoorRef.SetOpen(false)
DoorRef.BlockActivation(true, true)
kmyQuest.SFFL_MS01_Layer = InputEnableLayer.Create()
kmyQuest.SFFL_MS01_Layer.EnableFastTravel(false)
Alias_PilotSeat.GetRef().BlockActivation(true, true)
ObjectReference[] exteriorloadDoors = Alias_PlayerShip.GetShipRef().GetExteriorLoadDoors()
    int i = 0
    While (i < exteriorLoadDoors.Length)
        exteriorLoadDoors[i].BlockActivation(true, true)
        i += 1
    EndWhile
SFFL_MS01_NewBabylonFaction.SetCrimeGoldViolent(0)
SFFL_MS01_NewBabylonFaction.SetCrimeGold(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
ObjectReference DoorRef = Alias_Caruso_Door.GetRef()
DoorRef.BlockActivation(false, false)
DoorRef.SetOpen(true)

if GetStageDone(150)
    SetObjectiveCompleted(150)
    SetObjectiveDisplayed(160)
    SetObjectiveDisplayed(170)
    SetStage(190)
else
    SetStage(4000)
endif
Game.GetPlayer().SetValue(SFFL_MS01_CarusoDies, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_01
Function Fragment_Stage_0160_Item_01()
;BEGIN CODE
SetStage(4000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0165_Item_00
Function Fragment_Stage_0165_Item_00()
;BEGIN CODE
SetStage(170)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0166_Item_00
Function Fragment_Stage_0166_Item_00()
;BEGIN CODE
SetStage(170)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN CODE
SetObjectiveCompleted(130)
SetStage(190)
SFBGS00D_MS_HW_Quest_140_Caruso_Greet.Stop()
SFBGS00D_MS_HW_Quest_150_Caruso_Greet.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveCompleted(170)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
Actor[] ResidentsRef = Alias_BabylonResidents.GetActorArray()
int i = 0
while i < ResidentsRef.Length
    ResidentsRef[i].MoveTo(ResidentsRef[i].GetLinkedRef(LinkCustom01))
    ResidentsRef[i].EvaluatePackage()
    i += 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(130)
SetObjectiveDisplayed(200)
Alias_Caruso.GetActorRef().EvaluatePackage()
SetStage(190)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_01
Function Fragment_Stage_0260_Item_01()
;BEGIN CODE
SFBGS00D_MS_HW_Quest_160_CarusoDead_Zena01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_MS01_QuestScript
Quest __temp = self as Quest
SFBGS00D:SFFL_MS01_QuestScript kmyQuest = __temp as SFBGS00D:SFFL_MS01_QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(300)
SetStage(3010)
kmyQuest.SFFL_MS01_Layer.Delete()
Alias_PilotSeat.GetRef().BlockActivation(false, false)
ObjectReference[] exteriorloadDoors = Alias_PlayerShip.GetShipRef().GetExteriorLoadDoors()
    int i = 0
    While (i < exteriorLoadDoors.Length)
        exteriorLoadDoors[i].BlockActivation(false, false)
        i += 1
    EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1000)
SetObjectiveCompleted(1110)
SetObjectiveCompleted(1120)
SetObjectiveDisplayed(1100)


if !GetStageDone(1100)
    Actor PlayerRef = Game.GetPlayer()
    PlayerRef.RemoveItem(SFBGS00D_MS_HW_Power_Cell, 1, abSilent = true)  
    PlayerRef.AddAliasedItem(SFBGS00D_MS_HW_Power_Cell, Alias_Robot_PowerCell01, abSilent = true)
endif 

Actor RobotRef = Alias_Robot.GetActorRef()
RobotRef.SnapIntoInteraction(Alias_Robot_Pod.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0910_Item_00
Function Fragment_Stage_0910_Item_00()
;BEGIN CODE
SFBGS00D_MS_HW_Quest_c2000_Yates_OpeningScene.Stop()
;SFBGS00D_MS_HW_Quest_c2100_Yeats_Intro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_MS01_QuestScript
Quest __temp = self as Quest
SFBGS00D:SFFL_MS01_QuestScript kmyQuest = __temp as SFBGS00D:SFFL_MS01_QuestScript
;END AUTOCAST
;BEGIN CODE
ObjectReference DoorRef = Alias_Caruso_Door.GetRef()
DoorRef.SetOpen(true)
DoorRef.BlockActivation(false, false)
kmyQuest.SFFL_MS01_Layer.Delete()
FailAllObjectives()
Weather.ReleaseOverride()
Alias_BabylonResidents.RemoveFromFaction(CaptiveFaction)
Alias_BabylonResidents.AddtoFaction(PlayerEnemyFaction)
Alias_BabylonResidents.SetValue(Aggression, 1)
;Alias_BabylonResidents.StartCombatAll(Game.GetPlayer())
Actor CarusoRef = Alias_Caruso.GetActorRef()
if CarusoRef.IsInLocation(Alias_NewBabylonLocation.GetLocation())
    CarusoRef.AddtoFaction(PlayerEnemyFaction)
    CarusoRef.SetValue(Aggression, 1)
endif
Alias_MusicObjectShinar.GetRef().DisableNoWait()
SFFL_MS01_MiscDialogue.SetStage(100)
Alias_PilotSeat.GetRef().BlockActivation(false, false)
ObjectReference[] exteriorloadDoors = Alias_PlayerShip.GetShipRef().GetExteriorLoadDoors()
    int i = 0
    While (i < exteriorLoadDoors.Length)
        exteriorLoadDoors[i].BlockActivation(false, false)
        i += 1
    EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_01
Function Fragment_Stage_10000_Item_01()
;BEGIN CODE
Actor Bernhard = Alias_Bernhard.GetActorRef()

Bernhard.AddtoFaction(PlayerEnemyFaction)
Bernhard.StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(250)

if !GetStageDone(1120)
    SetObjectiveDisplayed(1000)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1020_Item_00
Function Fragment_Stage_1020_Item_00()
;BEGIN CODE
Alias_Cave_BreakableWall.GetRef().PlayAnimation("Stage2")
SFFL_MS01_Quest_b1100_Ivica_SceneDrilling.Start()
Utility.Wait(4)
SetStage(1030)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1030_Item_00
Function Fragment_Stage_1030_Item_00()
;BEGIN CODE
Alias_Cave_BoringMachine.GetRef().PlayAnimation("Stage2")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1000)
SetObjectiveDisplayed(1100)
ObjectReference PowerCellRef = Alias_JunkyardSwitch.GetRef().PlaceAtMe(SFBGS00D_MS_HW_Power_Cell)

Game.GetPlayer().AddItem(PowerCellRef)
Alias_Robot_PowerCell01.ForceRefTo(PowerCellRef)
Actor RobotRef = Alias_Robot.GetActorRef()
RobotRef.SnapIntoInteraction(Alias_Robot_Pod.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1110_Item_00
Function Fragment_Stage_1110_Item_00()
;BEGIN CODE
if !GetStageDone(1100) && !GetStageDone(900)
    SetObjectiveDisplayed(1110)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1120_Item_00
Function Fragment_Stage_1120_Item_00()
;BEGIN CODE
Actor RobotRef = Alias_Robot.GetActorRef()
SetObjectiveSkipped(1000)
RobotRef.SetUnconscious(false)
RobotRef.BlockActivation(false, false)
RobotRef.EvaluatePackage()
RobotRef.AddToFaction(SFFL_MS01_NewBabylonFaction)
RobotRef.SetCrimeFaction(SFFL_MS01_NewBabylonFaction)
SetObjectiveCompleted(1100)
SetObjectiveSkipped(1120)
SetObjectiveDisplayed(1146)
SetObjectiveDisplayed(1150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1125_Item_00
Function Fragment_Stage_1125_Item_00()
;BEGIN CODE
Alias_JunkyardParts.EnableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1130_Item_00
Function Fragment_Stage_1130_Item_00()
;BEGIN CODE
SetObjectiveSkipped(1146)
SetObjectiveCompleted(1150)
if !GetStageDone(2000)
    SetObjectiveCompleted(250, false)
    SetObjectiveDisplayed(250, true, true)
endif
if GetStageDone(2450)
    SetObjectiveDisplayed(2520)
    ;kmyQuest.RegisterForSleep()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1140_Item_00
Function Fragment_Stage_1140_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1146)
SetObjectiveDisplayed(1140)
SetObjectiveSkipped(1150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1145_Item_00
Function Fragment_Stage_1145_Item_00()
;BEGIN CODE
Alias_Robot.GetActorRef().KillEssential()
SetObjectiveCompleted(1140)
SetObjectiveDisplayed(1145)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1150_Item_00
Function Fragment_Stage_1150_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_Robot_DeathItemSpareParts.GetRef())
if GetStageDone(1130)
    SetObjectiveCompleted(1150, false)
endif
SetObjectiveCompleted(1140)
SetObjectiveCompleted(1145)
SetObjectiveDisplayed(1150)
SFFL_MS01_GeneratorsStabilized.SetValue(1)
Alias_Ivica.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1155_Item_00
Function Fragment_Stage_1155_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1150)
if !GetStageDone(2000)
    SetObjectiveCompleted(250, false)
    SetObjectiveDisplayed(250, true, true)
endif

if GetStageDone(2450)
    SetObjectiveDisplayed(2520)
    ;kmyQuest.RegisterForSleep()
endif

Alias_Cave_BoringMachine.GetRef().PlayAnimation("Stage1")
Alias_Ivica.GetActorRef().EvaluatePackage()
SetStage(1010)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1220_Item_00
Function Fragment_Stage_1220_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(SFBGS00D_MS_HW_Keycard)
SetObjectiveDisplayed(1110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1302_Item_00
Function Fragment_Stage_1302_Item_00()
;BEGIN CODE
SetStage(2004)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1303_Item_00
Function Fragment_Stage_1303_Item_00()
;BEGIN CODE
SetStage(2004)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_20000_Item_00
Function Fragment_Stage_20000_Item_00()
;BEGIN CODE
if GetStageDone(150)
    Alias_BabylonResidents.DisableAll()
endif
Weather.ReleaseOverride()
Alias_MusicObjectShinar.GetRef().DisableNoWait()
    Alias_Zena_Podium.GetRef().SetFactionOwner(SFFL_MS01_NewBabylonYeatsFaction)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
if GetStageDone(1000)
    SetObjectiveCompleted(250)
endif
SetObjectiveDisplayed(2000)

ObjectReference DoorRef = Alias_Yates_Door.GetRef()
DoorRef.SetLockLevel(0)
DoorRef.Lock(false)
DoorRef.SetOpen(false)
SFFL_MS01_PrisonDoorUnlocked.SetValue(1)

Actor GuardRef = Alias_Guard.GetActorRef()
GuardRef.MoveTo(Alias_Guard_YatesSpeech.GetRef())
GuardRef.EvaluatePackage()

Alias_Alphonse.GetRef().DisableNoWait()
Alias_Yeats_Activator.GetRef().SetLinkedRef(Alias_Yeats.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2001_Item_00
Function Fragment_Stage_2001_Item_00()
;BEGIN CODE
SFBGS00D_MS_HW_ReligionGlobal.SetValue(1)
;Alias_Yeats.GetActorRef().SetOutfit(Outfit_Clothes_Formal_ShirtSlacks_Vest)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2002_Item_00
Function Fragment_Stage_2002_Item_00()
;BEGIN CODE
SFBGS00D_MS_HW_ReligionGlobal.SetValue(2)
;Alias_Yeats.GetActorRef().SetOutfit(Outfit_Clothes_Sanctum_Priest_with_Hat)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2003_Item_00
Function Fragment_Stage_2003_Item_00()
;BEGIN CODE
SFBGS00D_MS_HW_ReligionGlobal.SetValue(3)
;Alias_Yeats.GetActorRef().SetOutfit(Outfit_Clothes_Sanctum_Priest_with_Hat)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2004_Item_00
Function Fragment_Stage_2004_Item_00()
;BEGIN CODE
SFBGS00D_MS_HW_ReligionGlobal.SetValue(4)
;Alias_Yeats.GetActorRef().SetOutfit(Outfit_Clothes_Formal_ShirtSlacks_Vest)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2010_Item_00
Function Fragment_Stage_2010_Item_00()
;BEGIN CODE
SetStage(2100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2100_Item_00
Function Fragment_Stage_2100_Item_00()
;BEGIN CODE
SFBGS00D_MS_HW_Quest_c2000_Yates_OpeningScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2200_Item_00
Function Fragment_Stage_2200_Item_00()
;BEGIN CODE
Alias_Alphonse.GetRef().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2300_Item_00
Function Fragment_Stage_2300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2000)
SetObjectiveDisplayed(2300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2310_Item_00
Function Fragment_Stage_2310_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2300)
if !GetStageDone(2330)
    SetObjectiveDisplayed(2310)
endif
Alias_Alphonse.GetRef().MoveTo(Alias_Alphonse_Supply01.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2320_Item_00
Function Fragment_Stage_2320_Item_00()
;BEGIN CODE
SFBGS00D_MS_HW_Quest_c2320_Alphonese_Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2330_Item_00
Function Fragment_Stage_2330_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2300)
SetObjectiveCompleted(2310)
if !GetStageDone(2340)
    Game.GetPlayer().AddItem(SFFL_MS01_DumpsterKeycard)
endif
if GetStageDone(2332) && GetStageDone(2331)
    SetStage(2340)
    SetObjectiveDisplayed(2340)
else
    SetObjectiveDisplayed(2330)
endif
;Alias_DumpsterClosed.GetRef().DisableNoWait()
SFBGS00D_MS_HW_Quest_c2320_Alphonese_Scene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2331_Item_00
Function Fragment_Stage_2331_Item_00()
;BEGIN CODE
if GetStageDone(2331) && GetStageDone(2320)
    SetStage(2340)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2332_Item_00
Function Fragment_Stage_2332_Item_00()
;BEGIN CODE
if GetStageDone(2332) && GetStageDone(2320)
    SetStage(2340)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2340_Item_00
Function Fragment_Stage_2340_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2330)
if GetStageDone(2330)
    SetObjectiveDisplayed(2340)
endif
Alias_Caruso.GetRef().MoveTo(Alias_Guard_YatesSpeech.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2345_Item_00
Function Fragment_Stage_2345_Item_00()
;BEGIN CODE
SFBGS00D_MS_HW_Quest_Scenes_YeatsCaruso.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2355_Item_00
Function Fragment_Stage_2355_Item_00()
;BEGIN CODE
SetStage(2360)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2360_Item_00
Function Fragment_Stage_2360_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2340)
SetObjectiveDisplayed(2360)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2367_Item_00
Function Fragment_Stage_2367_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2370)
if GetStageDone(2370)
    SetObjectiveDisplayed(2380)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2370_Item_00
Function Fragment_Stage_2370_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2360)
if GetStageDone(2367)
    SetObjectiveDisplayed(2380)
else
    SetObjectiveDisplayed(2370)
endif
ObjectReference GuardRef = Alias_Guard.GetRef()

GuardRef.MoveTo(GuardRef.GetLinkedRef(LinkCustom04))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2398_Item_00
Function Fragment_Stage_2398_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Credits, OE_Credit_BribeHigh.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2399_Item_00
Function Fragment_Stage_2399_Item_00()
;BEGIN CODE
SFFL_MS01_SQ_Doctors_Price_Addictions.SetValue(225)
SFFL_MS01_SQ_Doctors_Price_Afflictions.SetValue(250)
SFFL_MS01_SQ_Doctors_Price_Everything.SetValue(375)
SFFL_MS01_SQ_Doctors_Price_Wounds.SetValue(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2400_Item_00
Function Fragment_Stage_2400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2310)
SetObjectiveDisplayed(2330)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2410_Item_00
Function Fragment_Stage_2410_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2360)
SetObjectiveCompleted(2380)
SetObjectiveDisplayed(2415)
Actor PlayerRef = Game.GetPlayer()
ObjectReference OreRef = PlayerRef.PlaceAtMe(SFBGS00D_MS_HW_StolenInorgUniqueCaelumite)
PlayerRef.AddItem(OreRef)
Alias_Grace_Caelumite.ForceRefTo(OreRef)
Actor GuardRef = Alias_Guard.GetActorRef()
GuardRef.MoveTo(Alias_Guard_YatesSpeech.GetRef())
GuardRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2415_Item_00
Function Fragment_Stage_2415_Item_00()
;BEGIN CODE
SFBGS00D_MS_HW_Quest_Scenes_YeatsCarusoSasha.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2418_Item_00
Function Fragment_Stage_2418_Item_00()
;BEGIN CODE
SFBGS00D_MS_HW_SunniConvicted.SetValue(1)
SetStage(2420)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2419_Item_00
Function Fragment_Stage_2419_Item_00()
;BEGIN CODE
SFBGS00D_MS_HW_GraceConvicted.SetValue(1)
SetStage(2420)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2420_Item_00
Function Fragment_Stage_2420_Item_00()
;BEGIN CODE
SFBGS00D_MS_HW_Quest_Scenes_YeatsCarusoSasha.Stop()
SFFL_MS01_Quest_d2750_YeatsCarusoSashaEXIT.Start()
SetObjectiveCompleted(2415)
SetStage(2440)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2435_Item_00
Function Fragment_Stage_2435_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_Grace_Caelumite.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2440_Item_00
Function Fragment_Stage_2440_Item_00()
;BEGIN CODE
SFBGS00D_MS_HW_Quest_Scenes_YeatsCarusoSashaEXIT.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2450_Item_00
Function Fragment_Stage_2450_Item_00()
;BEGIN CODE
Alias_Yeats_CellDoor.GetRef().SetOpen(true)
Alias_Yeats_Activator.GetRef().DisableNoWait()
Alias_Caruso.GetActorRef().EvaluatePackage()
;Alias_Yeats_Activator.Clear()
SetObjectiveCompleted(2415)
SetObjectiveDisplayed(2445)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2475_Item_00
Function Fragment_Stage_2475_Item_00()
;BEGIN CODE
Alias_Zena.GetActorRef().EvaluatePackage()

Actor CarusoRef = Alias_Caruso.GetActorRef()
CarusoRef.MoveTo(Alias_Zena_Visitor.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2500_Item_00
Function Fragment_Stage_2500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2415)
SetObjectiveCompleted(2445)

if !GetStageDone(160)
    SetObjectiveDisplayed(2500)
else
    SetObjectiveDisplayed(2600)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2505_Item_00
Function Fragment_Stage_2505_Item_00()
;BEGIN CODE
SFBGS00D_MS_HW_Quest_3000_CarusoZena.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2510_Item_00
Function Fragment_Stage_2510_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2500)
SetObjectiveDisplayed(2510)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2520_Item_00
Function Fragment_Stage_2520_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2510)
SetObjectiveDisplayed(2530)
SetObjectiveDisplayed(2535)
Alias_Bernhard.GetRef().EnableNoWait()
if GetStageDone(1150) || GetStageDone(1130)
    ;SetObjectiveDisplayed(2520)
    ;kmyQuest.RegisterForSleep()
endif

Alias_PlayerBed.GetRef().SetFactionOwner(PlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2520_Item_01
Function Fragment_Stage_2520_Item_01()
;BEGIN CODE
ObjectReference SunniRef = Alias_SunniKim.GetRef()
SunniRef.MoveTo(Alias_Grace_Prison.GetRef())
Alias_Yeats_CellDoor.GetRef().SetOpen(false)
ObjectReference CellActivatorRef = Alias_Grace_Activator.GetRef()
CellActivatorRef.EnableNoWait()
CellActivatorRef.SetLinkedRef(SunniRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2520_Item_02
Function Fragment_Stage_2520_Item_02()
;BEGIN CODE
ObjectReference GraceRef = Alias_GraceKim.GetRef()
GraceRef.MoveTo(Alias_Grace_Prison.GetRef())
Alias_Yeats_CellDoor.GetRef().SetOpen(false)
ObjectReference CellActivatorRef = Alias_Grace_Activator.GetRef()
CellActivatorRef.EnableNoWait()
CellActivatorRef.SetLinkedRef(GraceRef)
SFFL_MS01_DoctorDialogue.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2521_Item_00
Function Fragment_Stage_2521_Item_00()
;BEGIN CODE
if GetStageDone(2553) && GetStageDone(2522) && GetStageDone(2526)
    if GetStageDone(2523) || SFBGS00D_MS_HW_SunniConvicted.GetValueInt() >= 1
        if GetStageDone(2524) || SFBGS00D_MS_HW_GraceConvicted.GetValueInt() >= 1
            SetObjectiveCompleted(2535)
        endif
    endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2522_Item_00
Function Fragment_Stage_2522_Item_00()
;BEGIN CODE
if GetStageDone(2553) && GetStageDone(2521) && GetStageDone(2526)
    if GetStageDone(2523) || SFBGS00D_MS_HW_SunniConvicted.GetValueInt() >= 1
        if GetStageDone(2524) || SFBGS00D_MS_HW_GraceConvicted.GetValueInt() >= 1
            SetObjectiveCompleted(2535)
        endif
    endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2523_Item_00
Function Fragment_Stage_2523_Item_00()
;BEGIN CODE
if GetStageDone(2553) && GetStageDone(2521) && GetStageDone(2522) && GetStageDone(2526)
    if GetStageDone(2524) || SFBGS00D_MS_HW_GraceConvicted.GetValueInt() >= 1
        SetObjectiveCompleted(2535)
    endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2524_Item_00
Function Fragment_Stage_2524_Item_00()
;BEGIN CODE
if GetStageDone(2553) && GetStageDone(2521) && GetStageDone(2522) && GetStageDone(2526)
    if GetStageDone(2523) || SFBGS00D_MS_HW_SunniConvicted.GetValueInt() >= 1
        SetObjectiveCompleted(2535)
    endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2530_Item_00
Function Fragment_Stage_2530_Item_00()
;BEGIN CODE
SetObjectiveSkipped(2535)
SetObjectiveCompleted(2530)
SetStage(2540)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2535_Item_00
Function Fragment_Stage_2535_Item_00()
;BEGIN CODE
SetObjectiveSkipped(2535)
SetObjectiveCompleted(2530)
SetStage(2540)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2539_Item_00
Function Fragment_Stage_2539_Item_00()
;BEGIN CODE
Game.SetLocalTime(7.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2540_Item_00
Function Fragment_Stage_2540_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2520)
SetObjectiveDisplayed(2540)
if !GetStageDone(160)
    ObjectReference CarusoRef = Alias_Caruso.GetRef()
    CarusoRef.MoveTo(Alias_Caruso_Prayer.GetRef())
endif

ObjectReference ZenaRef = Alias_Zena.GetRef()
ZenaRef.MoveTo(ZenaRef.GetLinkedRef(LinkCustom05))

ObjectReference YeatsRef = Alias_Yeats.GetRef()
YeatsRef.MoveTo(YeatsRef.GetLinkedRef(LinkCustom04))

ObjectReference GuardRef = Alias_Guard.GetRef()
GuardRef.MoveTo(GuardRef.GetLinkedRef(LinkCustom04))

if SFBGS00D_MS_HW_GraceConvicted.GetValueInt() == 0
    ObjectReference GraceRef = Alias_GraceKim.GetRef()
    GraceRef.MoveTo(GuardRef.GetLinkedRef(LinkCustom04))
endif

Alias_BabylonResidents.EvaluateAll()
Alias_Caruso_CellDoorActual.GetRef().BlockActivation(true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2540_Item_01
Function Fragment_Stage_2540_Item_01()
;BEGIN CODE
Alias_Church_UniversalEnableMarker.GetRef().DisableNoWait()
Alias_Yeats.GetActorRef().SetOutfit(Outfit_Clothes_Formal_ShirtSlacks_Vest)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2540_Item_02
Function Fragment_Stage_2540_Item_02()
;BEGIN CODE
Alias_Church_UniversalEnableMarker.GetRef().DisableNoWait()
Alias_Church_EnlightenedEnableMarker.GetRef().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2540_Item_03
Function Fragment_Stage_2540_Item_03()
;BEGIN CODE
Alias_Church_UniversalEnableMarker.GetRef().DisableNoWait()
Alias_Church_SerpentEnableMarker.GetRef().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2540_Item_04
Function Fragment_Stage_2540_Item_04()
;BEGIN CODE
Alias_Yeats.GetActorRef().SetOutfit(Outfit_Clothes_Sanctum_Priest_with_Hat)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2541_Item_00
Function Fragment_Stage_2541_Item_00()
;BEGIN CODE
if SFBGS00D_MS_HW_SunniConvicted.GetValueInt() == 0
    ObjectReference SunniRef = Alias_SunniKim.GetRef()
    ObjectReference SunniMarkerRef = SunniRef.GetLinkedRef(LinkCustom04)
    if SunniRef.GetDistance(SunniMarkerRef) > 10
        SunniRef.MoveTo(SunniMarkerRef)
    endif
endif

ObjectReference ZenaRef = Alias_Zena.GetRef()
ObjectReference ZenaMarkerRef = ZenaRef.GetLinkedRef(LinkCustom05)
if ZenaRef.GetDistance(ZenaMarkerRef) > 15
    ZenaRef.MoveTo(ZenaMarkerRef)
endif

ObjectReference YeatsRef = Alias_Yeats.GetRef()
ObjectReference YeatsMarkerRef = YeatsRef.GetLinkedRef(LinkCustom04)
if YeatsRef.GetDistance(YeatsMarkerRef) > 15
    YeatsRef.MoveTo(YeatsMarkerRef)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2545_Item_00
Function Fragment_Stage_2545_Item_00()
;BEGIN CODE
Alias_Alphonse.GetRef().AddItem(SFFL_MS01_Note_ExtraVote)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2546_Item_00
Function Fragment_Stage_2546_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2540)
SetObjectiveDisplayed(2550)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2550_Item_00
Function Fragment_Stage_2550_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2550)
SetObjectiveDisplayed(2560)
Alias_Caruso.GetActorRef().EvaluatePackage()

Actor BernRef = Alias_Bernhard.GetActorRef()

if GetStageDone(2530)
    BernRef.MoveTo(Alias_Bernhard_WallLean.GetRef())
    BernRef.AddToFaction(PlayerAllyFaction)
else
    BernRef.DisableNoWait()
endif
Alias_Caruso_CellDoor.GetRef().DisableNoWait()
Alias_Guard.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2550_Item_01
Function Fragment_Stage_2550_Item_01()
;BEGIN CODE
Actor IvicaRef = Alias_Ivica.GetActorRef()
ObjectReference ChairRef = IvicaRef.GetLinkedRef(LinkCustom03)

If IvicaRef.GetDistance(ChairRef) > 8
    IvicaRef.SnapIntoInteraction(ChairRef)
Endif

Actor CaspianRef = Alias_Alphonse.GetActorRef()
ObjectReference Chair2Ref = CaspianRef.GetLinkedRef(LinkCustom03)

If CaspianRef.GetDistance(Chair2Ref) > 8
    CaspianRef.SnapIntoInteraction(Chair2Ref)
Endif

Actor ZenaRef = Alias_Zena.GetActorRef()
ObjectReference Chair3Ref = ZenaRef.GetLinkedRef(LinkCustom03)

If ZenaRef.GetDistance(Chair3Ref) > 8
    ZenaRef.SnapIntoInteraction(Chair3Ref)
Endif

Actor SunniRef = Alias_SunniKim.GetActorRef()
ObjectReference Chair4Ref = SunniRef.GetLinkedRef(LinkCustom03)

If SunniRef.GetDistance(Chair4Ref) > 8 && SFFL_MS01_SunniConvicted.GetValueInt() == 0
    SunniRef.SnapIntoInteraction(Chair4Ref)
Endif

Actor GraceRef = Alias_GraceKim.GetActorRef() 
ObjectReference Chair5Ref = GraceRef.GetLinkedRef(LinkCustom03)

If GraceRef.GetDistance(Chair5Ref) > 8 && SFFL_MS01_GraceConvicted.GetValueInt() == 0
    GraceRef.SnapIntoInteraction(Chair5Ref)
Endif

Actor YeatsRef = Alias_Yeats.GetActorRef()
ObjectReference Chair6Ref = YeatsRef.GetLinkedRef(LinkCustom03)

If YeatsRef.GetDistance(Chair6Ref) > 8
    YeatsRef.SnapIntoInteraction(Chair6Ref)
Endif

Actor SashaRef = Alias_Guard.GetActorRef()
ObjectReference Chair7Ref = SashaRef.GetLinkedRef(LinkCustom03)

If SashaRef.GetDistance(Chair7Ref) > 8
    SashaRef.SnapIntoInteraction(Chair7Ref)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2555_Item_00
Function Fragment_Stage_2555_Item_00()
;BEGIN CODE
SFBGS00D_MS_HW_Quest_d3200_CarusoJail.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2557_Item_00
Function Fragment_Stage_2557_Item_00()
;BEGIN CODE
Actor YeatsRef = Alias_Yeats.GetActorRef()
Actor ZenaRef = Alias_Zena.GetActorRef()
Actor IvicaRef = Alias_Ivica.GetActorRef()
Actor SunniRef = Alias_SunniKim.GetActorRef()
Actor GraceRef = Alias_GraceKim.GetActorRef()
Actor CaspianRef = Alias_Alphonse.GetActorRef()
Actor SashaRef = Alias_Guard.GetActorRef()

YeatsRef.SnapIntoInteraction(YeatsRef.GetLinkedRef(LinkCustom03))
ZenaRef.SnapIntoInteraction(ZenaRef.GetLinkedRef(LinkCustom03))
if SFBGS00D_MS_HW_SunniConvicted.GetValueInt() == 0
    SunniRef.SnapIntoInteraction(SunniRef.GetLinkedRef(LinkCustom03))
endif
if SFBGS00D_MS_HW_GraceConvicted.GetValueInt() == 0
    GraceRef.SnapIntoInteraction(GraceRef.GetLinkedRef(LinkCustom03))
endif
CaspianRef.SnapIntoInteraction(CaspianRef.GetLinkedRef(LinkCustom03))
IvicaRef.SnapIntoInteraction(IvicaRef.GetLinkedRef(LinkCustom03))
SashaRef.SnapIntoInteraction(SashaRef.GetLinkedRef(LinkCustom03))
Alias_BabylonResidents.EvaluateAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2558_Item_00
Function Fragment_Stage_2558_Item_00()
;BEGIN CODE
SFBGS00D_WwiseEvent_QST_MS01_CommunityBell.Play(Alias_BellMarker.GetRef())
Alias_BallotBox.GetRef().BlockActivation(true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2560_Item_00
Function Fragment_Stage_2560_Item_00()
;BEGIN CODE
SFBGS00D_MS_HW_Quest_d3300_SceneAll.Start()
Alias_BallotBoxActivator.GetRef().EnableNoWait()
ObjectReference BallotBox = Alias_BallotBox.GetRef()
BallotBox.EnableNoWait()
BallotBox.BlockActivation(true, true)
Alias_Caruso_CellDoor.GetRef().EnableNoWait()
ObjectReference DoorRef = Alias_Yates_Door.GetRef()
DoorRef.SetLockLevel(0)
DoorRef.Lock(false)
DoorRef.SetOpen(false)
SFFL_MS01_PrisonDoorUnlocked.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2570_Item_00
Function Fragment_Stage_2570_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2540)
SetObjectiveDisplayed(2550)
Alias_Zena.GetActorRef().EvaluatePackage()
Utility.Wait(0.7)
Alias_GraceKim.GetActorRef().EvaluatePackage()
Utility.Wait(0.4)
Alias_Ivica.GetActorRef().EvaluatePackage()
Utility.Wait(0.4)
Alias_SunniKim.GetActorRef().EvaluatePackage()
Alias_Yeats.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2585_Item_00
Function Fragment_Stage_2585_Item_00()
;BEGIN CODE
SetStage(2931)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2699_Item_00
Function Fragment_Stage_2699_Item_00()
;BEGIN CODE
SFBGS00D_MS_HW_Quest_Scenes_ZenaVoteTally.Stop()
SFFL_MS01_Quest_c3400_Zena_VoteStart.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2700_Item_00
Function Fragment_Stage_2700_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2560)
SetObjectiveCompleted(2600)
SetObjectiveDisplayed(2700)
Game.RequestSaveByName("CarusoTrialStarted")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2710_Item_00
Function Fragment_Stage_2710_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_MS01_QuestScript
Quest __temp = self as Quest
SFBGS00D:SFFL_MS01_QuestScript kmyQuest = __temp as SFBGS00D:SFFL_MS01_QuestScript
;END AUTOCAST
;BEGIN CODE
SFBGS00D_MS_HW_Quest_Scenes_d3500_OpeningStatement.Start()
ObjectReference DoorRef = Alias_Caruso_Door.GetRef()
DoorRef.SetOpen(false)
DoorRef.BlockActivation(true, true)
kmyQuest.SFFL_MS01_Layer = InputEnableLayer.Create()
kmyQuest.SFFL_MS01_Layer.EnableFastTravel(false)
Alias_PilotSeat.GetRef().BlockActivation(true, true)
ObjectReference[] exteriorloadDoors = Alias_PlayerShip.GetShipRef().GetExteriorLoadDoors()
    int i = 0
    While (i < exteriorLoadDoors.Length)
        exteriorLoadDoors[i].BlockActivation(true, true)
        i += 1
    EndWhile
UC04_TurnOffArrestScene.SetValue(1)
int crimeGold = SFFL_MS01_NewBabylonFaction.GetCrimeGold()

SFFL_MS01_CrimeGoldGlobal.SetValue(crimeGold)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2718_Item_00
Function Fragment_Stage_2718_Item_00()
;BEGIN CODE
ObjectReference BallotBoxRef = Alias_BallotBox.GetRef()
BallotBoxRef.RemoveItem(SFBGS00D_Note_ExonerateVote, 1)
if !GetStageDone(2730)
    SFBGS00D_MS_HW_Quest_Scenes_ZenaVoteTally.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2719_Item_00
Function Fragment_Stage_2719_Item_00()
;BEGIN CODE
ObjectReference VoteStorageRef = Alias_BallotStorage.GetRef()
int YeatsVote = Alias_Yeats.GetActorRef().GetValueInt(Variable07) 
if YeatsVote == 2
    Alias_BallotBox.GetRef().AddItem(SFBGS00D_Note_ExileVote, 1)
    VoteStorageRef.AddItem(SFBGS00D_Note_ExileVote, 1)
elseif YeatsVote == 3
    Alias_BallotBox.GetRef().AddItem(SFBGS00D_Note_ExonerateVote, 1)
    VoteStorageRef.AddItem(SFBGS00D_Note_ExonerateVote, 1)
else
    Alias_BallotBox.GetRef().AddItem(SFBGS00D_Note_ExecutionVote, 1)
    VoteStorageRef.AddItem(SFBGS00D_Note_ExecutionVote, 1)
endif

if !GetStageDone(2727)
    SFBGS00D_MS_HW_Quest_Scenes_Vote_Alphonse.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2719_Item_01
Function Fragment_Stage_2719_Item_01()
;BEGIN CODE
SFBGS00D_MS_HW_Quest_Scenes_ZenaVoteCarusoShot.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2720_Item_00
Function Fragment_Stage_2720_Item_00()
;BEGIN CODE
Actor BernhardRef = Alias_Bernhard.GetActorRef()
BernhardRef.EvaluatePackage()
Alias_BabylonResidents.RemoveRef(Alias_Caruso.GetRef())
Alias_Caruso.GetActorRef().EvaluatePackage()
SFBGS00D_MS_HW_Quest_Scenes_Vote_Ivica.Start()
SetObjectiveCompleted(2700)
SetObjectiveDisplayed(2720)
iF Alias_BallotBoxActivator.GetRef() == None
    Alias_BallotBoxActivator.RefillAlias()
endif
if Alias_BallotStorage.GetRef() == None
    Alias_BallotStorage.RefillAlias()
endif
Alias_BallotBox.GetRef().BlockActivation(false, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2721_Item_00
Function Fragment_Stage_2721_Item_00()
;BEGIN AUTOCAST TYPE DefaultFollowerToggleQuestScript
Quest __temp = self as Quest
DefaultFollowerToggleQuestScript kmyQuest = __temp as DefaultFollowerToggleQuestScript
;END AUTOCAST
;BEGIN CODE
int SunniCount = SFBGS00D_MS_HW_SunniConvicted.GetValueInt()
int GraceCount = SFBGS00D_MS_HW_GraceConvicted.GetValueInt()

if SunniCount == 0 && !GetStageDone(2727)
    SFBGS00D_MS_HW_Quest_Scenes_Vote_Sunni.Start()
elseif GraceCount == 0
    SetStage(2722)
endif
ObjectReference VoteStorageRef = Alias_BallotStorage.GetRef()
ObjectReference BallotBoxRef = Alias_BallotBox.GetRef()
int IvicaVote = SFBGS00D_MS_HW_IvicaVote.GetValueInt()

if IvicaVote == 1
    BallotBoxRef.AddItem(SFBGS00D_Note_ExecutionVote, 1)
    VoteStorageRef.AddItem(SFBGS00D_Note_ExecutionVote, 1)
elseif IvicaVote == 2
    BallotBoxRef.AddItem(SFBGS00D_Note_ExileVote, 1)
    VoteStorageRef.AddItem(SFBGS00D_Note_ExileVote, 1)
elseif IvicaVote == 3
    BallotBoxRef.AddItem(SFBGS00D_Note_ExonerateVote, 1)
    VoteStorageRef.AddItem(SFBGS00D_Note_ExonerateVote, 1)
else
    BallotBoxRef.AddItem(SFBGS00D_Note_ExileVote, 1)
    VoteStorageRef.AddItem(SFBGS00D_Note_ExileVote, 1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2721_Item_01
Function Fragment_Stage_2721_Item_01()
;BEGIN CODE
Alias_Guard.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2722_Item_00
Function Fragment_Stage_2722_Item_00()
;BEGIN CODE
ObjectReference BallotBoxRef = Alias_BallotBox.GetRef()
ObjectReference VoteStorageRef = Alias_BallotStorage.GetRef()
int SunniVote = SFBGS00D_MS_HW_SunniVote.GetValueInt()

if GetStageDone(1140) || GetStageDone(1145)
    BallotBoxRef.AddItem(SFBGS00D_Note_ExecutionVote, 1)
    VoteStorageRef.AddItem(SFBGS00D_Note_ExecutionVote, 1)
elseif SunniVote == 1
    BallotBoxRef.AddItem(SFBGS00D_Note_ExecutionVote, 1)
    VoteStorageRef.AddItem(SFBGS00D_Note_ExecutionVote, 1)
elseif SunniVote == 2
    BallotBoxRef.AddItem(SFBGS00D_Note_ExileVote, 1)
    VoteStorageRef.AddItem(SFBGS00D_Note_ExileVote, 1)
elseif SunniVote == 3
    BallotBoxRef.AddItem(SFBGS00D_Note_ExonerateVote, 1)
    VoteStorageRef.AddItem(SFBGS00D_Note_ExonerateVote, 1)
else
    BallotBoxRef.AddItem(SFBGS00D_Note_ExecutionVote, 1)
    VoteStorageRef.AddItem(SFBGS00D_Note_ExecutionVote, 1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2722_Item_01
Function Fragment_Stage_2722_Item_01()
;BEGIN CODE
int GraceCount = SFBGS00D_MS_HW_GraceConvicted.GetValueInt()

if GraceCount == 0 && !GetStageDone(2727)
    SFBGS00D_MS_HW_Quest_Scenes_Vote_Grace.Start()
else
    SetStage(2723)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2722_Item_02
Function Fragment_Stage_2722_Item_02()
;BEGIN CODE
Alias_Guard.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2723_Item_00
Function Fragment_Stage_2723_Item_00()
;BEGIN CODE
ObjectReference BallotBoxRef = Alias_BallotBox.GetRef()
ObjectReference VoteStorageRef = Alias_BallotStorage.GetRef()
int GraceVote = SFBGS00D_MS_HW_GraceVote.GetValueInt()

if GraceVote == 1
    BallotBoxRef.AddItem(SFBGS00D_Note_ExecutionVote, 1)
    VoteStorageRef.AddItem(SFBGS00D_Note_ExecutionVote, 1)
elseif GraceVote == 2
    BallotBoxRef.AddItem(SFBGS00D_Note_ExileVote, 1)
    VoteStorageRef.AddItem(SFBGS00D_Note_ExileVote, 1)
elseif GraceVote == 3
    BallotBoxRef.AddItem(SFBGS00D_Note_ExonerateVote, 1)
    VoteStorageRef.AddItem(SFBGS00D_Note_ExonerateVote, 1)
else
    BallotBoxRef.AddItem(SFBGS00D_Note_ExileVote, 1)
    VoteStorageRef.AddItem(SFBGS00D_Note_ExileVote, 1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2723_Item_01
Function Fragment_Stage_2723_Item_01()
;BEGIN CODE
if !GetStageDone(2727)
    SFBGS00D_MS_HW_Quest_Scenes_Vote_Sasha.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2723_Item_02
Function Fragment_Stage_2723_Item_02()
;BEGIN CODE
Alias_Guard.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2724_Item_00
Function Fragment_Stage_2724_Item_00()
;BEGIN AUTOCAST TYPE DefaultFollowerToggleQuestScript
Quest __temp = self as Quest
DefaultFollowerToggleQuestScript kmyQuest = __temp as DefaultFollowerToggleQuestScript
;END AUTOCAST
;BEGIN CODE
if !GetStageDone(2727)
    SFBGS00D_MS_HW_Quest_e2900_Vote_Yeats.Start()
endif 
ObjectReference VoteStorageRef = Alias_BallotStorage.GetRef()
ObjectReference BallotBoxRef = Alias_BallotBox.GetRef()
int SashaVote = SFBGS00D_MS_HW_SashaVote.GetValueInt()

if SashaVote == 1
    BallotBoxRef.AddItem(SFBGS00D_Note_ExecutionVote, 1)
    VoteStorageRef.AddItem(SFBGS00D_Note_ExecutionVote, 1)
elseif SashaVote == 2
    BallotBoxRef.AddItem(SFBGS00D_Note_ExileVote, 1)
    VoteStorageRef.AddItem(SFBGS00D_Note_ExileVote, 1)
elseif SashaVote == 3
    BallotBoxRef.AddItem(SFBGS00D_Note_ExonerateVote, 1)
    VoteStorageRef.AddItem(SFBGS00D_Note_ExonerateVote, 1)
else
    BallotBoxRef.AddItem(SFBGS00D_Note_ExecutionVote, 1)
    VoteStorageRef.AddItem(SFBGS00D_Note_ExecutionVote, 1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2724_Item_01
Function Fragment_Stage_2724_Item_01()
;BEGIN CODE
SFBGS00D_MS_HW_Quest_Scenes_ZenaVoteCarusoShot.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2724_Item_02
Function Fragment_Stage_2724_Item_02()
;BEGIN CODE
Alias_Guard.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2725_Item_00
Function Fragment_Stage_2725_Item_00()
;BEGIN CODE
if GetStageDone(2755) && !GetStageDone(2727)
    SFBGS00D_MS_HW_Quest_Scenes_Vote_Alphonse.Stop()
    SFBGS00D_MS_HW_Quest_Scenes_ZenaVoteTally.Start()
endif

ObjectReference BallotBoxRef = Alias_BallotBox.GetRef()
ObjectReference VoteStorageRef = Alias_BallotStorage.GetRef()
ObjectReference CaspianRef = Alias_Alphonse.GetRef()
if CaspianRef.GetItemCount(SFFL_MS01_Note_ExtraVote) >= 1
    BallotBoxRef.AddItem(SFBGS00D_Note_ExonerateVote, 2)
    VoteStorageRef.AddItem(SFBGS00D_Note_ExonerateVote, 2)
    CaspianRef.RemoveItem(SFFL_MS01_Note_ExtraVote)
else
    BallotBoxRef.AddItem(SFBGS00D_Note_ExonerateVote, 1)
    VoteStorageRef.AddItem(SFBGS00D_Note_ExonerateVote, 1)
    CaspianRef.RemoveItem(SFFL_MS01_Note_ExtraVote)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2725_Item_01
Function Fragment_Stage_2725_Item_01()
;BEGIN CODE
Alias_Guard.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2726_Item_00
Function Fragment_Stage_2726_Item_00()
;BEGIN CODE
ObjectReference BallotBoxRef = Alias_BallotBox.GetRef()
ObjectReference VoteStorageRef = Alias_BallotStorage.GetRef()
BallotBoxRef.BlockActivation(true, true)
int ZenaVote = SFBGS00D_MS_HW_ZenaVote.GetValueInt()

if ZenaVote == 1
    BallotBoxRef.AddItem(SFBGS00D_Note_ExecutionVote, 1)
    VoteStorageRef.AddItem(SFBGS00D_Note_ExecutionVote, 1)
elseif ZenaVote == 2
    BallotBoxRef.AddItem(SFBGS00D_Note_ExileVote, 1)
    VoteStorageRef.AddItem(SFBGS00D_Note_ExileVote, 1)
elseif ZenaVote == 3
    BallotBoxRef.AddItem(SFBGS00D_Note_ExonerateVote, 1)
    VoteStorageRef.AddItem(SFBGS00D_Note_ExonerateVote, 1)
else
    BallotBoxRef.AddItem(SFBGS00D_Note_ExileVote, 1)
endif

;BallotBoxRef.RemoveAllItems(akTransferTo = Alias_Zena.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2726_Item_01
Function Fragment_Stage_2726_Item_01()
;BEGIN CODE
Alias_Guard.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2727_Item_00
Function Fragment_Stage_2727_Item_00()
;BEGIN CODE
SetStage(2719)
SetStage(2721)
SetStage(2722)
SetStage(2723)
SetStage(2724)
SetStage(2725)
SetStage(2726)
SFBGS00D_MS_HW_Quest_Scenes_Vote_Sunni.Stop()
SFBGS00D_MS_HW_Quest_Scenes_Vote_Grace.Stop()
SFBGS00D_MS_HW_Quest_Scenes_Vote_Ivica.Stop()
SFBGS00D_MS_HW_Quest_Scenes_Vote_Alphonse.Stop()
SFBGS00D_MS_HW_Quest_Scenes_Vote_Sasha.Stop()
SFBGS00D_MS_HW_Quest_e2900_Vote_Yeats.Stop()
SFBGS00D_MS_HW_Quest_Scenes_ZenaVoteTally.Stop()

Alias_BallotBoxActivator.GetRef().DisableNoWait()
SetObjectiveSkipped(2720)
if GetStageDone(2735)
    SFBGS00D_MS_HW_Quest_Scenes_ZenaVoteCarusoShot.Stop()
    SFFL_MS01_Quest_e2920_BernhardKilled.Start()
endif
Alias_BallotBox.GetRef().BlockActivation(false, false)
Game.GetPlayer().SetValue(SFFL_MS01_BernhardDies, 1)
Alias_BallotBoxVotingMarkerThird.GetRef().MoveTo(Alias_Caruso.GetRef())
Alias_MusicOverride.GetRef().EnableNoWait()

if Alias_Bernhard.GetActorRef().IsDead() && !Alias_Caruso.GetActorRef().IsDead()
    Game.AddAchievement(79)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2728_Item_00
Function Fragment_Stage_2728_Item_00()
;BEGIN CODE
ObjectReference BallotBoxRef = Alias_BallotBox.GetRef()
int ExecutionVote = BallotBoxRef.GetItemCount(SFBGS00D_Note_ExecutionVote)
int ExileVote = BallotBoxRef.GetItemCount(SFBGS00D_Note_ExileVote)
int ExonerateVote = BallotBoxRef.GetItemCount(SFBGS00D_Note_ExonerateVote)

if ExecutionVote > ExileVote && ExecutionVote > ExonerateVote
    SetStage(2910)
elseif ExileVote > ExecutionVote && ExileVote > ExonerateVote
    SetStage(2920)
elseif ExonerateVote > ExecutionVote && ExonerateVote > ExileVote
    SetStage(2930)
elseif ExecutionVote == ExileVote && ExecutionVote > ExonerateVote
    SetStage(2901)
elseif ExecutionVote == ExonerateVote && ExecutionVote > ExileVote 
    SetStage(2902)
elseif ExileVote == ExonerateVote && ExileVote > ExecutionVote
    SetStage(2903)
else
    SetStage(2904)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2730_Item_00
Function Fragment_Stage_2730_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2930)
SetObjectiveSkipped(2950)
SetObjectiveDisplayed(2951)
ObjectReference DoorRef = Alias_Caruso_Door.GetRef()
DoorRef.SetOpen(true)
DoorRef.BlockActivation(false, false)
Alias_Bernhard.GetActorRef().EvaluatePackage()
Actor CarusoRef = Alias_Caruso.GetActorRef()
Alias_BabylonResidents.RemoveRef(CarusoRef)
CarusoRef.SetCrimeFaction(None)
CarusoRef.SetProtected(false)
CarusoREf.KillEssential()

SFBGS00D_MS_HW_Quest_Scenes_ZenaVoteTally.Stop()
SFBGS00D_MS_HW_Quest_Scenes_Vote_Sunni.Stop()
SFBGS00D_MS_HW_Quest_Scenes_Vote_Grace.Stop()
SFBGS00D_MS_HW_Quest_Scenes_Vote_Sasha.Stop()
SFBGS00D_MS_HW_Quest_Scenes_Vote_Alphonse.Stop()
SFBGS00D_MS_HW_Quest_Scenes_Vote_Ivica.Stop()
SFBGS00D_MS_HW_Quest_e2900_Vote_Yeats.Stop()
SFFL_MS01_e2900_BernhardCaruso.Stop()
SFBGS00D_MS_HW_Quest_Scenes_ZenaVoteCarusoShot.ForceStart()

Alias_Bernhard.GetActorRef().AddToFaction(SFFL_MS01_NewBabylonFriendFaction)

SFFL_MS01_SpeechChallenge_Caspian.Start()
SetObjectiveSkipped(2720)
Alias_BabylonResidents.StopCombatAlarm()
Alias_BabylonResidents.EvaluateAll()

Alias_BallotBox.GetRef().BlockActivation(false, false)
Game.GetPlayer().SetValue(SFFL_MS01_CarusoDies, 1)
Alias_BallotBoxVotingMarkerThird.GetRef().MoveTo(Alias_Caruso.GetRef())

ObjectReference CellActivatorRef = Alias_Yeats_Activator.GetRef()
CellActivatorRef.DisableNoWait()
ObjectReference CarusoCellActivatorRef = Alias_Caruso_CellDoorActivator.GetRef()
CarusoCellActivatorRef.DisableNoWait()
Alias_MusicOverride.GetRef().EnableNoWait()
Alias_Caruso_CellDoorActual.GetRef().BlockActivation(false, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2733_Item_00
Function Fragment_Stage_2733_Item_00()
;BEGIN CODE
ObjectReference DoorRef = Alias_Yeats_CellDoor.GetRef()
;DoorRef.BlockActivation(true, true)
DoorRef.SetOpen(true)
Game.GetPlayer().SetValue(SFFL_MS01_CaspianKills, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2734_Item_00
Function Fragment_Stage_2734_Item_00()
;BEGIN CODE
Alias_Yeats_CellDoor.GetRef().SetOpen(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2740_Item_00
Function Fragment_Stage_2740_Item_00()
;BEGIN CODE
Alias_Bernhard.GetActorRef().KillEssential()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2750_Item_00
Function Fragment_Stage_2750_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2750)
SetObjectiveCompleted(2931)
SetObjectiveDisplayed(2940)
Alias_BabylonResidents.EvaluateAll()
if GetStageDone(2740)
    SFFL_MS01_Quest_e2920_BernhardKilled.Start()
else
    SFFL_MS01_Quest_e2920_BernhardKilledZenaGreet.Start()
endif
Alias_MusicOverride.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2751_Item_00
Function Fragment_Stage_2751_Item_00()
;BEGIN CODE
Alias_BallotBoxActivator.GetRef().DisableNoWait()
Alias_BallotBox.GetRef().BlockActivation(false, false)
SetObjectiveCompleted(2720)
SetObjectiveDisplayed(2750)
ObjectReference VoteStorageRef = Alias_BallotStorage.GetRef()
VoteStorageRef.AddItem(SFBGS00D_Note_ExecutionVote, 1)
Alias_BallotBox.GetRef().AddItem(SFBGS00D_Note_ExecutionVote, 1)

if GetStageDone(2725) && !GetStageDone(2727) && !GetStageDone(2730)
    SFBGS00D_MS_HW_Quest_Scenes_ZenaVoteTally.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2752_Item_00
Function Fragment_Stage_2752_Item_00()
;BEGIN CODE
Alias_BallotBoxActivator.GetRef().DisableNoWait()
Alias_BallotBox.GetRef().BlockActivation(false, false)
SetObjectiveCompleted(2720)
SetObjectiveDisplayed(2750)
ObjectReference VoteStorageRef = Alias_BallotStorage.GetRef()
VoteStorageRef.AddItem(SFBGS00D_Note_ExileVote, 1)
Alias_BallotBox.GetRef().AddItem(SFBGS00D_Note_ExileVote, 1)

if GetStageDone(2725) && !GetStageDone(2727) && !GetStageDone(2730)
    SFBGS00D_MS_HW_Quest_Scenes_ZenaVoteTally.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2753_Item_00
Function Fragment_Stage_2753_Item_00()
;BEGIN CODE
Alias_BallotBoxActivator.GetRef().DisableNoWait()
Alias_BallotBox.GetRef().BlockActivation(false, false)
SetObjectiveCompleted(2720)
SetObjectiveDisplayed(2750)
ObjectReference VoteStorageRef = Alias_BallotStorage.GetRef()
VoteStorageRef.AddItem(SFBGS00D_Note_ExonerateVote, 1)
Alias_BallotBox.GetRef().AddItem(SFBGS00D_Note_ExonerateVote, 1)

if GetStageDone(2725) && !GetStageDone(2727) && !GetStageDone(2730)
    SFBGS00D_MS_HW_Quest_Scenes_ZenaVoteTally.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2754_Item_00
Function Fragment_Stage_2754_Item_00()
;BEGIN CODE
Alias_BallotBoxActivator.GetRef().DisableNoWait()
Alias_BallotBox.GetRef().BlockActivation(false, false)
SetObjectiveCompleted(2720)
SetObjectiveDisplayed(2750)

if GetStageDone(2725) && !GetStageDone(2727) && !GetStageDone(2730)
    SFBGS00D_MS_HW_Quest_Scenes_ZenaVoteTally.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2799_Item_00
Function Fragment_Stage_2799_Item_00()
;BEGIN CODE
SFFL_MS01_Quest_e2920_ZenaVoteCarusoShot.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2800_Item_00
Function Fragment_Stage_2800_Item_00()
;BEGIN CODE
Actor BernhardRef = Alias_Bernhard.GetActorRef()
BernhardRef.SetValue(Aggression, 0)
BernhardRef.RemoveFromAllFactions()
BernhardRef.SetEssential(false)
BernhardRef.EvaluatePackage()

SFBGS00D_MS_HW_Quest_Scenes_BernhardCaruso.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2811_Item_00
Function Fragment_Stage_2811_Item_00()
;BEGIN CODE
int ZenaVote = SFBGS00D_MS_HW_ZenaVote.GetValueInt()

if ZenaVote == 1
    SetStage(2910)
else
    SetStage(2920)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2811_Item_01
Function Fragment_Stage_2811_Item_01()
;BEGIN CODE
int ZenaVote = SFBGS00D_MS_HW_ZenaVote.GetValueInt()

if ZenaVote == 1
    SetStage(2910)
else
    SetStage(2930)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2811_Item_02
Function Fragment_Stage_2811_Item_02()
;BEGIN CODE
int ZenaVote = SFBGS00D_MS_HW_ZenaVote.GetValueInt()

if ZenaVote == 2
    SetStage(2920)
else
    SetStage(2930)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2811_Item_03
Function Fragment_Stage_2811_Item_03()
;BEGIN CODE
int ZenaVote = SFBGS00D_MS_HW_ZenaVote.GetValueInt()

if ZenaVote == 1
    SetStage(2910)
elseif ZenaVote == 2
    SetStage(2920)
elseif ZenaVote == 3
    SetStage(2930)
else
    SetStage(2920)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2905_Item_00
Function Fragment_Stage_2905_Item_00()
;BEGIN CODE
ObjectReference DoorRef = Alias_Caruso_Door.GetRef()
DoorRef.SetOpen(true)
DoorRef.BlockActivation(false, false)
Alias_Bernhard.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2906_Item_00
Function Fragment_Stage_2906_Item_00()
;BEGIN CODE
SFFL_MS01_SpeechChallenge_Caspian.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2907_Item_00
Function Fragment_Stage_2907_Item_00()
;BEGIN CODE
SFFL_MS01_Quest_e2920_ZenaVoteCarusoShot.Stop()
SFFL_MS01_SpeechChallenge_Caspian.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2909_Item_00
Function Fragment_Stage_2909_Item_00()
;BEGIN CODE
Alias_Alphonse.GetActorRef().EquipItem(Eon)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2910_Item_00
Function Fragment_Stage_2910_Item_00()
;BEGIN CODE
Alias_BallotBox.GetRef().BlockActivation(false, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2920_Item_00
Function Fragment_Stage_2920_Item_00()
;BEGIN CODE
Alias_BallotBox.GetRef().BlockActivation(false, false)
Alias_Bernhard.GetActorRef().EvaluatePackage()
Alias_Shinar.ForceLocationTo(Alias_ShinarOutpostLocation.GetLocation())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2930_Item_00
Function Fragment_Stage_2930_Item_00()
;BEGIN CODE
Actor CarusoRef = Alias_Caruso.GetActorRef()
Alias_BabylonResidents.AddRef(CarusoRef)
CarusoRef.AddtoFaction(SFFL_MS01_NewBabylonFaction)
Alias_CarusoMisc.ForceRefTo(CarusoRef)
Alias_BallotBox.GetRef().BlockActivation(false, false)
Alias_Bernhard.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2931_Item_00
Function Fragment_Stage_2931_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(2931)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2932_Item_00
Function Fragment_Stage_2932_Item_00()
;BEGIN CODE
SFFL_MS01_Quest_e2920_ZenaVoteCarusoShot.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2940_Item_00
Function Fragment_Stage_2940_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_MS01_QuestScript
Quest __temp = self as Quest
SFBGS00D:SFFL_MS01_QuestScript kmyQuest = __temp as SFBGS00D:SFFL_MS01_QuestScript
;END AUTOCAST
;BEGIN CODE
ObjectReference DoorRef = Alias_Caruso_Door.GetRef()
DoorRef.SetOpen(true)
DoorRef.BlockActivation(false, false)

SetObjectiveCompleted(2750)
SetObjectiveDisplayed(2930)
if GetStageDone(2905) && !GetStageDone(2730) && GetStageDone(2930)
    SFBGS00D_MS_HW_Quest_Scenes_BernhardCaruso.Start()
endif
Actor BernhardRef = Alias_Bernhard.GetActorRef()
BernhardRef.EvaluatePackage()
if !GetStageDone(2905) && !GetStageDone(2730)
    Alias_BabylonResidents.AddRef(BernhardRef)
    BernhardRef.AddtoFaction(SFFL_MS01_NewBabylonFaction)
endif

if Game.GetPlayer().GetDistance(Alias_Zena.GetRef()) < 5 && !GetStageDone(2730)
    SFFL_MS01_Quest_e2940_ZenaVoteGreet.Start()
endif
kmyQuest.SFFL_MS01_Layer.Delete()
Alias_PilotSeat.GetRef().BlockActivation(false, false)
ObjectReference[] exteriorloadDoors = Alias_PlayerShip.GetShipRef().GetExteriorLoadDoors()
    int i = 0
    While (i < exteriorLoadDoors.Length)
        exteriorLoadDoors[i].BlockActivation(false, false)
        i += 1
    EndWhile
UC04_TurnOffArrestScene.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2948_Item_00
Function Fragment_Stage_2948_Item_00()
;BEGIN AUTOCAST TYPE defaultquestchangelocationscript
Quest __temp = self as Quest
defaultquestchangelocationscript kmyQuest = __temp as defaultquestchangelocationscript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().RemovePerk(SFBGS00D_MS_HW_ActivationPerk)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2949_Item_00
Function Fragment_Stage_2949_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2930)

if !GetStageDone(2730) 
    SetObjectiveDisplayed(2950)
    if GetStageDone(2910) || GetStageDone(2920)
        Alias_Caruso.GetActorRef().SetEssential(True)
    endif
endif
if GetStageDone(2905)
    if GetStageDone(2730) || GetStageDone(2735)
        SFFL_MS01_Quest_e2920_ZenaVoteCarusoShot.Start()
    endif
endif

Actor PlayerRef = Game.GetPlayer()
PlayerRef.AddItem(SFBGS00D_MS_HW_PrisonCellKeycard)
PlayerRef.AddPerk(SFBGS00D_MS_HW_ActivationPerk)
Alias_Caruso_CellDoor.GetRef().EnableNoWait()
Alias_BabylonResidents.EvaluateAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2949_Item_01
Function Fragment_Stage_2949_Item_01()
;BEGIN CODE
SetObjectiveCompleted(1220)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2950_Item_00
Function Fragment_Stage_2950_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2930)
SetObjectiveDisplayed(2950)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2960_Item_00
Function Fragment_Stage_2960_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2950)
SetObjectiveDisplayed(2960)
Alias_Caruso.GetActorRef().EvaluatePackage()
Alias_Caruso_CellDoorActual.GetRef().BlockActivation(false, false)
    if GetStageDone(2910) || GetStageDone(2920)
        Alias_Caruso.GetActorRef().SetEssential(True)
    endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2970_Item_00
Function Fragment_Stage_2970_Item_00()
;BEGIN CODE
WeatherThunderstormList.SetActive()
Actor CarusoRef = Alias_Caruso.GetActorRef()
ObjectReference PlayerRef = Game.GetPlayer()

CarusoRef.MoveTo(Alias_Caruso_ShinarSpot.GetRef())
CarusoRef.RemoveFromAllFactions()
CarusoRef.BlockActivation(true, true)
CarusoRef.EvaluatePackage()
CarusoRef.SetValue(Health, 1)
Alias_MusicObjectShinar.GetRef().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2971_Item_00
Function Fragment_Stage_2971_Item_00()
;BEGIN CODE
Alias_Caruso.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2972_Item_00
Function Fragment_Stage_2972_Item_00()
;BEGIN CODE
Actor CarusoRef = Alias_Caruso.GetActorRef()
CarusoRef.EvaluatePackage()
CarusoRef.SetValue(Aggression, -1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2975_Item_00
Function Fragment_Stage_2975_Item_00()
;BEGIN CODE
Actor CarusoRef = Alias_Caruso.GetActorRef()
CarusoRef.EvaluatePackage()
CarusoRef.SetEssential(false)
SetStage(4000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2980_Item_00
Function Fragment_Stage_2980_Item_00()
;BEGIN CODE
SetObjectiveCompleted(2960)

If GetStageDone(2910)
    SFBGS00D_MS_HW_Quest_e2980_CarusoDeath.Start()
    SetObjectiveDisplayed(2980)
elseif GetStageDone(2920)
    SFBGS00D_MS_HW_Quest_e2980_CarusoExile.Start()
endif

Actor CarusoRef = Alias_Caruso.GetActorRef()
CarusoRef.EvaluatePackage()
CarusoRef.SetEssential(false)
Alias_CarusoKill.ForceRefTo(CarusoRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2988_Item_00
Function Fragment_Stage_2988_Item_00()
;BEGIN CODE
Alias_Caruso_EndDeath.ForceRefTo(Alias_DEBUG_Caruso_EndDeath.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2990_Item_00
Function Fragment_Stage_2990_Item_00()
;BEGIN CODE
Actor CarusoRef = Alias_Caruso.GetActorRef()
if GetStageDone(2910) && !CarusoRef.IsDead()
    SFBGS00D_MS_HW_Quest_e2980_CarusoDeath.Stop()
    Utility.Wait(2)
    SFFL_MS01_Quest_CarusoGunshot.Start()
    Utility.Wait(1)
    CarusoRef.AddItem(LL_Weapon_Sidestar_Upgraded)
    CarusoRef.DropObject(Sidestar, 1)
    CarusoRef.BlockActivation(False, false)
    CarusoRef.KillEssential()
    SetStage(4000)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2991_Item_00
Function Fragment_Stage_2991_Item_00()
;BEGIN CODE
SFBGS00D_MS_HW_Quest_e2980_CarusoDeath.Stop()
    Alias_Caruso.GetActorRef().BlockActivation(False, false)
SetStageNoWait(4000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_3010_Item_00
Function Fragment_Stage_3010_Item_00()
;BEGIN CODE
SFFL_MS01_Quest_x1CarusoDiesArc_160_CarusoDead_Zena01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_3020_Item_00
Function Fragment_Stage_3020_Item_00()
;BEGIN CODE
Alias_BabylonResidents.AddtoFaction(PlayerEnemyFaction)
Alias_BabylonResidents.SetValue(Aggression, 1)
Alias_BabylonResidents.StartCombatAll(Game.GetPlayer())
SetStage(4000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_3980_Item_00
Function Fragment_Stage_3980_Item_00()
;BEGIN CODE
SetObjectiveCompleted(160)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_3990_Item_00
Function Fragment_Stage_3990_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(4050)
Alias_BabylonResidents.EvaluateAll()
SetStage(4000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_4000_Item_00
Function Fragment_Stage_4000_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_MS01_QuestScript
Quest __temp = self as Quest
SFBGS00D:SFFL_MS01_QuestScript kmyQuest = __temp as SFBGS00D:SFFL_MS01_QuestScript
;END AUTOCAST
;BEGIN CODE
If !GetStageDone(150) || GetStageDone(2990) || GetStageDone(2991) || GetStageDone(2975)
    CompleteAllObjectives()
    SetStage(4100)
else
    SetObjectiveCompleted(160)
    SetObjectiveSkipped(170)
    SetObjectiveCompleted(250)
    SetObjectiveCompleted(300)
    SetStage(4050)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_4000_Item_01
Function Fragment_Stage_4000_Item_01()
;BEGIN CODE
Game.GetPlayer().SetValue(SFFL_MS01_CarusoExonerate, 1)
Actor CarusoRef = Alias_Caruso.GetActorRef()
Alias_CarusoMisc.ForceRefTo(CarusoRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_4000_Item_02
Function Fragment_Stage_4000_Item_02()
;BEGIN CODE
Game.GetPlayer().SetValue(SFFL_MS01_CarusoExile, 1)
Actor CarusoRef = Alias_Caruso.GetActorRef()
Alias_CarusoMisc.ForceRefTo(CarusoRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_4000_Item_03
Function Fragment_Stage_4000_Item_03()
;BEGIN CODE
Game.GetPlayer().SetValue(SFFL_MS01_CarusoExecution, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_4050_Item_00
Function Fragment_Stage_4050_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_MS01_QuestScript
Quest __temp = self as Quest
SFBGS00D:SFFL_MS01_QuestScript kmyQuest = __temp as SFBGS00D:SFFL_MS01_QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(4050)
Alias_Bernhard.GetRef().EnableNoWait()
ObjectReference DoorRef = Alias_Caruso_Door.GetRef()
DoorRef.BlockActivation(false, false)
kmyQuest.SFFL_MS01_Layer.Delete()
Weather.ReleaseOverride()
Alias_MusicObjectShinar.GetRef().DisableNoWait()
Alias_BabylonResidents.EvaluateAll()
Alias_MusicOverride.GetRef().DisableNoWait()
Alias_PilotSeat.GetRef().BlockActivation(false, false)
ObjectReference[] exteriorloadDoors = Alias_PlayerShip.GetShipRef().GetExteriorLoadDoors()
    int i = 0
    While (i < exteriorLoadDoors.Length)
        exteriorLoadDoors[i].BlockActivation(false, false)
        i += 1
    EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_4100_Item_00
Function Fragment_Stage_4100_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_MS01_QuestScript
Quest __temp = self as Quest
SFBGS00D:SFFL_MS01_QuestScript kmyQuest = __temp as SFBGS00D:SFFL_MS01_QuestScript
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()
SFFL_MS01_MiscDialogue.SetStage(100)
ObjectReference DoorRef = Alias_Caruso_Door.GetRef()
DoorRef.BlockActivation(false, false)
kmyQuest.SFFL_MS01_Layer.Delete()
Weather.ReleaseOverride()
Alias_MusicObjectShinar.GetRef().DisableNoWait()
Alias_BabylonResidents.EvaluateAll()
Alias_MusicOverride.GetRef().DisableNoWait()
Alias_PilotSeat.GetRef().BlockActivation(false, false)
ObjectReference[] exteriorloadDoors = Alias_PlayerShip.GetShipRef().GetExteriorLoadDoors()
    int i = 0
    While (i < exteriorLoadDoors.Length)
        exteriorLoadDoors[i].BlockActivation(false, false)
        i += 1
    EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_5000_Item_00
Function Fragment_Stage_5000_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_MS01_QuestScript
Quest __temp = self as Quest
SFBGS00D:SFFL_MS01_QuestScript kmyQuest = __temp as SFBGS00D:SFFL_MS01_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SFFL_MS01_Layer.Delete()
Weather.ReleaseOverride()
if GetStageDone(2730) || GetStageDone(150)
    SetStage(20000)
else
    Alias_MusicObjectShinar.GetRef().DisableNoWait()
    if GetStageDone(150)
        Alias_BabylonResidents.DisableAll()
    endif
    Weather.ReleaseOverride()
    Alias_Zena_Podium.GetRef().SetFactionOwner(SFFL_MS01_NewBabylonYeatsFaction)
    Stop()
endif
If GetStageDone(4050)
    Alias_Bernhard.GetRef().DisableNoWait()
endif
Alias_PilotSeat.GetRef().BlockActivation(false, false)
ObjectReference[] exteriorloadDoors = Alias_PlayerShip.GetShipRef().GetExteriorLoadDoors()
    int i = 0
    While (i < exteriorLoadDoors.Length)
        exteriorLoadDoors[i].BlockActivation(false, false)
        i += 1
    EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_5000_Item_01
Function Fragment_Stage_5000_Item_01()
;BEGIN CODE
Actor CarusoRef = Alias_Caruso.GetActorRef()
CarusoRef.BlockActivation(false, false)
CarusoRef.EvaluatePackage()
Alias_CarusoMisc.ForceRefTo(CarusoRef)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Computer Auto Const Mandatory

Scene Property SFBGS00D_MS_HW_Quest_Scene01 Auto Const Mandatory

Scene Property SFBGS00D_MS_HW_Quest_Scene02 Auto Const Mandatory

Scene Property SFBGS00D_MS_HW_Quest_130_Scene03 Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ReferenceAlias Property Alias_Caruso Auto Const Mandatory

RefCollectionAlias Property Alias_BabylonResidents Auto Const Mandatory

Keyword Property LinkCustom01 Auto Const Mandatory

Scene Property SFBGS00D_MS_HW_Quest_160_CarusoDead_Zena01 Auto Const Mandatory

Scene Property SFBGS00D_MS_HW_Quest_150_Caruso_Greet Auto Const Mandatory

ReferenceAlias Property Alias_MagnetAnimHelper Auto Const Mandatory

Hazard Property SFBGS00D_GravWellHazard Auto Const Mandatory

Float Property TimeToMagnetize Auto Const

Float Property TimeToMoveMagnet Auto Const

ReferenceAlias Property Alias_Robot Auto Const Mandatory

ReferenceAlias Property Alias_Robot_PowerCell01 Auto Const Mandatory

ReferenceAlias Property Alias_JunkyardSwitch Auto Const Mandatory

MiscObject Property SFBGS00D_MS_HW_Power_Cell Auto Const Mandatory

ReferenceAlias Property Alias_Robot_Pod Auto Const Mandatory

RefCollectionAlias Property Alias_JunkyardParts Auto Const Mandatory

ReferenceAlias Property Alias_Robot_DeathItemSpareParts Auto Const Mandatory

LocationAlias Property Alias_AbandonedOutpostLocation Auto Const Mandatory

Key Property SFBGS00D_MS_HW_Keycard Auto Const Mandatory

ReferenceAlias Property Alias_Caruso_Door Auto Const Mandatory

ReferenceAlias Property Alias_Yates_Door Auto Const Mandatory

ReferenceAlias Property Alias_Guard_YatesSpeech Auto Const Mandatory

ReferenceAlias Property Alias_Guard Auto Const Mandatory

Scene Property SFBGS00D_MS_HW_Quest_c2000_Yates_OpeningScene Auto Const Mandatory

Scene Property SFBGS00D_MS_HW_Quest_140_Caruso_Greet Auto Const Mandatory

Scene Property SFBGS00D_MS_HW_Quest_c2320_Alphonese_Scene Auto Const Mandatory

ReferenceAlias Property Alias_Alphonse Auto Const Mandatory

ReferenceAlias Property Alias_Dumpster_Syringe Auto Const Mandatory

ReferenceAlias Property Alias_Dumpster_BloodyGloves Auto Const Mandatory

Scene Property SFBGS00D_MS_HW_Quest_110_Scene02 Auto Const Mandatory

Scene Property SFBGS00D_MS_HW_Quest_Scenes_YeatsCaruso Auto Const Mandatory

GlobalVariable Property OE_Credit_BribeHigh Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

ReferenceAlias Property Alias_Grace_Caelumite Auto Const Mandatory

MiscObject Property SFBGS00D_MS_HW_StolenInorgUniqueCaelumite Auto Const Mandatory

ReferenceAlias Property Alias_Caruso_Start Auto Const Mandatory

Scene Property SFBGS00D_MS_HW_Quest_Scenes_YeatsCarusoSasha Auto Const Mandatory

Scene Property SFBGS00D_MS_HW_Quest_Scenes_YeatsCarusoSashaEXIT Auto Const Mandatory

ReferenceAlias Property Alias_Yeats_CellDoor Auto Const Mandatory

ReferenceAlias Property Alias_Yeats_Activator Auto Const Mandatory

GlobalVariable Property SFBGS00D_MS_HW_ReligionGlobal Auto Const Mandatory

ReferenceAlias Property Alias_Zena_Visitor Auto Const Mandatory

ReferenceAlias Property Alias_Zena Auto Const Mandatory

Scene Property SFBGS00D_MS_HW_Quest_3000_CarusoZena Auto Const Mandatory

ReferenceAlias Property Alias_Bernhard Auto Const Mandatory

ReferenceAlias Property Alias_PlayerBed Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

Scene Property SFBGS00D_MS_HW_Quest_d3200_CarusoJail Auto Const Mandatory

ReferenceAlias Property Alias_Yeats_Chair Auto Const Mandatory

ReferenceAlias Property Alias_Caruso_Prayer Auto Const Mandatory

Weather Property WeatherThunderstormList Auto Const Mandatory

Scene Property SFBGS00D_MS_HW_Quest_d3300_SceneAll Auto Const

ReferenceAlias Property Alias_GraceKim Auto Const Mandatory

ReferenceAlias Property Alias_Ivica Auto Const Mandatory

GlobalVariable Property SFBGS00D_MS_HW_GraceConvicted Auto Const Mandatory

GlobalVariable Property SFBGS00D_MS_HW_SunniConvicted Auto Const Mandatory

ReferenceAlias Property Alias_SunniKim Auto Const Mandatory

ReferenceAlias Property Alias_Yeats Auto Const Mandatory

Scene Property SFBGS00D_MS_HW_Quest_Scenes_d3500_OpeningStatement Auto Const Mandatory

ReferenceAlias Property Alias_Bernhard_WallLean Auto Const Mandatory

ReferenceAlias Property Alias_BallotBox Auto Const Mandatory

ReferenceAlias Property Alias_BallotBoxActivator Auto Const Mandatory

Scene Property SFBGS00D_MS_HW_Quest_Scenes_Vote_Ivica Auto Const Mandatory

ReferenceAlias Property Alias_Voter_NextInLine Auto Const Mandatory

ReferenceAlias Property Alias_Voter_NextInLineAfter Auto Const Mandatory

Scene Property SFBGS00D_MS_HW_Quest_Scenes_Vote_Sunni Auto Const Mandatory

Scene Property SFBGS00D_MS_HW_Quest_Scenes_Vote_Grace Auto Const

Scene Property SFBGS00D_MS_HW_Quest_Scenes_Vote_Sasha Auto Const Mandatory

Scene Property SFBGS00D_MS_HW_Quest_Scenes_Vote_Alphonse Auto Const Mandatory

ReferenceAlias Property Alias_Caruso_CellDoor Auto Const Mandatory

Scene Property SFBGS00D_MS_HW_Quest_Scenes_BernhardCaruso Auto Const Mandatory

Book Property SFBGS00D_Note_ExecutionVote Auto Const Mandatory

Book Property SFBGS00D_Note_ExileVote Auto Const Mandatory

Book Property SFBGS00D_Note_ExonerateVote Auto Const Mandatory

GlobalVariable Property SFBGS00D_MS_HW_IvicaVote Auto Const Mandatory

GlobalVariable Property SFBGS00D_MS_HW_SashaVote Auto Const Mandatory

GlobalVariable Property SFBGS00D_MS_HW_ZenaVote Auto Const Mandatory

GlobalVariable Property SFBGS00D_MS_HW_SunniVote Auto Const Mandatory

GlobalVariable Property SFBGS00D_MS_HW_GraceVote Auto Const Mandatory

Scene Property SFBGS00D_MS_HW_Quest_Scenes_ZenaVoteTally Auto Const Mandatory

Scene Property SFBGS00D_MS_HW_Quest_Scenes_ZenaVoteCarusoShot Auto Const

Quest Property SFBGS00D_MS_HW_HelpWanted_MiscDialogue Auto Const Mandatory

Scene Property SFBGS00D_MS_HW_Quest_100_Scene01 Auto Const Mandatory

Keyword Property LinkCustom04 Auto Const Mandatory

Weapon Property Eon Auto Const Mandatory

Key Property SFBGS00D_MS_HW_PrisonCellKeycard Auto Const Mandatory

Perk Property SFBGS00D_MS_HW_ActivationPerk Auto Const Mandatory

Scene Property SFBGS00D_MS_HW_Quest_e2900_Vote_Yeats Auto Const Mandatory

Scene Property SFBGS00D_MS_HW_Quest_e2980_CarusoDeath Auto Const Mandatory

Scene Property SFBGS00D_MS_HW_Quest_e2980_CarusoExile Auto Const Mandatory

GlobalVariable Property SFFL_MS01_SQ_Doctors_Price_Addictions Auto Const Mandatory

GlobalVariable Property SFFL_MS01_SQ_Doctors_Price_Afflictions Auto Const Mandatory

GlobalVariable Property SFFL_MS01_SQ_Doctors_Price_Everything Auto Const Mandatory

GlobalVariable Property SFFL_MS01_SQ_Doctors_Price_Wounds Auto Const Mandatory

ReferenceAlias Property Alias_VendorContainerDoc Auto Const Mandatory

ReferenceAlias Property Alias_VendorContainer Auto Const Mandatory

Keyword Property VendorContainerKeyword01 Auto Const Mandatory

Scene Property SFFL_MS01_Quest_CarusoGunshot Auto Const Mandatory

Scene Property SFFL_MS01_Quest_e2920_ZenaVoteCarusoShot Auto Const Mandatory

Quest Property SFFL_MS01_SpeechChallenge_Caspian Auto Const Mandatory

Scene Property SFFL_MS01_Quest_e2920_BernhardKilled Auto Const Mandatory

Scene Property SFFL_MS01_Quest_e2920_BernhardKilledZenaGreet Auto Const Mandatory

Faction Property SFFL_MS01_NewBabylonFaction Auto Const Mandatory

Faction Property PlayerAllyFaction Auto Const Mandatory

ReferenceAlias Property Alias_Caruso_EndDeath Auto Const Mandatory

ReferenceAlias Property Alias_ZenaOutside01 Auto Const Mandatory

ReferenceAlias Property Alias_DEBUG_Caruso_EndDeath Auto Const Mandatory

Scene Property SFFL_MS01_Quest_x1CarusoDiesArc_160_CarusoDead_Zena01 Auto Const Mandatory

GlobalVariable Property SFFL_MS01_GeneratorsStabilized Auto Const Mandatory

ReferenceAlias Property Alias_Church_UniversalEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_Church_EnlightenedEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_Church_SerpentEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory

ReferenceAlias Property Alias_NewBabylonMapMarker Auto Const Mandatory

Quest Property SFFL_MS01_DoctorDialogue Auto Const Mandatory

LocationAlias Property Alias_NewBabylonLocation Auto Const Mandatory

LocationAlias Property NewBabylonPostQuestLocationAlias Auto Const Mandatory

ReferenceAlias Property YeatsAlias Auto Const Mandatory

ReferenceAlias Property SunniAlias Auto Const Mandatory

ReferenceAlias Property GraceAlias Auto Const Mandatory

ReferenceAlias Property CaspianAlias Auto Const Mandatory

ReferenceAlias Property SashaAlias Auto Const Mandatory

ReferenceAlias Property IvicaAlias Auto Const Mandatory

ReferenceAlias Property ZenaAlias Auto Const Mandatory

Keyword Property LinkCustom03 Auto Const Mandatory

ReferenceAlias Property Alias_Grace_Start Auto Const Mandatory

LocationAlias Property Alias_parentLocation Auto Const Mandatory

ReferenceAlias Property Alias_Cave_BreakableWall Auto Const Mandatory

ReferenceAlias Property Alias_Cave_BoringMachine Auto Const Mandatory

Scene Property SFFL_MS01_Quest_b1100_Ivica_SceneDrilling Auto Const Mandatory

Weather Property WeatherClearList Auto Const Mandatory

Keyword Property LinkCustom05 Auto Const Mandatory

Faction Property SFFL_MS01_NewBabylonFriendFaction Auto Const Mandatory

ReferenceAlias Property Alias_Alphonse_Supply01 Auto Const Mandatory

ReferenceAlias Property Alias_Caruso_ShinarSpot Auto Const Mandatory

ReferenceAlias Property Alias_DumpsterClosed Auto Const Mandatory

Outfit Property Outfit_Clothes_Sanctum_Priest_with_Hat Auto Const Mandatory

Outfit Property Outfit_Clothes_Formal_ShirtSlacks_Vest Auto Const Mandatory

ReferenceAlias Property Alias_Caruso_KitchenMarker Auto Const Mandatory

ReferenceAlias Property Alias_BallotStorage Auto Const Mandatory

Scene Property SFFL_MS01_e2900_BernhardCaruso Auto Const Mandatory

Scene Property SFFL_MS01_Quest_e2940_ZenaVoteGreet Auto Const Mandatory

Scene Property SFFL_MS01_Quest_c3400_Zena_VoteStart Auto Const Mandatory

ActorValue Property SFFL_MS01_CarusoDies Auto Const Mandatory

ActorValue Property SFFL_MS01_BernhardDies Auto Const Mandatory

ActorValue Property SFFL_MS01_CarusoExonerate Auto Const Mandatory

ActorValue Property SFFL_MS01_CarusoExile Auto Const Mandatory
ActorValue Property SFFL_MS01_CarusoExecution Auto Const Mandatory

ActorValue Property SFFL_MS01_CaspianKills Auto Const Mandatory

Book Property SFFL_MS01_Note_ExtraVote Auto Const Mandatory

ReferenceAlias Property Alias_CarusoKill Auto Const Mandatory

ReferenceAlias Property Alias_BallotBoxVotingMarkerThird Auto Const Mandatory

ReferenceAlias Property Alias_CarusoMisc Auto Const Mandatory

LocationAlias Property Alias_ShinarOutpostLocation Auto Const Mandatory

LocationAlias Property Alias_Shinar Auto Const Mandatory

ReferenceAlias Property Alias_Caruso_CellDoorActivator Auto Const Mandatory

Scene Property SFFL_MS01_Quest_d2750_YeatsCarusoSashaEXIT Auto Const Mandatory

ReferenceAlias Property Alias_MusicObjectShinar Auto Const Mandatory

ActorValue Property Variable07 Auto Const Mandatory

Key Property SFFL_MS01_DumpsterKeycard Auto Const Mandatory

ReferenceAlias Property Alias_BellMarker Auto Const Mandatory

WwiseEvent Property SFBGS00D_WwiseEvent_QST_MS01_CommunityBell Auto Const Mandatory

Quest Property SFFL_MS01_MiscDialogue Auto Const Mandatory

ReferenceAlias Property Alias_Zena_Podium Auto Const Mandatory

Faction Property SFFL_MS01_NewBabylonYeatsFaction Auto Const Mandatory

RefCollectionAlias Property Alias_LoreSlates Auto Const Mandatory

ReferenceAlias Property Alias_MusicOverride Auto Const Mandatory

GlobalVariable Property SFFL_MS01_SunniConvicted Auto Const Mandatory

GlobalVariable Property SFFL_MS01_GraceConvicted Auto Const Mandatory

ActorValue Property Health Auto Const Mandatory

GlobalVariable Property UC04_TurnOffArrestScene Auto Const Mandatory

LeveledItem Property LL_Weapon_Sidestar_Upgraded Auto Const Mandatory

Weapon Property Sidestar Auto Const Mandatory

ReferenceAlias Property Alias_Caruso_CellDoorActual Auto Const Mandatory

ReferenceAlias Property Alias_Grace_Activator Auto Const Mandatory

ReferenceAlias Property Alias_Grace_Prison Auto Const Mandatory

GlobalVariable Property SFFL_MS01_CrimeGoldGlobal Auto Const Mandatory

ReferenceAlias Property Alias_PilotSeat Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

GlobalVariable Property SFFL_MS01_PrisonDoorUnlocked Auto Const Mandatory

ReferenceAlias Property Alias_Robot_Patrol Auto Const Mandatory

Faction Property CaptiveFaction Auto Const Mandatory
