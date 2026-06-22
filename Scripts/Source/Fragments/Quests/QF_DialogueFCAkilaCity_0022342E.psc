;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueFCAkilaCity_0022342E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; Set FC01 to complete
FC01.SetStage(2000)

; Disable the bank robbers inside and out
FC01_BankRobbersEnableMarker.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_DuncanLynch.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Start up quests 
City_AkilaLife06.Start()
City_AkilaLife08.Start()
City_Akila_Jansen.Start()
City_AkilaLife03.Start()
City_AkilaLife07.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Set in end data of Annie's greeting scene

; Used as a condition to prevent the greeting scene from playing more than once
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN CODE
; Set in end data of Elias's greeting scene

; Spin up AkilaLife02 in the background
City_AkilaLife02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
; Set in end data of Amira's greeting scene
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0112_Item_00
Function Fragment_Stage_0112_Item_00()
;BEGIN CODE
; Set at the end of Amira's greeting scene if the player donates money
; Remove 50 credits from the player

Alias_PLayer.GetActorRef().RemoveItem(credits, City_AC_LowHouseDonation.GetValue() as int)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0115_Item_00
Function Fragment_Stage_0115_Item_00()
;BEGIN CODE
; Set in end data of Earl's greeting scene
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0117_Item_00
Function Fragment_Stage_0117_Item_00()
;BEGIN CODE
; Set at the end of Earl's greeting scene if the player pays for zoo
; Remove 10 credits from the player

Alias_PLayer.GetActorRef().RemoveItem(credits, 10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0119_Item_00
Function Fragment_Stage_0119_Item_00()
;BEGIN CODE
; Earl shames the player
AkilaCity_Earl_SnuckIn.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
RAD03.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0525_Item_00
Function Fragment_Stage_0525_Item_00()
;BEGIN CODE
; As soon as you start talking to Sarah, spin up Akila04
City_AkilaLife04.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN CODE
; Purchase the house.
PlayerHouseSystem.PurchaseHouse(PlayerHouse_AC_MidtownCost, CityAkilaCityMidtownHouseKey)

FC_AC_Home_MidtownHouse_Misc.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0820_Item_00
Function Fragment_Stage_0820_Item_00()
;BEGIN CODE
; Purchase the house.
PlayerHouseSystem.PurchaseHouse(PlayerHouse_AC_CoreCost, CityAkilaCityCoreHouseKey)

UC_AC_Home_CoreHouse_Misc.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
; Spin up some city life quests
City_AkilaLife01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2015_Item_00
Function Fragment_Stage_2015_Item_00()
;BEGIN CODE
; Just make sure the scene is dead - because otherwise it'll mess up quests
AkilaCityLife_2010_Davis.Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Player Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

ObjectReference Property FC01_BankRobbersEnableMarker Auto Const Mandatory

Quest Property FC01 Auto Const Mandatory

Quest Property RAD03 Auto Const Mandatory

ReferenceAlias Property Alias_DuncanLynch Auto Const Mandatory

Quest Property City_AkilaLife01 Auto Const Mandatory

Quest Property City_AkilaLife02 Auto Const Mandatory

GlobalVariable Property PlayerHouse_AC_CoreCost Auto Const Mandatory

GlobalVariable Property PlayerHouse_AC_MidtownCost Auto Const Mandatory

Scene Property AkilaCity_Earl_SnuckIn Auto Const Mandatory

Quest Property City_AkilaLife04 Auto Const Mandatory

Quest Property City_AkilaLife06 Auto Const Mandatory

Quest Property City_AkilaLife08 Auto Const Mandatory

Key Property CityAkilaCityCoreHouseKey Auto Const Mandatory

Quest Property UC_AC_Home_CoreHouse_Misc Auto Const Mandatory

Quest Property FC_AC_Home_MidtownHouse_Misc Auto Const Mandatory

Key Property CityAkilaCityMidtownHouseKey Auto Const Mandatory

Scene Property AkilaCityLife_2010_Davis Auto Const Mandatory

ReferenceAlias Property Alias_AugustBowen Auto Const Mandatory

Quest Property City_Akila_Jansen Auto Const Mandatory

ReferenceAlias Property Alias_JustinSnead Auto Const Mandatory

Quest Property City_AkilaLife03 Auto Const Mandatory

Quest Property City_AkilaLife07 Auto Const Mandatory

Quest Property City_AC_FAB_Quest18 Auto Const Mandatory

SQ_PlayerHouseScript Property PlayerHouseSystem Auto Const Mandatory

ReferenceAlias Property Alias_EarlFulton Auto Const Mandatory

GlobalVariable Property City_AC_LowHouseDonation Auto Const Mandatory
