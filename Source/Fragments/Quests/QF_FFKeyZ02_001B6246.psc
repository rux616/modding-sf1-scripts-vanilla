;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFKeyZ02_001B6246 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
CF_Main.SetStage(1)
;DialogueCFTheKey.SetStage(800)
Game.GetPlayer().MoveTo(Alias_SaminaStartMarker.GetRef())
Game.GetPlayer().AddPerk(FactionCrimsonFleetPerk)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
CF_Main.SetStage(1)
DialogueCFTheKey.SetStage(800)
Game.GetPlayer().MoveTo(Alias_GennadyStartMarker.GetRef())
Game.GetPlayer().AddPerk(FactionCrimsonFleetPerk)
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
CF_Main.SetStage(1)
DialogueCFTheKey.SetStage(800)
Game.GetPlayer().MoveTo(Alias_SuppliesStartMarker.GetRef())
Game.GetPlayer().AddPerk(FactionCrimsonFleetPerk)
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
CF_Main.SetStage(1)
DialogueCFTheKey.SetStage(800)
Game.GetPlayer().MoveTo(Alias_SaminaStartMarker.GetRef())
Game.GetPlayer().AddPerk(FactionCrimsonFleetPerk)
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveFailed(100)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0066_Item_00
Function Fragment_Stage_0066_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)

Alias_TheClinicMapMarker.GetRef().AddToMapScanned()
Alias_TheClinicMapMarker.GetRef().SetMarkerVisibleOnStarMap()

Alias_MedicalSupplies_Container.GetRef().Lock()
Alias_CFSD01Evidence.TryToEnable()

Gennady.SetEssential(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_SupplyStorageKey.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)

If !GetStageDone(155)
     Game.GetPlayer().AddItem(Alias_SupplyStorageKey.GetRef())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(100)
     SetObjectiveDisplayed(100, False, False)
EndIf 
If IsObjectiveDisplayed(200)
Debug.Trace(self + "Objective 200 is displayed")
     SetObjectiveCompleted(200)
EndIf

SetObjectiveSkipped(50)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(FFKeyZ02_MedicalSupplies)
Utility.Wait(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_MedicalSupplies_Container Auto Const Mandatory

ReferenceAlias Property Alias_SupplyStorageKey Auto Const Mandatory

MiscObject Property FFKeyZ02_MedicalSupplies Auto Const Mandatory

ReferenceAlias Property Alias_SaminaStartMarker Auto Const Mandatory

Quest Property LC082 Auto Const Mandatory

Quest Property DialogueCFTheKey Auto Const Mandatory

ReferenceAlias Property Alias_GennadyStartMarker Auto Const Mandatory

ReferenceAlias Property Alias_SuppliesStartMarker Auto Const Mandatory

Perk Property FactionCrimsonFleetPerk Auto Const Mandatory

Quest Property CF_Main Auto Const Mandatory

ReferenceAlias Property Alias_CFSD01Evidence Auto Const Mandatory

ReferenceAlias Property Alias_TheClinicMapMarker Auto Const Mandatory

ActorBase Property Gennady Auto Const Mandatory
