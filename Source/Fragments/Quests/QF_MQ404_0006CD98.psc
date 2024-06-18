;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ404_0006CD98 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;close out current quest
If MQ201.IsRunning()
  MQ201.SetStage(2000)
EndIf

If MQ201B.IsRunning()
  MQ201B.SetStage(2000)
EndIf

SetObjectiveDisplayed(10)

;make sure Artifact Collection is enabled
ArmillaryMountSwapEnableMarker.Disable()

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN AUTOCAST TYPE mq404script
Quest __temp = self as Quest
mq404script kmyQuest = __temp as mq404script
;END AUTOCAST
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()
ObjectReference ArmillaryMountREF = Alias_ArmillaryMount.GetRef()
ObjectReference ArmillaryREF = Alias_Armillary.GetRef()

(ArmillaryREF as ArmillaryScript).PackupArmillary(PlayerREF)
ArmillaryMountREF.BlockActivation(True, True)
ArmillaryREF.DisableNoWait()

;wait for the Workshop menu to close before we progress
kmyquest.WaitForWorkshopMenuClose()

;allow player to build grav drive
MQAlllowArmillaryGravDrive.SetValueInt(1)
Alias_HomeShipArmillaryScreenTrigger.GetRef().Enable()

SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
SetObjectiveDisplayed(30)

MQ204ArmillaryBuildMSG.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_01
Function Fragment_Stage_0120_Item_01()
;BEGIN CODE
SetStage(130)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()
Actor HunterREF = Alias_Hunter.GetActorRef()
ObjectReference HunterMarker = PlayerREF.PlaceAtMe(XMarkerHeading)
HunterMarker.MoveToNearestNavmeshLocation()
HunterREF.moveto(HunterMarker)
HunterREF.PlaceAtMe(LC165_ScriptedTeleportSourceExplosion)
Starborn_EntryShader.Play(HunterREF)
Utility.Wait(1.0)

MQ404_002_HunterScene.Start()

Utility.Wait(1.0)
SetObjectiveCompleted(20)
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Game.StopDialogueCamera()
MQ404_002_HunterScene.Stop()
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)

Actor HunterREF = Alias_Hunter.GetActorRef()
HunterREF.PlaceAtMe(LC165_ScriptedTeleportSourceExplosion)
Starborn_DeathShader.Play(HunterREF)
AbStarbornDeath.Cast(HunterREF, HunterREF)
Utility.Wait(3.0)

;move back to the holding cell
HunterREF.Moveto(MQHoldingCellCenterMarker)
AbStarbornTeleport.Cast(HunterREF, HunterREF)

;the Scow is now gone
Alias_TheScow.GetShipRef().DisableNoWait()
MQ202TurretEnableMarker.DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
CompleteAllObjectives()
MQ206B.SetStage(100)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
;Emissary needs to be random since no Companion dies
MQ_EmissaryRandom.SetValueInt(1)
MQ_EmissaryRevealed.SetValueInt(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ201 Auto Const Mandatory

Quest Property MQ201B Auto Const Mandatory

ReferenceAlias Property Alias_ArmillaryMount Auto Const Mandatory

GlobalVariable Property MQ_EmissaryRandom Auto Const Mandatory

GlobalVariable Property MQ_EmissaryRevealed Auto Const Mandatory

Scene Property MQ404_002_HunterScene Auto Const Mandatory

ObjectReference Property MQHoldingCellCenterMarker Auto Const Mandatory

ReferenceAlias Property Alias_Hunter Auto Const Mandatory

Quest Property MQ206B Auto Const Mandatory

ReferenceAlias Property Alias_TheScow Auto Const Mandatory

Explosion Property LC165_ScriptedTeleportSourceExplosion Auto Const Mandatory

STATIC Property XMarkerHeading Auto Const Mandatory

ReferenceAlias Property Alias_Armillary Auto Const Mandatory

ObjectReference Property ArmillaryMountSwapEnableMarker Auto Const Mandatory

Spell Property AbStarbornTeleport Auto Const Mandatory

Spell Property AbStarbornDeath Auto Const Mandatory

Message Property MQ204ArmillaryBuildMSG_NGPlus Auto Const Mandatory

Message Property MQ204ArmillaryBuildMSG Auto Const Mandatory

GlobalVariable Property MQAlllowArmillaryGravDrive Auto Const Mandatory

ReferenceAlias Property Alias_HomeShipArmillaryScreenTrigger Auto Const Mandatory

EffectShader Property Starborn_DeathShader Auto Const Mandatory

EffectShader Property Starborn_EntryShader Auto Const Mandatory

ObjectReference Property MQ202TurretEnableMarker Auto Const Mandatory
