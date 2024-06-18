;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SQ_StationTrafficManager__001C580D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE SQ_StationTrafficManagerQuestScript
Quest __temp = self as Quest
SQ_StationTrafficManagerQuestScript kmyQuest = __temp as SQ_StationTrafficManagerQuestScript
;END AUTOCAST
;BEGIN CODE
;Set by: Startup

;Call the init function. This has to be done from the startup stage
;to make sure this initialization is hidden by the load.
kMyQuest.InitOnStartupStage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Set by: Ships alias, OnCombatStateChanged
;
;Stop spawning new ships if any traffic ship becomes involved in
;combat with the player, to make infinite spawn exploits harder.
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
