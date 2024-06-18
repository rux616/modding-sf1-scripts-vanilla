;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ101SpaceEncounter01_000143B4 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
MQ101.setstage(408)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;start the next space encounter
MQ101.SetStage(490)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;skip the second space encounter
MQ101.SetStage(495)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ101 Auto Const Mandatory

ReferenceAlias Property Alias_AutoPilot Auto Const Mandatory

ReferenceAlias Property Alias_Player Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory
