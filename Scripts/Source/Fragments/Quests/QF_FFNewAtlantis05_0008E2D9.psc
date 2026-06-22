;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFNewAtlantis05_0008E2D9 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
Alias_landingMarker.GetRef().SetFactionOwner(None)
Alias_SmugglerShip.GetRef().DisableNoWait()
Alias_ShipCrew.DisableAll()
SetObjectiveCompleted(2, false)
SetObjectiveDisplayed(2, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
SetObjectiveCompleted(3)
if GetStageDone(30)
    SetStage(40)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
Actor[] ShipCrewRef = Alias_ShipCrew.GetActorArray()

int i = 0
while i < ShipCrewRef.Length
    ShipCrewRef[i].IgnoreFriendlyHits(false)
    ShipCrewRef[i].SetEssential(false)
    i += 1
endwhile

Alias_ShipCrew.RemovefromFaction(PlayerFriendFaction)
Alias_ShipCrew.AddtoFaction(PlayerEnemyFaction)
Alias_ShipCrew.SetValue(Aggression, 1)
Alias_ShipCrew.StartCombatAll(Game.GetPlayer())
SetObjectiveSkipped(70)
SetObjectiveDisplayed(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
FFNewAtlantis05_Global.SetValue(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
FFNewAtlantis05_Global.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
FFNewAtlantis05_Global.SetValue(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
FFNewAtlantis05_Global.SetValue(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
SetObjectiveSkipped(60)
SetObjectiveCompleted(70)
SetObjectiveDisplayed(80)
Game.GetPlayer().AddItem(Credits, FFNewAtlantis05_Credits_Small.GetValueInt())
Game.GetPlayer().RemoveItem(FFNewAtlantis05_MissionCargoTypeContraband)
SetStage(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN CODE
SetObjectiveSkipped(60)
SetObjectiveCompleted(70)
SetObjectiveDisplayed(80)
Game.GetPlayer().AddItem(Credits, FFNewAtlantis05_Credits_Medium.GetValueInt())
Game.GetPlayer().RemoveItem(FFNewAtlantis05_MissionCargoTypeContraband)
SetStage(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0014_Item_00
Function Fragment_Stage_0014_Item_00()
;BEGIN CODE
SetObjectiveSkipped(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
SetObjectiveCompleted(70)
Game.GetPlayer().AddItem(Alias_Contraband.GetRef())
SetStage(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0016_Item_00
Function Fragment_Stage_0016_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60)
FFNewAtlantis05_TL_Captain_Greet.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
FFNewAtlantis02Misc.SetStage(40)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
if !GetStageDone(45)
    SetObjectiveDisplayed(40)
elseif GetStageDone(3)
    SetStage(40)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(50)
Alias_landingMarker.GetRef().SetFactionOwner(FFNewAtlantis05_LandingFactionShip)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveDisplayed(3)

Game.GetPlayer().AddAliasedItem(FFNewAtlantis05_Slate, Alias_Slate)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
Alias_SmugglerShip.TryToEnable()
Alias_SmugglerShip.GetShipRef().SetExteriorLoadDoorInaccessible(False)

ObjectReference CaptainRef = Alias_Captain.GetRef()

Cell AnansiRef = CaptainRef.GetParentCell()

AnansiRef.SetFactionOwner(EclipticFaction)
AnansiRef.SetPublic(true)

Alias_ShipCrew.AddRef(CaptainRef)
Alias_ShipCrew.AddRef(Alias_Crew01.GetRef())
Alias_ShipCrew.AddRef(Alias_Crew02.GetRef())
Alias_ShipCrew.EnableAll()

SetObjectiveCompleted(2)
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)
Alias_Chest.GetRef().SetFactionOwner(PlayerFaction)
Alias_Contraband.GetRef().SetFactionOwner(PlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_01
Function Fragment_Stage_0060_Item_01()
;BEGIN CODE
SetObjectiveCompleted(50)
SetStage(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(70)
Game.GetPlayer().AddItem(Alias_Contraband.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60)
SetObjectiveDisplayed(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_Contraband.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
CompleteAllObjectives()
FFNewAtlantis06.Start()
Alias_landingMarker.GetRef().SetFactionOwner(None)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_01
Function Fragment_Stage_0100_Item_01()
;BEGIN CODE
CompleteAllObjectives()
SetStage(2)
FFNewAtlantis06.Start()
Alias_landingMarker.GetRef().SetFactionOwner(None)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_SmugglerShip Auto Const Mandatory

RefCollectionAlias Property Alias_ShipCrew Auto Const Mandatory

ReferenceAlias Property Alias_Captain Auto Const Mandatory

Book Property FFNewAtlantis05_Slate Auto Const Mandatory

ReferenceAlias Property Alias_Slate Auto Const Mandatory

GlobalVariable Property FFNewAtlantis05_Global Auto Const Mandatory

Faction Property PlayerFriendFaction Auto Const Mandatory

GlobalVariable Property FFNewAtlantis05_Credits_Small Auto Const Mandatory

GlobalVariable Property FFNewAtlantis05_Credits_Medium Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

ReferenceAlias Property Alias_Contraband Auto Const Mandatory

ReferenceAlias Property Alias_Chest Auto Const Mandatory

MiscObject Property FFNewAtlantis05_MissionCargoTypeContraband Auto Const Mandatory

Scene Property FFNewAtlantis05_TL_Captain_Greet Auto Const Mandatory

Quest Property FFNewAtlantis06 Auto Const Mandatory

ReferenceAlias Property Alias_SpawnMarker Auto Const Mandatory

Scene Property FFNewAtlantis05_070_Move_Captain Auto Const Mandatory

Quest Property FFNewAtlantis02Misc Auto Const Mandatory

ReferenceAlias Property Alias_Crew01 Auto Const Mandatory

ReferenceAlias Property Alias_Crew02 Auto Const Mandatory

Faction Property FFNewAtlantis05_LandingFactionShip Auto Const Mandatory

ReferenceAlias Property Alias_landingMarker Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

LocationAlias Property Alias_ShipInterior Auto Const Mandatory

Faction Property EclipticFaction Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory
