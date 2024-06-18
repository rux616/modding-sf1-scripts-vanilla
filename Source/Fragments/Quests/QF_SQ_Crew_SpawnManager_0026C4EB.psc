;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SQ_Crew_SpawnManager_0026C4EB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE SQ_Crew_SpawnManagerScript
Quest __temp = self as Quest
SQ_Crew_SpawnManagerScript kmyQuest = __temp as SQ_Crew_SpawnManagerScript
;END AUTOCAST
;BEGIN CODE
kmyquest.Trace(self, "Stage 0. Startup stage. Calling RollToEnableRefs()")
kmyquest.RollToEnableRefs()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9999_Item_00
Function Fragment_Stage_9999_Item_00()
;BEGIN AUTOCAST TYPE SQ_Crew_SpawnManagerScript
Quest __temp = self as Quest
SQ_Crew_SpawnManagerScript kmyQuest = __temp as SQ_Crew_SpawnManagerScript
;END AUTOCAST
;BEGIN CODE
kmyquest.Trace(self, "Stage 9999. Calling Stop()")
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
