;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS02_0029A00C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; Teleport the player to Crucible
Game.GetPlayer().MoveTo(Alias_CrucibleCOC.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
; When you enter the system, play the message
SetStage(100)

; Lots of people in Crucible start "hiding" until FDR is talked to
Alias_InitiallyHiddenPeople.DisableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
; Teleport the player to Crucible
Game.GetPlayer().MoveTo(Alias_CrucibleCOC.GetRef())

; Set a bunch of stages
SetStage(200)
SetStage(210)
SetStage(250)
SetStage(300)
SetStage(310)
SetStage(400)
SetStage(500)
SetStage(600)
SetStage(700)
SetStage(800)
SetStage(900)
SetStage(1000)
SetStage(1100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
SetStage(2)

SetStage(1200)
SetStage(1210)  ; This is the key difference for the choices
SetStage(1300)
SetStage(1400)
SetStage(1500)
SetStage(1550)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
SetStage(2)

SetStage(1200)
SetStage(1220)  ; This is the key difference for the choices
SetStage(1300)
SetStage(1400)
SetStage(1500)
SetStage(1550)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
SetStage(2)

SetStage(1200)
SetStage(1230)  ; This is the key difference for the choices
SetStage(1300)
SetStage(1400)
SetStage(1500)
SetStage(1550)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)

Utility.Wait(0.1)

; Play the distress call
MS02_0100_EmergencyBroadcast.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
; Now she's enabled so she can go to the player
Alias_AdaLovelace.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
; Start up the misc objective quest for copper delivery
MS02_Delivery.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(400)

; Now open and unlock the Pragmatist's door
ObjectReference oTarg = Alias_DoorPragmatists.GetRef()
oTarg.Lock(FALSE)
oTarg.SetOpen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
; Clear out the fake names
Alias_AdaTempName.Clear()
Alias_FDRTempName.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(400)
SetObjectiveDisplayed(500)
SetObjectiveDisplayed(600)

; Now Crucible's streets fill back up
Alias_InitiallyHiddenPeople.EnableAll()

; Flag that you've been to Crucible and know they're clones for New Game+
Game.GetPlayer().SetValue(MS02_Foreknowledge, 1.0)

; Now open all the doors
Alias_DoorsCrucible.GetAt(0).Lock(FALSE)
Alias_DoorsCrucible.GetAt(1).Lock(FALSE)
Alias_DoorsCrucible.GetAt(2).Lock(FALSE)
Alias_DoorsCrucible.SetOpen()

; Add Genghis Khan to the PlayerAllyFaction so he doesn't go hostile
;   too easy.
Alias_GenghisKhan.GetActorRef().AddToFaction(PlayerAllyFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)

; If you've talked to both the other leaders - advance the quest
if ( GetStageDone(600) )
  SetStage(800)
endif

SetStage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600)

; If you've talked to both the other leaders - advance the quest
if ( GetStageDone(500) )
  SetStage(800)
endif

; Remove Genghis Khan from the PlayerAllyFaction
Alias_GenghisKhan.GetActorRef().RemoveFromFaction(PlayerAllyFaction)

SetStage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
; This check is to make debugging easier
; There should be no natural way 600 gets set before this stage
if ( !GetStageDone(600) )
  ; Spawn the aliens and have them fight Genghis
  Alias_GenghisAliens.EnableAll()
  Alias_GenghisAliens.StartCombatAll(Alias_GenghisKhan.GetActorRef())

  ; Genghis shouts something
  Alias_GenghisKhan.GetActorRef().EvaluatePackage()
  MS02_0610_GenghisApproaches.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(700)
SetObjectiveCompleted(800)

; Now reveal Origin so the player can go there
Alias_FacilityMapMarker.GetRef().Enable()

