;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MB_Bounty04_FCR04_0014D4A3 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE missionquestscript
Quest __temp = self as Quest
missionquestscript kmyQuest = __temp as missionquestscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10)

; Set stage 170 on FC02 if it's running and stage 160 was set
if FC02.IsRunning() && FC02.GetStageDone(160)
  FC02.SetStage(170)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE missionquestscript
Quest __temp = self as Quest
missionquestscript kmyQuest = __temp as missionquestscript
;END AUTOCAST
;BEGIN CODE
; Set stage 180 on FC02 if it's running & stage 160 was set
if FC02.IsRunning() && FC02.GetStageDone(160)
  FC02.SetStage(180)
endif

kmyQuest.MissionComplete()
FCRQuestScript myFCRQuest = (kmyQuest as Quest) as FCRQuestScript
myFCRQuest.FCRMissionComplete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_01
Function Fragment_Stage_0100_Item_01()
;BEGIN AUTOCAST TYPE missionquestscript
Quest __temp = self as Quest
missionquestscript kmyQuest = __temp as missionquestscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.MissionShutdown()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property FC02 Auto Const Mandatory
