;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_UC07_00215E93 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
SetStage(19)

Game.GetPlayer().Moveto(UC07_DebugMarker01)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
SetStage(19)
SetStage(200)
SetStage(300)

Actor PlayREF = Game.GetPlayer()
PlayREF.AddItem(Alias_KaiserSchematics.GetRef(), abSilent = true)
PlayREF.Moveto(UC07_DebugMarker02)
SetObjectiveCompleted(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
SetStage(19)
SetStage(200)
SetStage(300)
SetStage(400)
Dialogue1OfAKindUC07.SetStage(50)
Dialogue1OfAKindUC07.SetStage(100)

Actor PlayREF = Game.GetPlayer()
PlayREF.AddItem(Alias_KaiserSchematics.GetRef(), abSilent = true)
PlayREF.Moveto(UC07_DebugMarker02)
SetObjectiveCompleted(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
SetStage(19)
SetStage(200)
SetStage(300)
SetStage(400)
Dialogue1OfAKindUC07.SetStage(50)
Dialogue1OfAKindUC07.SetStage(100)

Actor PlayREF = Game.GetPlayer()
PlayREF.AddItem(Alias_KaiserSchematics.GetRef(), abSilent = true)
PlayREF.Moveto(UC07_DebugMarker03)
SetObjectiveCompleted(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
SetStage(19)
SetStage(200)
SetStage(300)
SetStage(400)
SetStage(410)
SetStage(415)
SetStage(420)
SetStage(430)
SetStage(440)
SetStage(450)
Dialogue1OfAKindUC07.SetStage(50)
Dialogue1OfAKindUC07.SetStage(100)

Actor PlayREF = Game.GetPlayer()
PlayREF.AddItem(Alias_KaiserSchematics.GetRef(), abSilent = true)
Alias_HeatLeeches.DisableAll()
PlayREF.Moveto(UC07_DebugMarker02)
SetObjectiveCompleted(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
SetStage(19)
SetStage(200)
SetStage(300)
SetStage(400)
SetStage(410)
SetStage(415)
SetStage(420)
SetStage(430)
SetStage(440)
SetStage(450)

Actor PlayREF = Game.GetPlayer()
PlayREF.AddItem(Alias_KaiserSchematics.GetRef(), abSilent = true)
PlayREF.Moveto(UC07_DebugMarker03)
Alias_HeatLeeches.DisableAll()
PlayREF.AddItem(Mfg_Positron_Battery)
SetObjectiveCompleted(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
SetStage(19)
SetStage(200)
SetStage(300)
SetStage(430)
SetStage(440)
SetStage(450)
SetStage(500)
SetStage(550)

Alias_KaiserCaptiveAlias.Clear()
Actor KaiREF = Alias_Kaiser.GetActorRef()
KaiREF.Moveto(UC07_DebugMarker_KaiserTeleport_Stage7)
KaiRef.EvaluatePackage()
Actor PlayREF = Game.GetPlayer()
PlayREF.AddItem(Alias_KaiserSchematics.GetRef(), abSilent = true)
PlayREF.Moveto(UC07_DebugMarker05)
SetObjectiveCompleted(100)
SetObjectiveCompleted(300)
SetObjectiveCompleted(430)
SetObjectiveCompleted(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
SetStage(19)
SetStage(200)
SetStage(300)
SetStage(430)
SetStage(440)
SetStage(450)
SetStage(500)
SetStage(550)
SetStage(560)
SetStage(600)

Alias_KaiserCaptiveAlias.Clear()
Actor KaiREF = Alias_Kaiser.GetActorRef()
KaiREF.Moveto(UC07_DebugMarker_KaiserTeleport_Stage8)
UC07_550_Kaiser_ProceedToOverlook.Stop()
KaiRef.EvaluatePackage()
Actor PlayREF = Game.GetPlayer()
PlayREF.AddItem(Alias_KaiserSchematics.GetRef(), abSilent = true)
PlayREF.Moveto(UC07_DebugMarker06)
SetObjectiveCompleted(100)
SetObjectiveCompleted(300)
SetObjectiveCompleted(430)
SetObjectiveCompleted(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
SetStage(19)
SetStage(200)
SetStage(300)
SetStage(800)
DialogueRedDevilsHQ.SetStage(20)

Alias_KaiserCaptiveAlias.Clear()
Actor PlayREF = Game.GetPlayer()
PlayREF.AddItem(Alias_KaiserSchematics.GetRef(), abSilent = true)
PlayREF.Moveto(UC07_DebugMarker01)
SetObjectiveCompleted(100)
SetObjectiveCompleted(300)
Utility.Wait(1.0)
SetStage(820)
Alias_Kaiser.GetActorRef().AllowPCDialogue(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE UC07QuestScript
Quest __temp = self as Quest
UC07QuestScript kmyQuest = __temp as UC07QuestScript
;END AUTOCAST
;BEGIN CODE
int i = 0
int iLength = kmyquest.RecipePieces.Length
ObjectReference PlayREF = Game.GetPlayer()

while i < iLength
  PlayRef.AddItem(kmyquest.RecipePieces[i].ComponentObject, kmyquest.RecipePieces[i].AmountRequired)

  i += 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0019_Item_00
Function Fragment_Stage_0019_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(UC03_RedDevilsHQKey, abSilent=true)

;give player a ship
Frontier_ModularREF.moveto(RDHQShipLandingMarker)
Frontier_ModularREF.setlinkedref(RDHQShipLandingMarker, SpaceshipEnabledLandingLink)
Frontier_ModularREF.Enable()
(SQ_PlayerShip as SQ_PlayerShipScript).ResetHomeShip(Frontier_ModularREF as SpaceshipReference)

;Get Jakob in the right place and sandboxing
UC04_JakobSandboxing_PostUC03.SetValue(1)
Alias_Jakob.GetRef().MoveTo(UC07_JakobTeleportMarker)

;Get Hadrian turned on and in the right place
UC05_HadrianSandboxing_PostUC05.SetValue(1)
Actor HadREF = Alias_Hadrian.GetActorRef()
HadREF.Enable()
HadREF.MoveTo(UC07_HadrianTeleportMarker)

;Give the player some guns
Game.GetPlayer().AddItem(TestVSWeapons, abSilent = true)

;Unlock the RHQ
DialogueRedDevilsHQ.SetStage(7)

;Turn on its map marker
Alias_RHQMapMarker.GetRef().Enable()
Alias_RHQMapMarker.GetRef().SetMarkerVisibleOnStarMap(true)

;Clean up the previous quests
UC05.SetStage(1000)
UC06.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE UC07QuestScript
Quest __temp = self as Quest
UC07QuestScript kmyQuest = __temp as UC07QuestScript
;END AUTOCAST
;BEGIN CODE
;GEN-532711: Reset the Eclitpic guards
Alias_Ecliptic.ResetAll()

;Get the battery pieces handed out
kmyquest.DistributeBatteryComponents()

;Get the VV conversation quest up and running
UC07_HadrianVVRevealQuest.Start()

;Get the Red Devils HQ state updated
DialogueRedDevilsHQ.SetStage(10)

;Turn on the FC observers if the player's called them in
if UC05_FreestarObserversAccepted.GetValue() >= 1.0
  DialogueRedDevilsHQ.SetStage(12)
endif 

SetObjectiveDisplayed(100)
SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
UC07_110_HadrianSpotsPlayer.Start()
Alias_Hadrian.GetActorRef().EvaluatePackage()
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
;Get Hadrian into the right package
Alias_Hadrian.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
Actor PlayREF = Game.GetPlayer()
PlayREF.AddItem(Alias_KaiserSchematics.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0221_Item_00
Function Fragment_Stage_0221_Item_00()
;BEGIN CODE
if UC_PlayerKnows_KaiserIsARobot.GetValue() < 1
  ;UC_PlayerKnows_KaiserIsARobot.SetValue(1)
  SetStage(222)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0223_Item_00
Function Fragment_Stage_0223_Item_00()
;BEGIN CODE
UC_PlayerKnows_KaiserIsARobot.SetValue(1)
UC_PlayerKnows_HadrianBuiltKaiser.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0225_Item_00
Function Fragment_Stage_0225_Item_00()
;BEGIN CODE
UC_PlayerKnows_HadriansPast_Clone.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0226_Item_00
Function Fragment_Stage_0226_Item_00()
;BEGIN CODE
;Also close off the clone conversation choice
SetStage(225)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0227_Item_00
Function Fragment_Stage_0227_Item_00()
;BEGIN CODE
UC_PlayerKnows_HadriansPast_Clone.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)

;Turn on Kaiser
Actor KaiserREF = Alias_Kaiser.GetActorRef()
KaiserREF.AddKeyword(ActorSocialImmune)
KaiserREF.IgnoreFriendlyHits()
KaiserREF.AllowPCDialogue(False)
KaiserREF.SetGhost(true)
KaiserREF.Enable()
Alias_EmergencyBeacon.GetRef().Enable()

;Make sure the cage door is closed and locked
ObjectReference CageREF = Alias_CageDoor.GetRef()
CageREF.SetOpen(false)
CageREF.Lock()

;Turn on Unit 99
Actor Unit99REF = Alias_Unit99.GetActorRef()
Unit99REF.SetRestrained(true)
Unit99REF.Enable()

;Turn on Heat Leeches
Alias_HeatLeeches.EnableAll()
Alias_Heatleeches.SetValue(Health, 1)

;Get the field notes in the wall safe
Alias_WallSafe.GetRef().AddItem(Alias_FieldNotes.GetRef())

;Unlock the positron battery recipe for the player
UC07_LearnedPositronBatteryRecipe.SetValue(1)

;GEN-514505: Setting the prereq stage for the lock event
;For Unit 99's cage so locking the cage doesn't cause it to 
;trigger the event!
Utility.Wait(3.0)
SetStage(302)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0305_Item_00
Function Fragment_Stage_0305_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(305)
SetObjectiveDisplayed(306)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
float newValue = UC07_GelFee.GetValue() - UC07_GelFee_SpeechDiscount.GetValue()

if UC07_GelFee.GetValue() - newValue < 1
  UC07_GelFee.SetValue(1)
else
  UC07_GelFee.SetValue(newValue)
endif

UpdateCurrentInstanceGlobal(UC07_GelFee)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0315_Item_00
Function Fragment_Stage_0315_Item_00()
;BEGIN CODE
float newValue = UC07_GelFee.GetValue() - UC07_GelFee_FreestarDiscount.GetValue()

if UC07_GelFee.GetValue() - newValue < 1
  UC07_GelFee.SetValue(1)
else
  UC07_GelFee.SetValue(newValue)
endif

UpdateCurrentInstanceGlobal(UC07_GelFee)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0317_Item_00
Function Fragment_Stage_0317_Item_00()
;BEGIN CODE
float newValue = UC07_GelFee.GetValue() - UC07_GelFee_AzamiDiscount.GetValue()

if UC07_GelFee.GetValue() - newValue < 1
  UC07_GelFee.SetValue(1)
else
  UC07_GelFee.SetValue(newValue)
endif

UpdateCurrentInstanceGlobal(UC07_GelFee)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, UC07_GelFee.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0399_Item_00
Function Fragment_Stage_0399_Item_00()
;BEGIN CODE
SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveCompleted(305)
SetObjectiveCompleted(306)
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0407_Item_00
Function Fragment_Stage_0407_Item_00()
;BEGIN CODE
SetStage(420)

if !GetStageDone(440)
  UC07_420_Kaiser_BiologicalContamination.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
SetObjectiveSkipped(305)
SetObjectiveSkipped(306)
SetObjectiveCompleted(300)
SetObjectiveCompleted(400)
SetObjectiveDisplayed(410)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0415_Item_00
Function Fragment_Stage_0415_Item_00()
;BEGIN CODE
Alias_EmergencyBeacon.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN CODE
SetObjectiveCompleted(410)
SetObjectiveDisplayed(420, false, false)
SetObjectiveDisplayed(430)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0440_Item_00
Function Fragment_Stage_0440_Item_00()
;BEGIN CODE
Alias_Kaiser.GetActorRef().AllowPCDialogue(true)
SetObjectiveCompleted(410)
SetObjectiveCompleted(430)
SetObjectiveDisplayed(420)
UC07_420_Kaiser_BiologicalContamination.Stop()
UC07_440a_Kaiser_HeatleechesEliminated.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
if Game.GetPlayer().GetItemCount(Mfg_Positron_Battery) < 1
  SetObjectiveCompleted(420)
  SetObjectiveCompleted(430)
  SetObjectiveDisplayed(450)
else
  SetObjectiveSkipped(420)
  SetStage(500)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0460_Item_00
Function Fragment_Stage_0460_Item_00()
;BEGIN CODE
SetObjectiveCompleted(450)
SetObjectiveDisplayedAtTop(460)
SetObjectiveDisplayed(461)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0470_Item_00
Function Fragment_Stage_0470_Item_00()
;BEGIN CODE
SetObjectiveCompleted(461)
SetStage(480)

;Player has already read Kaiser's schematics
;if GetStageDone(475)


;If they haven't, direct them to now
;else
;  SetObjectiveDisplayed(465)
;endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0480_Item_00
Function Fragment_Stage_0480_Item_00()
;BEGIN CODE
Actor PlayACT = Game.GetPlayer()

if !GetStageDone(500)
  if PlayACT.GetItemCount(UC07_Microcell_ConductorArray) >= 1 && \
  PlayACT.GetItemCount(UC07_Microcell_PowerSource) >= 1 && \
  PlayACT.GetItemCount(UC07_Microcell_Shielding) >= 1
    SetStage(485)
  else
    if PlayACT.GetItemCount(UC07_Microcell_ConductorArray) < 1
      SetObjectiveDisplayed(481)
    endif

    if PlayACT.GetItemCount(UC07_Microcell_PowerSource) < 1
      SetObjectiveDisplayed(482)
    endif

    if PlayACT.GetItemCount(UC07_Microcell_Shielding) < 1
      SetObjectiveDisplayed(483)
    endif
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0481_Item_00
Function Fragment_Stage_0481_Item_00()
;BEGIN CODE
if !GetStageDone(500)
  SetObjectiveCompleted(481)

  if GetStageDone(482) && GetStageDone(483)
    SetStage(485)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0482_Item_00
Function Fragment_Stage_0482_Item_00()
;BEGIN CODE
if !GetStageDone(500)
  SetObjectiveCompleted(482)

  if GetStageDone(481) && GetStageDone(483)
    SetStage(485)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0483_Item_00
Function Fragment_Stage_0483_Item_00()
;BEGIN CODE
if !GetStageDone(500)
  SetObjectiveCompleted(483)

  if GetStageDone(482) && GetStageDone(481)
    SetStage(485)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0485_Item_00
Function Fragment_Stage_0485_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(485)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(450)

if GetStageDone(495)
  SetObjectiveDisplayed(460, false, false)
  SetObjectiveCompleted(485)
else
  SetObjectiveCompleted(460)
  SetObjectiveDisplayed(485, false, false)
endif


if isObjectiveDisplayed(461)
  SetObjectiveDisplayed(461, false, false)
endif

if isObjectiveDisplayed(481)
  SetObjectiveDisplayed(481, false, false)
endif

if isObjectiveDisplayed(482)
  SetObjectiveDisplayed(482, false, false)
endif

if isObjectiveDisplayed(483)
  SetObjectiveDisplayed(483, false, false)
endif

SetObjectiveDisplayed(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
;Take the battery from the player
Game.GetPlayer().RemoveItem(Alias_Microcell.GetRef())

SetObjectiveCompleted(500)
SetObjectiveDisplayed(510)

;Get Kaiser up an running again
Actor KaiserREF = Alias_Kaiser.GetActorRef()
KaiserREF.RemoveKeyword(ActorSocialImmune)
KaiserREF.SetNoBleedoutRecovery(false)
KaiserREF.AllowBleedoutDialogue(false)
KaiserREF.SetGhost(false)
KaiserRef.RestoreValue(Health, 1000000)
KaiserRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
;Kaiser is now welcome to aggro whatever his heart desires
Alias_KaiserCaptiveAlias.Clear()

;Clear that ghost status one more time
Alias_Kaiser.GetActorRef().SetGhost(false)

UC07_550_Kaiser_ProceedToOverlook.Start()

SetObjectiveCompleted(510)
SetObjectiveDisplayed(550)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0551_Item_00
Function Fragment_Stage_0551_Item_00()
;BEGIN CODE
SetStage(550)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0557_Item_00
Function Fragment_Stage_0557_Item_00()
;BEGIN CODE
Alias_Kaiser.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0560_Item_00
Function Fragment_Stage_0560_Item_00()
;BEGIN CODE
SetObjectiveCompleted(550)
SetObjectiveDisplayed(560)
Alias_Kaiser.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0563_Item_00
Function Fragment_Stage_0563_Item_00()
;BEGIN CODE
SetStage(545)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0598_Item_00
Function Fragment_Stage_0598_Item_00()
;BEGIN CODE
if !GetStageDone(610) && !GetStageDone(650)
  if GetStageDone(599)
    SetObjectiveDisplayed(598)

    if !GetStageDone(615)
      SetObjectiveDisplayed(597)
    endif
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0599_Item_00
Function Fragment_Stage_0599_Item_00()
;BEGIN CODE
if !GetStageDone(610) && !GetStageDone(650)
  SetObjectiveCompleted(560)
  SetObjectiveDisplayed(600)

  if GetStageDone(598)
    SetObjectiveDisplayed(598)

    if !GetStageDone(615)
      SetObjectiveDisplayed(597)
    endif
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
;Pull the stealth objective. You're going in full force!
SetObjectiveDisplayed(598, false, false)
SetObjectiveDisplayed(597, false, false)

Actor KaiACT = Alias_Kaiser.GetActorRef()
KaiACT.SetValue(Perception, 3.0)
Alias_EclipticEnemyAlias.ForceRefTo(KaiACT)
KaiACT.EvaluatePackage()

if !GetStageDone(610) || UC07_Niira_PreventCageRelease.GetValue() > 0
  
  if !GetStageDone(650)
    SetObjectiveCompleted(560)
    SetObjectiveDisplayed(600)

    if GetStageDone(598)
      SetObjectiveDisplayed(598)
    endif
  else
    Alias_Unit99.GetActorRef().AddToFaction(UC07_EclipticFaction)
    SetObjectiveCompleted(599)
    SetStage(660)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0604_Item_00
Function Fragment_Stage_0604_Item_00()
;BEGIN CODE
if !GetStageDone(610) && !GetStageDone(700)
  UC07_604_EclipticScene.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN AUTOCAST TYPE UC07QuestScript
Quest __temp = self as Quest
UC07QuestScript kmyQuest = __temp as UC07QuestScript
;END AUTOCAST
;BEGIN CODE
if UC07_Niira_PreventCageRelease.GetValue() < 1.0
  SetObjectiveFailed(598)
  SetObjectiveFailed(597)
else
  SetObjectiveDisplayed(598, false, false)
endif
SetStage(605)
ObjectReference CageREF = Alias_CageDoor.GetRef()

if !GetStageDone(620) && !GetStageDone(700) && CageREF.GetOpenState() == 3
  if kmyquest.CheckForLivingSceneTarget(Alias_Ecliptic)
    UC07_610_Ecliptic_Release99.Start()

    ;Check to see if the player sealed the cage
    Utility.Wait(6.0)
    if UC07_Niira_PreventCageRelease.GetValue() < 1.0
      CageREF.Unlock()
      CageREF.SetOpen(true)
    endif
  endif
endif

SetStage(625)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0615_Item_00
Function Fragment_Stage_0615_Item_00()
;BEGIN CODE
if GetStageDone(598) && !GetStageDone(610) && !GetStageDone(700)
  SetObjectiveCompleted(597)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0620_Item_00
Function Fragment_Stage_0620_Item_00()
;BEGIN AUTOCAST TYPE UC07QuestScript
Quest __temp = self as Quest
UC07QuestScript kmyQuest = __temp as UC07QuestScript
;END AUTOCAST
;BEGIN CODE
SetStage(605)

if IsObjectiveDisplayed(599)
  SetObjectiveDisplayed(599, false, false)
endif

if IsObjectiveDisplayed(597)
  SetObjectiveFailed(597)
endif

if !GetStageDone(610)
  if kmyquest.CheckForLivingSceneTarget(Alias_Ecliptic)
    UC07_604_EclipticScene.Stop()
    UC07_620_Ecliptic_Release99Hostile.Start()
  endif

  SetStage(630)
endif

if !GetStageDone(710)
  SetStage(660)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0625_Item_00
Function Fragment_Stage_0625_Item_00()
;BEGIN CODE
if UC07_Niira_PreventCageRelease.GetValue() < 1.0
  Actor Unit99REF = Alias_Unit99.GetActorRef()
  Unit99REF.SetRestrained(false)
  Unit99Ref.AddToFaction(PlayerEnemyFaction)
  SetStage(660) 
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0630_Item_00
Function Fragment_Stage_0630_Item_00()
;BEGIN CODE
Dialogue1OfAKindUC07.SetStage(200)
SetStage(660)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600)

;Only progress things here if the player has already engaged Eclpitic
if GetStageDone(560)
  if !GetStageDone(700)
    if !GetStageDone(600) && (!GetStageDone(610) || UC07_Niira_PreventCageRelease.GetValue() > 0)
      if !IsObjectiveCompleted(597)
        SetObjectiveDisplayed(597, false, false)
      endif
      SetObjectiveCompleted(598)
      SetObjectiveDisplayed(599)
    else
      ;If Unit 99's dead, start Kaiser's eulogy
      ;Otherwise, direct them to kill Unit 99
      if GetStageDone(700)
        SetStage(705)
      else
        SetStage(660)
      endif
    endif

  ;If Unit 99's already dead, get Kaiser hiking towards the exit
  else
    SetObjectiveDisplayed(599, false, false)
    SetStage(705)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0660_Item_00
Function Fragment_Stage_0660_Item_00()
;BEGIN CODE
UC07_701_Kaiser_ProceedToUnit99.Stop()

if GetStageDone(560)
  if !IsObjectiveCompleted(550)
    SetObjectiveDisplayed(550, false, false)
  endif  

  if !IsObjectiveCompleted(560)
    SetObjectiveDisplayed(560, false, false)
  endif  


  if !GetStageDone(710)
    SetObjectiveDisplayed(660)

    ; Make Unit 99 hostile so Kaiser will shoot at it
    Dialogue1OfAKindUC07.SetStage(190)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
UC07_701_Kaiser_ProceedToUnit99.Stop()
UC07_610_Ecliptic_Release99.Stop()

SetObjectiveCompleted(660)

;Only kick off Kaiser's scene if Ecliptic is dead
if GetStageDone(550) && GetStageDone(560)
  if GetStageDone(610)
    if GetStageDone(650)
      SetStage(705)
    endif
  else
    SetObjectiveDisplayed(600, false, false)
    SetStage(705)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0701_Item_00
Function Fragment_Stage_0701_Item_00()
;BEGIN CODE
SetObjectiveCompleted(560)
SetObjectiveCompleted(599)
SetObjectiveDisplayed(700)
UC07_701_Kaiser_ProceedToUnit99.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0705_Item_00
Function Fragment_Stage_0705_Item_00()
;BEGIN CODE
;Only kick this off if the player has earlier agreed to help Kaiser
if GetStageDone(550)
  if GetStageDone(600)
    SetObjectiveDisplayed(700)
    UC07_700_Kaiser_Unit99Eulogy.Start()
  else
    SetStage(710)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0707_Item_00
Function Fragment_Stage_0707_Item_00()
;BEGIN CODE
if !Alias_Unit99.GetActorRef().IsDead()
  WwiseEvent_QST_UC08_Robot_Remote_Unlock.Play(Alias_Kaiser.GetRef())
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
SetObjectiveCompleted(700)
SetObjectiveDisplayed(710)
Alias_Kaiser.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0715_Item_00
Function Fragment_Stage_0715_Item_00()
;BEGIN CODE
if UC07_550_Kaiser_ProceedToOverlook.IsPlaying()
  UC07_550_Kaiser_ProceedToOverlook.Stop()
endif
Alias_Kaiser.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
SetObjectiveCompleted(510)

if IsObjectiveDisplayed(560)
  SetObjectiveCompleted(560)
endif

SetObjectiveCompleted(710)
SetObjectiveDisplayed(800)

;Get the Red Devils HQ state updated
DialogueRedDevilsHQ.SetStage(20)

;Return Kaiser's Perception to base (5.0)
Alias_Kaiser.GetActorRef().SetValue(Perception, 5.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN CODE
if !GetStageDone(820)
  Alias_Kaiser.GetRef().Disable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0815_Item_00
Function Fragment_Stage_0815_Item_00()
;BEGIN CODE
if Alias_PlayerShip.GetRef().GetCurrentLocation() == LC042BattleofNiiraLocation
  UC07_815_Kaiser_PlayerSatInPilotsSeatScene.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0817_Item_00
Function Fragment_Stage_0817_Item_00()
;BEGIN CODE
Actor Unit99 = Alias_Unit99.GetActorRef()
if !Unit99.IsDead()
  Unit99.Disable()
  
  ObjectReference CageDoorRef = Alias_CageDoor.GetRef()
  CageDoorRef.Unlock()
  if CageDoorRef.GetOpenState() == 3
    CageDoorRef.SetOpen(true)
  endif

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0820_Item_00
Function Fragment_Stage_0820_Item_00()
;BEGIN CODE
UC07_820_Kaiser_ArrivedAtRDHQ.Start()

Actor KaiREF = Alias_Kaiser.GetActorRef()
KaiREF.Moveto(UC07_Kaiser_Scene850Marker)
KaiREF.Enable()

Alias_TriggerStage825.GetRef().Enable()

;Get Hadrian and Jakob in position as well
Alias_Hadrian.GetRef().MoveTo(UC07_Jakob_Scene850Marker)
Alias_Jakob.GetRef().MoveTo(UC07_Hadrian_Scene850Marker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0825_Item_00
Function Fragment_Stage_0825_Item_00()
;BEGIN CODE
Alias_Kaiser.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
UC07_850_KaiserHadrianJakob_Reunite.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
UC08.Start()
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Key Property UC03_RedDevilsHQKey Auto Const Mandatory

ObjectReference Property UC07_DebugMarker01 Auto Const Mandatory

ObjectReference Property Frontier_ModularREF Auto Const Mandatory

ObjectReference Property RDHQShipLandingMarker Auto Const Mandatory

Keyword Property SpaceshipEnabledLandingLink Auto Const Mandatory

Quest Property SQ_PlayerShip Auto Const Mandatory

Scene Property UC07_110_HadrianSpotsPlayer Auto Const Mandatory

ReferenceAlias Property Alias_Hadrian Auto Const Mandatory

GlobalVariable Property UC_PlayerKnows_KaiserIsARobot Auto Const Mandatory

ReferenceAlias Property Alias_Kaiser Auto Const Mandatory

ActorValue Property Health Auto Const Mandatory

Scene Property UC07_420_Kaiser_BiologicalContamination Auto Const Mandatory

Scene Property UC07_440_Kaiser_PowerRequired Auto Const Mandatory

MiscObject Property Mfg_Positron_Battery Auto Const Mandatory

Message Property UC07_DEBUG_KaiserPoweringUp Auto Const Mandatory

Message Property UC07_DEBUG_BeaconSound Auto Const Mandatory

Scene Property UC07_550_Kaiser_ProceedToOverlook Auto Const Mandatory

ReferenceAlias Property Alias_Unit99 Auto Const Mandatory

Scene Property UC07_610_Ecliptic_Release99 Auto Const Mandatory

RefCollectionAlias Property Alias_Ecliptic Auto Const Mandatory

Scene Property UC07_700_Kaiser_Unit99Eulogy Auto Const Mandatory

ObjectReference Property UC_Jakob_PostquestSandboxMarker Auto Const Mandatory

ObjectReference Property UC07_JakobTeleportMarker Auto Const Mandatory

GlobalVariable Property UC04_JakobSandboxing_PostUC03 Auto Const Mandatory

ReferenceAlias Property Alias_Jakob Auto Const Mandatory

ObjectReference Property UC07_DebugMarker02 Auto Const Mandatory

Book Property UC07_KaiserSchematics Auto Const Mandatory

ReferenceAlias Property Alias_KaiserSchematics Auto Const Mandatory

GlobalVariable Property UC05_HadrianSandboxing_PostUC05 Auto Const Mandatory

ObjectReference Property UC07_HadrianTeleportMarker Auto Const Mandatory

RefCollectionAlias Property Alias_HeatLeeches Auto Const Mandatory

ObjectReference Property UC07_DebugMarker03 Auto Const Mandatory

ObjectReference Property UC07_DebugMarker_KaiserTeleport_Stage7 Auto Const Mandatory

ObjectReference Property UC07_DebugMarker05 Auto Const Mandatory

ObjectReference Property UC07_DebugMarker06 Auto Const Mandatory

ObjectReference Property UC07_DebugMarker_KaiserTeleport_Stage8 Auto Const Mandatory

LeveledItem Property TestVSWeapons Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ObjectReference Property UC07_Kaiser_Scene850Marker Auto Const Mandatory

ObjectReference Property UC07_Hadrian_Scene850Marker Auto Const Mandatory

ObjectReference Property UC07_Jakob_Scene850Marker Auto Const Mandatory

ReferenceAlias Property Alias_KaiserCaptiveAlias Auto Const Mandatory

Scene Property UC07_850_KaiserHadrianJakob_Reunite Auto Const Mandatory

Quest Property UC08 Auto Const Mandatory

GlobalVariable Property UC07_GelFee_SpeechDiscount Auto Const Mandatory

GlobalVariable Property UC07_GelFee Auto Const Mandatory

GlobalVariable Property UC07_GelFee_FreestarDiscount Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

Message Property UC07_BatterySchematicLearned Auto Const Mandatory

GlobalVariable Property UC07_LearnedPositronBatteryRecipe Auto Const Mandatory

Scene Property UC07_604_EclipticScene Auto Const Mandatory

ReferenceAlias Property Alias_CageDoor Auto Const Mandatory

Faction Property UC07_EclipticEnemyFaction Auto Const Mandatory

Scene Property UC07_701_Kaiser_ProceedToUnit99 Auto Const Mandatory

Scene Property UC07_815_Kaiser_PlayerSatInPilotsSeatScene Auto Const Mandatory

Location Property LC042BattleofNiiraLocation Auto Const Mandatory

ReferenceAlias Property Alias_QuestPositronBattery Auto Const Mandatory

GlobalVariable Property UC07_GelFee_AzamiDiscount Auto Const Mandatory

Quest Property UC07_HadrianVVRevealQuest Auto Const Mandatory

Quest Property Dialogue1OfAKindUC07 Auto Const Mandatory

ReferenceAlias Property Alias_EclipticEnemyAlias Auto Const Mandatory

Scene Property UC07_620_Ecliptic_Release99Hostile Auto Const Mandatory

Scene Property UC07_820_Kaiser_ArrivedAtRDHQ Auto Const Mandatory

RefCollectionAlias Property Alias_QuestBatteryMaterials Auto Const Mandatory

GlobalVariable Property UC_PlayerKnows_HadriansPast_Clone Auto Const Mandatory

GlobalVariable Property UC_PlayerKnows_HadrianBuiltKaiser Auto Const Mandatory

Quest Property DialogueRedDevilsHQ Auto Const Mandatory

GlobalVariable Property UC05_FreestarObserversAccepted Auto Const Mandatory

MiscObject Property UC07_Microcell_ConductorArray Auto Const Mandatory

MiscObject Property UC07_Microcell_PowerSource Auto Const Mandatory

MiscObject Property UC07_Microcell_Shielding Auto Const Mandatory

ReferenceAlias Property Alias_Wallsafe Auto Const Mandatory

ReferenceAlias Property Alias_FieldNotes Auto Const Mandatory

GlobalVariable Property UC07_Niira_PreventCageRelease Auto Const Mandatory

ReferenceAlias Property Alias_EmergencyBeacon Auto Const Mandatory

Scene Property UC07_440a_Kaiser_HeatleechesEliminated Auto Const Mandatory

ReferenceAlias Property Alias_TriggerStage825 Auto Const Mandatory

ReferenceAlias Property Alias_MicroCell Auto Const Mandatory

ReferenceAlias Property Alias_RHQMapMarker Auto Const Mandatory

WwiseEvent Property WwiseEvent_QST_UC08_Robot_Remote_Unlock Auto Const Mandatory

ActorValue Property Perception Auto Const Mandatory

ReferenceAlias Property Alias_EclipticSceneTarget Auto Const Mandatory

Quest Property UC05 Auto Const Mandatory

Quest Property UC06 Auto Const Mandatory

Keyword Property ActorSocialImmune Auto Const Mandatory

Faction Property UC07_EclipticFaction Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

ReferenceAlias Property Alias_EclipticBoss Auto Const Mandatory
