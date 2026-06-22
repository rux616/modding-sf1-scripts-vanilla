;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FC01_0029A8F0 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; TODO Evaluate whether I need this in 2nd pass, I might not
game.GetPlayer().moveto(FC01_PT1)

;give player a ship
Frontier_ModularREF.moveto(AkilaCityShipLandingMarker)
Frontier_ModularREF.setlinkedref(AkilaCityShipLandingMarker, SpaceshipEnabledLandingLink)
Frontier_ModularREF.Enable()
(SQ_PlayerShip as SQ_PlayerShipScript).ResetHomeShip(Frontier_ModularREF as SpaceshipReference)

;Disable Crowds in Akila City
FC01CrowdDisable.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Open the vault door
Alias_VaultDoor.GetRef().SetOpen()
Alias_VaultDoor.GetRef().SetLockLevel(0)

; Move hostages to the bank
Alias_ElizabethCardwell.GetRef().MoveTo(FC01_ElizabethCowerMarker)
Alias_MarkoJansen.GetRef().MoveTo(FC01_Marko_CowerMarker)

; Turn off interior lights and on the backup lights
Alias_InteriorLightsOn_EnableMarker.GetRef().Disable()

; Block activation on the intercom
Alias_RobberLeaderExt.GetRef().BlockActivation(true, true)

;Disable Crowds in Akila City
FC01CrowdDisable.SetValue(1)

; EVP the gate guard so he forcegreets (per 447306)
Alias_Guard.GetActorRef().EvaluatePackage()

; Start the FC02 slate holder quest so we cna access its alias later
FC_JobsDoneSlateHolderQuest.Start()

; Start the dialogue holder quest (contains bank robber hellos)
FC01_DialogueHolderQuest.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Set in action 1 of guard's greet scene

; evp guard to prevent another forcegreet
Alias_Guard.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
;Set when guard's top level scenes 01 and 02 end (in scene data)

SetActive()
SetObjectiveDisplayed(100)

;update main quest if it's running
If MQ103.IsRunning() && MQ103.GetStageDone(100)
  MQ103.SetStage(220)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
; Set when player enters trigger volume "FC01_StartWarningSceneTrigger" 

FC01_RobberLeaderWarningScene.Start()

;update main quest if it's running
If MQ103.IsRunning() && MQ103.GetStageDone(100)
  MQ103.SetStage(220)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Set from info in phase 3 of Blake's "greeting01" scene

Alias_DanielBlake.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0203_Item_00
Function Fragment_Stage_0203_Item_00()
;BEGIN CODE
Alias_DanielBlake.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
; Set in final phase of Blake's greet 01 scene

FC01_BlakeAnnouncePlayerScene.Start()

; Unblock activation on the intercom
Alias_RobberLeaderExt.GetRef().BlockActivation(false)

SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;Set when robber leader's greet01 scene ends (in scene data)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
; Remove Jed from name-replaced aliase

Alias_RobberLeaderInt_Rename.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
; Set either by winning speech challenge zero or choosing the
; dialogue option with the "Wanted" trait in Robber greet scene 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN CODE
SetStage(320)
SetStage(345)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0340_Item_00
Function Fragment_Stage_0340_Item_00()
;BEGIN CODE
SetStage(345)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)

; Set global for robbers surrendering
FC01_RobbersSurrendered.SetValue(1)

; Add the bank robbers to the CrimeFactionFreestar faction and set it to crime faction
Alias_RobberLeaderInt.GetActorRef().SetCrimeFaction(CrimeFactionFreestar)
Alias_RobberLeaderInt_Rename.GetActorRef().SetCrimeFaction(CrimeFactionFreestar)
Alias_Robber02.GetActorRef().SetCrimeFaction(CrimeFactionFreestar)
Alias_Robber03.GetActorRef().SetCrimeFaction(CrimeFactionFreestar)
Alias_Robber04.GetActorRef().SetCrimeFaction(CrimeFactionFreestar)
Alias_Robber05.GetActorRef().SetCrimeFaction(CrimeFactionFreestar)
Alias_Robber06.GetActorRef().SetCrimeFaction(CrimeFactionFreestar)

; Make the bank robbers no longer enemies of the player
Alias_BankRobbersAll.RemoveFromFaction(PlayerEnemyFaction)

SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0355_Item_00
Function Fragment_Stage_0355_Item_00()
;BEGIN CODE
Alias_DanielBlake.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN CODE
SetObjectiveFailed(200)

SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0370_Item_00
Function Fragment_Stage_0370_Item_00()
;BEGIN CODE
FC01_CompanionReactSurrender.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Set in stages 350 and 360

