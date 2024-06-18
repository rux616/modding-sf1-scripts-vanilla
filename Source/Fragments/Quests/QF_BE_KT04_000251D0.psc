;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BE_KT04_000251D0 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_Container.GetRef().AddAliasedItem(BE_KT04_DataSlate00, Alias_AudioLog04)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_01
Function Fragment_Stage_0010_Item_01()
;BEGIN CODE
Alias_EnemyShipInteriorLocation.GetLocation().AddKeyword(LocTypeBEDerelict)
SE_KT04.SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
Alias_Captain.GetActorRef().Kill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_01
Function Fragment_Stage_0015_Item_01()
;BEGIN CODE
ObjectReference[] pCorpses = Alias_GenericCorpses.GetArray()
ObjectReference[] pSpawnMarkers = Alias_SmallItemSpawnMarkers.GetArray()

Alias_Captain.GetRef().AddAliasedItem(BE_KT04_AudioLogSlate02, Alias_AudioLog01)
Alias_SlateCollection.AddRef(Alias_AudioLog01.GetRef())

pCorpses[1].AddAliasedItem(BE_KT04_DataSlate01, Alias_AudioLog02)
Alias_SlateCollection.AddRef(Alias_AudioLog02.GetRef())

ObjectReference SlateRef = pSpawnMarkers[0].PlaceAtMe(BE_KT04_AudioLogSlate01)
Alias_AudioLog03.ForceRefTo(SlateRef)
Alias_SlateCollection.AddRef(SlateRef)

BE_KT04_Variant01.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_02
Function Fragment_Stage_0015_Item_02()
;BEGIN CODE
;Rich passengers storyline, add relevant audio logs and slates, set global to track

ObjectReference[] pCorpses = Alias_GenericCorpses.GetArray()

pCorpses[1].AddAliasedItem(BE_KT04_AudioLogSlate03, Alias_AudioLog01)
Alias_SlateCollection.AddRef(Alias_AudioLog01.GetRef())

pCorpses[2].AddAliasedItem(BE_KT04_DataSlate02, Alias_AudioLog02)
Alias_SlateCollection.AddRef(Alias_AudioLog02.GetRef())

ObjectReference CaptainRef = Alias_Captain.GetRef()
CaptainRef.AddAliasedItem(BE_KT04_AudioLogSlate04, Alias_AudioLog03)
Alias_SlateCollection.AddRef(Alias_AudioLog03.GetRef())

CaptainRef.AddAliasedItem(BE_KT04_AudioLogSlate04B, Alias_AudioLog04)
Alias_SlateCollection.AddRef(Alias_AudioLog04.GetRef())

BE_KT04_Variant02.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_03
Function Fragment_Stage_0015_Item_03()
;BEGIN CODE
;Spacer attack storyline, add relevant audio logs and slates, set global to track
Alias_SpacerCaptain.GetRef().AddAliasedItem(BE_KT04_AudioLogSlate07, Alias_AudioLog01)
Alias_SlateCollection.AddRef(Alias_AudioLog01.GetRef())

int i = 0
ObjectReference[] SpawnMarkers = Alias_CrewSpawnMarkers.GetArray()

While i < SpawnMarkers.Length && i < 7
    ObjectReference Spacer = SpawnMarkers[i].PlaceAtMe(LvlSpacer)
    Alias_Spacers.AddRef(Spacer)
    i += 1
endWhile

ObjectReference[] SpacerRefs = Alias_Spacers.GetArray()
ObjectReference[] GenericCorpsesRefs = Alias_GenericCorpses.GetArray()
SpacerRefs[0].AddAliasedItem(BE_KT04_AudioLogSlate06, Alias_AudioLog02)
Alias_SlateCollection.AddRef(Alias_AudioLog02.GetRef())

SpacerRefs[1].AddAliasedItem(BE_KT04_DataSlate03, Alias_AudioLog03)
Alias_SlateCollection.AddRef(Alias_AudioLog03.GetRef())

Alias_Spacers.KillAll()

ObjectReference[] pCorpses = Alias_GenericCorpses.GetArray()

Alias_Captain.GetRef().AddAliasedItem(BE_KT04_DataSlate03b, Alias_AudioLog04)
Alias_SlateCollection.AddRef(Alias_AudioLog04.GetRef())

BE_KT04_Variant03.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_04
Function Fragment_Stage_0015_Item_04()
;BEGIN CODE
;Escaped lovers storyline, add relevant audio logs and slates, set global to track
ObjectReference[] pSpawnMarkers = Alias_SmallItemSpawnMarkers.GetArray()
ObjectReference[] pCorpses = Alias_GenericCorpses.GetArray()

pCorpses[1].AddAliasedItem(BE_KT04_AudioLogSlate08, Alias_AudioLog01)
Alias_SlateCollection.AddRef(Alias_AudioLog01.GetRef())

ObjectReference SlateRef = pSpawnMarkers[0].PlaceAtMe(BE_KT04_AudioLogSlate08b)
Alias_AudioLog02.ForceRefTo(SlateRef)
Alias_SlateCollection.AddRef(SlateRef)

