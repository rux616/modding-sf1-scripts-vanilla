;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_SE_MG02_Logs_Hostile_0108D457 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_StageTimerScript
Quest __temp = self as Quest
SFBGS00D:SFFL_StageTimerScript kmyQuest = __temp as SFBGS00D:SFFL_StageTimerScript
;END AUTOCAST
;BEGIN CODE
kmyquest.StartAttackTimer()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Enemy01 Auto Const Mandatory

ReferenceAlias Property Alias_Enemy02 Auto Const Mandatory

ReferenceAlias Property Alias_Enemy03 Auto Const Mandatory

ReferenceAlias Property Alias_Player Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory
