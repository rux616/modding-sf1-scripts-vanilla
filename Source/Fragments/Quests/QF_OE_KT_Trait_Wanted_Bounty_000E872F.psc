;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_KT_Trait_Wanted_Bounty_000E872F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Trait_NPC_BountyHunterEncounter.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN AUTOCAST TYPE oescript
Quest __temp = self as Quest
oescript kmyQuest = __temp as oescript
;END AUTOCAST
;BEGIN CODE
ObjectReference ExtraNPC = Alias_NPC04.GetRef()
ObjectReference LandingMarker = Alias_ShipA_LandingDeckMarker03.GetRef()
if LandingMarker != None
    ExtraNPC.MoveTo(LandingMarker)
else
    ExtraNPC.MoveTo(Alias_NPC03.GetRef())
endif
Alias_NPC_Group01.AddRef(ExtraNPC)
ExtraNPC.EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_01
Function Fragment_Stage_0004_Item_01()
;BEGIN CODE
Alias_NPC04.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
int i = Utility.RandomInt(0,1)

if i == 1
    SetStage(7)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN AUTOCAST TYPE oe_shipsaddonscript
Quest __temp = self as Quest
oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
;END AUTOCAST
;BEGIN CODE
if Alias_Marker_ShipLandingB.GetRef() != None
   kmyQuest.LandShip(1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
Alias_ShipB.RefillDependentAliases()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
Alias_ShipA.RefillDependentAliases()
Alias_PilotSeat.GetRef().BlockActivation(true, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE oe_shipsaddonscript
Quest __temp = self as Quest
oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.LandShip(0)
OE_TraitWantedRandomPercent.SetValue(EncounterOdds)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_01
Function Fragment_Stage_0010_Item_01()
;BEGIN AUTOCAST TYPE oescript
Quest __temp = self as Quest
oescript kmyQuest = __temp as oescript
;END AUTOCAST
;BEGIN CODE
kmyquest.SetCooldown()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;SpaceshipReference ShipRef = Alias_ShipA.GetShipRef()
;ObjectReference[] landingRamps = ShipRef.GetLandingRamps()
   ; int i = 0
   ; While (i < landingRamps.Length)
   ;     landingRamps[i].SetOpen(true)
   ;     i += 1
  ;  EndWhile

ObjectReference NPC01 = Alias_NPC01.GetActorRef()
ObjectReference NPC02 = Alias_NPC02.GetActorRef()
ObjectReference NPC03 = Alias_NPC03.GetActorRef()
NPC01.MoveTo(Alias_ShipA_LandingDeckMarker00.GetRef())
NPC02.MoveTo(Alias_ShipA_LandingDeckMarker01.GetRef())
NPC03.MoveTo(Alias_ShipA_LandingDeckMarker02.GetRef())

NPC01.EnableNoWait()
NPC02.EnableNoWait()
NPC03.EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_01
Function Fragment_Stage_0015_Item_01()
;BEGIN CODE
SetStage(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_02
Function Fragment_Stage_0015_Item_02()
;BEGIN CODE
SetStage(6)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_NPC_Group01.AddRef(Alias_NPC01.GetRef())
Alias_NPC_Group01.AddRef(Alias_NPC02.GetRef())
Alias_NPC_Group01.AddRef(Alias_NPC03.GetRef())

if GetStageDone(4)
   Alias_NPC_Group01.AddRef(Alias_NPC04.GetRef())
endif

Alias_NPC01.GetRef().AddAliasedItem(Trait_Wanted_DataSlate01, Alias_BountyNote01)

Alias_NPC_Group01.RemovefromFaction(PlayerFriendFaction)
Alias_NPC_Group01.AddtoFaction(PlayerEnemyFaction)
Alias_NPC_Group01.StartCombatAll(Game.GetPlayer())
Alias_NPC_Group01.SetValue(Game.GetAggressionAV(), 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, Trait_Credit_ExtortionMedium.GetValueInt())
SetStage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, Trait_Credit_ExtortionMedium.GetValueInt())
Game.GetPlayer().RemoveItem(Credits, Trait_Credit_ExtortionMedium.GetValueInt())
SetStage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
Alias_NPC_Group02.RemovefromFaction(PlayerAllyFaction)
Alias_NPC_Group02.AddtoFaction(PlayerEnemyFaction)
Alias_NPC_Group02.StartCombatAll(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
ObjectReference[] landingRamps = Alias_ShipB.GetShipRef().GetLandingRamps()
    int i = 0
    While (i < landingRamps.Length)
        landingRamps[i].SetOpen(true)
        i += 1
    EndWhile

ObjectReference NPC05 = Alias_NPC05.GetRef()
ObjectReference NPC06 = Alias_NPC06.GetRef()
ObjectReference NPC07 = Alias_NPC07.GetRef()
ObjectReference NPC08 = Alias_NPC08.GetRef()
ObjectReference NPC09 = Alias_NPC09.GetRef()

NPC05.MoveTo(Alias_ShipB_LandingDeckMarker00.GetRef())
NPC06.MoveTo(Alias_ShipB_LandingDeckMarker01.GetRef())
NPC07.MoveTo(Alias_ShipB_LandingDeckMarker02.GetRef())
NPC08.MoveTo(Alias_ShipB_LandingDeckMarker03.GetRef())
NPC09.MoveTo(Alias_ShipB_LandingDeckMarker03.GetRef())

NPC05.EnableNoWait()
NPC06.EnableNoWait()
NPC07.EnableNoWait()
NPC08.EnableNoWait()
NPC09.EnableNoWait()

Alias_NPC_Group02.StartCombatAll(Alias_NPC01.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0079_Item_00
Function Fragment_Stage_0079_Item_00()
;BEGIN CODE
int i = 0
While i < BE_GenericQuests.Length
    if BE_GenericQuests[i].IsRunning() && enemyShipRef[i].GetShipRef() == Alias_ShipB.GetShipRef()
        BE_GenericQuests[i].SetEnemyShipLandingRampsOpenState(true)
    endif
    i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
int i = 0
While i < BE_GenericQuests.Length
    if BE_GenericQuests[i].IsRunning() && enemyShipRef[i].GetShipRef() == Alias_ShipA.GetShipRef()
        BE_GenericQuests[i].SetEnemyShipLandingRampsOpenState(true)
    endif
    i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
TraitWanted.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
Alias_NPC01.GetActorRef().EvaluatePackage()
TraitWanted.SetStage(10)
int ChanceValue = Trait_Wanted_KillGlobal.GetValueInt()
Trait_Wanted_KillGlobal.SetValue(ChanceValue + 1)

if !GetStageDone(30)
    int BountyIncrease = Trait_Credit_ValueIncrease.GetValueInt()
    int CurrentBountyValue = Trait_Credit_WantedMedium.GetValueInt() + BountyIncrease
    Trait_Credit_WantedMedium.SetValue(CurrentBountyValue)
endif

float expiry = Utility.ExpiryDay(Trait_Wanted_SE_CooldownDays.GetValue())
Game.GetPlayer().SetValue(Trait_Wanted_SE_Cooldown_AVIF, expiry)
OE_TraitWantedRandomPercent.SetValue(EncounterOdds)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_01
Function Fragment_Stage_0150_Item_01()
;BEGIN CODE
int ChanceValue = SE_Player_ChanceTraitWantedGlobal.GetValueInt()
SE_Player_ChanceTraitWantedGlobal.SetValue(ChanceValue + 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9999_Item_00
Function Fragment_Stage_9999_Item_00()
;BEGIN AUTOCAST TYPE oescript
Quest __temp = self as Quest
oescript kmyQuest = __temp as oescript
;END AUTOCAST
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_NPC01 Auto Const Mandatory

ReferenceAlias Property Alias_NPC02 Auto Const Mandatory

ReferenceAlias Property Alias_NPC03 Auto Const Mandatory

RefCollectionAlias Property Alias_NPC_Group01 Auto Const Mandatory

ReferenceAlias Property Alias_NPC04 Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

Book Property Trait_Wanted_DataSlate01 Auto Const Mandatory

ReferenceAlias Property Alias_BountyNote01 Auto Const Mandatory

GlobalVariable Property Trait_Credit_ExtortionSmall Auto Const Mandatory

GlobalVariable Property Trait_Credit_ExtortionMedium Auto Const Mandatory

ReferenceAlias Property Alias_ShipA Auto Const Mandatory

ReferenceAlias Property Alias_Marker_ShipLandingA Auto Const Mandatory

Faction Property PlayerAllyFaction Auto Const Mandatory

Faction Property PlayerFriendFaction Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

Float Property TimeDelayForShipArrival Auto Const Mandatory

Quest Property TraitWanted Auto Const Mandatory

ReferenceAlias Property Alias_Marker_ShipLandingB Auto Const Mandatory

ReferenceAlias Property Alias_ShipB Auto Const Mandatory

RefCollectionAlias Property Alias_NPC_Group02 Auto Const Mandatory

ReferenceAlias Property Alias_NPC05 Auto Const Mandatory

ReferenceAlias Property Alias_NPC06 Auto Const Mandatory

ReferenceAlias Property Alias_NPC07 Auto Const Mandatory

Float Property ShipSpawnHeightFloat Auto Const Mandatory

Scene Property Trait_NPC_BountyHunterEncounter Auto Const Mandatory

GlobalVariable Property Trait_Wanted_KillGlobal Auto Const Mandatory


SpaceshipBase Property LvlShip_Ecliptic_Combat Auto Const Mandatory

LocationAlias Property Alias_ShipA_InteriorLocation Auto Const Mandatory

ReferenceAlias Property Alias_ShipA_InteriorMarker00 Auto Const Mandatory

LocationAlias Property Alias_ShipB_InteriorLocation Auto Const Mandatory

ReferenceAlias Property Alias_ShipB_InteriorMarker00 Auto Const Mandatory

SpaceshipBase Property LvlShip_Spacer_Combat Auto Const Mandatory

LocationAlias Property Alias_ShipA_ExteriorLocation Auto Const Mandatory

LocationAlias Property Alias_ShipB_ExteriorLocation Auto Const Mandatory

ReferenceAlias Property Alias_ShipA_LandingDeckMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_ShipB_LandingDeckMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_NPC08 Auto Const Mandatory

ReferenceAlias Property Alias_NPC09 Auto Const Mandatory

bescript Property BE_Generic Auto Const Mandatory

ReferenceAlias Property Alias_ShipA_LandingDeckMarker02 Auto Const Mandatory

ReferenceAlias Property Alias_ShipB_LandingDeckMarker02 Auto Const Mandatory

ReferenceAlias Property Alias_ShipA_LandingDeckMarker03 Auto Const Mandatory

ReferenceAlias Property Alias_ShipB_LandingDeckMarker03 Auto Const Mandatory

ReferenceAlias Property Alias_ShipB_LandingDeckMarker00 Auto Const Mandatory

ReferenceAlias Property Alias_ShipA_LandingDeckMarker00 Auto Const Mandatory

GlobalVariable Property Trait_Credit_WantedMedium Auto Const Mandatory

GlobalVariable Property Trait_Credit_ValueIncrease Auto Const Mandatory

GlobalVariable Property SE_Player_ChanceTraitWantedGlobal Auto Const Mandatory

GlobalVariable Property OE_Trait_Wanted_BountyHunters_Cooldown Auto Const Mandatory

ReferenceAlias Property Alias_PilotSeat Auto Const Mandatory

ReferenceAlias[] Property enemyShipRef Auto Const Mandatory

BEScript[] Property BE_GenericQuests Auto Const Mandatory

GlobalVariable Property Trait_Wanted_SE_CooldownDays Auto Const Mandatory

ActorValue Property Trait_Wanted_SE_Cooldown_AVIF Auto Const Mandatory

GlobalVariable Property OE_TraitWantedRandomPercent Auto Const Mandatory

Int Property EncounterOdds Auto Const Mandatory