if IsObjectiveDisplayed(200)
  SetObjectiveFailed(200)
endIf

SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
; Set in action 1 of Blake's Greet02 scene
Alias_DanielBlake.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0470_Item_00
Function Fragment_Stage_0470_Item_00()
;BEGIN CODE
; TODO the below is a temp solution until we have hackable locks in game
; Display the message box
FC01_UnlockRearDoor_MSG.Show()

; Unlock the back door
Alias_GalBankRearDoor.GetRef().Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; Set in phase 5 of Blake's greeting scene 02

; Give the player the back door key
Alias_Player.GetRef().AddItem(FC01_GallBankRearDoorKey)

SetObjectiveCompleted(300)
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
; Set in scene data of Robber Leader's greet scene 02.

SetObjectiveCompleted(400)
SetObjectiveDisplayed(410)

; Make the bank robbers no longer enemies of the player
Alias_BankRobbersAll.RemoveFromFaction(PlayerEnemyFaction)

; Unlock the front door
Alias_GalBankFrontDoor.GetRef().SetLockLevel(0)
Alias_GalBankFrontDoor.GetRef().Unlock()

; Block activation on the intercom
Alias_RobberLeaderExt.GetRef().BlockActivation(true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0517_Item_00
Function Fragment_Stage_0517_Item_00()
;BEGIN CODE
SetStage(510)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
; Set from trigger volume in GalBank when player enters via front

; if the player enters GalBank armed & didn't persuade the robbers to allow this, robbers attack
if Alias_Player.GetActorRef().GetItemCount(ObjectTypeWeapon) != 0 && !GetStageDone(517)
  FC01_PlayerPickedUpGun.Start()
else 
  FC01_RobberLeaderShowHostagesScene.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0530_Item_00
Function Fragment_Stage_0530_Item_00()
;BEGIN CODE
; Set if the player fails speech challenge in Robber Greet 02 scene 

; TODO Move the bank robber leader away from the window
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0540_Item_00
Function Fragment_Stage_0540_Item_00()
;BEGIN CODE
; Set from player alias location change script 

SetObjectiveCompleted(400)
SetObjectiveCompleted(410)
SetObjectiveDisplayed(420)

; Block activation on the intercom
Alias_RobberLeaderExt.GetRef().BlockActivation(true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0545_Item_00
Function Fragment_Stage_0545_Item_00()
;BEGIN CODE
; Set from the container change script on the gun alias

; Stop the show hostages scene
FC01_RobberLeaderShowHostagesScene.Stop()

; Start the reaction scene if Jed Bullock saw the player pick up the gun
if Game.GetPlayer().IsDetectedBy(Alias_RobberLeaderInt.GetActorref())
  FC01_PlayerPickedUpGun.Start()
  Alias_RobberLeaderInt.GetActorRef().EvaluatePackage()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
; Set from the end of "player picked up gun" scene

; Make the bank robbers enemies of the player
Alias_BankRobbersAll.AddToFaction(PlayerEnemyFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0555_Item_00
Function Fragment_Stage_0555_Item_00()
;BEGIN CODE
FC01_ThreatenBankManagerScene.Start()

Alias_WilliamCrowley.GetActorRef().EvaluatePackage()
Alias_Robber02.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0560_Item_00
Function Fragment_Stage_0560_Item_00()
;BEGIN CODE
; Crowley is no longer essential, and cowers in place ignoring combat
Alias_WilliamCrowley.GetActorRef().SetEssential(False)
Alias_WilliamCrowley.GetActorRef().EvaluatePackage()
;Alias_WilliamCrowley.GetActorRef().AddToFaction(FC01_GunmanEnemyFaction)

; evp the bank robber
Alias_Robber02.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0570_Item_00
Function Fragment_Stage_0570_Item_00()
;BEGIN CODE
; Set in Crowley's Alias OnHit script
Alias_WilliamCrowley.GetActorRef().Kill()

; evp the bank robber
Alias_Robber02.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
; Set from OnDeath script on BankRobbersAll ref collection

; EVP William Crowley
Alias_WilliamCrowley.GetActorRef().EvaluatePackage()

SetObjectiveCompleted(420)
SetObjectiveDisplayed(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
; Set in action 1 of Blake's Greet03 scene
Alias_DanielBlake.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
CompleteAllObjectives()

; evp Blake to get him into his base Rock office package
Alias_DanielBlake.GetActorRef().EvaluatePackage()

; set the quest completion actor value
Alias_Player.GetActorRef().SetValue(FC01_Completed, 1)

;Start next quest
FC01_PostQuest.Start()
FC02.Start()

; Set final log entry stage
if GetStageDone(350)
   SetStage(2010)
else
   SetStage(2020)
endif

;update main quest if it's running
If MQ103.IsRunning() && MQ103.GetStageDone(100)
  MQ103.SetStage(230)
EndIf

; Light In The Darkness (RAD02) - queued for interview
RAD02.SetStage(300)

; Ashta quest line is now open for business
City_Akila_Ashta01.SetStage(5)

; Set a stage on the Akila City quest to let it know FC01 is done
DialogueFCAkilaCity.SetStage(1000)

; Turn the lights back on inside of GalBank
Alias_InteriorLightsOn_EnableMarker.GetRef().Enable()

; Re-enable crowds in Akila City
FC01CrowdDisable.SetValue(0)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property FC01_RobberLeaderShowHostagesScene Auto Const Mandatory

Scene Property FC01_RobberLeaderWarningScene Auto Const Mandatory

Quest Property FC02 Auto Const Mandatory

ObjectReference Property FC01_PT1 Auto Const Mandatory

ReferenceAlias Property Alias_Guard Auto Const Mandatory

Scene Property FC01_BlakeAnnouncePlayerScene Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

RefCollectionAlias Property Alias_BankRobbersAll Auto Const Mandatory

Message Property FC01_UnlockRearDoor_MSG Auto Const Mandatory

ReferenceAlias Property Alias_GalBankRearDoor Auto Const Mandatory

Scene Property FC01_PlayerPickedUpGun Auto Const Mandatory

ReferenceAlias Property Alias_RobberLeaderInt_Rename Auto Const Mandatory

ReferenceAlias Property Alias_DanielBlake Auto Const Mandatory

Quest Property MQ103 Auto Const Mandatory

Quest Property RAD02 Auto Const Mandatory

Quest Property City_Akila_Ashta01 Auto Const Mandatory

Scene Property FC01_ThreatenBankManagerScene Auto Const Mandatory

Key Property FC01_GallBankRearDoorKey Auto Const Mandatory

ReferenceAlias Property Alias_Player Auto Const Mandatory

ReferenceAlias Property Alias_RobberLeaderInt Auto Const Mandatory

ReferenceAlias Property Alias_WilliamCrowley Auto Const Mandatory

Faction Property FC01_GunmanEnemyFaction Auto Const Mandatory

GlobalVariable Property FC01_RobbersSurrendered Auto Const Mandatory

Quest Property FC01_PostQuest Auto Const Mandatory

ReferenceAlias Property Alias_VaultDoor Auto Const Mandatory

ReferenceAlias Property Alias_GalBankFrontDoor Auto Const Mandatory

ReferenceAlias Property Alias_InteriorLightsOn_EnableMarker Auto Const Mandatory

ObjectReference Property Frontier_ModularREF Auto Const Mandatory

ObjectReference Property AkilaCityShipLandingMarker Auto Const Mandatory

Keyword Property SpaceshipEnabledLandingLink Auto Const Mandatory

Quest Property SQ_PlayerShip Auto Const Mandatory

Faction Property CrimeFactionFreestar Auto Const Mandatory

ReferenceAlias Property Alias_RobberLeaderExt Auto Const Mandatory

Scene Property FC01_CompanionReactSurrender Auto Const Mandatory

ReferenceAlias Property Alias_Robber02 Auto Const Mandatory

ReferenceAlias Property Alias_Robber03 Auto Const Mandatory

ReferenceAlias Property Alias_Robber04 Auto Const Mandatory

ReferenceAlias Property Alias_Robber05 Auto Const Mandatory

ReferenceAlias Property Alias_Robber06 Auto Const Mandatory

GlobalVariable Property FC01CrowdDisable Auto Const Mandatory

ActorValue Property FC01_Completed Auto Const Mandatory

Quest Property DialogueFCAkilaCity Auto Const Mandatory

ReferenceAlias Property Alias_ElizabethCardwell Auto Const Mandatory

ObjectReference Property FC01_ElizabethCowerMarker Auto Const Mandatory

ReferenceAlias Property Alias_MarkoJansen Auto Const Mandatory

ObjectReference Property FC01_Marko_CowerMarker Auto Const Mandatory

Keyword Property ObjectTypeWeapon Auto Const Mandatory

Quest Property FC_JobsDoneSlateHolderQuest Auto Const Mandatory

Quest Property FC01_DialogueHolderQuest Auto Const Mandatory
