;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_TraitKidStuff_0010C2FA Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; Set the stages up right
SetStage(25)
SetStage(50)

; Move the player to the apartment and get the perk
Game.GetPlayer().MoveTo(Alias_DebugMarker.GetRef())
Game.GetPlayer().AddPerk(TRAIT_KidStuff)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;make sure Parents look like the player 
;(we do this once, so player changing appearance doesn't affect the parents)

Trait_KS_Dad.DeriveGeneticParentAppearance(Game.GetPlayer().GetLeveledActorBase())
Trait_KS_Mom.DeriveGeneticParentAppearance(Game.GetPlayer().GetLeveledActorBase())

(Alias_Elevator.GetRef() as LoadElevatorFloorScript).SetAccessible(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
; Move everyone to where they belong
Actor aTarg = Alias_Dad.GetActorRef()
ObjectReference oMarker = MQ101_WalterMarker01
aTarg.SetLinkedRef(oMarker, TraitKidStuffKeyword)
aTarg.MoveTo(oMarker)

aTarg = Alias_Mom.GetActorRef()
oMarker = MQ401_HostileMarker03
aTarg.SetLinkedRef(oMarker, TraitKidStuffKeyword)
aTarg.MoveTo(oMarker)

aTarg = Alias_Noel.GetActorRef()
oMarker = MQ401A_VascoMarker
aTarg.SetLinkedRef(oMarker, TraitKidStuffKeyword)
aTarg.MoveTo(oMarker)

; They start a banter intro
TraitKidStuff_0325_LodgeBanter.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)

; Update the actors so they move after the chat
Alias_Dad.GetActorRef().EvaluatePackage()
Alias_Mom.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Post conversation banter will player after a few seconds
Utility.Wait(3.0)
TraitKidStuff_0350_LodgePostBanter.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(LL_Weapon_Reward_KidStuff)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0325_Item_00
Function Fragment_Stage_0325_Item_00()
;BEGIN CODE
; Move everyone to where they belong
Actor aTarg = Alias_Dad.GetActorRef()
ObjectReference oMarker = MQ101_WalterMarker01
aTarg.SetLinkedRef(oMarker, TraitKidStuffKeyword)
aTarg.MoveTo(oMarker)

aTarg = Alias_Mom.GetActorRef()
oMarker = MQ401_HostileMarker03
aTarg.SetLinkedRef(oMarker, TraitKidStuffKeyword)
aTarg.MoveTo(oMarker)

aTarg = Alias_Noel.GetActorRef()
oMarker = MQ401A_VascoMarker
aTarg.SetLinkedRef(oMarker, TraitKidStuffKeyword)
aTarg.MoveTo(oMarker)

; They start a banter intro
TraitKidStuff_0325_LodgeBanter.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0325_Item_01
Function Fragment_Stage_0325_Item_01()
;BEGIN CODE
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0375_Item_00
Function Fragment_Stage_0375_Item_00()
;BEGIN CODE
ObjectReference MoveHomeRef = Alias_MomTeleportMarker.GetRef()

Actor DadRef = Alias_Dad.GetActorRef()
Actor MomRef = Alias_Mom.GetActorRef()

DadRef.MoveTo(MoveHomeRef)
MomRef.MoveTo(MoveHomeRef)
DadRef.EvaluatePackage()
MomRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1050_Item_00
Function Fragment_Stage_1050_Item_00()
;BEGIN CODE
; The player receives a note
Game.GetPlayer().AddAliasedItem(Trait_KidStuff_Note01, Alias_Note01, 1, FALSE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(LL_Quest_Reward_KidStuff_Spacesuit)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1250_Item_00
Function Fragment_Stage_1250_Item_00()
;BEGIN CODE
; The player receives a note
Game.GetPlayer().AddAliasedItem(Trait_KidStuff_Note02, Alias_Note02, 1, FALSE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
SpaceshipReference FreeShip = Alias_Spaceship.GetShipRef()

; TEMP until we get the event: GEN-527399
SQ_PlayerShipScript SQ_PlayerShip = Game.GetForm(0x000174a2) as SQ_PlayerShipScript
SQ_PlayerShip.AddPlayerOwnedShip(FreeShip)
; once bug is fixed, can return to using:
;Game.AddPlayerOwnedShip(FreeShip)

FreeShip.SetValue(SpaceshipRegistration, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1350_Item_00
Function Fragment_Stage_1350_Item_00()
;BEGIN CODE
; The player receives a note
Game.GetPlayer().AddAliasedItem(Trait_KidStuff_Note03, Alias_Note03, 1, FALSE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2025_Item_00
Function Fragment_Stage_2025_Item_00()
;BEGIN CODE
; Start an ambient scene
TraitKidStuff_2025_NeonBark.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2125_Item_00
Function Fragment_Stage_2125_Item_00()
;BEGIN CODE
; Start an ambient scene
TraitKidStuff_2125_AkilaCityBark.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8000_Item_00
Function Fragment_Stage_8000_Item_00()
;BEGIN CODE
Game.GetPlayer().RemovePerk(TRAIT_KidStuff)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
(Alias_Elevator.GetRef() as LoadElevatorFloorScript).SetAccessible(false)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Dad Auto Const Mandatory

Perk Property TRAIT_KidStuff Auto Const Mandatory

Scene Property TraitKidStuff_0325_LodgeBanter Auto Const Mandatory
Scene Property TraitKidStuff_0350_LodgePostBanter Auto Const Mandatory

Keyword Property TraitKidStuffKeyword Auto Const Mandatory

ObjectReference Property MQ101_WalterMarker01 Auto Const Mandatory
ObjectReference Property MQ401_HostileMarker03 Auto Const Mandatory
ObjectReference Property MQ401A_VascoMarker Auto Const Mandatory

ReferenceAlias Property Alias_Mom Auto Const Mandatory
ReferenceAlias Property Alias_Noel Auto Const Mandatory
ReferenceAlias Property Alias_Note01 Auto Const Mandatory
ReferenceAlias Property Alias_Note02 Auto Const Mandatory
ReferenceAlias Property Alias_Note03 Auto Const Mandatory

Book Property Trait_KidStuff_Note01 Auto Const Mandatory
Book Property Trait_KidStuff_Note02 Auto Const Mandatory
Book Property Trait_KidStuff_Note03 Auto Const Mandatory

Scene Property TraitKidStuff_2025_NeonBark Auto Const Mandatory

Scene Property TraitKidStuff_2125_AkilaCityBark Auto Const Mandatory

LeveledItem Property LL_Weapon_Reward_KidStuff Auto Const Mandatory

ReferenceAlias Property Alias_DebugMarker Auto Const Mandatory

ActorBase Property Trait_KS_Dad Auto Const Mandatory

ActorBase Property Trait_KS_Mom Auto Const Mandatory

LeveledItem Property LL_Quest_Reward_KidStuff_Spacesuit Auto Const Mandatory

ReferenceAlias Property Alias_Spaceship Auto Const Mandatory

ReferenceAlias Property Alias_Elevator Auto Const Mandatory

ActorValue Property SpaceshipRegistration Auto Const Mandatory

ReferenceAlias Property Alias_MomTeleportMarker Auto Const Mandatory