ObjectReference Slate2Ref = pSpawnMarkers[1].PlaceAtMe(BE_KT04_AudioLogSlate09)
Alias_AudioLog03.ForceRefTo(Slate2Ref)
Alias_SlateCollection.AddRef(Slate2Ref)

Alias_Captain.GetRef().AddAliasedItem(BE_KT04_DataSlate04, Alias_AudioLog04)
Alias_SlateCollection.AddRef(Alias_AudioLog04.GetRef())

BE_KT04_Variant04.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_05
Function Fragment_Stage_0015_Item_05()
;BEGIN CODE
Alias_SpacerCaptain.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_06
Function Fragment_Stage_0015_Item_06()
;BEGIN CODE
;Start quest and add audio logs to RefColl for QT
SE_KT04.SetStage(30)
SetObjectiveDisplayed(10)
Alias_SlateCollection.AddRef(Alias_AudioLog01.GetRef())
Alias_SlateCollection.AddRef(Alias_AudioLog02.GetRef())
Alias_SlateCollection.AddRef(Alias_AudioLog03.GetRef())
Alias_SlateCollection.AddRef(Alias_AudioLog04.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0066_Item_00
Function Fragment_Stage_0066_Item_00()
;BEGIN CODE
;Have Captain killed by attackers
Alias_Captain.GetActorRef().Kill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
BE_KT04_AudioSlateSeries.SetValue(9)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_01
Function Fragment_Stage_1000_Item_01()
;BEGIN CODE
SetObjectiveFailed(10)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorValue Property SpaceshipCrew Auto Const Mandatory

ReferenceAlias Property Alias_EnemyShip Auto Const Mandatory

ReferenceAlias Property Alias_Captain Auto Const Mandatory

Float Property GravityFloat Auto Const Mandatory

RefCollectionAlias Property Alias_GenericCrew Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

Faction Property REPlayerFriend Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

Quest Property SE_KT03 Auto Const Mandatory

Book Property BE_KT04_AudioLogSlate01 Auto Const Mandatory

GlobalVariable Property BE_KT04_AudioSlateSeries Auto Const Mandatory

RefCollectionAlias Property Alias_GenericCorpses Auto Const Mandatory

Book Property BE_KT04_AudioLogSlate02 Auto Const Mandatory

Book Property BE_KT04_AudioLogSlate03 Auto Const Mandatory

Book Property BE_KT04_AudioLogSlate04 Auto Const Mandatory

Book Property BE_KT04_DataSlate01 Auto Const Mandatory

Book Property BE_KT04_AudioLogSlate04B Auto Const Mandatory

Book Property BE_KT04_DataSlate02 Auto Const Mandatory

GlobalVariable Property BE_KT04_Variant01 Auto Const Mandatory

GlobalVariable Property BE_KT04_Variant02 Auto Const Mandatory

GlobalVariable Property BE_KT04_Variant03 Auto Const Mandatory

GlobalVariable Property BE_KT04_Variant04 Auto Const

Book Property BE_KT04_AudioLogSlate08 Auto Const Mandatory

Book Property BE_KT04_AudioLogSlate07 Auto Const Mandatory

Book Property BE_KT04_AudioLogSlate06 Auto Const Mandatory

Book Property BE_KT04_DataSlate03 Auto Const Mandatory

Book Property BE_KT04_DataSlate04 Auto Const Mandatory

Book Property BE_KT04_AudioLogSlate09 Auto Const Mandatory

ActorBase Property LvlSpacer Auto Const Mandatory

RefCollectionAlias Property Alias_AllCrew Auto Const Mandatory

ReferenceAlias Property Alias_Container Auto Const Mandatory

Book Property BE_KT04_DataSlate00 Auto Const Mandatory

ReferenceAlias Property Alias_SpacerCaptain Auto Const Mandatory

Book Property BE_KT04_DataSlate03b Auto Const Mandatory

ReferenceAlias Property Alias_AudioLog01 Auto Const Mandatory

ReferenceAlias Property Alias_AudioLog02 Auto Const Mandatory

ReferenceAlias Property Alias_AudioLog03 Auto Const Mandatory

ReferenceAlias Property Alias_AudioLog04 Auto Const Mandatory

RefCollectionAlias Property Alias_SlateCollection Auto Const Mandatory

Quest Property SE_KT04 Auto Const Mandatory

Book Property BE_KT04_AudioLogSlate08b Auto Const Mandatory

RefCollectionAlias Property Alias_ItemSpawnMarkers Auto Const Mandatory

RefCollectionAlias Property Alias_CrewSpawnMarkers Auto Const Mandatory

ReferenceAlias Property Alias_SpawnMarkerCaptain Auto Const Mandatory

RefCollectionAlias Property Alias_Spacers Auto Const Mandatory

VoiceType Property _NPC_NoLines Auto Const Mandatory

RefCollectionAlias Property Alias_SmallItemSpawnMarkers Auto Const Mandatory

Keyword Property LocTypeBEDerelict Auto Const Mandatory

LocationAlias Property Alias_EnemyShipInteriorLocation Auto Const Mandatory
