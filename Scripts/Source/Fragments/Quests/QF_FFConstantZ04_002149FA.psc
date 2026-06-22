;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFConstantZ04_002149FA Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Janet.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Oliver.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
Game.GetPlayer().Additem(Credits, FFConstantZ04_Debt.GetValue() as Int)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Janet.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Complete the Misc Pointer Quest if it's still running.
If FFConstantZ04Misc.IsRunning()
	FFConstantZ04Misc.SetStage(1000)
EndIf

SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0270_Item_00
Function Fragment_Stage_0270_Item_00()
;BEGIN CODE
;We check to make sure the player has this first in 
;FFConstantZ04_0200_Oliver_Top_JanetDebt, Action 6
Game.GetPlayer().RemoveItem(Credits, FFConstantZ04_Debt.GetValue() as Int)

SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(200)
	SetObjectiveCompleted(200)
EndIf
If IsObjectiveDisplayed(250)
	SetObjectiveCompleted(250)
EndIf
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Sets a stage on the Dialogue quest to handle disabling Janet.
DialogueECSConstant.SetStage(1450)

Game.GetPlayer().SetValue(FFConstantZ04_ForeknowledgeAV, 1)

CompleteAllObjectives()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Credits Auto Const Mandatory

GlobalVariable Property FFConstantZ04_Debt Auto Const Mandatory

GlobalVariable Property ECS_EndState Auto Const Mandatory

ReferenceAlias Property Alias_Janet Auto Const Mandatory

ReferenceAlias Property Alias_Oliver Auto Const Mandatory

Quest Property FFConstantZ04Misc Auto Const Mandatory

Quest Property DialogueECSConstant Auto Const Mandatory

ActorValue Property FFConstantZ04_ForeknowledgeAV Auto Const Mandatory
