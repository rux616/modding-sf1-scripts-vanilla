;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_PlayerSkills_01000971 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0101_Item_00
Function Fragment_Stage_0101_Item_00()
;BEGIN CODE
game.GetPlayer().ModValue(Health,FitnessHealthBonus)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0102_Item_00
Function Fragment_Stage_0102_Item_00()
;BEGIN CODE
game.GetPlayer().ModValue(Health,FitnessHealthBonus)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0103_Item_00
Function Fragment_Stage_0103_Item_00()
;BEGIN CODE
game.GetPlayer().ModValue(Health,FitnessHealthBonus)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0104_Item_00
Function Fragment_Stage_0104_Item_00()
;BEGIN CODE
game.GetPlayer().ModValue(Health,FitnessHealthBonus)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN CODE
game.GetPlayer().ModValue(Health,FitnessHealthBonus)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0111_Item_00
Function Fragment_Stage_0111_Item_00()
;BEGIN CODE
game.GetPlayer().ModValue(Health,FitnessHealthBonus)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0112_Item_00
Function Fragment_Stage_0112_Item_00()
;BEGIN CODE
game.GetPlayer().ModValue(Health,FitnessHealthBonus)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0113_Item_00
Function Fragment_Stage_0113_Item_00()
;BEGIN CODE
game.GetPlayer().ModValue(Health,FitnessHealthBonus)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0114_Item_00
Function Fragment_Stage_0114_Item_00()
;BEGIN CODE
game.GetPlayer().ModValue(Health,FitnessHealthBonus)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0115_Item_00
Function Fragment_Stage_0115_Item_00()
;BEGIN CODE
game.GetPlayer().ModValue(Health,FitnessHealthBonus)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0201_Item_00
Function Fragment_Stage_0201_Item_00()
;BEGIN CODE
game.GetPlayer().ModValue(CarryWeight,CarryWeightBonus)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0202_Item_00
Function Fragment_Stage_0202_Item_00()
;BEGIN CODE
game.GetPlayer().ModValue(CarryWeight,CarryWeightBonus)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0203_Item_00
Function Fragment_Stage_0203_Item_00()
;BEGIN CODE
game.GetPlayer().ModValue(CarryWeight,CarryWeightBonus)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0204_Item_00
Function Fragment_Stage_0204_Item_00()
;BEGIN CODE
game.GetPlayer().ModValue(CarryWeight,CarryWeightBonus)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0205_Item_00
Function Fragment_Stage_0205_Item_00()
;BEGIN CODE
game.GetPlayer().ModValue(CarryWeight,CarryWeightBonus)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorValue Property Health Auto Const Mandatory

Int Property FitnessHealthBonus = 10 Auto Const

ActorValue Property CarryWeight Auto Const Mandatory

Int Property CarryWeightBonus = 10 Auto Const
