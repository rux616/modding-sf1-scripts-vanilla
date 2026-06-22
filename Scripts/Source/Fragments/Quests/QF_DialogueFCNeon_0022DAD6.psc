;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueFCNeon_0022DAD6 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0031_Item_00
Function Fragment_Stage_0031_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_FCNeonKolmanLang.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0101_Item_00
Function Fragment_Stage_0101_Item_00()
;BEGIN CODE
DialogueFCNeon_PlayerHomeQuest.SetStage(30)

if !DialogueFCNeon_PlayerHomeQuest.GetStageDone(30)
	PlayerHouseSystem.PurchaseHouse(FCNeon_TradeTowerHomeGlobal, FCNeon_TradeTowerPlayerHomeKey)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0115_Item_00
Function Fragment_Stage_0115_Item_00()
;BEGIN CODE
FFNeonZ01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0135_Item_00
Function Fragment_Stage_0135_Item_00()
;BEGIN CODE
FFNeonZ02.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0195_Item_00
Function Fragment_Stage_0195_Item_00()
;BEGIN CODE
FFNeonZ03.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0222_Item_00
Function Fragment_Stage_0222_Item_00()
;BEGIN CODE
FFNeonZ04.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0275_Item_00
Function Fragment_Stage_0275_Item_00()
;BEGIN CODE
FFNeonZ05.Start()
FFNeonZ05.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0293_Item_00
Function Fragment_Stage_0293_Item_00()
;BEGIN CODE
;Do a one day timer here (Pass 3)

FFNeonZ06_Controller.Start()
FFNeonZ06_Controller.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0294_Item_00
Function Fragment_Stage_0294_Item_00()
;BEGIN CODE
FFNeonZ06_Controller.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0295_Item_00
Function Fragment_Stage_0295_Item_00()
;BEGIN CODE
FFNeonZ06.Start()
FFNeonZ06.SetStage(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0315_Item_00
Function Fragment_Stage_0315_Item_00()
;BEGIN CODE
RAD03.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN CODE
FFNeonZ12.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0370_Item_00
Function Fragment_Stage_0370_Item_00()
;BEGIN CODE
;Do Rental Stuff Here
;NOTE this has all been moved to phase 4 of rental scene since stages don't repeat

;Increment the Neon_VoliiHotel_RentCount for "secret"
;If Neon_VoliiHotel_RentCount.GetValue() < 4
;Neon_VoliiHotel_RentCount.SetValue(Neon_VoliiHotel_RentCount.GetValue() + 1)
;EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0380_Item_00
Function Fragment_Stage_0380_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits,Neon_VoliiHotel_PermCost.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
;Provide Key and Deduct Credits for access to lounge
Game.GetPlayer().AddItem(City_NE_EuphorikaMemberPass)
If CF06.GetStageDone(46) == 0
Game.GetPlayer().RemoveItem(Credits,Neon_Euphorika_LoungeCost.GetValueInt())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits,NPCDemandMoney_Small.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0445_Item_00
Function Fragment_Stage_0445_Item_00()
;BEGIN CODE
FFNeonZ04.SetObjectiveCompleted(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0455_Item_00
Function Fragment_Stage_0455_Item_00()
;BEGIN CODE
FFNeonZ07.Start()
FFNeonZ07.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0475_Item_00
Function Fragment_Stage_0475_Item_00()
;BEGIN CODE
FFNeonZ08.Start()
FFNeonZ08.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0476_Item_00
Function Fragment_Stage_0476_Item_00()
;BEGIN CODE
FFNeonZ10.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0482_Item_00
Function Fragment_Stage_0482_Item_00()
;BEGIN CODE
SetStage(481)
Game.GetPlayer().RemoveItem(Credits, FC_Neon_BeggarDonationGlobal.GetValueInt())
FC_Neon_BeggarDonationCountGlobal.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0485_Item_00
Function Fragment_Stage_0485_Item_00()
;BEGIN CODE
FFNeonZ11.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0498_Item_00
Function Fragment_Stage_0498_Item_00()
;BEGIN CODE
FFNeonZ09.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0499_Item_00
Function Fragment_Stage_0499_Item_00()
;BEGIN CODE
FFNeonZ09.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0579_Item_00
Function Fragment_Stage_0579_Item_00()
;BEGIN CODE
FFNeonZ12.SetStage(12)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0581_Item_00
Function Fragment_Stage_0581_Item_00()
;BEGIN CODE
FFNeonZ12.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0582_Item_00
Function Fragment_Stage_0582_Item_00()
;BEGIN CODE
FFNeonZ12.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0620_Item_00
Function Fragment_Stage_0620_Item_00()
;BEGIN CODE
DialogueFCNeon_PlayerHomeQuest.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
Alias_FCNeonFranchescaMoore.Clear()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property RAD03 Auto Const Mandatory

ReferenceAlias Property Alias_FCNeonKolmanLang Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

GlobalVariable Property Neon_VoliiHotel_PermCost Auto Const Mandatory

GlobalVariable Property Neon_VoliiHotel_RentCount Auto Const Mandatory

GlobalVariable Property NPCDemandMoney_Small Auto Const Mandatory

Quest Property FFNeonZ04 Auto Const Mandatory

Quest Property FFNeonZ03 Auto Const Mandatory

Quest Property FFNeonZ01 Auto Const Mandatory

Quest Property FFNeonZ02 Auto Const Mandatory

ObjectReference Property FCNeon_EuphorikaMembersDoorRef Auto Const Mandatory

Quest Property FFNeonZ05 Auto Const

Quest Property FFNeonZ06 Auto Const

Quest Property FFNeonZ07 Auto Const

Quest Property FFNeonZ08 Auto Const

Quest Property FFNeonZ09 Auto Const Mandatory

GlobalVariable Property FC_Neon_BeggarDonationGlobal Auto Const Mandatory

GlobalVariable Property FC_Neon_BeggarDonationCountGlobal Auto Const Mandatory

Quest Property FFNeonZ10 Auto Const Mandatory

Quest Property FFNeonZ12 Auto Const Mandatory

ReferenceAlias Property Alias_FCNeonMiguelReeves Auto Const Mandatory

Quest Property DialogueFCNeon_PlayerHomeQuest Auto Const Mandatory

Quest Property FFNeonZ06_Controller Auto Const

Key Property City_NE_EuphorikaMemberPass Auto Const Mandatory

GlobalVariable Property Neon_Euphorika_LoungeCost Auto Const Mandatory

Quest Property FFNeonZ11 Auto Const Mandatory

Quest Property CF06 Auto Const Mandatory

ReferenceAlias Property Alias_FCNeonFranchescaMoore Auto Const Mandatory

sq_playerhousescript Property PlayerHouseSystem Auto Const Mandatory

GlobalVariable Property FCNeon_TradeTowerHomeGlobal Auto Const Mandatory

Key Property FCNeon_TradeTowerPlayerHomeKey Auto Const Mandatory
