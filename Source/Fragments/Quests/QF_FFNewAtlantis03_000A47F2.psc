;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFNewAtlantis03_000A47F2 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Quickstart to skip opening intro
SetStage(1)
SetStage(10)
SetStage(20)
SetStage(30)
SetStage(40)
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Alias_BobbyKatz.GetRef().MoveTo(Alias_BobbyMarker.GetRef())
Alias_RicardoBosch.GetRef().MoveTo(Alias_RicardoMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_01
Function Fragment_Stage_0001_Item_01()
;BEGIN CODE
City_NewAtlantis_Z_OliveBranch.Start()
FFNewAtlantis01TopLevels.Start()
City_NewAtlantis_Z_PartingGift.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
FFNewAtlantis03B_Helena_Scene01.Stop()
FFNewAtlantis03B_Helena_Scene02.Start()
Alias_SweepMarker.GetRef().EnableNoWait()
Alias_TerraManager.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
Alias_TerraManager.GetRef().DisableNoWait()
Alias_TerraManager.GetRef().Delete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
if GetStageDone(300)
    SetObjectiveCompleted(300)
    SetObjectiveDisplayed(400)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Alias_TerraManager.GetRef().EnableNoWait()
Alias_BobbyMom.GetRef().EnableNoWait()
Alias_BobbyDad.GetRef().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
FFNewAtlantis03_Scene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
FFNewAtlantis03_Scene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
FFNewAtlantis03_Scene01.Stop()
Alias_Functionary.GetActorRef().EvaluatePackage()
Alias_HelenaChambers.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
FFNewAtlantis03B_Helena_Scene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0099_Item_00
Function Fragment_Stage_0099_Item_00()
;BEGIN CODE
Alias_HelenaChambers.GetRef().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
ObjectReference HelenaRef = Alias_HelenaChambers.GetRef()

UC_NA_HelenaChambers.SetOutfit(Outfit_Clothes_Service_Uniform_Terrabrew)
Alias_HelenaChambers.GetActorRef().SetOutfit(Outfit_Clothes_Service_Uniform_Terrabrew)

HelenaRef.MoveTo(Alias_HelenaPQMarker.GetRef())
HelenaRef.DisableNoWait()

Alias_BobbyKatz.GetRef().MoveTo(Alias_BobbyPQMarker.GetRef())
Alias_RicardoBosch.GetRef().MoveTo(Alias_RicardoPQMarker.GetRef())

SetStage(5)

Alias_Functionary.GetRef().DisableNoWait()
Alias_Functionary.GetRef().Delete()
Alias_Guard.Clear()
FFNewAtlantis01.Start()
FFNewAtlantis03_Scene01.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
if !GetStageDone(4)
    SetObjectiveDisplayed(300)
else
    SetObjectiveDisplayed(400)
endif
Alias_MapMarker.GetRef().AddToMapScanned()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
CompleteAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property FFNewAtlantis03_Scene01 Auto Const Mandatory

ReferenceAlias Property Alias_Functionary Auto Const Mandatory

ReferenceAlias Property Alias_Chisolm Auto Const Mandatory

ReferenceAlias Property Alias_Guard Auto Const Mandatory

ReferenceAlias Property Alias_Wilkes Auto Const Mandatory

Quest Property FFNewAtlantis01 Auto Const Mandatory

ReferenceAlias Property Alias_HelenaChambers Auto Const Mandatory

ReferenceAlias Property Alias_RicardoBosch Auto Const Mandatory

ReferenceAlias Property Alias_BobbyKatz Auto Const Mandatory

ReferenceAlias Property Alias_RicardoMarker Auto Const Mandatory

ReferenceAlias Property Alias_BobbyMarker Auto Const Mandatory

ReferenceAlias Property Alias_HelenaPQMarker Auto Const Mandatory

Outfit Property Outfit_Clothes_Service_Uniform_Terrabrew Auto Const Mandatory

ActorBase Property UC_NA_HelenaChambers Auto Const Mandatory

ReferenceAlias Property Alias_TerraManager Auto Const Mandatory

ReferenceAlias Property Alias_SweepMarker Auto Const Mandatory

Scene Property FFNewAtlantis03B_Helena_Scene01 Auto Const Mandatory

ReferenceAlias Property Alias_BobbyPQMarker Auto Const Mandatory

ReferenceAlias Property Alias_BobbyDad Auto Const Mandatory

ReferenceAlias Property Alias_BobbyMom Auto Const Mandatory

ReferenceAlias Property Alias_RicardoPQMarker Auto Const Mandatory

Scene Property FFNewAtlantis03B_Helena_Scene02 Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory

Quest Property City_NewAtlantis_Z_OliveBranch Auto Const Mandatory

Quest Property FFNewAtlantis01TopLevels Auto Const Mandatory

Quest Property City_NewAtlantis_Z_PartingGift Auto Const Mandatory
