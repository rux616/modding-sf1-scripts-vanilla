;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS04_001CD001 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)

; Once the book is picked up - flag the global
MS04_PickedUp_IntroBook.SetValue(1.0)

; Make the book a quest object
Game.GetPlayer().RemoveItem(MS04_IntroSlate, 1, TRUE)
Game.GetPlayer().AddAliasedItem(MS04_IntroSlate, Alias_SecretOutpostSlate)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

; Enable the world space map marker
Alias_WorldMapMarker.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
; As soon as you land - the Spacer starts yelling at you
MS04_0300_InitialSpacerWarning.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0302_Item_00
Function Fragment_Stage_0302_Item_00()
;BEGIN CODE
; After the warning scene - the spacer goes hostile
Alias_InitialSpacer.GetRef().SetValue(Aggression, 2.0)
Alias_InitialSpacer.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0305_Item_00
Function Fragment_Stage_0305_Item_00()
;BEGIN CODE
MS04_SpacerEavesdrop01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
MS04_SpacerEavesdrop02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0325_Item_00
Function Fragment_Stage_0325_Item_00()
;BEGIN CODE
; TODO: Deactivate the puzzle down the line

; Play Livvey's first scene
MS04_Livvey_01_PuzzleSolved.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0355_Item_00
Function Fragment_Stage_0355_Item_00()
;BEGIN CODE
; Check to see if both slates have been picked up
if ( GetStageDone(360) && GetStageDone(365) && GetStageDone(370) ) 
  SetObjectiveCompleted(350)
endif

; Play the first audio log
AudioLogs_MS04_Leon02_Arrival.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN CODE
; Check to see if both slates have been picked up
if ( GetStageDone(355) && GetStageDone(365) && GetStageDone(370) ) 
  SetObjectiveCompleted(350)
endif

; Play the second audio log
AudioLogs_MS04_AliceLearnsMantis.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0365_Item_00
Function Fragment_Stage_0365_Item_00()
;BEGIN CODE
; Check to see if all lore collected
if ( GetStageDone(355) && GetStageDone(360) && GetStageDone(370) ) 
  SetObjectiveCompleted(350)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0370_Item_00
Function Fragment_Stage_0370_Item_00()
;BEGIN CODE
; Check to see if all lore collected
if ( GetStageDone(355) && GetStageDone(360) && GetStageDone(365) ) 
  SetObjectiveCompleted(350)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0390_Item_00
Function Fragment_Stage_0390_Item_00()
;BEGIN CODE
; Is Livvey alive? If so, display his optional objective
if ( !GetStageDone(480) )
  SetObjectiveDisplayed(400)
  MS04_0390_LiveyBark.Start()  ; Livvey begs for life
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0405_Item_00
Function Fragment_Stage_0405_Item_00()
;BEGIN CODE
SetObjectiveCompleted(400)

Actor aTarg = Alias_Livvey.GetActorRef()
aTarg.RemoveFromAllFactions()
aTarg.SetValue(Aggression, 2)
aTarg.StartCombat(Game.GetPlayer())
aTarg.AddToFaction(PlayerEnemyFaction)
aTarg.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
Alias_Livvey.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0475_Item_00
Function Fragment_Stage_0475_Item_00()
;BEGIN CODE
; Now Livvey will be gleeful
MS04_0475_LivveyBetrayal.Start()

; Shut and lock the door
ObjectReference oDoor = Alias_BetrayalDoor.GetRef()
oDoor.SetOpen(FALSE)
oDoor.SetLockLevel(254)
oDoor.Lock(TRUE)

; Spin up the enemy robots
Alias_BetrayalTrigger.GetRef().Enable()

