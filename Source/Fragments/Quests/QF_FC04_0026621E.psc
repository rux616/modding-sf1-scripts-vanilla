;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FC04_0026621E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; Debug stage

; Complete FC01 and its post quest
FC01.SetStage(2000)
FC01_PostQuest.SetStage(2000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetActive()
SetObjectiveDisplayed(50)

; Enable Billy Clayton
Alias_BillyClayton.GetRef().Enable()

if COM_Quest_SamCoe_Q01.IsRunning() && !COM_Quest_SamCoe_Q01.GetStageDone(300)
  COM_Quest_SamCoe_Q01.SetStage(110)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
if GetStageDone(400)
  SetStage(500)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
ALias_JaylenPryce.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
; Start Jaylen's walk and talk scene
FC04_JaylenWalkTalkScene.Start()

SetObjectiveCompleted(100)
SetObjectiveDisplayed(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
; Set at th end of Jaylens walk adn talk scene

FC04_JaylenWalkTalkScene.Stop()
FC04_JaylenBillyIntroductionScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Set in the final info of Jaylen's first greeting scene

SetObjectiveCompleted(150)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN CODE
Alias_Player.GetActorRef().AddItem(credits, 500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0380_Item_00
Function Fragment_Stage_0380_Item_00()
;BEGIN CODE
; As per hotfix, if the Syndicate Doorman is dead or his alias is empty, unlock the warehouse door
; and set the player on the objective to confront Goodman

if ALias_SyndicateDoorman.GetActorRef().IsDead() || ALias_SyndicateDoorman.GetActorRef() == None
  Alias_WarehouseDoor.GetRef().Unlock()
  SetStage(500)
  SetObjectiveCompleted(200)
  SetObjectiveDisplayed(300)
else
  SetStage(400)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
; Set in the final info of Jaylen's first greeting scene

; Enable the Syndicate Doorman
Alias_SyndicateDoorman.GetRef().Enable()

SetObjectiveCompleted(200)

if !GetStageDone(50)
  SetObjectiveDisplayed(250)
else
  SetObjectiveDisplayed(300)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
; Set in Doorman's greet scene if player offers bribe

Alias_Player.GetActorRef().RemoveItem(Credits, NPCDemandMoney_Small.GetValue() as int)
Alias_SyndicateDoorman.GetActorRef().AddItem(Credits, NPCDemandMoney_Small.GetValue() as int)

SetStage(460)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0460_Item_00
Function Fragment_Stage_0460_Item_00()
;BEGIN CODE
; Set in the Doorman greet scene if player bribes, wins sc or mentions Ito.

; Give the player the Warehouse Key
Alias_Player.GetActorRef().AddItem(Alias_WarehouseKey.GetRef())

; Start the unlock scene
FC04_OpenWarehouseDoor.Start()

; Make the cell a public space
CityNeonWarehouseEmmetsLair.SetPublic(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; Change location event on player alias
; Set when player enters the warehouse cell

if IsObjectiveDisplayed(250)
  SetObjectiveCompleted(250)
  SetObjectiveDisplayed(300)
endIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
Alias_EmmetGoodman.GetActorRef().EvaluatePackage()

; Move the companion to Emmett's office
Alias_Companion.GetRef().MoveTo(FC04_CompanionStandMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
; Remove credits from the player

int CreditAmount = NPCDemandMoney_Large.GetValue() as int

Alias_PLayer.GetActorRef().RemoveItem(credits, CreditAmount)
Alias_EmmetGoodman.GetActorRef().AddItem(Credits, CreditAmount)

if IsObjectiveDisplayed(320)
  SetObjectiveCompleted(320)
endif

SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0530_Item_00
Function Fragment_Stage_0530_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(320)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0540_Item_00
Function Fragment_Stage_0540_Item_00()
;BEGIN CODE
SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0560_Item_00
Function Fragment_Stage_0560_Item_00()
;BEGIN CODE
; Add the player to FC04_EmmettEnemyFaction
Alias_Player.GetActorRef().AddToFaction(FC04_EmmettEnemyFaction)

; EVP ref coll actors to push them into combat with the player
Alias_EmmettAndHenchman.EvaluateAll()
Alias_EmmettAndHenchman.StartCombatAll(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0570_Item_00
Function Fragment_Stage_0570_Item_00()
;BEGIN CODE
SetStage(600)

if IsObjectiveDisplayed(320)
  SetObjectiveDisplayed(320, 0)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(400)

; Move Jaylen for scene with Billy
Alias_JaylenPryce.GetRef().MoveTo(FC04_JaylenTalkToBilly)

; Start Jaylen and Billy chat scene
FC04_JaylenBillyChatScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
; Start Jaylen backup scene
FC04_JaylenBackupScene.Start()

; EVP Billy
Alias_BillyClayton.GetActorRef().EvaluatePackage()

; EVP Jaylen
Alias_JaylenPryce.GetActorRef().EvaluatePackage()

; if Talk to Billy objective is still showing, complete it
if IsObjectiveDisplayed(200)
  SetObjectiveCompleted(200)
endif

; Enable Grace Early
Alias_GraceEarly.GetRef().Enable()

SetObjectiveCompleted(400)
SetObjectiveDisplayed(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
; Move Jaylen into Madame Sauvage's to the scene with Grace Early
Alias_JaylenPryce.GetRef().MoveTo(FC04_JaylenSt800SceneMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
FC04_GraceConfessScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
; Add Grace's encrypted slate to the player (move from quest container in holding cell)
Alias_Player.GetActorRef().AddItem(Alias_GraceSlate.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
; EVP Jaylen
Alias_JaylenPryce.GetActorRef().EvaluatePackage()

SetObjectiveCompleted(500)
SetObjectiveDisplayed(650)

;GEN-521271: If SamCoe_Q01 is running and not past the point where
;it still needs Jaylen Price, unlock it
if COM_Quest_SamCoe_Q01.IsRunning() && !COM_Quest_SamCoe_Q01.GetStageDone(300)
  COM_Quest_SamCoe_Q01.SetStage(120)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0925_Item_00
Function Fragment_Stage_0925_Item_00()
;BEGIN CODE
SetObjectiveCompleted(650)
SetObjectiveDisplayed(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
; Remove Grace's encrypted slate from the player (Alex Shadid took it)
Alias_Player.GetActorRef().RemoveItem(Alias_GraceSlate.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(700)
SetObjectiveDisplayed(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
CompleteAllObjectives()

; set the quest completion actor value
Alias_Player.GetActorRef().SetValue(FC04_Completed, 1)

; Set the meeting room packaging global for Blake and Emma
FCQuests_MeetingRoomPackages.SetValue(1)

; Start the encrypted slate quest
FC_EncryptedSlateQuest.Start()

; Start FC05
FC05.Start()

; Start FC06
FC06.Start()

; Start evidence holder quest
FC_EvidenceSlateHolderQuest.Start()


Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Player Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

Scene Property FC04_OpenWarehouseDoor Auto Const Mandatory

Faction Property FC04_EmmettEnemyFaction Auto Const Mandatory

RefCollectionAlias Property Alias_EmmettAndHenchman Auto Const Mandatory

Scene Property FC04_JaylenBackupScene Auto Const Mandatory

Scene Property FC04_JaylenBillyChatScene Auto Const Mandatory

Scene Property FC04_GraceConfessScene Auto Const Mandatory

Quest Property FC01 Auto Const Mandatory

ObjectReference Property FC04_JaylenTalkToBilly Auto Const Mandatory

ReferenceAlias Property Alias_JaylenPryce Auto Const Mandatory

ReferenceAlias Property Alias_BillyClayton Auto Const Mandatory

ReferenceAlias Property Alias_GraceEarly Auto Const Mandatory

Quest Property FC05 Auto Const Mandatory

Quest Property FC06 Auto Const Mandatory

ReferenceAlias Property Alias_WarehouseDoor Auto Const Mandatory

ReferenceAlias Property Alias_EmmetGoodman Auto Const Mandatory

ReferenceAlias Property Alias_SyndicateDoorman Auto Const Mandatory

Cell Property CityNeonWarehouseEmmetsLair Auto Const Mandatory

ObjectReference Property FC04_PT1 Auto Const Mandatory

Scene Property FC04_JaylenWalkTalkScene Auto Const Mandatory

Scene Property FC04_JaylenBillyIntroductionScene Auto Const Mandatory

ReferenceAlias Property Alias_WarehouseKey Auto Const Mandatory

Quest Property FC01_PostQuest Auto Const Mandatory

ObjectReference Property FC04_JaylenSt800SceneMarker Auto Const Mandatory

ReferenceAlias Property Alias_GraceSlate Auto Const Mandatory

ActorValue Property FC04_Completed Auto Const Mandatory

Quest Property FC_EncryptedSlateQuest Auto Const Mandatory

GlobalVariable Property FCQuests_MeetingRoomPackages Auto Const Mandatory

Quest Property FC_EvidenceSlateHolderQuest Auto Const Mandatory

GlobalVariable Property NPCDemandMoney_Large Auto Const Mandatory

GlobalVariable Property NPCDemandMoney_Small Auto Const Mandatory

ObjectReference Property FC04_CompanionStandMarker Auto Const Mandatory

ReferenceAlias Property Alias_Companion Auto Const Mandatory

Quest Property COM_Quest_SamCoe_Q01 Auto Const Mandatory
