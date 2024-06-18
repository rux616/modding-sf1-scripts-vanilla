;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueUCFactionNewAtlan_002C5402 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
UC01.SetStage(1000)
UC02.SetObjectiveCompleted(100)
UC02.Stop()
UC09.SetStage(500)
UC09_Result.SetValue(2)
Game.GetPlayer().MoveTo(UCR01_DebugMarker)
Utility.Wait(2.0)
Alias_Tuala.GetRef().Moveto(UC_TualaTravelMaker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
UC01.SetStage(1000)
UC02.SetObjectiveCompleted(100)
UC02.Stop()
UC09.SetStage(500)
UC09_Result.SetValue(1)
Game.GetPlayer().MoveTo(UCR01_DebugMarker)
Utility.Wait(2.0)
Alias_Tuala.GetRef().Moveto(UC_TualaTravelMaker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
UC01.SetStage(1000)
UC02.SetObjectiveCompleted(100)
UC02.Stop()
UC09.SetStage(500)
UC09_Result.SetValue(1)
Game.GetPlayer().MoveTo(UCR01_DebugMarker)
Utility.Wait(2.0)
Alias_Tuala.GetRef().Moveto(UC_TualaTravelMaker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
UC09.Start()
Utility.Wait(1.0)
UC09.SetStage(200)
UC09.SetStage(340)
UC09.SetStage(500)

Game.GetPlayer().MoveTo(UCR05_DebugMarker)

SetObjectiveDisplayed(500, false, false)

Alias_VVEntrance.GetRef().Unlock()

(Alias_SS7FloorManager.GetRef() as LoadElevatorFloorScript).SetAccessible(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
UC01.SetStage(1000)
UC02.SetObjectiveCompleted(100)
UC02.Stop()
UC09.SetStage(500)
UC09_Result.SetValue(1)
Game.GetPlayer().MoveTo(UCR01_DebugMarker)
Utility.Wait(2.0)
Alias_Tuala.GetRef().Moveto(UC_TualaTravelMaker)
Utility.Wait(1.0)
SetStage(550)
UCR01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
UC01.SetStage(1000)
UC02.SetObjectiveCompleted(100)
UC02.Stop()
UC09.SetStage(500)
UC09_Result.SetValue(2)
Game.GetPlayer().MoveTo(UCR01_DebugMarker)
Utility.Wait(2.0)
Alias_Tuala.GetRef().Moveto(UC_TualaTravelMaker)
Utility.Wait(1.0)
SetStage(550)
UCR01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
UC01.SetStage(1000)
UC02.SetObjectiveCompleted(100)
UC02.Stop()
UC09.SetStage(500)
UC09_Result.SetValue(1)
Game.GetPlayer().MoveTo(UCR01_DebugMarker)
Utility.Wait(2.0)
Alias_Tuala.GetRef().Moveto(UC_TualaTravelMaker)
Utility.Wait(1.0)
SetStage(550)
UCR03.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
UC01_MuralsViewedGlobal.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
UC01_MuralsViewedGlobal.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0021_Item_00
Function Fragment_Stage_0021_Item_00()
;BEGIN CODE
UC01_MuralsViewedGlobal.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0023_Item_00
Function Fragment_Stage_0023_Item_00()
;BEGIN CODE
UC01_MuralsViewedGlobal.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0024_Item_00
Function Fragment_Stage_0024_Item_00()
;BEGIN CODE
UC01_MuralsViewedGlobal.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
UC01_MuralsViewedGlobal.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0031_Item_00
Function Fragment_Stage_0031_Item_00()
;BEGIN CODE
UC01_MuralsViewedGlobal.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0032_Item_00
Function Fragment_Stage_0032_Item_00()
;BEGIN CODE
UC01_MuralsViewedGlobal.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
UC01_MuralsViewedGlobal.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
UC01_MuralsViewedGlobal.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0051_Item_00
Function Fragment_Stage_0051_Item_00()
;BEGIN CODE
UC01_MuralsViewedGlobal.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
UC01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; This stage is now unused.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(LL_Credits_Medium)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
UC09_PostQuest_Tuala_Misc.Start()

if !UC09.GetStageDone(320)
  UC09_PostQuest_VaeVictis_Misc.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0525_Item_00
Function Fragment_Stage_0525_Item_00()
;BEGIN CODE
Actor PlayACT = Game.GetPlayer()

PlayACT.AddItem(Credits, CreditsRewardFactionQuestLarge.GetValueInt())
PlayACT.RemovePerk(UC_CitizenVendorDiscount_Rank01)
PlayACT.AddPerk(UC_CitizenVendorDiscount_Rank02)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
UC09_PostQuest_Tuala_Misc.SetStage(1000)
Alias_ZoraSangweni.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
UC09_PostQuest_Percival_Misc.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
UC09_PostQuest_Percival_Misc.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0990_Item_00
Function Fragment_Stage_0990_Item_00()
;BEGIN CODE
;Also turn off the dad and kid at the museum
Alias_MuseumPatron_Child.GetRef().Disable()
Alias_MuseumPatron_Dad.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Also reset the space port guards, then clear that collection
int i = 0 
int iCount = Alias_SpaceportGuards.GetCount()

while i < iCount
    Actor currAct = Alias_SpaceportGuards.GetAt(i) as Actor

    if currAct.IsDisabled()
      currAct.Enable()
    endif

    if currAct.IsDead()
        currAct.Reset()
    endif

    i += 1
endwhile

Alias_SpaceportGuards.RemoveAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1020_Item_00
Function Fragment_Stage_1020_Item_00()
;BEGIN CODE
UC09_PostQuest_VaeVictis_Misc.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
;Get Pacifist touring the museum
Alias_Pacifist.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
SetStage(1100)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property UC01 Auto Const Mandatory

LeveledItem Property LL_Credits_Medium Auto Const Mandatory

ReferenceAlias Property Alias_TarmacEnableMarker Auto Const Mandatory

GlobalVariable Property UC04_PostAttackDialogueActive Auto Const Mandatory

Scene Property DialogueUCNewAtlantisUCFaction_POST_TualaAttract Auto Const Mandatory

Message Property UC09_DEBUG_TualasContinuance Auto Const Mandatory

GlobalVariable Property UC09_PlayerChoiceResult Auto Const Mandatory

Quest Property UC09 Auto Const Mandatory

GlobalVariable Property UC09_Result Auto Const Mandatory

ObjectReference Property UCR01_DebugMarker Auto Const Mandatory

Quest Property UC02 Auto Const Mandatory

Quest Property DialogueRedDevilsHQ Auto Const Mandatory

ObjectReference Property UCR05_DebugMarker Auto Const Mandatory

GlobalVariable Property CreditsRewardFactionQuestLarge Auto Const Mandatory

ReferenceAlias Property Alias_TualaLookatMarker Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

Perk Property UC_CitizenVendorDiscount_Rank02 Auto Const Mandatory

Perk Property UC_CitizenVendorDiscount_Rank01 Auto Const Mandatory

Message Property UC09_DEBUG_Zora Auto Const Mandatory

ObjectReference Property UC_TualaTravelMaker Auto Const Mandatory

ReferenceAlias Property Alias_Tuala Auto Const Mandatory

Quest Property UCR01 Auto Const Mandatory

Quest Property UCR03 Auto Const Mandatory

ReferenceAlias Property Alias_ZoraSangweni Auto Const

ReferenceAlias Property Alias_VVEntrance Auto Const Mandatory

ReferenceAlias Property Alias_MuseumPatron_Child Auto Const Mandatory

ReferenceAlias Property Alias_MuseumPatron_Dad Auto Const Mandatory

ReferenceAlias Property Alias_Pacifist Auto Const Mandatory

GlobalVariable Property UC01_MuralsViewedGlobal Auto Const Mandatory

RefCollectionAlias Property Alias_SpaceportGuards Auto Const Mandatory

ReferenceAlias Property Alias_SS7FloorManager Auto Const Mandatory

Quest Property UC09_PostQuest_VaeVictis_Misc Auto Const Mandatory

Quest Property UC09_PostQuest_Tuala_Misc Auto Const Mandatory

Quest Property UC09_PostQuest_Percival_Misc Auto Const Mandatory
