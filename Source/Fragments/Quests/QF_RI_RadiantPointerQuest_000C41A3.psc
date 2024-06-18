;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RI_RadiantPointerQuest_000C41A3 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; Check who the current radiant quest giver is and force them into 
; the QuestGiver alias.
; 1 - Masako / 2 - Ularu

Float fQuestGiver = RI_RadiantQuestGiver.GetValue()

If fQuestGiver == 1
     Alias_QuestGiver.ForceRefTo(Alias_Masako.GetRef())
ElseIf fQuestGiver == 2
     Alias_QuestGiver.ForceRefTo(Alias_Ularu.GetRef())
EndIf

Alias_QuestGiver.GetActorRef().EvaluatePackage()

; Check who the current pointer quest giver is and move them.
If RI05_ImogeneDead.GetValueInt() == 0 && RI05_Track_PlayerSidedWithMasako.GetValueInt() == 1
     Alias_Imogene.GetRef().MoveTo(Alias_PointerQuestGiverFurniture.GetRef())
Else
     Alias_Yuko.GetRef().MoveTo(Alias_PointerQuestGiverFurniture.GetRef())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_Imogene.GetActorRef().EvaluatePackage()
Alias_Yuko.GetActorRef().EvaluatePackage()
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

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Masako Auto Const Mandatory

ReferenceAlias Property Alias_Ularu Auto Const Mandatory

ReferenceAlias Property Alias_QuestGiver Auto Const Mandatory

GlobalVariable Property RI_RadiantQuestGiver Auto Const Mandatory

GlobalVariable Property RI_LastChosenRadiant Auto Const Mandatory

Quest Property RIR03 Auto Const Mandatory

Quest Property RIR05 Auto Const Mandatory

Quest Property RIR06 Auto Const Mandatory

Quest Property RIR07 Auto Const Mandatory

ReferenceAlias Property Alias_Yuko Auto Const Mandatory

ReferenceAlias Property Alias_Imogene Auto Const Mandatory

ReferenceAlias Property Alias_PointerQuestGiverFurniture Auto Const Mandatory

GlobalVariable Property RI05_ImogeneDead Auto Const Mandatory

GlobalVariable Property RI05_Track_PlayerSidedWithMasako Auto Const Mandatory
