;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_KT_FalseContact_0007E715 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
ObjectReference FurnitureRef = Alias_ShipA_CaptainMarker.GetRef().PlaceAtMe(NPCStanding_DataSlate)
Actor SmugglerRef = Alias_NPC_Smuggler.GetActorRef()
debug.trace(self + " SmugglerRef=" + SmugglerRef)
debug.trace(self + " FurnitureRef=" + FurnitureRef)
Alias_ShipA_CaptainFurniture.ForceRefTo(FurnitureRef)
SmugglerRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
int RQValue = RQ_Hello_Calm_PostAcceptValue.GetValueInt()
Alias_Smugglers.SetValue(RQ_AV_Hello, RQValue)

ObjectReference[] SmugRef = Alias_Smugglers.GetArray()
int i = 0
While i < SmugRef.Length
    Alias_CrewName.AddRef(SmugRef[i])
    i +=1
endWhile

Alias_Smugglers.SetValue(RQ_AV_Hello, RQValue)


Actor Captain = Alias_NPC_Smuggler.GetActorRef()

Alias_Smugglers.AddRef(Captain)
Alias_Smugglers.AddRef(Alias_NPC_Crew01.GetRef())
Alias_Smugglers.AddRef(Alias_NPC_Crew02.GetRef())
Captain.SetValue(RQ_AV_Hello, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Actor SmugglerRef = Alias_NPC_Smuggler.GetActorRef()

SmugglerRef.RemovefromFaction(REPlayerFriend)
SmugglerRef.AddtoFaction(PlayerEnemyFaction)
SmugglerRef.SetValue(Aggression, 1)
SmugglerRef.StartCombat(Game.GetPlayer())

Alias_Smugglers.RemovefromFaction(REPlayerFriend)
Alias_Smugglers.AddtoFaction(PlayerEnemyFaction)
Alias_Smugglers.SetValue(Aggression, 1)
Alias_Smugglers.StartCombatAll(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
; trigger NPC spawning
Alias_MapMarker.TryToEnable()
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

setstage(80) ; spawn NPCs
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
ObjectReference MarkerB = Alias_Marker_ShipLandingB.GetRef()
ObjectReference MarkerC = Alias_Marker_ShipLandingC.GetRef()

if Alias_Marker_ShipLandingA.GetRef().IsFurnitureInUse() && MarkerB != None && !MarkerB.IsFurnitureInUse()
    Alias_Marker_ShipLandingA.ForceRefTo(MarkerB)
elseif Alias_Marker_ShipLandingA.GetRef().IsFurnitureInUse() && MarkerB.IsFurnitureInUse() && MarkerC != None && !MarkerC.IsFurnitureInUse()
    Alias_Marker_ShipLandingA.ForceRefTo(MarkerC)
endif

kmyQuest.LandShip()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(LL_OE_AlternativeReward)
OE_FalseContact_Global.SetValue(1)

int RQValue = RQ_Hello_Calm_PostAcceptValue.GetValueInt()
Alias_NPC_Smuggler.GetActorRef().SetValue(RQ_AV_Hello, RQValue)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE oe_shipsaddonscript
Quest __temp = self as Quest
oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
;END AUTOCAST
;BEGIN CODE
Alias_ShipA.GetShipRef().SetExteriorLoadDoorInaccessible(True)
Utility.Wait(10)
kmyQuest.LaunchShip(0)
if Alias_OE_Location.GetLocation().HasKeyword(LocTypeOE_ThemeEmptyKeyword)
  Alias_MapMarker.TryToDisable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
Alias_PilotSeat.GetRef().RemoveKeyword(BlockPlayerActivation_Keyword)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property LL_Weapon_Ranged_Any Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

GlobalVariable Property OE_Credit_ExtortionMedium Auto Const Mandatory

Faction Property REPlayerFriend Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ReferenceAlias Property Alias_Marker_ShipLandingA Auto Const Mandatory

ReferenceAlias Property Alias_ShipA Auto Const Mandatory

LocationAlias Property Alias_ShipA_InteriorLocation Auto Const Mandatory

ReferenceAlias Property Alias_ShipA_InteriorMarker00 Auto Const Mandatory

ReferenceAlias Property Alias_NPC_Smuggler Auto Const Mandatory

LeveledItem Property LL_OE_AlternativeReward Auto Const Mandatory

ReferenceAlias Property Alias_PilotSeat Auto Const Mandatory

ReferenceAlias Property Alias_ShipContainer Auto Const Mandatory

GlobalVariable Property OE_FalseContact_Global Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

Faction Property OE_ShipOwnerFaction Auto Const Mandatory

RefCollectionAlias Property Alias_Smugglers Auto Const Mandatory

ReferenceAlias Property Alias_ShipA_CaptainFurniture Auto Const Mandatory

ReferenceAlias Property Alias_ShipA_CaptainMarker Auto Const Mandatory

ReferenceAlias Property Alias_Marker_ShipLandingB Auto Const Mandatory

ReferenceAlias Property Alias_Marker_ShipLandingC Auto Const Mandatory

Furniture Property NPCStanding_DataSlate Auto Const Mandatory

GlobalVariable Property RQ_Hello_Calm_PostAcceptValue Auto Const Mandatory

ActorValue Property RQ_AV_Hello Auto Const Mandatory

GlobalVariable Property RQ_Hello_Calm_PreAcceptValue Auto Const Mandatory

RefCollectionAlias Property Alias_CrewName Auto Const Mandatory

ReferenceAlias Property Alias_NPC_Crew01 Auto Const Mandatory

ReferenceAlias Property Alias_Marker_SceneB02 Auto Const Mandatory

ReferenceAlias Property Alias_NPC_Crew02 Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory

LocationAlias Property Alias_OE_Location Auto Const Mandatory

Keyword Property LocTypeOE_ThemeEmptyKeyword Auto Const Mandatory

Keyword Property BlockPlayerActivation_Keyword Auto Const Mandatory
