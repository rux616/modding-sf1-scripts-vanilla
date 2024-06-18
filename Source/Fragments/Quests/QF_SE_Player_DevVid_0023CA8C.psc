;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_Player_DevVid_0023CA8C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SpaceshipReference Ship01 = Alias_Ship01.GetRef() as SpaceshipReference
SpaceshipReference Ship02 = Alias_Ship02.GetRef() as SpaceshipReference
SpaceshipReference Ship03 = Alias_Ship03.GetRef() as SpaceshipReference

Utility.wait(7.0)
Ship01.EnableWithGravJump()
Utility.wait(1.0)
Ship02.EnableWithGravJump()
Utility.wait(1.0)
Ship03.EnableWithGravJump()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SpaceshipReference Ship04 = Alias_Ship04.GetRef() as SpaceshipReference
SpaceshipReference Ship05 = Alias_Ship05.GetRef() as SpaceshipReference
SpaceshipReference Ship06 = Alias_Ship06.GetRef() as SpaceshipReference

Utility.wait(1.0)
Ship04.EnableWithGravJump()
Utility.wait(1.0)
Ship05.EnableWithGravJump()
Utility.wait(1.0)
Ship06.EnableWithGravJump()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Ship01 Auto Const Mandatory

ReferenceAlias Property Alias_Ship02 Auto Const Mandatory

ReferenceAlias Property Alias_Ship03 Auto Const Mandatory

ReferenceAlias Property Alias_Ship04 Auto Const Mandatory

ReferenceAlias Property Alias_Ship05 Auto Const Mandatory

ReferenceAlias Property Alias_Ship06 Auto Const Mandatory
