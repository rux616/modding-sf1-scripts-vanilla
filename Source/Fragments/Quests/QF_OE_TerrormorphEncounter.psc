;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_TerrormorphEncounter Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetStage(75)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Actor Vanguard = Alias_VanguardCommander.GetActorRef()
Actor Aceles = Alias_Aceles.GetActorRef()
Actor Terrormorph = Alias_Terrormorph.GetActorRef()

Alias_RewardContainer.GetRef().Lock()
Terrormorph.EvaluatePackage()

If Vanguard != NONE
   Vanguard.EvaluatePackage()
EndIf 

If Aceles != NONE
   Aceles.EvaluatePackage()
EndIf 

If Alias_VanguardCommander.GetRef() == NONE
   SetStage(999)
EndIf

SetStage(75)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
Alias_VanguardInjured.GetActorRef().EvaluatePackage()
SetStage(210)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0115_Item_00
Function Fragment_Stage_0115_Item_00()
;BEGIN CODE
SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
If Game.GetPlayer().GetItemCount(Aid_MedPack) >= 1
    Game.GetPlayer().RemoveItem(Aid_MedPack, 1)
EndIf

SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
Actor InjuredVanguard = NONE
InjuredVanguard = Alias_VanguardInjured.GetActorReference()

If InjuredVanguard
   Scene_InjuredVanguardDies.Start()
   InjuredVanguard.Kill()
   InjuredVanguard.EvaluatePackage()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Actor Vanguard00 = Alias_VanguardCommander.GetActorRef()
Actor Vanguard01 = Alias_VanguardAcelesHandler.GetActorRef()
Actor Vanguard02 = Alias_VanguardVendor.GetActorRef()
Actor Vanguard03 = Alias_VanguardInjured.GetActorRef()
Actor Aceles = Alias_Aceles.GetActorRef()

SetObjectiveCompleted(150)

Aceles.EvaluatePackage()
Vanguard00.EvaluatePackage()
Vanguard01.EvaluatePackage()
Vanguard02.EvaluatePackage()
Vanguard03.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
Alias_VanguardCommander.GetActorRef().EvaluatePackage()
Alias_VanguardInjured.GetActorRef().EvaluatePackage()
Alias_VanguardVendor.GetActorRef().EvaluatePackage()
Alias_VanguardAcelesHandler.GetActorRef().EvaluatePackage()
Alias_Aceles.GetActorRef().EvaluatePackage()

SetStage(220)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0290_Item_00
Function Fragment_Stage_0290_Item_00()
;BEGIN CODE
Alias_VanguardCommander.GetActorRef().EvaluatePackage()
Alias_VanguardCommander.GetActorRef().SetProtected(False)
Alias_Aceles.GetActorRef().EvaluatePackage()

SetStage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(400)
SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(500)
SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
Alias_VanguardCommander.GetActorRef().EvaluatePackage()
Alias_Aceles.GetActorRef().EvaluatePackage()
SetStage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_01
Function Fragment_Stage_0600_Item_01()
;BEGIN CODE
Alias_VanguardCommander.GetActorRef().EvaluatePackage()
Alias_Aceles.GetActorRef().EvaluatePackage()
SetStage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_02
Function Fragment_Stage_0600_Item_02()
;BEGIN CODE
Alias_VanguardCommander.GetActorRef().EvaluatePackage()
Alias_Aceles.GetActorRef().EvaluatePackage()

Float WaitTime = Utility.RandomFloat(4.5, 15.5)

Utility.Wait(WaitTime)
SetStage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
If GetStageDone(400)
   Scene_CommanderArrived.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0620_Item_00
Function Fragment_Stage_0620_Item_00()
;BEGIN CODE
int PlayerLevel = Game.GetPlayer().GetLevel()

PlayerLevel = Math.Max(PlayerLevel as Float, 1.0) as Int
PlayerLevel = Math.Min(PlayerLevel as Float, 100.0) as Int

If Utility.RandomInt(0,PlayerLevel) > 50
   SetStage(630)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0630_Item_00
Function Fragment_Stage_0630_Item_00()
;BEGIN CODE
SetStage(790)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
Actor SpawnedTerrormorph = NONE
Actor Commander = NONE
Actor Aceles = NONE

SpawnedTerrormorph = Alias_Terrormorph.GetActorReference()
Commander = Alias_VanguardCommander.GetActorRef()
Aceles = Alias_Aceles.GetActorRef()

SetObjectiveCompleted(400)
SetObjectiveCompleted(500)
SetObjectiveDisplayed(700)

SpawnedTerrormorph.Enable()

SpawnedTerrormorph.EvaluatePackage()
Commander.EvaluatePackage()
Aceles.EvaluatePackage()

; If Injured Vanguard isn't healed, they die.
If !GetStageDone(110)
   SetStage(130)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0710_Item_00
Function Fragment_Stage_0710_Item_00()
;BEGIN CODE
Actor SpawnedTerrormorph = NONE
SpawnedTerrormorph = Alias_Terrormorph.GetActorReference()

