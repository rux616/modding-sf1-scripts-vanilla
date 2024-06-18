;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueFCRyujinTower_0026F911 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
RI01Quest.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
RI01Quest.CompleteQuest()
RI02Quest.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
RI02Quest.CompleteQuest()
RI03Quest.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
SettlementEnableMarker.Enable(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
JupiterAliasRef.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
RI_LaneUnlockTLs.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1350_Item_00
Function Fragment_Stage_1350_Item_00()
;BEGIN CODE
RI05_ImogeneDead.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2010_Item_00
Function Fragment_Stage_2010_Item_00()
;BEGIN CODE
Actor PlayerREF = Game.GetPlayer()
Int DataCount = PlayerRef.GetItemCount(DR017_ValuableData01)
Float fDemandedHighPrice = DR017_DemandedHighPrice.GetValue()

If fDemandedHighPrice == 1
     PlayerREF.AddItem(Credits, (DataCount * DR017_DataCreditsHigh.GetValueInt()))
Else
     PlayerREF.AddItem(Credits, (DataCount * DR017_DataCredits.GetValueInt()))
EndIf

PlayerREF.RemoveItem(DR017_ValuableData01, DataCount)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2020_Item_00
Function Fragment_Stage_2020_Item_00()
;BEGIN CODE
DR017_DemandedHighPrice.SetValue(1)
SetStage(2010)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_4410_Item_00
Function Fragment_Stage_4410_Item_00()
;BEGIN CODE
Alias_SeanMcAfee.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property JupiterEllicott Auto Const

ReferenceAlias Property JupiterAliasRef Auto Const

Quest Property RI01Quest Auto Const

Quest Property RI02Quest Auto Const

Quest Property RI03Quest Auto Const

ObjectReference Property SettlementEnableMarker Auto Const

GlobalVariable Property DR017_DataCredits Auto Const Mandatory

Book Property DR017_ValuableData01 Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

GlobalVariable Property DR017_DataCreditsHigh Auto Const Mandatory

GlobalVariable Property DR017_DemandedHighPrice Auto Const Mandatory

ReferenceAlias Property Alias_SeanMcAfee Auto Const Mandatory

GlobalVariable Property RI_LaneUnlockTLs Auto Const Mandatory

GlobalVariable Property RI05_ImogeneDead Auto Const Mandatory