; At this point HH Holmes' quest spins up
Crucible01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
; Flag Amelia Earhart as recruitable
Crew_Elite_CanHireAmelia.SetValue(1.0)
AmeliaEliteCrewQuest.SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(700)
SetObjectiveDisplayed(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1001_Item_00
Function Fragment_Stage_1001_Item_00()
;BEGIN AUTOCAST TYPE ms02script
Quest __temp = self as Quest
ms02script kmyQuest = __temp as ms02script
;END AUTOCAST
;BEGIN CODE
; Count how many of the clues that have been found
kmyQuest.CountClues()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1002_Item_00
Function Fragment_Stage_1002_Item_00()
;BEGIN AUTOCAST TYPE ms02script
Quest __temp = self as Quest
ms02script kmyQuest = __temp as ms02script
;END AUTOCAST
;BEGIN CODE
; Count how many of the clues that have been found
kmyQuest.CountClues()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1003_Item_00
Function Fragment_Stage_1003_Item_00()
;BEGIN AUTOCAST TYPE ms02script
Quest __temp = self as Quest
ms02script kmyQuest = __temp as ms02script
;END AUTOCAST
;BEGIN CODE
; Count how many of the clues that have been found
kmyQuest.CountClues()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1004_Item_00
Function Fragment_Stage_1004_Item_00()
;BEGIN AUTOCAST TYPE ms02script
Quest __temp = self as Quest
ms02script kmyQuest = __temp as ms02script
;END AUTOCAST
;BEGIN CODE
; Count how many of the clues that have been found
kmyQuest.CountClues()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1005_Item_00
Function Fragment_Stage_1005_Item_00()
;BEGIN AUTOCAST TYPE ms02script
Quest __temp = self as Quest
ms02script kmyQuest = __temp as ms02script
;END AUTOCAST
;BEGIN CODE
; Count how many of the clues that have been found
kmyQuest.CountClues()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1006_Item_00
Function Fragment_Stage_1006_Item_00()
;BEGIN AUTOCAST TYPE ms02script
Quest __temp = self as Quest
ms02script kmyQuest = __temp as ms02script
;END AUTOCAST
;BEGIN CODE
; Count how many of the clues that have been found
kmyQuest.CountClues()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1007_Item_00
Function Fragment_Stage_1007_Item_00()
;BEGIN AUTOCAST TYPE ms02script
Quest __temp = self as Quest
ms02script kmyQuest = __temp as ms02script
;END AUTOCAST
;BEGIN CODE
; Count how many of the clues that have been found
kmyQuest.CountClues()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1090_Item_00
Function Fragment_Stage_1090_Item_00()
;BEGIN CODE
; Play a warning message
MS02_1090_OriginDoorWarning.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1000)
SetObjectiveDisplayed(1100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1100)
SetObjectiveDisplayed(1200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1200)
SetObjectiveDisplayed(1300)

; Make it so you can go to the first beacon
Alias_Beagle.GetRef().Enable()
Alias_Beacon01_MapMarker.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1310_Item_00
Function Fragment_Stage_1310_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1300)
SetObjectiveDisplayed(1310)

; Make it so you can now find the Beagle
Alias_BeagleMapMarker.GetRef().Enable()

; Pop up a message
MS02_BeagleNavBeaconMessage.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1320_Item_00
Function Fragment_Stage_1320_Item_00()
;BEGIN CODE
; TODO - Update the objectives as you go
int i = 0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1330_Item_00
Function Fragment_Stage_1330_Item_00()
;BEGIN CODE
; TODO - Update the objectives as you go
int i = 0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1335_Item_00
Function Fragment_Stage_1335_Item_00()
;BEGIN CODE
; TODO - Update the objectives as you go
int i = 0
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1400_Item_00
Function Fragment_Stage_1400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1300)
SetObjectiveCompleted(1310)
SetObjectiveDisplayed(1400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1400)
SetObjectiveDisplayed(1880)

; Get the encrypted code
Game.GetPlayer().AddAliasedItem(MS02_EncryptedSecurityOverrideCode, Alias_EncryptedOverrideCode, 1, FALSE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1550_Item_00
Function Fragment_Stage_1550_Item_00()
;BEGIN AUTOCAST TYPE ms02script
Quest __temp = self as Quest
ms02script kmyQuest = __temp as ms02script
;END AUTOCAST
;BEGIN CODE
; Play the emergency message
MS02_1550_WarningMessage.Start()

; Flag different objectives depending on how you've been working with
if GetStageDone(1210)
  SetStage(1600)
elseif GetStageDone(1220)
  SetStage(1700)
else
  SetStage(1800)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1600_Item_00
Function Fragment_Stage_1600_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1610_Item_00
Function Fragment_Stage_1610_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1600)
SetObjectiveDisplayed(1610)

ObjectReference oTarg
ObjectReference oLinkedRef

oTarg = Alias_Amanirenas.GetRef()
oLinkedRef = oTarg.GetLinkedRef()
oTarg.MoveTo(oLinkedRef)

oTarg = Alias_FDR.GetRef()
(oTarg as Actor).EvaluatePackage()
;oLinkedRef = oTarg.GetLinkedRef()
;oTarg.MoveTo(oLinkedRef)

oTarg = Alias_GenghisKhan.GetRef()
oLinkedRef = oTarg.GetLinkedRef()
oTarg.MoveTo(oLinkedRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1615_Item_00
Function Fragment_Stage_1615_Item_00()
;BEGIN CODE
Actor aTarg = Alias_GenghisKhan.GetActorRef()
Actor aTarg2 = Alias_Amanirenas.GetActorRef()


; This gets Genghis moving to his spot and flagged for combat
aTarg.SetValue(MS02_LeaderReadyToFight, 1.0)
aTarg.EvaluatePackage()

; If Amanirenas didn't compromise - she's fighting
if ( !GetStageDone(1622) )
  aTarg2.SetValue(MS02_LeaderReadyToFight, 1.0)
  aTarg2.EvaluatePackage()  
endif

Utility.Wait(1.0)

; Now teleport Genghis and potentially Amanirenas to their fight spots
aTarg.MoveToPackageLocation()
if ( !GetStageDone(1622) )
  aTarg2.MoveToPackageLocation()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1620_Item_00
Function Fragment_Stage_1620_Item_00()
;BEGIN AUTOCAST TYPE ms02script
Quest __temp = self as Quest
ms02script kmyQuest = __temp as ms02script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(1610)
SetObjectiveDisplayed(1620)

; Remove NPCs from factions to prevent issues with stopping combat.
kmyQuest.RemoveFactions()

; If Amanirenas is in the fray, objective to kill her
if ( !GetStageDone(1622) )
  SetObjectiveDisplayed(1625)
endif

; Set Genghis hostile
; Make it so that the target goes hostile
Actor aTarg = Alias_GenghisKhan.GetActorRef()
kmyQuest.GoHostile(aTarg)


; Is Amanirenas still in the fray?
if ( !GetStageDone(1622) )
  ; Make it so that the target goes hostile
  aTarg = Alias_Amanirenas.GetActorRef()
  kmyQuest.GoHostile(aTarg)

  ; Make it so the faction goes hostile
  MS02_BelieversFaction.SetEnemy(MS02_PragmatistsFaction)
  Alias_Believers.AddToFaction(PlayerEnemyFaction)
endif

; do "making enemy" stuff last to avoid timing issues - KMK
MS02_RenegadesFaction.SetEnemy(MS02_PragmatistsFaction)
Alias_Renegades.AddToFaction(PlayerEnemyFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1621_Item_00
Function Fragment_Stage_1621_Item_00()
;BEGIN CODE
; Let the game know that Amanirenas isn't in the fight
SetStage(1622)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1625_Item_00
Function Fragment_Stage_1625_Item_00()
;BEGIN CODE
; Amanirenas will not be fighting with Genghis after the player says this
SetStage(1622)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1630_Item_00
Function Fragment_Stage_1630_Item_00()
;BEGIN AUTOCAST TYPE ms02script
Quest __temp = self as Quest
ms02script kmyQuest = __temp as ms02script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(1620)
SetObjectiveDisplayed(1630)

SetStage(1870)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1632_Item_00
Function Fragment_Stage_1632_Item_00()
;BEGIN CODE
; Is Amanirenas sitting out the fight? Or is she dead?
if ( GetStageDone(1622) || GetStageDone(1634) )
  SetStage(1630)
endif

; Get all his faction to stop fighting
Alias_Renegades.RemoveFromFaction(PlayerEnemyFaction)
MS02_RenegadesFaction.SetEnemy(MS02_PragmatistsFaction, TRUE, TRUE)
MS02_RenegadesFaction.SetEnemy(MS02_BelieversFaction, TRUE, TRUE)

;Alias_Renegades.RemoveFromFaction(MS02_RenegadesFaction)
Alias_Renegades.StopCombat()
Alias_Renegades.EvaluateAll()

SetObjectiveCompleted(1620)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1634_Item_00
Function Fragment_Stage_1634_Item_00()
;BEGIN CODE
; If Genghis is dead, proceed
if ( GetStageDone(1632) )
  SetStage(1630)
endif

; Get all her faction to stop fighting
Alias_Believers.RemoveFromFaction(PlayerEnemyFaction)
MS02_BelieversFaction.SetEnemy(MS02_PragmatistsFaction, TRUE, TRUE)
MS02_BelieversFaction.SetEnemy(MS02_RenegadesFaction, TRUE, TRUE)

;Alias_Believers.RemoveFromFaction(MS02_BelieversFaction)
Alias_Believers.StopCombat()
Alias_Believers.EvaluateAll()

SetObjectiveCompleted(1625)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1640_Item_00
Function Fragment_Stage_1640_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1630)

; Common Civil War is Over flag
SetStage(1875)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1700_Item_00
Function Fragment_Stage_1700_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1601)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1710_Item_00
Function Fragment_Stage_1710_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1601)
SetObjectiveDisplayed(1610)

ObjectReference oTarg
ObjectReference oLinkedRef

oTarg = Alias_Amanirenas.GetRef()
(oTarg as Actor).EvaluatePackage()
;oLinkedRef = oTarg.GetLinkedRef()
;oTarg.MoveTo(oLinkedRef)

oTarg = Alias_FDR.GetRef()
oLinkedRef = oTarg.GetLinkedRef()
oTarg.MoveTo(oLinkedRef)

oTarg = Alias_GenghisKhan.GetRef()
oLinkedRef = oTarg.GetLinkedRef()
oTarg.MoveTo(oLinkedRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1715_Item_00
Function Fragment_Stage_1715_Item_00()
;BEGIN CODE
Alias_GenghisKhan.GetActorRef().SetValue(MS02_LeaderReadyToFight, 1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1720_Item_00
Function Fragment_Stage_1720_Item_00()
;BEGIN AUTOCAST TYPE ms02script
Quest __temp = self as Quest
ms02script kmyQuest = __temp as ms02script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(1610)
SetObjectiveDisplayed(1620)

; Remove NPCs from factions to prevent issues with stopping combat.
kmyQuest.RemoveFactions()

; Set Genghis hostile
; Make it so that the target goes hostile
Actor aTarg = Alias_GenghisKhan.GetActorRef()
Actor aPlayer = Game.GetPlayer()
kmyQuest.GoHostile(aTarg)

; Make it so the faction goes hostile
MS02_RenegadesFaction.SetEnemy(MS02_BelieversFaction)
;MS02_RenegadesFaction.SetPlayerEnemy()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1730_Item_00
Function Fragment_Stage_1730_Item_00()
;BEGIN AUTOCAST TYPE ms02script
Quest __temp = self as Quest
ms02script kmyQuest = __temp as ms02script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(1620)
SetObjectiveDisplayed(1730)

SetStage(1870)

; Get all his faction to stop fighting
Alias_Renegades.RemoveFromFaction(PlayerEnemyFaction)
MS02_RenegadesFaction.SetEnemy(MS02_BelieversFaction, TRUE, TRUE)
MS02_RenegadesFaction.SetEnemy(MS02_PragmatistsFaction, TRUE, TRUE)
;Alias_Renegades.RemoveFromFaction(MS02_RenegadesFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1740_Item_00
Function Fragment_Stage_1740_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1730)

; Common Civil War is Over flag
SetStage(1875)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1800_Item_00
Function Fragment_Stage_1800_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(1602)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1810_Item_00
Function Fragment_Stage_1810_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1602)
SetObjectiveDisplayed(1610)

ObjectReference oTarg
ObjectReference oLinkedRef

oTarg = Alias_Amanirenas.GetRef()
oLinkedRef = oTarg.GetLinkedRef()
oTarg.MoveTo(oLinkedRef)

oTarg = Alias_FDR.GetRef()
oLinkedRef = oTarg.GetLinkedRef()
oTarg.MoveTo(oLinkedRef)

oTarg = Alias_GenghisKhan.GetRef()
(oTarg as Actor).EvaluatePackage()
;oLinkedRef = oTarg.GetLinkedRef()
;oTarg.MoveTo(oLinkedRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1815_Item_00
Function Fragment_Stage_1815_Item_00()
;BEGIN CODE
Alias_Amanirenas.GetActorRef().SetValue(MS02_LeaderReadyToFight, 1.0)

; If FDR didn't compromise - he's fighting
if ( !GetStageDone(1822) )
  Alias_FDR.GetActorRef().SetValue(MS02_LeaderReadyToFight, 1.0)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1820_Item_00
Function Fragment_Stage_1820_Item_00()
;BEGIN AUTOCAST TYPE ms02script
Quest __temp = self as Quest
ms02script kmyQuest = __temp as ms02script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(1610)
SetObjectiveDisplayed(1625)

; If FDR is in the fray, he has to die too
if ( !GetStageDone(1822) )
  SetObjectiveDisplayed(1627)
endif

; Remove NPCs from factions to prevent issues with stopping combat.
kmyQuest.RemoveFactions()

Actor aPlayer = Game.GetPlayer()

; KMK: Renegades are player allies
aPlayer.AddToFaction(MS02_RenegadesFaction)

; Set Amanirenas hostile
; Make it so that the target goes hostile
Actor aTarg = Alias_Amanirenas.GetActorRef()
kmyQuest.GoHostile(aTarg)

; If the Pragmatists aren't neutral, have them fight
if ( !GetStageDone(1822) )
  ; FDR goes hostile
  aTarg = Alias_FDR.GetActorRef()
  kmyQuest.GoHostile(aTarg)

  ; Make it so the faction goes hostile
  MS02_PragmatistsFaction.SetEnemy(MS02_RenegadesFaction)
  ;MS02_PragmatistsFaction.SetPlayerEnemy()
endif

; Make it so the faction goes hostile
MS02_BelieversFaction.SetEnemy(MS02_RenegadesFaction)
;MS02_BelieversFaction.SetPlayerEnemy()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1823_Item_00
Function Fragment_Stage_1823_Item_00()
;BEGIN CODE
; Flag that Amanirenas is staying out of it
SetStage(1622)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1830_Item_00
Function Fragment_Stage_1830_Item_00()
;BEGIN AUTOCAST TYPE ms02script
Quest __temp = self as Quest
ms02script kmyQuest = __temp as ms02script
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(1830)

SetStage(1870)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1832_Item_00
Function Fragment_Stage_1832_Item_00()
;BEGIN CODE
; Is FDR sitting out the fight? Or is he dead?
if ( GetStageDone(1822) || GetStageDone(1834) )
  SetStage(1830)
endif

; Get all her faction to stop fighting
Alias_Believers.RemoveFromFaction(PlayerEnemyFaction)
MS02_BelieversFaction.SetEnemy(MS02_RenegadesFaction, TRUE, TRUE)
MS02_BelieversFaction.SetEnemy(MS02_PragmatistsFaction, TRUE, TRUE)
;Alias_Believers.RemoveFromFaction(MS02_BelieversFaction)

Alias_Believers.StopCombat()
Alias_Believers.EvaluateAll()

SetObjectiveCompleted(1625)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1834_Item_00
Function Fragment_Stage_1834_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1627)

; If Amani is dead, then the quest proceeds
if ( GetStageDone(1832) )
  SetStage(1830)
endif

; Get all his faction to stop fighting
Alias_Pragmatists.RemoveFromFaction(PlayerEnemyFaction)
MS02_PragmatistsFaction.SetEnemy(MS02_BelieversFaction, TRUE, TRUE)
MS02_PragmatistsFaction.SetEnemy(MS02_RenegadesFaction, TRUE, TRUE)
;Alias_Pragmatists.RemoveFromFaction(MS02_PragmatistsFaction)

Alias_Pragmatists.StopCombat()
Alias_Pragmatists.EvaluateAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1840_Item_00
Function Fragment_Stage_1840_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1830)

; Common Civil War is Over flag
SetStage(1875)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1870_Item_00
Function Fragment_Stage_1870_Item_00()
;BEGIN AUTOCAST TYPE ms02script
Quest __temp = self as Quest
ms02script kmyQuest = __temp as ms02script
;END AUTOCAST
;BEGIN CODE
;Stop the fighting
kmyQuest.EveryoneStopFighting()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1872_Item_00
Function Fragment_Stage_1872_Item_00()
;BEGIN AUTOCAST TYPE ms02script
Quest __temp = self as Quest
ms02script kmyQuest = __temp as ms02script
;END AUTOCAST
;BEGIN CODE
kmyQuest.ResetBaseFactions()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1875_Item_00
Function Fragment_Stage_1875_Item_00()
;BEGIN AUTOCAST TYPE ms02script
Quest __temp = self as Quest
ms02script kmyQuest = __temp as ms02script
;END AUTOCAST
;BEGIN CODE
; Place everyone back into their original base Crucible faction and Crime Faction
kmyQuest.ResetBaseFactions()

; Make it so you can get into the Facility to the right place
Alias_BackdoorFacility.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1880_Item_00
Function Fragment_Stage_1880_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1880)
SetObjectiveDisplayed(1900)

; Remove the Encrypted Code
Game.GetPlayer().RemoveItem(Alias_EncryptedOverrideCode.GetRef())

