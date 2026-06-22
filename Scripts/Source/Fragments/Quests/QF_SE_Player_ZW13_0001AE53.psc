;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_Player_ZW13_0001AE53 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
utility.wait(5)
Spaceshipreference myShip = Alias_Datura.GetRef() as SpaceshipReference
myShip.enablewithgravjump()
myship.StartCombat(Alias_PlayerShip.GetRef() as SpaceshipReference)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
PRI03_MalaiDead.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property PRI03_MalaiDead Auto Const Mandatory

ReferenceAlias Property Alias_Datura Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

ReferenceAlias Property Alias_Player Auto Const Mandatory
