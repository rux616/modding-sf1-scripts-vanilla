;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_TestQuest_LVC_010D747E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
TestQuest_LVC_FaceCycleScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
DEBUG_GEN_359096_StageSetTestMessage.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(801)
SetObjectiveDisplayed(802)
SetObjectiveDisplayedAtTop(800)
Utility.Wait(4.0)
SetObjectiveDisplayed(803)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN AUTOCAST TYPE TEST_LVCQuestScript
Quest __temp = self as Quest
TEST_LVCQuestScript kmyQuest = __temp as TEST_LVCQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.TestEnableLayer = InputEnableLayer.Create()
kmyquest.TestEnableLayer.EnableInventoryMenuAccess(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0910_Item_00
Function Fragment_Stage_0910_Item_00()
;BEGIN AUTOCAST TYPE TEST_LVCQuestScript
Quest __temp = self as Quest
TEST_LVCQuestScript kmyQuest = __temp as TEST_LVCQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.TestEnableLayer.Delete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Actor PlayREF = Game.GetPlayer()
CrTerrormorphMindControl.Cast(PlayREF, PlayREF)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1100_Item_00
Function Fragment_Stage_1100_Item_00()
;BEGIN CODE
MQ101Debug.Setvalue(8)
MQ101.SetStage(0)
Utility.Wait(30)
Alias_PlayerShipInventory.GetRef().AddItem(Alias_TestInventoryItem.GetRef())
SetObjectiveDisplayed(1100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1200_Item_00
Function Fragment_Stage_1200_Item_00()
;BEGIN CODE
TestQuest_LVC_EndMidLine.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1300_Item_00
Function Fragment_Stage_1300_Item_00()
;BEGIN CODE
TestQuest_LVC_ExistsTest.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1310_Item_00
Function Fragment_Stage_1310_Item_00()
;BEGIN CODE
Alias_ExistsTestOptionalAlias.ForceRefTo(LVC_ExistsTestOptionalMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1400_Item_00
Function Fragment_Stage_1400_Item_00()
;BEGIN CODE
UC08_CrTerrormorphMindControl_Permanent.Cast(Alias_TestMorph.GetactorRef(), Alias_TestSecurityThrall.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property TestQuest_LVC_FaceCycleScene Auto Const Mandatory

Message Property DEBUG_GEN_359096_StageSetTestMessage Auto Const Mandatory

Spell Property CrTerrormorphMindControl Auto Const Mandatory

Quest Property TestQuest_LVC_EndMidLine Auto Const Mandatory

GlobalVariable Property MQ101Debug Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShipInventory Auto Const Mandatory

ReferenceAlias Property Alias_TestInventoryItem Auto Const Mandatory

Quest Property MQ101 Auto Const Mandatory

Scene Property TestQuest_LVC_ExistsTest Auto Const Mandatory

ObjectReference Property LVC_ExistsTestOptionalMarker Auto Const Mandatory

ReferenceAlias Property Alias_ExistsTestOptionalAlias Auto Const Mandatory

ReferenceAlias Property Alias_TestMorph Auto Const Mandatory

ReferenceAlias Property Alias_TestSecurityThrall Auto Const Mandatory

Spell Property UC08_CrTerrormorphMindControl_Permanent Auto Const Mandatory