; Get the decrypted code
Game.GetPlayer().AddAliasedItem(MS02_SecurityOverrideCode, Alias_OverrideCode, 1, FALSE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1890_Item_00
Function Fragment_Stage_1890_Item_00()
;BEGIN CODE
; Open the Restricted Section by activating the door
ObjectReference oDoor = Alias_FacilityRestrictedTerminal.GetRef().GetLinkedRef()
oDoor.Activate(Game.GetPlayer())

; Remove the Override Code
Game.GetPlayer().RemoveItem(Alias_OverrideCode.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1900_Item_00
Function Fragment_Stage_1900_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1900)
SetObjectiveCompleted(1600)
SetObjectiveCompleted(1601)
SetObjectiveCompleted(1602)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1910_Item_00
Function Fragment_Stage_1910_Item_00()
;BEGIN CODE
CompleteAllObjectives()

; Player chose to return the Facility to its initial state
; Player gets the full reward - minus any special item

SetStage(9000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1920_Item_00
Function Fragment_Stage_1920_Item_00()
;BEGIN CODE
CompleteAllObjectives()

; Player chose to kill everyone
; Player gets the full reward - special item is put on corpse

; Your companions may say something
MS02_1900_PC_Kills_Crucible.Start()

SetStage(9000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1930_Item_00
Function Fragment_Stage_1930_Item_00()
;BEGIN CODE
; The Facility has been dealt with
SetStage(1900)

SetObjectiveDisplayed(2010)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1940_Item_00
Function Fragment_Stage_1940_Item_00()
;BEGIN CODE
; The Facility has been dealt with
SetStage(1900)

SetObjectiveDisplayed(2020)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1950_Item_00
Function Fragment_Stage_1950_Item_00()
;BEGIN CODE
; The Facility has been dealt with
SetStage(1900)

SetObjectiveDisplayed(2030)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
CompleteAllObjectives()

; If you sided with Genghis - queue up the reactive content
if ( GetStageDone(1950) )
  MS02_GenghisReactivity.SetValue(1.0)
  float currentGameTime = Utility.GetCurrentGameTime()
  SE_Player_FAB18a_Timestamp.SetValue(currentGameTime + cooldownDays)
endif

SetStage(9000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8810_Item_00
Function Fragment_Stage_8810_Item_00()
;BEGIN CODE
; He's fair game during the fight with Genghis
if ( GetStageDone(1820) && !GetStageDone(1822) )
  SetStage(1834)
else
  SetStage(8900)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8820_Item_00
Function Fragment_Stage_8820_Item_00()
;BEGIN CODE
; The quest fails if we're not in the conflict situation

; Are you sided with FDR for the Conflict?
; AND Amanirenas didn't back out of the fight?
if ( GetStageDone(1620) && !GetStageDone(1622) )
  ; If so, progress the quest - Genghis is fair game
  SetStage(1634)

; During the Genghis Conflict - Amanirenas is always fighting
elseif ( GetStageDone(1820) ) 
  SetStage(1832)

else
  ; If both those checks fail, then this is a Quest Fail
  SetStage(8900)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8830_Item_00
Function Fragment_Stage_8830_Item_00()
;BEGIN CODE
; The quest fails if we're not in the conflict situation

; Are you sided with FDR for the Conflict?
if ( GetStageDone(1620) )
  ; If so, progress the quest - Genghis is fair game
  SetStage(1632)
elseif ( GetStageDone(1720) )  ; Are you sided with Amanirenas?
  SetStage(1730)
else
  SetStage(8900)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8840_Item_00
Function Fragment_Stage_8840_Item_00()
;BEGIN CODE
; If Ada is killed before she finishes her quest duties, then fail quest
if ( !GetStageDone(1300) )
  SetStage(8900)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_8900_Item_00
Function Fragment_Stage_8900_Item_00()
;BEGIN CODE
FailAllObjectives()

Stop()
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

GlobalVariable Property MS02_CluesCollected Auto Const Mandatory


Scene Property MS02_1550_WarningMessage Auto Const Mandatory
Scene Property MS02_0100_EmergencyBroadcast Auto Const Mandatory

ReferenceAlias Property Alias_AdaLovelace Auto Const Mandatory
ReferenceAlias Property Alias_GenghisKhan Auto Const Mandatory
ReferenceAlias Property Alias_Amanirenas Auto Const Mandatory
ReferenceAlias Property Alias_FDR Auto Const Mandatory

ReferenceAlias Property Alias_CrucibleCOC Auto Const Mandatory
ReferenceAlias Property Alias_AdaTempName Auto Const
ReferenceAlias Property Alias_FDRTempName Auto Const

Quest Property MS02_Delivery Auto Const Mandatory


Scene Property MS02_1090_OriginDoorWarning Auto Const Mandatory

RefCollectionAlias Property Alias_Renegades Auto Const Mandatory

Faction Property MS02_BelieversFaction Auto Const Mandatory

Faction Property MS02_PragmatistsFaction Auto Const Mandatory

Faction Property MS02_RenegadesFaction Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

Scene Property MS02_1900_PC_Kills_Crucible Auto Const Mandatory

ReferenceAlias Property Alias_AlienSpawner Auto Const Mandatory

RefCollectionAlias Property Alias_GenghisAliens Auto Const Mandatory

RefCollectionAlias Property Alias_InitiallyHiddenPeople Auto Const Mandatory

GlobalVariable Property Crew_Elite_CanHireAmelia Auto Const Mandatory

Quest Property AmeliaEliteCrewQuest Auto Const

ReferenceAlias Property Alias_FacilityMapMarker Auto Const Mandatory

Scene Property MS02_0610_GenghisApproaches Auto Const Mandatory

ReferenceAlias Property Alias_Beacon01_MapMarker Auto Const Mandatory

ReferenceAlias Property Alias_FacilityRestrictedTerminal Auto Const Mandatory

MiscObject Property MS02_EncryptedSecurityOverrideCode Auto Const Mandatory

ReferenceAlias Property Alias_EncryptedOverrideCode Auto Const Mandatory

ReferenceAlias Property Alias_OverrideCode Auto Const Mandatory

MiscObject Property MS02_SecurityOverrideCode Auto Const Mandatory

ActorValue Property MS02_Foreknowledge Auto Const Mandatory

ReferenceAlias Property Alias_DoorPragmatists Auto Const Mandatory

RefCollectionAlias Property Alias_DoorsCrucible Auto Const Mandatory

Faction Property CrimeFactionCrucible Auto Const Mandatory

Faction Property CrucibleFaction Auto Const Mandatory

RefCollectionAlias Property Alias_Believers Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

Faction Property PlayerFriendFaction Auto Const Mandatory

RefCollectionAlias Property Alias_Pragmatists Auto Const Mandatory

GlobalVariable Property MS02_GenghisReactivity Auto Const Mandatory

ReferenceAlias Property Alias_BeagleMapMarker Auto Const Mandatory

ActorValue Property MS02_LeaderReadyToFight Auto Const Mandatory

Message Property MS02_BeagleNavBeaconMessage Auto Const Mandatory

ReferenceAlias Property Alias_BackdoorFacility Auto Const Mandatory

Faction Property PlayerAllyFaction Auto Const Mandatory

Quest Property Crucible01 Auto Const Mandatory

ReferenceAlias Property Alias_Beagle Auto Const Mandatory

GlobalVariable Property SE_Player_FAB18a_Timestamp Auto Const Mandatory

Float Property cooldownDays Auto Const Mandatory

RefCollectionAlias Property Alias_NeutralClones Auto Const Mandatory
