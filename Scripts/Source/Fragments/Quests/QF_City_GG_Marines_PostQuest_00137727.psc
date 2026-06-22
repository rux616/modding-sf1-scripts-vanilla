;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_GG_Marines_PostQuest_00137727 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
if DialogueGagarin_UC_GG.GetStageDone(1200)
  DialogueGagarin_UC_GG.SetStage(1205)
endif

if DialogueGagarin_UC_GG.GetStageDone(1210)
  DialogueGagarin_UC_GG.SetStage(1215)
endif

if DialogueGagarin_UC_GG.GetStageDone(1220)
  DialogueGagarin_UC_GG.SetStage(1225)
endif

DialogueGagarin_UC_GG.SetStage(1230)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DialogueGagarin_UC_GG Auto Const Mandatory
