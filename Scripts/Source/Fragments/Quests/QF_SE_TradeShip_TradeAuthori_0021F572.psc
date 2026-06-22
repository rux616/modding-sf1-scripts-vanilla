;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_TradeShip_TradeAuthori_0021F572 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;stage set by SE Script
pse_TradeShip_TradeAuthority_01_HailingScene.Start()
setstage(100)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property pse_TradeShip_TradeAuthority_01_HailingScene Auto Const Mandatory
