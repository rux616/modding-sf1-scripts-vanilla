;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_AkilaLife03_00112373 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(FAB_Book_TheCountOfMonteCristo_m)

; Track how many books have been found
AkilaLife03_BookReturnCount.Mod(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(EAW_Book_Dracula_m)

; Track how many books have been found
AkilaLife03_BookReturnCount.Mod(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(EAW_Book_HistoryOfPyrates_m)

; Track how many books have been found
AkilaLife03_BookReturnCount.Mod(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(EAW_Book_LastDays_m)

; Track how many books have been found
AkilaLife03_BookReturnCount.Mod(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(EAW_Book_MobyDick_m)

; Track how many books have been found
AkilaLife03_BookReturnCount.Mod(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(EAW_Book_SpaceAndTime_m)

; Track how many books have been found
AkilaLife03_BookReturnCount.Mod(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0270_Item_00
Function Fragment_Stage_0270_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(EAW_Book_TheComet_m)

; Track how many books have been found
AkilaLife03_BookReturnCount.Mod(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0280_Item_00
Function Fragment_Stage_0280_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(EAW_Book_WarOfWorlds_m)

; Track how many books have been found
AkilaLife03_BookReturnCount.Mod(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9000_Item_00
Function Fragment_Stage_9000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Book Property FAB_Book_TheCountOfMonteCristo_m Auto Const Mandatory

Book Property EAW_Book_Dracula_m Auto Const Mandatory

Book Property EAW_Book_HistoryOfPyrates_m Auto Const Mandatory

Book Property EAW_Book_LastDays_m Auto Const Mandatory

Book Property EAW_Book_MobyDick_m Auto Const Mandatory

Book Property EAW_Book_SpaceAndTime_m Auto Const Mandatory

Book Property EAW_Book_TheComet_m Auto Const Mandatory

Book Property EAW_Book_WarOfWorlds_m Auto Const Mandatory

GlobalVariable Property AkilaLife03_BookReturnCount Auto Const Mandatory
