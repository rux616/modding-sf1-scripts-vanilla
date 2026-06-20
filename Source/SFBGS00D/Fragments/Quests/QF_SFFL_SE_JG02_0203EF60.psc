;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_SE_JG02_0203EF60 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;once player tries to make contact, allow docking
;SpaceshipReference damagedShip = Alias_DerelictShip.GetRef() as SpaceshipReference
;damagedShip.AddKeyword(BEDerelict)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_DerelictShip Auto Const Mandatory

Keyword Property BEDerelict Auto Const
