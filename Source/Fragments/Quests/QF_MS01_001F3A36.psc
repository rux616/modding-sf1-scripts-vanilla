;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS01_001F3A36 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
; Are you NOT in the Altair system?
if ( !Alias_PlayerShip.GetRef().IsInLocation(sAltair) )
  ; Then play the pointer merchant
  MS01SpaceEncounter03.Start()
else
  ; Otherwise, you're in the Altair system so do the distress
  SetStage(200)
endif

; Hide the Research Camp
Alias_ScientistMapMarker.GetRef().Disable()


Alias_SpaceFightersLocation01.GetLocation().AddKeyword(LocTypeSENotAllowed)
Alias_SpaceFightersLocation02.GetLocation().AddKeyword(LocTypeSENotAllowed)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
; Head to the complex straight away
Game.GetPlayer().MoveTo(OutpostCOC)

; Lock the doors on the Scientist POI
;Alias_ScientistDoors.GetAt(0).Lock()
;Alias_ScientistDoors.GetAt(1).Lock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
MS01SpaceEncounter03.Start()
MS01_0100_HaulerIntro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_ScientistMapMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Hauler hails the player
MS01_0075_HaulerHail.Start()

; OLD - If we decide to kill the hail, point to this instead
;MS01_0100_HaulerIntro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)

; Then make the merchant leave after a few seconds
Utility.Wait(3.0)
SpaceshipReference srHauler = Alias_Hauler.GetRef() as SpaceshipReference
srHauler.DisableWithGravJump()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

; You get a distress call when you enter
MS01_0200_DistressCall.Start()
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

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(400)
SetObjectiveDisplayed(475)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
; Start up Mahoney's scene
MS01_0410_MahoneySaved.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0415_Item_00
Function Fragment_Stage_0415_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(425)
Alias_FC_PvtMahoney.GetActorRef().RemoveFromFaction(CaptiveFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
; Unlock the door
Alias_InfirmaryDoor.GetRef().Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0422_Item_00
Function Fragment_Stage_0422_Item_00()
;BEGIN CODE
If !GetStageDone(415)
	SetObjectiveDisplayed(425)
EndIf

; Play a short scene where they acknowledge the door has opened
MS01_0422_DoctorDoorReact.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0425_Item_00
Function Fragment_Stage_0425_Item_00()
;BEGIN CODE
SetObjectiveCompleted(425)
SetObjectiveDisplayed(435)

; Get the key to most of the doors
Game.GetPlayer().AddItem(MS01_MedicalKey)

Alias_FC_DrMoussa.GetActorRef().RemoveFromFaction(CaptiveFaction)
Alias_UC_CplLezama.GetActorRef().RemoveFromFaction(CaptiveFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN CODE
; Start a quick back and forth with Torres
MS01_0430_TorresDoorOpened.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0435_Item_00
Function Fragment_Stage_0435_Item_00()
;BEGIN CODE
SetObjectiveCompleted(435)
SetObjectiveDisplayed(400)

; Get the key to the last door
Game.GetPlayer().AddItem(MS01_SecurityKey)

; Make everyone update packages
Alias_FC_LtTorres.GetActorRef().EvaluatePackage()
Alias_FC_SargeDasari.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
; Make the attackers spawn for Meyong and company to wipe out
Alias_MyeongInitialEnemies.EnableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0475_Item_00
Function Fragment_Stage_0475_Item_00()
;BEGIN AUTOCAST TYPE MS01Script
Quest __temp = self as Quest
MS01Script kmyQuest = __temp as MS01Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(400)
SetObjectiveDisplayed(475)

; Start a post combat scene
MS01_0475_PostCombatMyeongIntro.Start()

; Make everyone update packages
Alias_FC_LtTorres.GetActorRef().EvaluatePackage()
Alias_FC_SargeDasari.GetActorRef().EvaluatePackage()
Alias_UC_CaptMyeong.GetActorRef().EvaluatePackage()
Alias_UC_PvtTsai.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(475)
SetObjectiveDisplayed(490)

; Make the Research Camp show up
Alias_ScientistMapMarker.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN AUTOCAST TYPE MS01Script
Quest __temp = self as Quest
MS01Script kmyQuest = __temp as MS01Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(490)
SetObjectiveDisplayed(500)

; Lock the doors on the Scientist POI
kmyQuest.LockDoors(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN AUTOCAST TYPE MS01Script
Quest __temp = self as Quest
MS01Script kmyQuest = __temp as MS01Script
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(500)
SetObjectiveDisplayed(600)

; Unlock the doors on the Scientist POI
kmyQuest.LockDoors(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600)
SetObjectiveDisplayed(700)

; Move Torres and Myeong near the landing pad
Actor aTarg = Alias_FC_LtTorres.GetActorRef()
aTarg.EvaluatePackage()
aTarg.MoveTo(aTarg.GetLinkedRef(LinkCustom01))

aTarg = Alias_UC_CaptMyeong.GetActorRef()
aTarg.EvaluatePackage()
aTarg.MoveTo(aTarg.GetLinkedRef(LinkCustom01))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
SetObjectiveCompleted(700)
SetObjectiveDisplayed(800)
SetObjectiveDisplayed(850)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0820_Item_00
Function Fragment_Stage_0820_Item_00()
;BEGIN CODE
; Start up the space cell
MS01SpaceEncounter01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0830_Item_00
Function Fragment_Stage_0830_Item_00()
;BEGIN CODE
SetObjectiveCompleted(800)

; If the other fighters are done - then flag this part as done
if ( GetStageDone(850) )
  SetStage(900)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0840_Item_00
Function Fragment_Stage_0840_Item_00()
;BEGIN CODE
; Start up the space cell
MS01SpaceEncounter02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
SetObjectiveCompleted(850)

; If the other fighters are done - then flag this part as done
if ( GetStageDone(830) )
  SetStage(900)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(900)

; Mahoney sends an urgent message
MS01_0900_MahoneyDistress.Start()

;Remove the keyword so SEs can spawn here again.
Alias_SpaceFightersLocation01.GetLocation().RemoveKeyword(LocTypeSENotAllowed)
Alias_SpaceFightersLocation02.GetLocation().RemoveKeyword(LocTypeSENotAllowed)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
Alias_NPCsToCleanUp.DisableAll()
Alias_Rescue_Scientist.GetRef().Disable()
Alias_Rescue_Soldier.GetRef().Disable()

;Cooldown for SE_FAB06 to prevent it from being encountered immediately after quest

float currentGameTime = Utility.GetCurrentGameTime()
SE_FAB06_CooldownDays.SetValue(currentGameTime + cooldownDays)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(900)
SetObjectiveDisplayed(1000)

; Move everyone to their final stand locations
Actor aTarg
aTarg = Alias_FC_LtTorres.GetActorRef()
aTarg.MoveTo(aTarg.GetLinkedRef())
aTarg = Alias_FC_PvtMahoney.GetActorRef()
aTarg.MoveTo(aTarg.GetLinkedRef())
aTarg = Alias_FC_SargeDasari.GetActorRef()
aTarg.MoveTo(aTarg.GetLinkedRef())

aTarg = Alias_UC_CaptMyeong.GetActorRef()
aTarg.MoveTo(aTarg.GetLinkedRef())
aTarg = Alias_UC_CplLezama.GetActorRef()
aTarg.MoveTo(aTarg.GetLinkedRef())
aTarg = Alias_UC_PvtTsai.GetActorRef()
aTarg.MoveTo(aTarg.GetLinkedRef())

; Enable the end bad guys
; TODO: Need a wave battle here
Alias_EndFightBaddies.EnableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1010_Item_00
Function Fragment_Stage_1010_Item_00()
;BEGIN CODE
; Wave 2 Start, Enable 1st Dropship
Alias_EndFightBaddies_Wave02_Ship.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1020_Item_00
Function Fragment_Stage_1020_Item_00()
;BEGIN CODE
; Wave 2 Start, Enable 2nd Dropship
Alias_EndFightBaddies_Wave02_Ship02.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1000)
SetObjectiveDisplayed(1100)

; Make everyone update packages
Alias_FC_LtTorres.GetActorRef().EvaluatePackage()
Alias_UC_CaptMyeong.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1190_Item_00
Function Fragment_Stage_1190_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Credits, 1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
CompleteAllObjectives()

; Flag that the player remembers doing this
Game.GetPlayer().SetValue(MS01_ForeknowledgeAV, 1.0)
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

Scene Property MS01_0200_DistressCall Auto Const Mandatory

Quest Property MS01SpaceEncounter01 Auto Const Mandatory

Quest Property MS01SpaceEncounter02 Auto Const Mandatory

ReferenceAlias Property Alias_FC_LtTorres Auto Const Mandatory

ReferenceAlias Property Alias_FC_SargeDasari Auto Const Mandatory

ReferenceAlias Property Alias_UC_CaptMyeong Auto Const Mandatory

ReferenceAlias Property Alias_FC_PvtMahoney Auto Const Mandatory

ReferenceAlias Property Alias_UC_CplLezama Auto Const Mandatory

ReferenceAlias Property Alias_UC_PvtTsai Auto Const Mandatory

RefCollectionAlias Property Alias_EndFightBaddies Auto Const Mandatory

Quest Property MS01SpaceEncounter03 Auto Const Mandatory

Scene Property MS01_0100_HaulerIntro Auto Const Mandatory

ReferenceAlias Property Alias_ScientistMapMarker Auto Const Mandatory

ReferenceAlias Property Alias_Hauler Auto Const Mandatory

Key Property MS01_MedicalKey Auto Const Mandatory

ObjectReference Property OutpostCOC Auto Const

Key Property MS01_SecurityKey Auto Const Mandatory

RefCollectionAlias Property Alias_MyeongInitialEnemies Auto Const Mandatory

Scene Property MS01_0475_PostCombatMyeongIntro Auto Const Mandatory

ReferenceAlias Property Alias_InfirmaryDoor Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

Scene Property MS01_0410_MahoneySaved Auto Const Mandatory

Scene Property MS01_0422_DoctorDoorReact Auto Const Mandatory

Scene Property MS01_0075_HaulerHail Auto Const Mandatory

Scene Property MS01_0430_TorresDoorOpened Auto Const Mandatory

Keyword Property LinkCustom01 Auto Const Mandatory

Scene Property MS01_0900_MahoneyDistress Auto Const Mandatory

ActorValue Property MS01_ForeknowledgeAV Auto Const Mandatory

Location Property SAltair Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

ReferenceAlias Property Alias_EndFightBaddies_Wave02_Ship Auto Const Mandatory

LocationAlias Property Alias_SpaceFightersLocation02 Auto Const Mandatory

Keyword Property LocTypeSENotAllowed Auto Const Mandatory

RefCollectionAlias Property Alias_NPCsToCleanUp Auto Const Mandatory

ReferenceAlias Property Alias_Rescue_Scientist Auto Const Mandatory

ReferenceAlias Property Alias_Rescue_Soldier Auto Const Mandatory

Faction Property CaptiveFaction Auto Const Mandatory

ReferenceAlias Property Alias_FC_DrMoussa Auto Const Mandatory

LocationAlias Property Alias_SpaceFightersLocation01 Auto Const Mandatory

ReferenceAlias Property Alias_EndFightBaddies_Wave02_Ship02 Auto Const Mandatory

GlobalVariable Property SE_FAB06_CooldownDays Auto Const Mandatory

Float Property cooldownDays Auto Const Mandatory
