;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_Player_Patrol0400_002EA968_1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
utility.wait(11)

(Alias_Patrollers.GetAt(0) as SpaceshipReference).EnableWithGravJumpNoWait()
utility.wait(utility.randomfloat(0.2,3.9))
(Alias_Patrollers.GetAt(1) as SpaceshipReference).EnableWithGravJumpNoWait()
utility.wait(utility.randomfloat(0.2,3.9))
(Alias_Patrollers.GetAt(2) as SpaceshipReference).EnableWithGravJumpNoWait()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_Patrollers Auto Const Mandatory
