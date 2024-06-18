;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ104B_LinHeller_BaseDial_0027E279 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Int iHirePrice

If GetStageDone(20) == 1
  iHirePrice = 250
Else
  iHirePrice = 500
EndIf

Game.GetPlayer().removeitem(credits, iHirePrice)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Credits Auto Const Mandatory
