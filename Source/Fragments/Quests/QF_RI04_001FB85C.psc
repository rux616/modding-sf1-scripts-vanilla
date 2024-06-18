;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RI04_001FB85C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
LC044.SetStage(1000)
Alias_MasakoOfficeDoor.GetRef().Lock(False)
RI01_JobAdRadio.Stop()
SetStage(100)

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
PlayerRef.MoveTo(Alias_MasakoQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Alias_MasakoOfficeDoor.GetRef().Lock(False)
LC044.SetStage(1000)
RI01_JobAdRadio.Stop()
SetStage(100)

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
PlayerRef.MoveTo(Alias_DaltonQS.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
Alias_MasakoOfficeDoor.GetRef().Lock(False)
RI_Support.SetStage(1110)
LC044.SetStage(1000)
RI01_JobAdRadio.Stop()
SetStage(200)

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
PlayerRef.MoveTo(Alias_MadameSauvageQS.GetRef())
PlayerRef.AddAliasedItem(Disruptor, Alias_NovablastDisrupter, 1, False)
PlayerRef.AddItem(AmmoNeuralDisrupter, 500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
RI01_JobAdRadio.Stop()
SetStage(360)

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
PlayerRef.MoveTo(Alias_RyujinTowerQS.GetRef())
PlayerRef.AddAliasedItem(Disruptor, Alias_NovablastDisrupter, 1, False)
PlayerRef.AddItem(AmmoNeuralDisrupter, 500)
PlayerRef.AddItem(Alias_NyxProgram.GetRef())
;LC044RyujinGuardCrimeFaction.ModCrimeGold(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
RI01_JobAdRadio.Stop()
LC044.SetStage(10)
SetStage(400)

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
PlayerRef.MoveTo(Alias_UlaruQS.GetRef())
PlayerRef.AddAliasedItem(Disruptor, Alias_NovablastDisrupter, 1, False)
PlayerRef.AddItem(AmmoNeuralDisrupter, 500)
PlayerRef.AddItem(Alias_NyxProgram.GetRef())
LC044RyujinGuardCrimeFaction.ModCrimeGold(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
RI01_JobAdRadio.Stop()
LC044.SetStage(10)
SetStage(400)
SetStage(500)

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
PlayerRef.MoveTo(Alias_CamdenQS.GetRef())
PlayerRef.AddAliasedItem(Disruptor, Alias_NovablastDisrupter, 1, False)
PlayerRef.AddItem(AmmoNeuralDisrupter, 500)
PlayerRef.AddItem(Alias_NyxProgram.GetRef())
LC044RyujinGuardCrimeFaction.ModCrimeGold(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
RI01_JobAdRadio.Stop()
SetStage(600)

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
PlayerRef.MoveTo(Alias_NyxApartmentQS.GetRef())
PlayerRef.AddAliasedItem(Disruptor, Alias_NovablastDisrupter, 1, False)
PlayerRef.AddItem(AmmoNeuralDisrupter, 500)
PlayerRef.AddItem(Alias_NyxProgram.GetRef())
Alias_NyxExteriorApartmentDoor.GetRef().Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
RI01_JobAdRadio.Stop()
SetStage(900)

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
PlayerRef.MoveTo(Alias_NyxApartmentQS.GetRef())
PlayerRef.AddAliasedItem(Disruptor, Alias_NovablastDisrupter, 1, False)
PlayerRef.AddItem(AmmoNeuralDisrupter, 500)
Alias_NyxExteriorApartmentDoor.GetRef().Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
Alias_MasakoOfficeDoor.GetRef().Lock(False)
LC044.SetStage(1000)
RI01_JobAdRadio.Stop()
SetStage(1000)

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
PlayerRef.MoveTo(Alias_DaltonQS.GetRef())
PlayerRef.AddAliasedItem(Disruptor, Alias_NovablastDisrupter, 1, False)
PlayerRef.AddItem(AmmoNeuralDisrupter, 500)
PlayerRef.AddAliasedItem(RI04_EncryptedFiles, Alias_NyxEncryptedData)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
Alias_MasakoOfficeDoor.GetRef().Lock(False)
LC044.SetStage(1000)
RI01_JobAdRadio.Stop()
SetStage(1300)

Actor PlayerRef = Game.GetPlayer() as Actor
PlayerRef.AddPerk(FactionRyujinIndustriesPerk)
PlayerRef.MoveTo(Alias_DaltonQS.GetRef())
PlayerRef.AddAliasedItem(Disruptor, Alias_NovablastDisrupter, 1, False)
PlayerRef.AddItem(AmmoNeuralDisrupter, 500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetActive()
SetObjectiveDisplayed(100)

If Game.GetPlayer().GetDistance(ALias_Masako.GetRef()) < 100
     RI04_0000_Masako_DaltonIntercomScene.Start()
EndIf

RI04_RyujinTowerBodyCount.SetValue(RI_TotalBodyCount.GetValue())
RI04_RyujinTowerArrestsCount.SetValue(RI_TotalArrestCount.GetValue())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
Alias_Masako.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

Alias_Nyx.GetRef().MoveTo(Alias_NyxFurniture.GetRef())
Alias_NyxBackpack.GetRef().Disable()

ObjectReference PlayerRef = Game.GetPlayer()
PlayerRef.AddAliasedItem(Disruptor, Alias_NovablastDisrupter, 1, False)
PlayerRef.AddItem(AmmoNeuralDisrupter, 500)

Alias_NyxLapTopEnableMarker.GetRef().Disable()
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

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, NPCDemandMoney_Small.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0335_Item_00
Function Fragment_Stage_0335_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, NPCDemandMoney_Medium.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0340_Item_00
Function Fragment_Stage_0340_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, NPCDemandMoney_Large.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_NyxProgram.GetRef())
SetStage(375)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0375_Item_00
Function Fragment_Stage_0375_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(375)

LC044.SetStage(10)

ObjectReference VentRef = Alias_VentEntrance.GetRef()
VentRef.Lock(False)

ObjectReference VentExitRef = Alias_VentFinalExit.GetRef()
VentExitRef.Lock(False)

Alias_CraneButton.GetRef().BlockActivation(False, False)

Alias_DRONESanitationBot.GetActorRef().SetUnconscious()
Alias_DRONESecurityBot.GetActorRef().SetUnconscious()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0380_Item_00
Function Fragment_Stage_0380_Item_00()
;BEGIN CODE
Alias_CraneButton.GetRef().BlockActivation(True, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0385_Item_00
Function Fragment_Stage_0385_Item_00()
;BEGIN CODE
Alias_CraneButton.GetRef().BlockActivation(False, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0390_Item_00
Function Fragment_Stage_0390_Item_00()
;BEGIN CODE
LC044.SetStage(11)
SetStage(400)

If GetStageDone(350)
     SetStage(500)
EndIf
;LC044RyujinGuardCrimeFaction.ModCrimeGold(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(375)
SetObjectiveDisplayedAtTop(400)

SetObjectiveDisplayed(405)
If Game.GetPlayer().GetEquippedWeapon() == Disruptor
     SetObjectiveCompleted(405)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0405_Item_00
Function Fragment_Stage_0405_Item_00()
;BEGIN CODE
RI04_TowerGuardsEnteredCombat.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0406_Item_00
Function Fragment_Stage_0406_Item_00()
;BEGIN CODE
SetObjectiveCompleted(405)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
LC044.SetStage(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0460_Item_00
Function Fragment_Stage_0460_Item_00()
;BEGIN CODE
LC044.SetStage(13)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0480_Item_00
Function Fragment_Stage_0480_Item_00()
;BEGIN CODE
LC044.SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0499_Item_00
Function Fragment_Stage_0499_Item_00()
;BEGIN CODE
SetObjectiveCompleted(400)

If GetStageDone(350)
     If GetStageDone(550)
          SetStage(575)
     EndIf
Else
     SetStage(575)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveDisplayedAtTop(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)

If GetStageDone(499)
     SetStage(575)
EndIf

RI04_Track_PlayerStoleCamdenChoInfo.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0575_Item_00
Function Fragment_Stage_0575_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(575)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0590_Item_00
Function Fragment_Stage_0590_Item_00()
;BEGIN CODE
RI04_0400_Companion_InfiltrationCompleteScene.Start()
SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(575)
SetObjectiveDisplayed(600)
If IsObjectiveDisplayed(405)
     SetObjectiveDisplayed(405, False, False)
EndIf

Alias_NyxLapTopEnableMarker.GetRef().Enable()
Alias_Nyx.GetRef().MoveTo(Alias_NyxMoveToMarker.GetRef())
Alias_NyxBackpack.GetRef().Enable()
Alias_NyxExteriorApartmentDoor.GetRef().Lock(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600)
SetObjectiveDisplayed(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(RI04_NyxProgram)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
SetObjectiveCompleted(700)
SetObjectiveDisplayed(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN CODE
Alias_NyxMonitor01.GetRef().PlayAnimation("Play01")
Alias_NyxMonitor02.GetRef().PlayAnimation("Play01")
Alias_NyxMonitor03.GetRef().PlayAnimation("Play01")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
Alias_NyxMonitor01.GetRef().PlayAnimation("Play02")
Alias_NyxMonitor02.GetRef().PlayAnimation("Play02")
Alias_NyxMonitor03.GetRef().PlayAnimation("Play02")

Alias_Nyx.GetActorRef().EvaluatePackage()

SetObjectiveCompleted(800)
SetObjectiveDisplayed(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0910_Item_00
Function Fragment_Stage_0910_Item_00()
;BEGIN CODE
Game.GetPlayer().AddAliasedItem(RI04_EncryptedFiles, Alias_NyxEncryptedData)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1300)
RI05.SetStage(100)

;Cooldown on SE to prevent it from spinning up too soon
float currentGameTime = Utility.GetCurrentGameTime()
SE_Player_ZW13_Timestamp.SetValue(currentGameTime + cooldownDays)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(900)
SetObjectiveDisplayed(1000)

LC044.SetStage(20)

ObjectReference VentRef = Alias_VentEntrance.GetRef()
VentRef.Lock()
VentRef.SetLockLevel(254)

ObjectReference VentExitRef = Alias_VentFinalExit.GetRef()
VentExitRef.Lock()
VentExitRef.SetLockLevel(254)


Float fBodyCount = RI_TotalBodyCount.GetValue() - RI04_RyujinTowerBodyCount.GetValue()
RI04_RyujinTowerBodyCount.SetValue(fBodyCount)

Float fArrestCount = RI_TotalArrestCount.GetValue() - RI04_RyujinTowerArrestsCount.GetValue()
RI04_RyujinTowerArrestsCount.SetValue(fArrestCount)

Alias_Nyx.GetActorRef().EvaluatePackage()
Alias_DRONESanitationBot.GetActorRef().SetUnconscious(False)
Alias_DRONESecurityBot.GetActorRef().SetUnconscious(False)
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

;BEGIN FRAGMENT Fragment_Stage_1110_Item_00
Function Fragment_Stage_1110_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(RI04_EncryptedFiles)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1100)
SetObjectiveDisplayed(1200)
Alias_Dalton.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(1200)
SetObjectiveDisplayed(1300)
Alias_Dalton.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1310_Item_00
Function Fragment_Stage_1310_Item_00()
;BEGIN CODE
Alias_Dalton.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN AUTOCAST TYPE ri_crimetrackingquestscript
Quest __temp = self as Quest
ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.AddFinalValues()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Nyx Auto Const Mandatory

ReferenceAlias Property Alias_NyxFurniture Auto Const Mandatory

ReferenceAlias Property Alias_NyxMoveToMarker Auto Const Mandatory

ReferenceAlias Property Alias_DaltonQS Auto Const Mandatory

ReferenceAlias Property Alias_NyxProgram Auto Const Mandatory

ReferenceAlias Property Alias_Dalton Auto Const Mandatory

Quest Property LC044 Auto Const Mandatory

ReferenceAlias Property Alias_MadameSauvageQS Auto Const Mandatory

ReferenceAlias Property Alias_NyxApartmentQS Auto Const Mandatory

ReferenceAlias Property Alias_RyujinTowerQS Auto Const Mandatory

MiscObject Property RI04_NyxProgram Auto Const Mandatory

MiscObject Property RI04_EncryptedFiles Auto Const Mandatory

Scene Property RI04_0000_Masako_DaltonIntercomScene Auto Const Mandatory

ReferenceAlias Property Alias_Masako Auto Const Mandatory

GlobalVariable Property NPCDemandMoney_Small Auto Const Mandatory

GlobalVariable Property NPCDemandMoney_Medium Auto Const Mandatory

GlobalVariable Property NPCDemandMoney_Large Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

ReferenceAlias Property Alias_NyxEncryptedData Auto Const Mandatory

GlobalVariable Property RI04_RyujinTowerBodyCount Auto Const Mandatory

GlobalVariable Property RI_TotalBodyCount Auto Const Mandatory

GlobalVariable Property RI04_RyujinTowerArrestsCount Auto Const Mandatory

GlobalVariable Property RI_TotalArrestCount Auto Const Mandatory

Scene Property RI04_0400_Companion_InfiltrationCompleteScene Auto Const Mandatory

Weapon Property Disruptor Auto Const Mandatory

ReferenceAlias Property Alias_MasakoQS Auto Const Mandatory

ReferenceAlias Property Alias_UlaruQS Auto Const Mandatory

ReferenceAlias Property Alias_CamdenQS Auto Const Mandatory

Quest Property RI05 Auto Const Mandatory

Quest Property RI01_JobAdRadio Auto Const Mandatory

Perk Property FactionRyujinIndustriesPerk Auto Const Mandatory

Ammo Property AmmoNeuralDisrupter Auto Const Mandatory

ReferenceAlias Property Alias_NovablastDisrupter Auto Const Mandatory

ReferenceAlias Property Alias_NyxMonitor01 Auto Const Mandatory

ReferenceAlias Property Alias_NyxMonitor02 Auto Const Mandatory

ReferenceAlias Property Alias_NyxMonitor03 Auto Const Mandatory

ReferenceAlias Property Alias_NyxLapTopEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_VentEntrance Auto Const Mandatory

ReferenceAlias Property Alias_VentFinalExit Auto Const Mandatory

ReferenceAlias Property Alias_CraneButton Auto Const Mandatory

ReferenceAlias Property Alias_NyxBackpack Auto Const Mandatory

Quest Property RI_Support Auto Const Mandatory

ReferenceAlias Property Alias_MasakoOfficeDoor Auto Const Mandatory

GlobalVariable Property RI04_Track_PlayerStoleCamdenChoInfo Auto Const Mandatory

ReferenceAlias Property Alias_DRONESanitationBot Auto Const Mandatory

ReferenceAlias Property Alias_DRONESecurityBot Auto Const Mandatory

Faction Property LC044RyujinGuardCrimeFaction Auto Const Mandatory

ReferenceAlias Property Alias_NyxExteriorApartmentDoor Auto Const Mandatory

GlobalVariable Property RI04_TowerGuardsEnteredCombat Auto Const Mandatory

GlobalVariable Property SE_Player_ZW13_Timestamp Auto Const Mandatory

Float Property cooldownDays Auto Const Mandatory
