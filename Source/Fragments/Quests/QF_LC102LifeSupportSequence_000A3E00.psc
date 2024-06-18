;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_LC102LifeSupportSequence_000A3E00 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE LC102LifeSupportSequenceQuestScript
Quest __temp = self as Quest
LC102LifeSupportSequenceQuestScript kmyQuest = __temp as LC102LifeSupportSequenceQuestScript
;END AUTOCAST
;BEGIN CODE
; Resgiter for LifeSupportMachine lever activations

kMyQuest.RegisterForLifeSupportMachineActivations()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
;shut down.
Stop()
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
