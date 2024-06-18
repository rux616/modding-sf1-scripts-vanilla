;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BE_CF02_Ragana_BoardingQu_0010CB89 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
BE_CF02_Ragana_BoardingQuestMovePlacement.Stop()
Alias_GenericCrew04.GetRef().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
BE_CF02_Ragana_Winston_Dialogue.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
BE_CF02_Ragana_Winston_Dialogue_Action04_Choice01.Send()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
CF02.SetObjectiveCompleted(550)
CF02.SetObjectiveDisplayed(560)

ObjectReference CaptainRef = Alias_Captain.GetRef()

Alias_CF02_Winston.ForceRefTo(CaptainRef)
Alias_Rake.ForceRefTo(CF_AustinRakeRef)
Alias_AustinRakeName.ForceRefTo(CF_AustinRakeRef)
CF_AustinRakeRef.MoveTo(Alias_CrewSpawn01.GetRef())
Alias_AllCrew.AddRef(CF_AustinRakeRef)

ObjectReference[] myCrew = Alias_AllCrew.GetArray()

myCrew[1].AddItem(LL_Weapon_Ranged_Handgun, 1)
myCrew[2].AddItem(LL_Weapon_Ranged_Handgun, 1)

BE_CF02_Ragana_BoardingQuestMovePlacement.Start()
SetStage(9)

ObjectReference Link01 = Alias_CrewSpawn01.GetRef().GetLinkedRef(LinkCustom09)
ObjectReference Link02 = Alias_CrewSpawn02.GetRef().GetLinkedRef(LinkCustom09)
ObjectReference Link03 = Alias_CrewSpawn03.GetRef().GetLinkedRef(LinkCustom09)
ObjectReference Link04 = Alias_CrewSpawn04.GetRef().GetLinkedRef(LinkCustom09)
Alias_CrewSpawnFurniture01.ForceRefTo(Link01)
Alias_CrewSpawnFurniture02.ForceRefTo(Link02)
Alias_CrewSpawnFurniture03.ForceRefTo(Link03)
Alias_CrewSpawnFurniture04.ForceRefTo(Link04)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
if GetStageDone(8) && !GetStageDone(40)
    SetStage(30)
else
    SetStage(20)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
Alias_AustinRakeName.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
ObjectReference CaptainRef = Alias_Captain.GetRef()

DmitriNPC01.ForceRefTo(CaptainRef)
DmitriNPC02.ForceRefTo(CaptainRef)
DmitriNPC03.ForceRefTo(CaptainRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_GenericCrew.AddRef(Alias_GenericCrew02.GetRef())
Alias_GenericCrew.AddRef(Alias_GenericCrew03.GetRef())
Alias_GenericCrew.AddRef(Alias_GenericCrew04.GetRef())
Alias_GenericCrew.EnableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
CF02.SetObjectiveCompleted(560)
CF02_Ragana_SpeechChallenge04.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
CF02.SetObjectiveFailed(560)
CF02.SetObjectiveSkipped(600)
CF02.SetObjectiveSkipped(605)
CF02.SetObjectiveDisplayed(606)

ObjectReference CaptainRef = Alias_Captain.GetRef()

Alias_AllCrew.AddRef(CaptainRef)

Actor PlayerRef = Game.GetPlayer()
Alias_AllCrew.RemoveFromFaction(PlayerFriendFaction)
PlayerRef.RemoveFromFaction(CF02_RaganaFaction)

Alias_Rake.GetActorRef().StartCombat(PlayerRef)
Utility.Wait(0.5)
Alias_AllCrew.SetValue(Aggression, 2)
Alias_AllCrew.StartCombatAll(PlayerRef)
Alias_ModuleExit.GetRef().Lock(true)

SpaceshipReference RaganaRef = Alias_EnemyShip.GetShipRef()

RaganaRef.AddToFaction(PlayerEnemyFaction)
RaganaRef.SetValue(Aggression, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
CF02.SetObjectiveCompleted(600)
CF02.SetObjectiveSkipped(605)

Actor RakeRef = Alias_Rake.GetActorRef()
RakeRef.RemoveFromFaction(CF02_RaganaFaction)
Alias_AllCrew.RemoveRef(RakeRef)
RakeRef.SetValue(Aggression, 3)
RakeRef.StartCombat(Alias_Captain.GetActorRef())
RakeRef.AddtoFaction(CF02_RaganaHostileFaction)

Alias_GenericCrew.SetValue(Aggression, 1)
Alias_GenericCrew.StartCombatAll(RakeRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
CF02.SetObjectiveCompleted(605)
BE_CF02_Ragana_Winston_Dialogue.Stop()
Actor[] CrewRef = Alias_AllCrew.GetActorArray()
int i = 0

while i < CrewRef.Length
    CrewRef[i].EvaluatePackage()
    Utility.Wait(0.75)
    i += 1
endwhile

CF02.SetStage(475)
CF02.SetStage(480)
SetStage(11)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
if GetStageDone(60)
    CF02.SetStage(520)
else 
    CF02.SetStage(610)
endif

CF02.SetObjectiveCompleted(606)
SetStage(11)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
if GetStageDone(50)
    CF02.SetStage(520)
    Setstage(1000)
endif
Alias_ModuleExit.GetRef().Lock(false)

SpaceshipReference ShipRef = Alias_EnemyShip.GetShipRef()

ShipRef.SetValue(SpaceshipCrew, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Alias_EnemyShip.GetShipRef().SetValue(DockingPermission, 4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
CF02.SetStage(12)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorValue Property Aggression Auto Const Mandatory

ReferenceAlias Property Alias_Rake Auto Const Mandatory

RefCollectionAlias Property Alias_AllCrew Auto Const Mandatory

Faction Property CF02_RaganaFaction Auto Const Mandatory

Quest Property CF02 Auto Const Mandatory

ReferenceAlias Property Alias_Captain Auto Const Mandatory

ReferenceAlias Property Alias_PilotSeat Auto Const Mandatory

ReferenceAlias Property Alias_CaptainSpawnMarker Auto Const Mandatory

RefCollectionAlias Property Alias_CrewSpawnMarkers Auto Const Mandatory

ObjectReference Property CF_AustinRakeRef Auto Const

LeveledItem Property LL_Weapon_Ranged_Handgun Auto Const Mandatory

Faction Property CF02_RaganaHostileFaction Auto Const Mandatory

RefCollectionAlias Property Alias_GenericCrew Auto Const Mandatory

Quest Property CF02_Ragana_SpeechChallenge04 Auto Const Mandatory

ReferenceAlias Property Alias_CF02_Winston Auto Const Mandatory


ReferenceAlias Property Alias_ModuleExit Auto Const Mandatory

Scene Property BE_CF02_Ragana_BoardingQuestMovePlacement Auto Const Mandatory

Faction Property PlayerFriendFaction Auto Const Mandatory

Scene Property BE_CF02_Ragana_Winston_Dialogue Auto Const Mandatory

ReferenceAlias Property Alias_CrewSpawn01 Auto Const Mandatory

ReferenceAlias Property Alias_GenericCrew02 Auto Const Mandatory

ReferenceAlias Property Alias_GenericCrew03 Auto Const Mandatory

ReferenceAlias Property Alias_GenericCrew04 Auto Const Mandatory

ReferenceAlias Property Alias_AustinRakeName Auto Const Mandatory

ReferenceAlias Property DmitriNPC01 Auto Const Mandatory

ReferenceAlias Property DmitriNPC02 Auto Const Mandatory

ReferenceAlias Property DmitriNPC03 Auto Const Mandatory

AffinityEvent Property BE_CF02_Ragana_Winston_Dialogue_Action04_Choice01 Auto Const Mandatory

ReferenceAlias Property Alias_enemyShip Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory

ActorValue Property SpaceshipCrew Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ReferenceAlias Property Alias_CrewSpawn02 Auto Const Mandatory

ReferenceAlias Property Alias_CrewSpawn03 Auto Const Mandatory

ReferenceAlias Property Alias_CrewSpawn04 Auto Const Mandatory

ReferenceAlias Property Alias_CrewSpawnFurniture01 Auto Const Mandatory

ReferenceAlias Property Alias_CrewSpawnFurniture02 Auto Const Mandatory

ReferenceAlias Property Alias_CrewSpawnFurniture03 Auto Const Mandatory

ReferenceAlias Property Alias_CrewSpawnFurniture04 Auto Const Mandatory

Keyword Property LinkCustom09 Auto Const Mandatory

Keyword Property LinkCustom10 Auto Const Mandatory
