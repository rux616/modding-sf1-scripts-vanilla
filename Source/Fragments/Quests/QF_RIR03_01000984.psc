;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RIR03_01000984 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; Check who the current quest giver is and force them into 
; the QuestGiver alias.
; 0 - Imogene / 1 - Masako / 2 - Ularu

Float fQuestGiver = RI_RadiantQuestGiver.GetValue()
Debug.Trace(Self + "Stage 10: fQuestGiver = " + fQuestGiver)

If fQuestGiver == 0
     Alias_QuestGiver.ForceRefTo(Alias_Imogene.GetRef())
ElseIf fQuestGiver == 1
     Alias_QuestGiver.ForceRefTo(Alias_Masako.GetRef())
ElseIf fQuestGiver == 2
     Alias_QuestGiver.ForceRefTo(Alias_Ularu.GetRef())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_Keycard.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_Keycard.GetRef())
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

GlobalVariable Property RI_RadiantQuestGiver Auto Const Mandatory

Actor Property RI_Imogene Auto Const Mandatory

Actor Property RI_Masako Auto Const Mandatory

Actor Property RI_Ularu Auto Const Mandatory

ReferenceAlias Property Alias_QuestGiver Auto Const Mandatory

ReferenceAlias Property Alias_Guard Auto Const Mandatory

MiscObject Property RIR03_Keycard Auto Const Mandatory

ReferenceAlias Property Alias_Imogene Auto Const Mandatory

ReferenceAlias Property Alias_Masako Auto Const Mandatory

ReferenceAlias Property Alias_Ularu Auto Const Mandatory

ReferenceAlias Property Alias_Keycard Auto Const Mandatory
