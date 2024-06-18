;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_LC102Combat_006E8568 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE LC102CombatQuestScript
Quest __temp = self as Quest
LC102CombatQuestScript kmyQuest = __temp as LC102CombatQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetTargetQuestStage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_LifeSupportMachine01_FXEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_LifeSupportMachine02_FXEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_LifeSupportMachine03_FXEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_LockdownEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_LifeSupportMachine01Activator Auto Const Mandatory

ReferenceAlias Property Alias_LifeSupportMachine02Activator Auto Const Mandatory

ReferenceAlias Property Alias_LifeSupportMachine03Activator Auto Const Mandatory
