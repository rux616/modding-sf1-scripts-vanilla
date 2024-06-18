Scriptname FFClinicR02QuestScript extends Quest Conditional


MiscObject Property OrgCommonToxin Auto Const Mandatory

MiscObject Property OrgCommonSealant Auto Const Mandatory

MiscObject Property OrgUncommonMembrane Auto Const Mandatory

MiscObject Property OrgUncommonAntibiotic Auto Const Mandatory

MiscObject Property OrgRareAnalgesic Auto Const Mandatory

MiscObject Property OrgRareSedative Auto Const Mandatory

MiscObject Property OrgExoticNarcotic Auto Const Mandatory

MiscObject Property OrgExoticBiosuppressant Auto Const Mandatory

GlobalVariable Property FFClinicR02ResourceNumber Auto Const Mandatory

GlobalVariable Property FFClinicR02ItemTotal Auto Const Mandatory

GlobalVariable Property FFClinicR02Reward Auto Const Mandatory

Resource Property ResourceOrgCommonSealant Auto Const

Resource Property ResCommonToxin Auto Const

Resource Property ResOrgExoticBiosuppressant Auto Const

Resource Property ResOrgExoticNarcotic Auto Const

Resource Property ResOrgRareAnalgesic Auto Const

Resource Property ResOrgRareSedative Auto Const

Resource Property ResOrgUncommonAntibiotic Auto Const

Resource Property ResOrgUncommonMembrane Auto Const




Function CalculateRewards()

if FFClinicR02ResourceNumber.GetValueInt() == 1
	FFClinicR02Reward.SetValue(FFClinicR02ItemTotal.GetValueInt() * (OrgCommonToxin.GetGoldValue() as int) * 1.5)
elseif FFClinicR02ResourceNumber.GetValueInt() == 2
	FFClinicR02Reward.SetValue(FFClinicR02ItemTotal.GetValueInt() * (OrgCommonSealant.GetGoldValue() as int) * 1.5)
elseif FFClinicR02ResourceNumber.GetValueInt() == 3
	FFClinicR02Reward.SetValue(FFClinicR02ItemTotal.GetValueInt() * (OrgUncommonMembrane.GetGoldValue() as int) * 1.5)
elseif FFClinicR02ResourceNumber.GetValueInt() == 4
	FFClinicR02Reward.SetValue(FFClinicR02ItemTotal.GetValueInt() * (OrgUncommonAntibiotic.GetGoldValue() as int) * 1.5)
elseif FFClinicR02ResourceNumber.GetValueInt() == 5
	FFClinicR02Reward.SetValue(FFClinicR02ItemTotal.GetValueInt() * (OrgRareAnalgesic.GetGoldValue() as int) * 1.5)
elseif FFClinicR02ResourceNumber.GetValueInt() == 6
	FFClinicR02Reward.SetValue(FFClinicR02ItemTotal.GetValueInt() * (OrgRareSedative.GetGoldValue() as int) * 1.5)
elseif FFClinicR02ResourceNumber.GetValueInt() == 7
	FFClinicR02Reward.SetValue(FFClinicR02ItemTotal.GetValueInt() * (OrgExoticNarcotic.GetGoldValue() as int) * 1.5)
elseif FFClinicR02ResourceNumber.GetValueInt() == 8
	FFClinicR02Reward.SetValue(FFClinicR02ItemTotal.GetValueInt() * (OrgExoticBiosuppressant.GetGoldValue() as int) * 1.5)
endif

UpdateCurrentInstanceGlobal(FFClinicR02ItemTotal)

EndFunction


Function RemoveResourceItems()

if FFClinicR02ResourceNumber.GetValueInt() == 1
	Game.GetPlayer().RemoveItem(ResCommonToxin, FFClinicR02ItemTotal.GetValueInt())
elseif FFClinicR02ResourceNumber.GetValueInt() == 2
	Game.GetPlayer().RemoveItem(ResourceOrgCommonSealant, FFClinicR02ItemTotal.GetValueInt())
elseif FFClinicR02ResourceNumber.GetValueInt() == 3
	Game.GetPlayer().RemoveItem(ResOrgUncommonMembrane, FFClinicR02ItemTotal.GetValueInt())
elseif FFClinicR02ResourceNumber.GetValueInt() == 4
	Game.GetPlayer().RemoveItem(ResOrgUncommonAntibiotic, FFClinicR02ItemTotal.GetValueInt())
elseif FFClinicR02ResourceNumber.GetValueInt() == 5
	Game.GetPlayer().RemoveItem(ResOrgRareAnalgesic, FFClinicR02ItemTotal.GetValueInt())
elseif FFClinicR02ResourceNumber.GetValueInt() == 6
	Game.GetPlayer().RemoveItem(ResOrgRareSedative, FFClinicR02ItemTotal.GetValueInt())
elseif FFClinicR02ResourceNumber.GetValueInt() == 7
	Game.GetPlayer().RemoveItem(ResOrgExoticNarcotic, FFClinicR02ItemTotal.GetValueInt())
elseif FFClinicR02ResourceNumber.GetValueInt() == 8
	Game.GetPlayer().RemoveItem(ResOrgExoticBiosuppressant, FFClinicR02ItemTotal.GetValueInt())
endif
SetStage(200)
EndFunction
