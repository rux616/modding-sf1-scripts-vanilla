;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_TradeShip_DataBroker_0010FAE5 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
pse_tradeshipDataBroker_01_HailingScene.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
PSE_TradeShip_DataBrokerIsDead.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property pse_tradeshipUC_01_AcceptSceneCOPY0000 Auto Const Mandatory

Scene Property pse_tradeshipUC_01_HailingSceneCOPY0000 Auto Const Mandatory

Scene Property Pse_tradeshipDataBroker_01_HailingScene Auto Const Mandatory

GlobalVariable Property PSE_TradeShip_DataBrokerIsDead Auto Const Mandatory
