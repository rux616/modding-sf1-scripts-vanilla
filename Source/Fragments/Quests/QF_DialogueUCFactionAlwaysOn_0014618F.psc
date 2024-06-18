;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueUCFactionAlwaysOn_0014618F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0990_Item_00
Function Fragment_Stage_0990_Item_00()
;BEGIN AUTOCAST TYPE UCParentFactionQuestScript
Quest __temp = self as Quest
UCParentFactionQuestScript kmyQuest = __temp as UCParentFactionQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.BeginStateChangeTimer()

DialogueUCFactionNewAtlantis.SetStage(990)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Alias_ReconstructionMarker.GetRef().Enable()
Alias_OverhangMarker.GetRef().Enable()
UC04_PostAttackDialogueActive.SetValue(0)

DialogueUCFactionNewAtlantis.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_ReconstructionMarker Auto Const Mandatory

GlobalVariable Property UC04_PostAttackDialogueActive Auto Const Mandatory

ReferenceAlias Property Alias_OverhangMarker Auto Const Mandatory

Quest Property DialogueUCFactionNewAtlantis Auto Const Mandatory
