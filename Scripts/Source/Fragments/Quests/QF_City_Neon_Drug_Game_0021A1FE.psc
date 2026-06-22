;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_Neon_Drug_Game_0021A1FE Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Remove all the items from the hoppers
debug.trace(self + " Stage 100")
;/
Alias_IngredientHopper.GetRef().RemoveAllItems()
Alias_AssemblyHopper.GetRef().RemoveAllItems()

; Set up the round of manufacturing the player's on
Neon_Drug_ManufactureCount.Mod(1.0)
debug.trace(self + " Neon_Drug_ManufactureCount=" + Neon_Drug_ManufactureCount.GetValue())
/;
SetStage(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
debug.trace(self + " stage 120")
;/
; Add the right leveled list to the Ingredients
Alias_IngredientHopper.GetRef().AddItem(Drug02_Game_Aurora01Hopper)

; Play the scene
City_Neon_Drug_Game_120_Aurora01.Start()
/;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
Alias_ConveyorBelt.GetRef().PlayAnimation("play01")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
debug.trace(self + " stage 200 - ran out of time")
Neon_Drug_06_TimedOutFollowup.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN AUTOCAST TYPE City_Neon_DrugGameScript
Quest __temp = self as Quest
City_Neon_DrugGameScript kmyQuest = __temp as City_Neon_DrugGameScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " stage 220")

kmyQuest.ValidateItemsUsed()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0280_Item_00
Function Fragment_Stage_0280_Item_00()
;BEGIN CODE
debug.trace(self + " stage 280")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
debug.trace(self + " stage 300")

City_Neon_Drug_Game_200_AssemblyComplete.Start()

SetStage(350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0325_Item_00
Function Fragment_Stage_0325_Item_00()
;BEGIN CODE
debug.trace(self + " stage 325 - failed to make anything")

; Timed out message
Neon_Drug_05_TimedOut.Show()

SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN AUTOCAST TYPE City_Neon_DrugGameScript
Quest __temp = self as Quest
City_Neon_DrugGameScript kmyQuest = __temp as City_Neon_DrugGameScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " stage 350 - RewardPlayer()")

kmyQuest.RewardPlayer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE City_Neon_DrugGameScript
Quest __temp = self as Quest
City_Neon_DrugGameScript kmyQuest = __temp as City_Neon_DrugGameScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " stage 400")

kmyQuest.Cleanup()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property City_Neon_Drug_Game_200_AssemblyComplete Auto Const Mandatory

Message Property Neon_Drug_05_TimedOut Auto Const Mandatory

ReferenceAlias Property Alias_ConveyorBelt Auto Const Mandatory

Message Property Neon_Drug_06_TimedOutFollowup Auto Const Mandatory