Game.GetPlayer().SetValue(MS04_Foreknowledge_LivveyBetrayalAV, 1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0477_Item_00
Function Fragment_Stage_0477_Item_00()
;BEGIN CODE
; Fire the explosion
Alias_LivveyExplosionMarker.GetRef().PlaceAtMe(fragGrenadeExplosion)

; Livvey dies
Alias_Livvey.GetActorRef().SetProtected(FALSE)
Alias_Livvey.GetActorRef().Kill()

; Open and unlock the door
ObjectReference oDoor = Alias_BetrayalDoor.GetRef()
oDoor.SetOpen(TRUE)
oDoor.SetLockLevel(0)
oDoor.Lock(FALSE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0480_Item_00
Function Fragment_Stage_0480_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(400, FALSE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(600)
SetObjectiveDisplayed(700)

; Play Doriane's last message
MS04_0500_FinalMessage.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600)

; Do you have both?
if ( GetStageDone(700) )
  SetStage(800)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetObjectiveCompleted(700)

; Now you have the ship in your fleet
SpaceshipReference myShip = Alias_MantisShip.GetShipRef()

; TEMP until we get the event: GEN-527399
SQ_PlayerShipScript SQ_PlayerShip = Game.GetForm(0x000174a2) as SQ_PlayerShipScript
SQ_PlayerShip.AddPlayerOwnedShip(myShip)
; once bug is fixed, can return to using:
;Game.AddPlayerOwnedShip(myShip)

myShip.SetValue(SpaceshipRegistration, 1)

Alias_MantisShip.GetRef().Enable()
Alias_MantisShip.GetShipRef().SetExteriorLoadDoorInaccessible(False)

; Do you have both?
if ( GetStageDone(600) )
  SetStage(800)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(800)

; 423481: Disappear Livvey if he isn't dead
Actor aLivvey = Alias_Livvey.GetActorRef()
if ( aLivvey.IsDead() == FALSE )
  aLivvey.Disable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()
SetStage(9000)

;Cooldown on SE_FAB15 to prevent it from spinning up too soon
float currentGameTime = Utility.GetCurrentGameTime()
SE_Player_FAB15_Timestamp.SetValue(currentGameTime + cooldownDays)
SE_Player_FAB16_Timestamp.SetValue(currentGameTime + cooldownDays)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property MS04_PickedUp_IntroBook Auto Const Mandatory

Book Property MS04_IntroSlate Auto Const Mandatory

ReferenceAlias Property Alias_SecretOutpostSlate Auto Const Mandatory

Scene Property MS04_SpacerEavesdrop01 Auto Const Mandatory

ReferenceAlias Property Alias_Livvey Auto Const Mandatory

Scene Property MS04_0500_FinalMessage Auto Const Mandatory

Scene Property AudioLogs_MS04_AliceInheritance Auto Const Mandatory

Scene Property AudioLogs_MS04_AliceLearnsMantis Auto Const Mandatory

Scene Property MS04_Livvey_01_PuzzleSolved Auto Const Mandatory

Scene Property MS04_0475_LivveyBetrayal Auto Const Mandatory

ReferenceAlias Property Alias_InitialSpacer Auto Const Mandatory

Scene Property MS04_0300_InitialSpacerWarning Auto Const Mandatory

Scene Property MS04_0390_LiveyBark Auto Const Mandatory

Scene Property MS04_SpacerEavesdrop02 Auto Const Mandatory

ReferenceAlias Property Alias_BetrayalDoor Auto Const Mandatory

ReferenceAlias Property Alias_MantisShip Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

ActorValue Property MS04_Foreknowledge_LivveyBetrayalAV Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ReferenceAlias Property Alias_WorldMapMarker Auto Const Mandatory

ObjectReference Property LC119RobotActivationTrigger Auto Const Mandatory

ReferenceAlias Property Alias_BetrayalTrigger Auto Const Mandatory

ObjectReference Property LivveyExplosionMarker Auto Const Mandatory

Explosion Property fragGrenadeExplosion Auto Const Mandatory

ReferenceAlias Property Alias_LivveyExplosionMarker Auto Const Mandatory

ActorValue Property SpaceshipRegistration Auto Const Mandatory

Float Property cooldownDays Auto Const Mandatory

GlobalVariable Property SE_Player_FAB15_Timestamp Auto Const Mandatory

GlobalVariable Property SE_Player_FAB16_Timestamp Auto Const Mandatory

Scene Property AudioLogs_MS04_Leon02_Arrival Auto Const Mandatory
