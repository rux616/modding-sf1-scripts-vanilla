;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_GG_Marines_00188D25 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Game.GetPlayer().Moveto(UC_GG_Marines_DebugMarker02)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(UC_GG_Marines_DebugMarker03)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Credits, UC_GG_Marines_ViktorBribe.GetValueInt())
Game.GetPlayer().MoveTo(GG_Marker_OutdoorBar01)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
SetStage(500)
Game.GetPlayer().Moveto(UC_GG_Marines_DebugMarker01)
SetObjectiveCompleted(100)
Game.GetPlayer().RemoveItem(UC_GG_Marines_RecruitmentMaterials, 3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Actor PlayACT = Game.GetPlayer()
PlayACT.AddPerk(BackgroundSoldier)
PlayACT.AddPerk(BackgroundCombatMedic)
PlayACT.AddPerk(TraitUnitedColoniesNative)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
if UC_GG_Marines_Misc.IsRunning()
  UC_GG_Marines_Misc.SetStage(1000)
endif 
Game.GetPlayer().AddAliasedItem(UC_GG_Marines_RecruitmentMaterials, Alias_RecruitmentMaterials, 3)
UpdateCurrentInstanceGlobal(UC_GG_Marines_LizzyBribe)
SetObjectiveDisplayedAtTop(100)

;If the player didn't hear Zinaida's spiel
;pitch it now
if UC_GG_Marines_PlayerHeardZinaidaPitch.GetValue() < 1.0
  SetObjectiveDisplayed(110)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(UC_GG_Marines_RecruitmentMaterials, 1)
UC_GG_Marines_BonusCount.Mod(1)
if ModObjectiveGlobal(1.0, UC_GG_Marines_DropoffsCompleted, 100, UC_GG_Marines_TotalDropoffs.GetValue())
  SetStage(500)
endif

if UC_GG_Marines_BonusCount.GetValue() >= 3.0
  SetStage(499)
endif

;Tag the settlement quest to put up the posters at the right time
DialogueGagarin_UC_GG.SetStage(1200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
;Mark stage 310, designating the fact that the player got Keala's bonus
SetStage(310)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(UC_GG_Marines_RecruitmentMaterials, 1)
if ModObjectiveGlobal(1.0, UC_GG_Marines_DropoffsCompleted, 100, UC_GG_Marines_TotalDropoffs.GetValue())
  SetStage(500)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
UC_GG_Marines_BonusCount.Mod(1)
SetStage(300)

if UC_GG_Marines_BonusCount.GetValue() >= 3.0
  SetStage(499)
endif

;Tag the settlement quest to put up the posters at the right time
DialogueGagarin_UC_GG.SetStage(1210)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(UC_GG_Marines_RecruitmentMaterials, 1)
if ModObjectiveGlobal(1.0, UC_GG_Marines_DropoffsCompleted, 100, UC_GG_Marines_TotalDropoffs.GetValue())
  SetStage(500)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN CODE
UC_GG_Marines_BonusCount.Mod(1)
SetStage(400)

if UC_GG_Marines_BonusCount.GetValue() >= 3.0
  SetStage(499)
endif

;Tag the settlement quest to put up the posters at the right time
DialogueGagarin_UC_GG.SetStage(1220)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0415_Item_00
Function Fragment_Stage_0415_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, UC_GG_Marines_LizzyBribe.GetValueInt())
SetStage(410)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
SetStage(410)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0499_Item_00
Function Fragment_Stage_0499_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property UC_GG_Marines_DropoffsCompleted Auto Const Mandatory

GlobalVariable Property UC_GG_Marines_TotalDropoffs Auto Const Mandatory

GlobalVariable Property UC_GG_Marines_PlayerHeardZinaidaPitch Auto Const Mandatory

ObjectReference Property UC_GG_Marines_DebugMarker01 Auto Const Mandatory

ObjectReference Property UC_GG_Marines_DebugMarker02 Auto Const Mandatory

ObjectReference Property UC_GG_Marines_DebugMarker03 Auto Const Mandatory

ObjectReference Property GG_Marker_OutdoorBar01 Auto Const Mandatory

GlobalVariable Property UC_GG_Marines_ViktorBribe Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

MiscObject Property UC_GG_Marines_RecruitmentMaterials Auto Const Mandatory

GlobalVariable Property UC_GG_Marines_BonusCount Auto Const Mandatory

GlobalVariable Property UC_GG_Marines_LizzyBribe Auto Const Mandatory

Perk Property BackgroundSoldier Auto Const Mandatory

Perk Property BackgroundCombatMedic Auto Const Mandatory

Perk Property TraitUnitedColoniesNative Auto Const Mandatory

Quest Property UC_GG_Marines_Misc Auto Const Mandatory

Quest Property DialogueGagarin_UC_GG Auto Const Mandatory

RefCollectionAlias Property Alias_RecruitmentMaterials Auto Const Mandatory