SpawnedTerrormorph.Enable()
SpawnedTerrormorph.EvaluatePackage()

; If Injured Vanguard isn't healed, they die.
If !GetStageDone(110)
   SetStage(130)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0790_Item_00
Function Fragment_Stage_0790_Item_00()
;BEGIN CODE
If !GetStageDone(700)
   SetStage(700)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
If !GetStageDone(810) || !GetStageDone(811) || !GetStageDone(812) || !GetStageDone(813)
   SetStage(900)
Else ; nobody is alive
   SetStage(990)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN CODE
If !GetStageDone(820) && Alias_Aceles.GetActorRef() != NONE
   Alias_Aceles.GetActorRef().EvaluatePackage()
EndIf

If IsObjectiveDisplayed(150)
   SetObjectiveFailed(150)
EndIf 

; Commander dies before the patrol ends
If !GetStageDone(790) 
   SetStage(710)
   SetStage(980)
EndIf

If GetStageDone(811) && GetStageDone(812) && GetStageDone(813)
   SetStage(985)
   SetStage(700)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0811_Item_00
Function Fragment_Stage_0811_Item_00()
;BEGIN CODE
If GetStageDone(810) && GetStageDone(812) && GetStageDone(813)
   SetStage(985)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0812_Item_00
Function Fragment_Stage_0812_Item_00()
;BEGIN CODE
If GetStageDone(810) && GetStageDone(811) && GetStageDone(813)
   SetStage(985)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0813_Item_00
Function Fragment_Stage_0813_Item_00()
;BEGIN CODE
If GetStageDone(810) && GetStageDone(811) && GetStageDone(812)
   SetStage(985)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0820_Item_00
Function Fragment_Stage_0820_Item_00()
;BEGIN CODE
If !GetStageDone(810)
   If Alias_VanguardCommander.GetActorRef() != NONE
      Alias_VanguardCommander.GetActorRef().EvaluatePackage()
   EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
SetObjectiveCompleted(700)
SetStage(790)
SetStage(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
If GetStageDone(810) && GetStageDone(811) && GetStageDone(812) && GetStageDone(813)
   SetStage(990)
Else
   SetObjectiveDisplayed(900)
EndIf

Actor Vanguard00 = Alias_VanguardCommander.GetActorRef()
Actor Vanguard01 = Alias_VanguardAcelesHandler.GetActorRef()
Actor Vanguard02 = Alias_VanguardVendor.GetActorRef()
Actor Vanguard03 = Alias_VanguardInjured.GetActorRef()
Vanguard00.EvaluatePackage()
Vanguard01.EvaluatePackage()
Vanguard02.EvaluatePackage()
Vanguard03.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0980_Item_00
Function Fragment_Stage_0980_Item_00()
;BEGIN CODE
FailAllObjectives()
SetStage(999)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0985_Item_00
Function Fragment_Stage_0985_Item_00()
;BEGIN CODE
FailAllObjectives()
SetStage(999)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0990_Item_00
Function Fragment_Stage_0990_Item_00()
;BEGIN CODE
Actor Vanguard00 = Alias_VanguardCommander.GetActorRef()
Actor Vanguard01 = Alias_VanguardAcelesHandler.GetActorRef()
Actor Vanguard02 = Alias_VanguardVendor.GetActorRef()
Actor Vanguard03 = Alias_VanguardInjured.GetActorRef()
Actor Aceles = Alias_Aceles.GetActorRef()

Aceles.EvaluatePackage()
Vanguard00.EvaluatePackage()
Vanguard01.EvaluatePackage()
Vanguard02.EvaluatePackage()
Vanguard03.EvaluatePackage()

CompleteAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0995_Item_00
Function Fragment_Stage_0995_Item_00()
;BEGIN CODE
SetStage(990)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0999_Item_00
Function Fragment_Stage_0999_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

; General
ReferenceAlias Property Alias_CenterMarker Auto Const Mandatory
ReferenceAlias Property Alias_SpawnFurniture Auto Const Mandatory
Potion Property Aid_MedPack Auto Const Mandatory

; NPCs
ReferenceAlias Property Alias_Terrormorph Auto Const Mandatory
ReferenceAlias Property Alias_TerrormorphCorpse Auto Const Mandatory
ReferenceAlias Property Alias_VanguardCommander Auto Const Mandatory
ReferenceAlias Property Alias_Aceles Auto Const Mandatory
ReferenceAlias Property Alias_VanguardAcelesHandler Auto Const Mandatory
ReferenceAlias Property Alias_VanguardInjured Auto Const Mandatory
ReferenceAlias Property Alias_VanguardVendor Auto Const Mandatory

ReferenceAlias Property Alias_MarkerAmbush Auto Const Mandatory

Scene Property Scene_InjuredVanguardDies Auto Const Mandatory

Scene Property Scene_CommanderArrived Auto Const Mandatory

ReferenceAlias Property Alias_RewardContainer Auto Const Mandatory
