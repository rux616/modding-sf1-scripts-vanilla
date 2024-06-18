;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BE_KT02_0002927E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Alias_Minibot.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
BE_KT02_001_SceneStart.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
Alias_Minibot.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN AUTOCAST TYPE bescript
Quest __temp = self as Quest
bescript kmyQuest = __temp as bescript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetShipGravity(1)
Alias_Minibot.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
Alias_Captain.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_CaptainFurniture.GetRef().SetFactionOwner(BEKT02_CaptainFaction)
Alias_BoatswainFurniture.GetRef().SetFactionOwner(BEKT02_BoatswainFaction)

Cell myCell = Alias_PilotSeat.GetRef().GetParentCell()

myCell.SetPublic()

Alias_EnemyShipInteriorLocation.GetLocation().AddKeyword(LocTypeZeroGAllowClothes)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
SpaceshipReference enemyShipRef = Alias_EnemyShip.GetShipRef()
enemyshipRef.SetValue(SpaceshipCrew, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Clear misc objective, start encounter
;Alias_GenericCrew.RefillAlias()
;Alias_AllCrew.RefillAlias()
;Alias_GravitySwitch.RefillAlias()

Alias_AllCrew.AddRef(Alias_Captain.GetRef())
Alias_AllCrew.AddRef(Alias_Boatswain.GetRef())
Alias_AllCrew.AddRef(Alias_CrewPartygoer01.GetRef())
Alias_AllCrew.AddRef(Alias_CrewPartygoer.GetRef())
Alias_AllCrew.AddRef(Alias_Pilot.GetRef())

SE_KT02.SetStage(30)
BE_KT02_001_SceneStart.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0024_Item_00
Function Fragment_Stage_0024_Item_00()
;BEGIN AUTOCAST TYPE bescript
Quest __temp = self as Quest
bescript kmyQuest = __temp as bescript
;END AUTOCAST
;BEGIN CODE
ShipPowerOn.Play(Game.GetPlayer())
Utility.Wait(1)
kmyQuest.SetShipGravity(1)
Alias_EnableMarker.GetRef().EnableNoWait()
Alias_AllCrew.EvaluateAll()
Alias_Minibot.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN AUTOCAST TYPE bescript
Quest __temp = self as Quest
bescript kmyQuest = __temp as bescript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetShipGravity(GravityFloat)
Game.GetPlayer().PlaceAtMe(BE_KT02_ExplosionHavok)
BE_KT02_001_SceneStart.Stop()
Alias_EnableMarker.GetRef().DisableNoWait()
Alias_Minibot.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SpaceshipReference enemyShipRef = Alias_EnemyShip.GetShipRef()
enemyshipRef.SetValue(DockingPermission, 4)
Utility.Wait(6)

if !GetStageDone(15)
    enemyShipRef.DisableWithGravJump()
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
Alias_AllCrew.RemoveFromFaction(REPlayerFriend)
Alias_AllCrew.AddtoFaction(PlayerEnemyFaction)
Alias_AllCrew.SetValue(Aggression, 1)
Alias_AllCrew.StartCombatAll(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorValue Property SpaceshipCrew Auto Const Mandatory

ReferenceAlias Property Alias_EnemyShip Auto Const Mandatory

ReferenceAlias Property Alias_Captain Auto Const Mandatory

Float Property GravityFloat Auto Const Mandatory

GlobalVariable Property BE_KT01_InstanceID Auto Const Mandatory

Scene Property BE_KT02_001_SceneStart Auto Const Mandatory

LeveledItem Property LL_Drink_Any Auto Const Mandatory

WwiseEvent Property PartyMusicTrack Auto Const Mandatory

MusicType Property MusicSilencer Auto Const Mandatory

RefCollectionAlias Property Alias_GenericCrew Auto Const Mandatory

ReferenceAlias Property Alias_CrewPartygoer Auto Const Mandatory

ReferenceAlias Property Alias_Boatswain Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

Faction Property REPlayerFriend Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

ReferenceAlias Property Alias_Announcer Auto Const Mandatory

Explosion Property BE_KT02_ExplosionHavok Auto Const Mandatory

ReferenceAlias Property Alias_EnableMarker Auto Const Mandatory

Quest Property SE_KT02 Auto Const Mandatory

RefCollectionAlias Property Alias_AllCrew Auto Const Mandatory

WwiseEvent Property ShipPowerOn Auto Const Mandatory

ReferenceAlias Property Alias_CaptainFurniture Auto Const Mandatory

Faction Property BEKT02_CaptainFaction Auto Const Mandatory

WwiseEvent Property ZeroGOff Auto Const Mandatory

ReferenceAlias Property Alias_BoatswainFurniture Auto Const Mandatory

Faction Property BEKT02_BoatswainFaction Auto Const Mandatory

ReferenceAlias Property Alias_GravitySwitch Auto Const Mandatory

ReferenceAlias Property Alias_CrewPartygoer01 Auto Const Mandatory

ReferenceAlias Property Alias_Pilot Auto Const Mandatory

ReferenceAlias Property Alias_PilotSeat Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory

LocationAlias Property Alias_EnemyShipInteriorLocation Auto Const Mandatory

Keyword Property LocTypeZeroGAllowClothes Auto Const Mandatory

ReferenceAlias Property Alias_MiniBot Auto Const Mandatory
