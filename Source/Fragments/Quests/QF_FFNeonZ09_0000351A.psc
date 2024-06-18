;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFNeonZ09_0000351A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

; Close the pointer
FFNeonGuardPointer_Z09.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)

;Enable junk and quest activators
Alias_EnableMarker.GetRef().EnableNoWait()
Alias_PaperActivator01.GetRef().EnableNoWait()
Alias_PaperActivator02.GetRef().EnableNoWait()
Alias_PaperActivator03.GetRef().EnableNoWait()
Alias_Napkin01.GetRef().EnableNoWait()
Alias_Napkin02.GetRef().EnableNoWait()
Alias_Napkin03.GetRef().EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Trash 1 picked up, update global and add item
FFNeonZ09_PapersCollected.Mod(1)
UpdateCurrentInstanceGlobal(FFNeonZ09_PapersCollected)
SetObjectiveDisplayed(20, abForce = true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_01
Function Fragment_Stage_0030_Item_01()
;BEGIN CODE
SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Trash 2 picked up, update global, add item to alias
FFNeonZ09_PapersCollected.Mod(1)
UpdateCurrentInstanceGlobal(FFNeonZ09_PapersCollected)
SetObjectiveDisplayed(20, abForce = true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_01
Function Fragment_Stage_0040_Item_01()
;BEGIN CODE
SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Trash 3 picked up, update global, add item to alias
FFNeonZ09_PapersCollected.Mod(1)
UpdateCurrentInstanceGlobal(FFNeonZ09_PapersCollected)
SetObjectiveDisplayed(20, abForce = true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_01
Function Fragment_Stage_0050_Item_01()
;BEGIN CODE
SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
;Papers exchanged for slate

SetObjectiveCompleted(60)
SetObjectiveDisplayed(70)

ObjectReference PlayerRef = Game.GetPlayer()

PlayerRef.RemoveItem(Alias_Napkin01.GetRef())
PlayerRef.RemoveItem(Alias_Napkin02.GetRef())
PlayerRef.RemoveItem(Alias_Napkin03.GetRef())
PlayerRef.AddAliasedItem(FFNeonZ09_HamzaSlate, Alias_HamzaSlate)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Remove slate from player, complete objectives

CompleteAllObjectives()
if GetStageDone(70)
    Game.GetPlayer().RemoveItem(Alias_HamzaSlate.GetRef())
endif

;Disable quest clutter and stop quest
Alias_EnableMarker.GetRef().DisableNoWait()
DialogueFCNeon.SetStage(499)
Alias_PaperActivator01.GetRef().DisableNoWait()
Alias_PaperActivator02.GetRef().DisableNoWait()
Alias_PaperActivator03.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_EnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_PaperActivator01 Auto Const Mandatory

ReferenceAlias Property Alias_PaperActivator02 Auto Const Mandatory

ReferenceAlias Property Alias_PaperActivator03 Auto Const Mandatory

GlobalVariable Property FFNeonZ09_PapersCollected Auto Const Mandatory

Quest Property DialogueFCNeon Auto Const Mandatory

Book Property FFNeonZ09_Note01 Auto Const Mandatory

Book Property FFNeonZ09_Note02 Auto Const Mandatory

Book Property FFNeonZ09_Note03 Auto Const Mandatory

Book Property FFNeonZ09_HamzaSlate Auto Const Mandatory



ReferenceAlias Property Alias_Napkin01 Auto Const Mandatory

ReferenceAlias Property Alias_Napkin02 Auto Const Mandatory

ReferenceAlias Property Alias_Napkin03 Auto Const Mandatory

ReferenceAlias Property Alias_HamzaSlate Auto Const Mandatory

Quest Property FFNeonGuardPointer_Z09 Auto Const Mandatory
