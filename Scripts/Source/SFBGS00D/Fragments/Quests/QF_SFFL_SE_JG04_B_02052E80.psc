;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_SE_JG04_B_02052E80 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE oe_simpletimer
Quest __temp = self as Quest
oe_simpletimer kmyQuest = __temp as oe_simpletimer
;END AUTOCAST
;BEGIN CODE
;kmyquest.StartWaitTimer()

Utility.Wait(5)
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Player interacts with destroyed ship containers and springs the trap
;Timers are for effect, a staggered grav jump arrival

;Alias_Enemy01.GetShipReference().EnableWithGravJump()
;Alias_Enemy01.GetShipReference().StartCombat(Alias_PlayerShip.GetShipReference())

SpaceShipReference EnemyShipREF01 = Alias_Enemy01.GetRef() as SpaceshipReference
EnemyShipREF01.EnableWithGravJump()
EnemyShipREF01.StartCombat(Alias_PlayerShip.GetRef() as SpaceshipReference)


Utility.Wait(1)

;Alias_Enemy02.GetShipReference().EnableWithGravJump()
;Alias_Enemy02.GetShipReference().StartCombat(Alias_PlayerShip.GetShipReference())

Utility.Wait(0.5)

;Alias_Enemy03.GetShipReference().EnableWithGravJump()
;Alias_Enemy03.GetShipReference().StartCombat(Alias_PlayerShip.GetShipReference())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Enemy01 Auto Const Mandatory

ReferenceAlias Property Alias_Enemy02 Auto Const Mandatory

ReferenceAlias Property Alias_Enemy03 Auto Const Mandatory

ReferenceAlias Property Alias_Player Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory
