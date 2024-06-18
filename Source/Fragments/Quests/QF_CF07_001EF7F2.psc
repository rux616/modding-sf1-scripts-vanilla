;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CF07_001EF7F2 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Debug Start
;Prep the Key and the Vigilance for debug play
CF_Main.SetStage(1)

;Allow Player to build ComSpike (as if CF05 was done)
CF05.SetStage(2200)
CF05.SetStage(11000)

SetStage(10)
Alias_CF07_Delgado.GetActorRef().MoveTo(CF07_DelgadoSceneMarkerRef)
Alias_CF07_Delgado.GetActorRef().EvaluatePackage()
Alias_CF07_Jazz.GetActorRef().MoveTo(CF07_JazzSceneMarkerRef)
Alias_CF07_Jazz.GetActorRef().EvaluatePackage()
Alias_CF07_Kibwe.GetActorRef().MoveTo(CF07_KibweMarkerRef)
Alias_CF07_Kibwe.GetActorRef().EvaluatePackage()
Alias_CF07_Toft.GetActorRef().MoveTo(CF07_ToftMarkerRef)
Alias_CF07_Toft.GetActorRef().EvaluatePackage()

;Move the Vigilance.
LC082.UpdateVigilanceLocation("CF07")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Debug Start with Manual Move to Key
;Prep the Key and the Vigilance for debug play
CF_Main.SetStage(1)

;Allow Player to build ComSpike (as if CF05 was done)
CF05.SetStage(2200)
CF05.SetStage(11000)

SetStage(10)
Alias_CF07_Delgado.GetActorRef().MoveTo(CF07_DelgadoSceneMarkerRef)
Alias_CF07_Delgado.GetActorRef().EvaluatePackage()
Alias_CF07_Jazz.GetActorRef().MoveTo(CF07_JazzSceneMarkerRef)
Alias_CF07_Jazz.GetActorRef().EvaluatePackage()
Alias_CF07_Kibwe.GetActorRef().MoveTo(CF07_KibweMarkerRef)
Alias_CF07_Kibwe.GetActorRef().EvaluatePackage()
Alias_CF07_Toft.GetActorRef().MoveTo(CF07_ToftMarkerRef)
Alias_CF07_Toft.GetActorRef().EvaluatePackage()
Game.GetPlayer().MoveTo(CF07_StartMarker)

;Move the Vigilance.
LC082.UpdateVigilanceLocation("CF07")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;Debug Start with Manual Move to Key
;Prep the Key and the Vigilance for debug play
CF_Main.SetStage(1)

;Allow Player to build ComSpike (as if CF05 was done)
CF05.SetStage(2200)
CF05.SetStage(11000)

SetStage(10)
SetStage(20)
SetStage(40)
SetStage(110)
SetStage(120)
Alias_CF07_Delgado.GetActorRef().MoveTo(CF07_DelgadoSceneMarkerRef)
Alias_CF07_Delgado.GetActorRef().EvaluatePackage()
Alias_CF07_Jazz.GetActorRef().MoveTo(CF07_JazzSceneMarkerRef)
Alias_CF07_Jazz.GetActorRef().EvaluatePackage()
Alias_CF07_Kibwe.GetActorRef().MoveTo(CF07_KibweMarkerRef)
Alias_CF07_Kibwe.GetActorRef().EvaluatePackage()
Alias_CF07_Toft.GetActorRef().MoveTo(CF07_ToftMarkerRef)
Alias_CF07_Toft.GetActorRef().EvaluatePackage()
Game.GetPlayer().MoveTo(CF01PlayerOpsMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_CF07_CGDecryptedSlate.GetRef(),1,true)

SetObjectiveDisplayed(10)

;Make sure Delgado and Jazz are in their correct packages
Alias_CF07_Delgado.GetActorRef().EvaluatePackage()
Alias_CF07_Jazz.GetActorRef().EvaluatePackage()

;The Vigilance moves at the next opportunity.
LC082.UpdateVigilanceLocation("CF07")

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
;Scene Triggered
CF07_Stage000_Delgado_PreScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_CF07_CGDecryptedSlate.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0018_Item_00
Function Fragment_Stage_0018_Item_00()
;BEGIN CODE
;Triggered from CF_Main Stage 300
;Checks if any SysDef Objectives are active and kills them

If IsObjectiveDisplayed(110) == 1
   SetObjectiveDisplayed(110,0)
   SetStage(210)
EndIf

If IsObjectiveDisplayed(120) == 1
   SetObjectiveDisplayed(120,0)
   SetStage(210)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)

;add the Empty Data Core to the Player
Game.GetPlayer().AddItem(Alias_CF07_DataCoreEmpty.GetRef())

;Conduction Grid Construction Available
CF06_ConductionGridMessage.Show()

;EVP Delgado.
Alias_CF07_Delgado.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_01
Function Fragment_Stage_0040_Item_01()
;BEGIN CODE
SetObjectiveCompleted(20)
SetStage(210)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(110)

Alias_CF07_Delgado.GetActorRef().EvaluatePackage()
Alias_CF07_Jazz.GetActorRef().EvaluatePackage()

;Enable special staging and markers on the Vigilance
DialogueUCVigilance.SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110)
SetObjectiveDisplayed(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
CF07_Stage110_Kibwe_PreScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
CF_Main.SetStage(275)

SetObjectiveCompleted(120)
SetStage(210)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
CF_Main.SetStage(300)

SetObjectiveCompleted(120)
SetStage(210)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Debug Setup
CF_Main.SetStage(1)
Alias_CF07_Kibwe.GetActorRef().MoveTo(CF07_KibweMarkerRef)
Alias_CF07_Kibwe.GetActorRef().EvaluatePackage()
Alias_CF07_Toft.GetActorRef().MoveTo(CF07_ToftMarkerRef)
Alias_CF07_Toft.GetActorRef().EvaluatePackage()
Alias_CF07_Delgado.GetActorRef().MoveTo(CF07_DelgadoSceneMarkerRef)
Alias_CF07_Delgado.GetActorRef().EvaluatePackage()
Alias_CF07_Jazz.GetActorRef().MoveTo(CF07_JazzSceneMarkerRef)
Alias_CF07_Jazz.GetActorRef().EvaluatePackage()
LC107LegacyLocation.Reset()
LC107LegacySpaceCellLocation.Reset()
LC107.SetStage(0)
SetStage(230)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0201_Item_00
Function Fragment_Stage_0201_Item_00()
;BEGIN CODE
;Debug Setup
CF_Main.SetStage(1)
Alias_CF07_Kibwe.GetActorRef().MoveTo(CF07_KibweMarkerRef)
Alias_CF07_Kibwe.GetActorRef().EvaluatePackage()
Alias_CF07_Toft.GetActorRef().MoveTo(CF07_ToftMarkerRef)
Alias_CF07_Toft.GetActorRef().EvaluatePackage()
Alias_CF07_Delgado.GetActorRef().MoveTo(CF07_DelgadoSceneMarkerRef)
Alias_CF07_Delgado.GetActorRef().EvaluatePackage()
Alias_CF07_Jazz.GetActorRef().MoveTo(CF07_JazzSceneMarkerRef)
Alias_CF07_Jazz.GetActorRef().EvaluatePackage()
LC107LegacyLocation.Reset()
LC107LegacySpaceCellLocation.Reset()
LC107.SetStage(4)
SetStage(230)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
SetObjectiveCompleted(120)
SetObjectiveDisplayed(210)

;Initialize LC Quest
LC107LegacyLocation.Reset()
LC107LegacySpaceCellLocation.Reset()
LC107.SetStage(20)
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

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
SetObjectiveCompleted(220)
SetObjectiveDisplayed(230)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(240)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_01
Function Fragment_Stage_0240_Item_01()
;BEGIN CODE
;Player already has module, no need to ping the objective or a log.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
SetObjectiveCompleted(240)
SetObjectiveDisplayed(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;Set in LC107 Stage 240
CF07_zLegacy002_Callout_VaultAccess.Start()
SetObjectiveCompleted(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(260)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0265_Item_00
Function Fragment_Stage_0265_Item_00()
;BEGIN CODE
;Set in LC107 Stage 265
SetObjectiveCompleted(260)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0266_Item_00
Function Fragment_Stage_0266_Item_00()
;BEGIN CODE
;Set in LC107 Stage 270
;If the optional objective isn't complete, hide it.
if (!IsObjectiveCompleted(260))
     SetObjectiveDisplayed(260, False)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0270_Item_00
Function Fragment_Stage_0270_Item_00()
;BEGIN CODE
SetObjectiveCompleted(230)
SetObjectiveDisplayed(270)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0275_Item_00
Function Fragment_Stage_0275_Item_00()
;BEGIN CODE
If GetStageDone(276) == 1
SetStage(280)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0276_Item_00
Function Fragment_Stage_0276_Item_00()
;BEGIN CODE
If GetStageDone(275) == 1
SetStage(280)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0280_Item_00
Function Fragment_Stage_0280_Item_00()
;BEGIN CODE
SetObjectiveCompleted(270)
SetObjectiveDisplayed(280)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0290_Item_00
Function Fragment_Stage_0290_Item_00()
;BEGIN CODE
SetObjectiveCompleted(280)
SetObjectiveDisplayed(290)

;Once the player has listened to the log, unblock the switches.
LC107.SetStage(330)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;Set in LC107 Stage 332
SetObjectiveCompleted(290)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN CODE
;Set by LC107 Stage 343
SetObjectiveCompleted(300)
SetObjectiveDisplayed(360)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0370_Item_00
Function Fragment_Stage_0370_Item_00()
;BEGIN CODE
;Set by LC107 Stage 350
SetObjectiveCompleted(360)
SetObjectiveDisplayed(370)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0380_Item_00
Function Fragment_Stage_0380_Item_00()
;BEGIN CODE
;Set by LC107 Stage 360
SetObjectiveCompleted(370)
SetObjectiveDisplayed(380)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0390_Item_00
Function Fragment_Stage_0390_Item_00()
;BEGIN CODE
;Set by: CF07_zLegacy006_Callout_HullBreach, in scene.

;Update LC107 VFX/SFX/state.
LC107.SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0395_Item_00
Function Fragment_Stage_0395_Item_00()
;BEGIN CODE
;Set by: CF07_zLegacy006_Callout_HullBreach, in scene.

;Update LC107 VFX/SFX/state.
LC107.SetStage(510)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0397_Item_00
Function Fragment_Stage_0397_Item_00()
;BEGIN CODE
;Set by: CF07_zLegacy006_Callout_HullBreach, in scene.

;Update LC107 VFX/SFX/state.
LC107.SetStage(520)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
;Set by: CF07_zLegacy006_Callout_HullBreach, scene end.
SetObjectiveCompleted(380)
SetObjectiveDisplayed(400)

;Primarily for quickstarts, also clean up prior objectives here.
if (!IsObjectiveCompleted(270))
     SetObjectiveDisplayed(270,False)
EndIf
if (!IsObjectiveCompleted(280))
     SetObjectiveDisplayed(280,False)
EndIf
if (!IsObjectiveCompleted(290))
     SetObjectiveDisplayed(290,False)
EndIf
if (!IsObjectiveCompleted(300))
     SetObjectiveDisplayed(300,False)
EndIf
if (!IsObjectiveCompleted(360))
     SetObjectiveDisplayed(360,False)
EndIf
if (!IsObjectiveCompleted(370))
     SetObjectiveDisplayed(370,False)
EndIf
if (!IsObjectiveCompleted(380))
     SetObjectiveDisplayed(380,False)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0499_Item_00
Function Fragment_Stage_0499_Item_00()
;BEGIN CODE
CF07_Stage500_Message.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;Blow up the Legacy
LC107.SetStageNoWait(1000)

SetObjectiveCompleted(400)
SetObjectiveDisplayed(410)
SetObjectiveDisplayed(420)
SetStage(550)

;Start up CF08 LD Quest
LC088.Start()
LC088_Space.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_01
Function Fragment_Stage_0500_Item_01()
;BEGIN CODE
;Blow up the Legacy
LC107.SetStage(1000)

SetObjectiveCompleted(400)
SetObjectiveDisplayed(430)

;Start up CF08 LD Quest
LC088.Start()
LC088_Space.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
;Check if there is a Companion filling the alias
if Alias_Companion.GetRef() != none
SetObjectiveDisplayed(450)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0555_Item_00
Function Fragment_Stage_0555_Item_00()
;BEGIN CODE
SetObjectiveCompleted(450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(410)
SetObjectiveDisplayed(420,0)
LC107.SetStage(2000)

;CF Kicked from Crimson Fleet in CF_Main
CF_Main.SetStage(200)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
;Set SysDef Kickout on CF_Main (if it hasn't already been done)
If CF_Main.GetStageDone(300) == 0
CF_Main.SetStage(300)
EndIf

if isObjectiveDisplayed(420) == 1
SetObjectiveCompleted(420)
endif
if isObjectiveDisplayed(430) == 1
SetObjectiveCompleted(430)
endif
SetObjectiveDisplayed(410,0)
LC107.SetStage(2000)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_01
Function Fragment_Stage_1500_Item_01()
;BEGIN CODE
;Set SysDef Kickout on CF_Main (if it hasn't already been done)
If CF_Main.GetStageDone(300) == 0
CF_Main.SetStage(300)
EndIf

if isObjectiveDisplayed(420) == 1
SetObjectiveCompleted(420)
endif
if isObjectiveDisplayed(430) == 1
SetObjectiveCompleted(430)
endif
SetObjectiveDisplayed(410,0)
LC107.SetStage(2000)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property CF_SysDefShutdown Auto Const Mandatory

Quest Property LC107 Auto Const Mandatory

ReferenceAlias Property Alias_CF07_DataCoreEmpty Auto Const Mandatory

ReferenceAlias Property Alias_CF07_Jazz Auto Const Mandatory

ReferenceAlias Property Alias_CF07_Delgado Auto Const Mandatory

ObjectReference Property CF07_DelgadoSceneMarkerRef Auto Const Mandatory

ObjectReference Property CF07_JazzSceneMarkerRef Auto Const Mandatory

Scene Property CF07_Stage000_Delgado_PreScene Auto Const Mandatory

ObjectReference Property CF07_StartMarker Auto Const Mandatory

ReferenceAlias Property Alias_CF07_Kibwe Auto Const Mandatory

ReferenceAlias Property Alias_CF07_Toft Auto Const Mandatory

Scene Property CF07_zLegacy002_Callout_VaultAccess Auto Const Mandatory

Scene Property CF07_Stage110_Kibwe_PreScene Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

Message Property CF07_Stage500_Message Auto Const Mandatory

Quest Property LC088_Space Auto Const Mandatory

Quest Property LC088 Auto Const Mandatory

LC082_VigilanceQuestScript Property LC082 Auto Const Mandatory

Quest Property CFKey Auto Const Mandatory

Message Property CF06_ConductionGridMessage Auto Const Mandatory

Quest Property CF_Main Auto Const Mandatory

ObjectReference Property CF07_KibweMarkerRef Auto Const Mandatory

ObjectReference Property CF07_ToftMarkerRef Auto Const Mandatory

Quest Property CF05 Auto Const Mandatory

Message Property CF05_ComSpikeMessage Auto Const Mandatory

ReferenceAlias Property Alias_Companion Auto Const Mandatory

Quest Property DialogueUCVigilance Auto Const Mandatory

ObjectReference Property CF01PlayerOpsMarker Auto Const Mandatory

Location Property LC107LegacyLocation Auto Const Mandatory

Location Property LC107LegacySpaceCellLocation Auto Const Mandatory

ReferenceAlias Property Alias_CF07_VigilanceShip Auto Const Mandatory

ReferenceAlias Property Alias_CF07_CGDecryptedSlate Auto Const Mandatory
