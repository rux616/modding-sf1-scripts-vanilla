;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_KT_RepoMen_0007D4A7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE oe_shipsaddonscript
Quest __temp = self as Quest
oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.LandShip(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
ObjectReference mySeat = Alias_ShipA_PilotSeat.GetRef()

mySeat.BlockActivation(true, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
ObjectReference mySeat = Alias_ShipA_PilotSeat.GetRef()

mySeat.BlockActivation(false, false)
Alias_ShipA_PilotSeat.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_NPC_Group01.RemoveFromFaction(REPlayerFriend)
Alias_NPC_Group01.AddtoFaction(PlayerEnemyFaction)
Alias_NPC_Group01.StartCombatAll(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
SetStage(84)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_01
Function Fragment_Stage_0080_Item_01()
;BEGIN CODE
ObjectReference LandingDeckUCRef = Alias_ShipA_LandingDeckMarker00.GetRef()
ObjectReference UCGuard01Ref = LandingDeckUCRef.PlaceAtMe(LvlSecurity_UC)
ObjectReference UCGuard02Ref = LandingDeckUCRef.PlaceAtMe(LvlSecurity_UC)
ObjectReference UCGuard03Ref = LandingDeckUCRef.PlaceAtMe(LvlSecurity_UC)

Alias_NPC_RepoPerson01.ForceRefTo(UCGuard01Ref)
Alias_NPC_RepoPerson02.ForceRefTo(UCGuard02Ref)
Alias_NPC_RepoPerson03.ForceRefTo(UCGuard03Ref)

Alias_NPC_Group01.AddRef(Alias_NPC_RepoPerson01.GetRef())
Alias_NPC_Group01.AddRef(Alias_NPC_RepoPerson02.GetRef())
Alias_NPC_Group01.AddRef(Alias_NPC_RepoPerson03.GetRef())

Alias_NPC_Group01.EnableAll(LandingDeckUCRef)
Alias_NPC_Group01.MoveAllTo(LandingDeckUCRef)

SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0084_Item_00
Function Fragment_Stage_0084_Item_00()
;BEGIN CODE
;Replace UC Security with Freestar

ObjectReference LandingDeckRef = Alias_ShipA_LandingDeckMarker00.GetRef()
ObjectReference Freestar01Ref = LandingDeckRef.PlaceAtMe(LvlSecurity_Freestar)
ObjectReference Freestar02Ref = LandingDeckRef.PlaceAtMe(LvlSecurity_Freestar)
ObjectReference Freestar03Ref = LandingDeckRef.PlaceAtMe(LvlSecurity_Freestar)

Alias_NPC_RepoPerson01.ForceRefTo(Freestar01Ref)
Alias_NPC_RepoPerson02.ForceRefTo(Freestar02Ref)
Alias_NPC_RepoPerson03.ForceRefTo(Freestar03Ref)

Alias_NPC_Group01.AddRef(Alias_NPC_RepoPerson01.GetRef())
Alias_NPC_Group01.AddRef(Alias_NPC_RepoPerson02.GetRef())
Alias_NPC_Group01.AddRef(Alias_NPC_RepoPerson03.GetRef())

SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN AUTOCAST TYPE oe_shipsaddonscript
Quest __temp = self as Quest
oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
;END AUTOCAST
;BEGIN CODE
Alias_ShipA.RefillDependentAliases()

if GetStageDone(10)
    SetStage(80)
else
    SetStage(84)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE oe_shipsaddonscript
Quest __temp = self as Quest
oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
;END AUTOCAST
;BEGIN CODE
int i = Utility.RandomInt(0,1)

if i == 1
    kmyQuest.LandShip(0)
else
    SetStage(10)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_01
Function Fragment_Stage_0100_Item_01()
;BEGIN AUTOCAST TYPE oe_shipsaddonscript
Quest __temp = self as Quest
oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.LandShip(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_02
Function Fragment_Stage_0100_Item_02()
;BEGIN CODE
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_03
Function Fragment_Stage_0100_Item_03()
;BEGIN AUTOCAST TYPE oe_shipsaddonscript
Quest __temp = self as Quest
oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
;END AUTOCAST
;BEGIN CODE
int i = Utility.RandomInt(0,1)

if i == 1
    kmyQuest.LandShip(0)
else
    SetStage(10)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Alias_Guard.Clear()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property LL_Weapon_Ranged_Any Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

RefCollectionAlias Property Alias_NPC_Group01 Auto Const Mandatory

Faction Property REPlayerFriend Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

SpaceshipBase Property RepoSpaceship Auto Const Mandatory

ReferenceAlias Property Alias_Marker_ShipLandingA Auto Const Mandatory

ReferenceAlias Property Alias_ShipA Auto Const Mandatory

LocationAlias Property Alias_ShipA_InteriorLocation Auto Const Mandatory

ReferenceAlias Property Alias_ShipA_InteriorMarker00 Auto Const Mandatory

LeveledItem Property LL_OE_AlternativeReward Auto Const Mandatory

Faction Property OE_GroupAllyFaction Auto Const Mandatory

GlobalVariable Property OE_Credit_RepoBounty Auto Const Mandatory

ReferenceAlias Property Alias_playerShip Auto Const Mandatory

ReferenceAlias Property Alias_NPC_RepoPerson03 Auto Const Mandatory

ReferenceAlias Property Alias_NPC_RepoPerson02 Auto Const Mandatory

ReferenceAlias Property Alias_NPC_RepoPerson01 Auto Const Mandatory

Faction Property CrimeFactionUC Auto Const Mandatory

Faction Property CrimeFactionFreestar Auto Const Mandatory

ReferenceAlias Property Alias_NPCStandingClipboard Auto Const Mandatory

ReferenceAlias Property Alias_ShipDoor Auto Const Mandatory

LocationAlias Property Alias_ShipA_ExteriorLocation Auto Const Mandatory

ReferenceAlias Property Alias_ShipA_LandingDeckMarker00 Auto Const Mandatory

ReferenceAlias Property Alias_ShipA_LandingDeckMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_Marker_TravelB02 Auto Const Mandatory

ReferenceAlias Property Alias_ShipA_LandingDeckMarker02 Auto Const Mandatory

ActorBase Property LvlSecurity_Freestar Auto Const Mandatory

ReferenceAlias Property Alias_Guard Auto Const Mandatory

ActorBase Property LvlSecurity_UC Auto Const Mandatory

ReferenceAlias Property Alias_ShipA_PilotSeat Auto Const Mandatory
