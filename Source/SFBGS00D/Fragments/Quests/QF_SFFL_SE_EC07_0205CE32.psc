;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_SE_EC07_0205CE32 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Setup Galbank ship
SpaceshipReference GalBankShip = Alias_GalBankShip.GetShipRef()
GalBankShip.AddToFaction(PlayerFriendFaction)
GalBankShip.SetIgnoreFriendlyHits(true)
GalBankShip.SetValue(Aggression,0)

;This sets the initial speed of the first pirate ship heading for the GalBank ship
SpaceshipReference pirateShip1 = Alias_PirateShip01.GetShipRef()
pirateShip1.SetValue(ShipSpeedMult,5.5)
pirateShip1.AddToFaction(PlayerFriendFaction)
pirateShip1.SetIgnoreFriendlyHits(true)
pirateShip1.SetValue(Aggression,0)

;Set SE Location Alias
Location currentLocation = Alias_CenterMarker.GetRef().GetCurrentLocation()
Alias_SELocation.ForceLocationTo(currentLocation)

;Move Arrival Marker in space cell
Alias_ArrivalMarker.GetRef().MoveTo(PlayerShipSpawn.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Activate Space Mines
Alias_SpaceMines.EnableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Start the pre-hailing scene
Scene_50_InitialContact.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;Starts scene that will make a fake mine blow up based on distance
Alias_SpaceMines.EnableAll()
Scene_60_PirateReactsToMines.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
;Spawn fake explosion near the ship
float[] offsetValues = new float[3]
offsetValues[0] = 10.0
offsetValues[1] = 40.0
offsetValues[2] = 50.0
Alias_PirateShip01.GetShipRef().PlaceAtMe(FakeMine,1,false,false,true,offsetValues,Alias_FakeMine,false)
Alias_FakeMine.GetRef().DamageObject(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
;Destroy the pirate ship after a short pause
Utility.Wait(1.5)
SpaceshipReference pirateShip1 = Alias_PirateShip01.GetShipRef() as SpaceshipReference
pirateShip1.KillSilent()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
;Actual Hailing sequence starts
Utility.Wait(2.0)
Scene_80_Hailing.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN CODE
Scene_85_PlayerShootsGalBankShip.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
Alias_GalBankShipCockpit.RefillAlias()
Alias_GalBankShip.GetShipRef().SetValue(DockingPermission,0)
SetObjectiveDisplayed(160)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
Alias_GalBankShip.GetShipRef().RemoveFromFaction(PlayerFriendFaction)

SetObjectiveCompleted(160)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0175_Item_00
Function Fragment_Stage_0175_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(175)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
SetObjectiveCompleted(175)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)

if (!IsStageDone(160))
    SetStage(160)
endif

if (IsObjectiveDisplayed(175))
    SetObjectiveSkipped(175)
endif
BoardingEncounter.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
;Displayed if player tells Ruby they need to think about it, or backs out of the dialogue
SetObjectiveDisplayed(210)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
SetObjectiveCompleted(210)
SetObjectiveDisplayed(220)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE defaultpassengerquestscript
Quest __temp = self as Quest
defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
;END AUTOCAST
;BEGIN CODE
if (!IsStageDone(350))
    if (BoardingEncounter.IsStageDone(230))
        kmyQuest.AddPassenger(Alias_HannahFrye)
    endif
    kmyQuest.AddPassenger(Alias_RubyKrause)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN AUTOCAST TYPE defaultpassengerquestscript
Quest __temp = self as Quest
defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
;END AUTOCAST
;BEGIN CODE
;Safety in case player skipped stage 300
if (!IsStageDone(300))
    kmyQuest.AddPassenger(Alias_RubyKrause)
    if (BoardingEncounter.IsStageDone(230))
        kmyQuest.AddPassenger(Alias_HannahFrye)
        SetStage(370)
    endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN AUTOCAST TYPE defaultpassengerquestscript
Quest __temp = self as Quest
defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.AddPassenger(Alias_HannahFrye)
SetStage(370)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0370_Item_00
Function Fragment_Stage_0370_Item_00()
;BEGIN CODE
if (!IsStageDone(300))
    SetStage(300)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
;GalBank ship is now expendable
Spaceshipreference galBankShip = Alias_GalBankShip.GetShipRef()
galBankShip.SetEssential(false)
;Don't penalize player if they shoot the ship
;Eventually we should deal with destroying the ship with Hannah in it
galBankShip.SetCrimeFaction(None)

Utility.Wait(2.5)

;Spawn two more pirate ships
;First one targets the GalBank ship
Spaceshipreference pirate02 = Alias_PirateShip02.GetShipRef()
pirate02.EnableWithGravJump()
pirate02.StartCombat(galBankShip)

Utility.Wait(2.0)

;Second ship will target player
Spaceshipreference pirate03 = Alias_PirateShip03.GetShipRef()
pirate03.EnableWithGravJump()
pirate03.StartCombat(Alias_PlayerShip.GetShipRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
Alias_GalbankShip.GetRef().Disable()

if (!IsStageDone(370))
    Alias_HannahFrye.GetRef().Disable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
SetStage(650)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_SE_EC07Script
Quest __temp = self as Quest
SFBGS00D:SFFL_SE_EC07Script kmyQuest = __temp as SFBGS00D:SFFL_SE_EC07Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.RegisterPlayer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN AUTOCAST TYPE defaultpassengerquestscript
Quest __temp = self as Quest
defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
;END AUTOCAST
;BEGIN CODE
;Remove Friend status from Ruby Krause
;We may regain it depending on our finaly dialogue choice with her
Actor Ruby = Alias_RubyKrause.GetActorRef()
PlayerFaction.SetEnemy(RubyFaction,true,true)

;Set objective to go say goodbye
if (IsObjectiveDisplayed(230))
    SetObjectiveCompleted(230)
    SetObjectiveDisplayed(700)
else
    SetObjectiveCompleted(220)
    SetObjectiveDisplayed(660)
endif

;Remove Ruby from Passenger list and
;teleport her just a bit behind destination marker
;or near player if he was jailed in NA
kmyQuest.RemovePassengerActor(Ruby)

if (IsStageDone(550))
    Ruby.MoveTo(Alias_UCSec_RubySpawn.GetRef())
else
    ObjectReference destinationMarker = Alias_PassengerDestinationMarker.GetRef()
    Ruby.MoveTo(destinationMarker,3.2,0.0,0.0)
endif
Ruby.EvaluatePackage()

;Do the same for Hannah if she got on board
if (IsStageDone(370))
    Actor Hannah = Alias_HannahFrye.GetActorRef()
    kmyQuest.RemovePassengerActor(Hannah)
    Hannah.MoveTo(Ruby,1.0,1.5,0.0)
    Hannah.EvaluatePackage()
endif

;Set Player Exits Ship stage if player was Jailed in New Atlantis
;if (IsStageDone(550))
;    SetStage(650)
;endif

;Start Ruby's waiting scene
SFFL_SE_EC07_610_RubyExitsShip.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN AUTOCAST TYPE defaultpassengerquestscript
Quest __temp = self as Quest
defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
;END AUTOCAST
;BEGIN CODE
;Take care of some stuff if player got out of ship before Ruby and Hannah

if (!IsStageDone(610))
    SetStage(610)
endif

if (IsStageDone(700))
    SetStage(800)
endif

Actor Ruby = Alias_RubyKrause.GetActorRef()
Ruby.EvaluatePackage()
if (IsStageDone(370))
    Actor Hannah = Alias_HannahFrye.GetActorRef()
    Hannah.EvaluatePackage()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0680_Item_00
Function Fragment_Stage_0680_Item_00()
;BEGIN CODE
;Put back Friend status with Ruby Krause if we were nice to her
PlayerFaction.SetAlly(RubyFaction,true,true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
if (IsObjectiveDisplayed(700))
    SetObjectiveCompleted(700)
elseif (IsObjectiveDisplayed(660))
    SetObjectiveCompleted(660)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN AUTOCAST TYPE defaultpassengerquestscript
Quest __temp = self as Quest
defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
;END AUTOCAST
;BEGIN CODE
;Note that this stage can also be set if player changes location before
;saying goodbye, or gets > 150 meters away from Ruby after disembarking

Actor Ruby = Alias_RubyKrause.GetActorRef()
Actor Hannah = Alias_HannahFrye.GetActorRef()

;Make sure neither Ruby nor Hannah are still on board
if (!IsStageDone(610))
    ObjectReference destinationMarker = Alias_PassengerDestinationMarker.GetRef()
    Ruby.SetRelationshipRank(Game.GetPlayer(),0)
    kmyQuest.RemovePassengerActor(Ruby)
    Ruby.MoveTo(destinationMarker)
    if (IsObjectiveDisplayed(230))
        kmyQuest.RemovePassengerActor(Hannah)
        Hannah.MoveTo(Ruby)
        SetObjectiveCompleted(230)
    else
        SetObjectiveCompleted(220)
    endif
endif

;Clean up "say goodbye to Ruby and/or Hannah" objectives
if (!IsStageDone(700))
    if (IsObjectiveDisplayed(700))
        SetObjectiveFailed(700)
    endif 
    if (IsObjectiveDisplayed(660))
        SetObjectiveFailed(660)
    endif
endif

;Mark quest as complete if it isn't already
if (!IsStageDone(900))
    SetStage(900)
else
    Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
CompleteQuest()

if (IsStageDone(800))
    Stop()
endif

;If still on planet, start extra dialogue quest with Ruby and/or Hannah
SFFL_SE_EC07_MiscDialogue.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;End the corresponding BE if it is still running
if (BoardingEncounter.IsRunning() || BoardingEncounter.IsActive())
        BoardingEncounter.CompleteQuest()
        BoardingEncounter.Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_SpaceMines Auto Const Mandatory

ReferenceAlias Property Alias_PirateShip01 Auto Const Mandatory

ReferenceAlias Property Alias_PirateShip02 Auto Const Mandatory

Scene Property Scene_80_Hailing Auto Const Mandatory

Scene Property Scene_50_InitialContact Auto Const Mandatory

ReferenceAlias Property Alias_GalBankShip Auto Const Mandatory

ActorValue Property ShipSpeedMult Auto Const Mandatory

Scene Property Scene_60_PirateReactsToMines Auto Const Mandatory

ReferenceAlias Property Alias_GeneralMarker01 Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory

MovableStatic Property FakeMine Auto Const Mandatory

ReferenceAlias Property Alias_FakeMine Auto Const Mandatory

Quest Property BoardingEncounter Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

Faction Property PlayerFriendFaction Auto Const Mandatory

Scene Property Scene_85_PlayerShootsGalBankShip Auto Const Mandatory

ReferenceAlias Property Alias_GalBankShipCockpit Auto Const Mandatory

ReferenceAlias Property Alias_HannahFrye Auto Const Mandatory

ReferenceAlias Property Alias_RubyKrause Auto Const Mandatory

ReferenceAlias Property Alias_PirateShip03 Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

Quest Property SFFL_SE_EC07_MiscDialogue Auto Const Mandatory

Scene Property SFFL_SE_EC07_610_Ruby Auto Const Mandatory

ReferenceAlias Property Alias_PassengerDestinationMarker Auto Const Mandatory

ReferenceAlias Property Alias_Player Auto Const Mandatory

Scene Property SFFL_SE_EC07_650_PlayerExitsShip Auto Const Mandatory

Scene Property SFFL_SE_EC07_610_RubyExitsShip Auto Const Mandatory

Faction Property RubyFaction Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

ReferenceAlias Property Alias_CenterMarker Auto Const Mandatory

LocationAlias Property Alias_SELocation Auto Const Mandatory

ReferenceAlias Property PlayerShipSpawn Auto Const Mandatory

ReferenceAlias Property Alias_ArrivalMarker Auto Const Mandatory

ReferenceAlias Property Alias_UCSec_RubySpawn Auto Const Mandatory
