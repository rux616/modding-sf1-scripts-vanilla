;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_Player_Bountyships_Fre_000937FD Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Utility.wait(7)
SpaceshipReference myship01 = Alias_BountyShip01.GetRef() as SpaceshipReference
myship01.enablewithgravjump()
Utility.wait(1)
SpaceshipReference myship02 = Alias_BountyShip02.GetRef() as SpaceshipReference
myship02.enablewithgravjump()
Utility.wait(0.3)
SpaceshipReference myship03 = Alias_BountyShip03.GetRef() as SpaceshipReference
myship03.enablewithgravjump()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_BountyShip01 Auto Const Mandatory

ReferenceAlias Property Alias_BountyShip02 Auto Const Mandatory

ReferenceAlias Property Alias_BountyShip03 Auto Const Mandatory
