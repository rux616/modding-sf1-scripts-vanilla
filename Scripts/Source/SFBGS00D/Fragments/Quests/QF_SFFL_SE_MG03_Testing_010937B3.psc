;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_SE_MG03_Testing_010937B3 Extends Quest Hidden Const

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

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_SE_JG04_ShipSpawnerScript
Quest __temp = self as Quest
SFBGS00D:SFFL_SE_JG04_ShipSpawnerScript kmyQuest = __temp as SFBGS00D:SFFL_SE_JG04_ShipSpawnerScript
;END AUTOCAST
;BEGIN CODE
;Enemy ships spawn after a random timer set at Stage 10

;Randomize number of ships spawned
int RandomShipPicker = Utility.RandomInt(1,3)

if RandomShipPicker == 1
   ;Spawn 2 of 3 ships
   ;kmyquest.ActivateAttackingShip(1.5,Alias_Enemy01,Alias_PlayerShip)
   ;kmyquest.ActivateAttackingShip(0.5,Alias_Enemy02,Alias_PlayerShip)
   
ElseIf RandomShipPicker == 2
   ;Spawn all 3 ships
   ;kmyquest.ActivateAttackingShip(1.5,Alias_Enemy01,Alias_PlayerShip)
   ;kmyquest.ActivateAttackingShip(0.5,Alias_Enemy02,Alias_PlayerShip)
   ;kmyquest.ActivateAttackingShip(0.5,Alias_Enemy03,Alias_PlayerShip)
Else
   ;Spawn 1 ship
   ;kmyquest.ActivateAttackingShip(1.5,Alias_Enemy01,Alias_PlayerShip)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Enemy01 Auto Const Mandatory

ReferenceAlias Property Alias_Enemy02 Auto Const Mandatory

ReferenceAlias Property Alias_Enemy03 Auto Const Mandatory

ReferenceAlias Property Alias_Player Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory
