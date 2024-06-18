;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS05_00299E79 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Game.GetPlayer().moveto(DebugStaryardMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Credits, MS05BudgetPlayerPay.GetValue() as Int)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
MS05_RDIntroScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(150)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
MS05Budget.SetValue(-1)
Game.GetPlayer().SetValue(MS05_Foreknowledge_JulesConvinceAV, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
MS05Budget.SetValue(1)
Game.GetPlayer().SetValue(MS05_Foreknowledge_FrankConvinceAV, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
MS05Budget.SetValue(-1)

SetObjectiveCompleted(250)
SetObjectiveDisplayed(270, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0270_Item_00
Function Fragment_Stage_0270_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(270)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0280_Item_00
Function Fragment_Stage_0280_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, MS05BudgetPlayerPay.GetValue() as Int)
MS05Budget.SetValue(-1)

SetObjectiveDisplayed(250, False)
SetObjectiveCompleted(270)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN CODE
If GetStageDone(320) && GetStageDone(330) && GetStageDone(340) && GetStageDone(350)
	SetStage(360)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN CODE
If GetStageDone(310) && GetStageDone(330) && GetStageDone(340) && GetStageDone(350)
	SetStage(360)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN CODE
If GetStageDone(310) && GetStageDone(320) && GetStageDone(340) && GetStageDone(350)
	SetStage(360)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0340_Item_00
Function Fragment_Stage_0340_Item_00()
;BEGIN CODE
If GetStageDone(310) && GetStageDone(320) && GetStageDone(330) && GetStageDone(350)
	SetStage(360)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
If GetStageDone(310) && GetStageDone(320) && GetStageDone(330) && GetStageDone(340)
	SetStage(360)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE MS05QuestScript
Quest __temp = self as Quest
MS05QuestScript kmyQuest = __temp as MS05QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(400)
SetObjectiveDisplayed(510)
SetObjectiveDisplayed(520)

;Start tracking Mission completions
kmyQuest.StartMissions()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(510) && !IsObjectiveCompleted(510)
	SetObjectiveCompleted(510)
EndIf
If IsObjectiveDisplayed(511) && !IsObjectiveCompleted(511)
	SetObjectiveCompleted(511)
EndIf

If IsObjectiveDisplayed(520) && !GetStageDone(520)
	SetObjectiveDisplayed(520, False)
	SetObjectiveDisplayed(521)
EndIf

If GetStageDone(520)
	SetStage(550)
EndIf

SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(520) && !IsObjectiveCompleted(520)
	SetObjectiveCompleted(520)
EndIf
If IsObjectiveDisplayed(521) && !IsObjectiveCompleted(521)
	SetObjectiveCompleted(521)
EndIf

If IsObjectiveDisplayed(510) && !GetStageDone(510)
	SetObjectiveDisplayed(510, False)
	SetObjectiveDisplayed(511)
EndIf

If GetStageDone(510)
	SetStage(550)
EndIf

SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN AUTOCAST TYPE MS05QuestScript
Quest __temp = self as Quest
MS05QuestScript kmyQuest = __temp as MS05QuestScript
;END AUTOCAST
;BEGIN CODE
;Unregisters for MissionCompleted Events
kmyQuest.MissionsCompleted()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)
SetObjectiveDisplayed(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0601_Item_00
Function Fragment_Stage_0601_Item_00()
;BEGIN AUTOCAST TYPE MS05QuestScript
Quest __temp = self as Quest
MS05QuestScript kmyQuest = __temp as MS05QuestScript
;END AUTOCAST
;BEGIN CODE
;Unregisters for MissionCompleted Events
kmyQuest.MissionsCompleted()

;Set the MS05Market Value depending on how many missions the player ran.
;This will be used to calculate the final ship design value.
If GetStageDone(550)
	MS05Market.SetValue(-1)
Else
	MS05Market.SetValue(1)
EndIf

;Fail the remaining optional objective, if not completed
If IsObjectiveDisplayed(511) && !IsObjectiveCompleted(511)
	SetObjectiveFailed(511)
EndIf
If IsObjectiveDisplayed(521) && !IsObjectiveCompleted(521)
	SetObjectiveFailed(521)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
MS05Interpersonal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0620_Item_00
Function Fragment_Stage_0620_Item_00()
;BEGIN CODE
MS05Interpersonal.SetValue(-1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
;Add the values of the player's choices together and set the 
;MS05ShipDesign value. 
;A total positive value will result in the sensible ship design
;A total negative value will result in the ridiculous ship design
Float fShipDesignTotal = MS05Budget.GetValue() + MS05Market.GetValue() + MS05Interpersonal.GetValue()
MS05ShipDesign.SetValue(fShipDesignTotal)

SetObjectiveCompleted(500)
SetObjectiveCompleted(600)
SetObjectiveDisplayed(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
If !IsObjectiveCompleted(300)
	SetObjectiveFailed(300)
EndIf

SetObjectiveCompleted(700)
SetObjectiveDisplayed(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()

;Cooldown on SE to prevent it from spinning up too soon
float currentGameTime = Utility.GetCurrentGameTime()
SE_Player_ZW16a_Timestamp.SetValue(currentGameTime + cooldownDays)
SE_Player_ZW16B_Timestamp.SetValue(currentGameTime + cooldownDays)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
MS05Reward.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property MS05_RDIntroScene Auto Const

Message Property MS05_Stage300Temp_Message Auto Const

Message Property PMS05_Stage500Temp_Message Auto Const Mandatory

Message Property MS05_Stage500Temp_Message Auto Const
ObjectReference Property DebugStaryardMarker Auto Const

GlobalVariable Property MS05Interpersonal Auto Const Mandatory

GlobalVariable Property MS05Market Auto Const Mandatory

GlobalVariable Property MS05Budget Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

GlobalVariable Property MS05BudgetPlayerPay Auto Const Mandatory

GlobalVariable Property MS05ShipDesign Auto Const Mandatory

ActorValue Property MS05_Foreknowledge_JulesConvinceAV Auto Const Mandatory

ActorValue Property MS05_Foreknowledge_FrankConvinceAV Auto Const Mandatory

Quest Property MS05Reward Auto Const Mandatory

Float Property cooldownDays Auto Const Mandatory

GlobalVariable Property SE_Player_ZW16a_Timestamp Auto Const Mandatory

GlobalVariable Property SE_Player_ZW16b_Timestamp Auto Const Mandatory
