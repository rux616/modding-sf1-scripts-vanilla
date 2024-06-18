;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_CY_Psych01_00225130 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Andres.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Hank.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Leona.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Samund.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Complete the Misc Pointer Quest if it's still running.
If City_CY_Psych01Misc.IsRunning()
	City_CY_Psych01Misc.SetStage(1000)
EndIf

Actor myPlayer = Game.GetPlayer()
myPlayer.AddItem(Alias_AndresQuestions.GetRef())
myPlayer.AddItem(Alias_LeonaQuestions.GetRef())
myPlayer.AddItem(Alias_SamundQuestions.GetRef())
SetObjectiveDisplayed(110)
SetObjectiveDisplayed(130)
SetObjectiveDisplayed(140)

;If Hank is dead or jailed, we don't need his questionnaire.
If !City_CY_RedTape03_HankGoneConditionForm.IsTrue()
	SetObjectiveDisplayed(120)
	myPlayer.AddItem(Alias_HankQuestions.GetRef())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110)

Actor myPlayer = Game.GetPlayer()
Float myRequestValue = City_CY_RedTape02Request01.GetValue()
Bool myHankBool = City_CY_RedTape03_HankGoneConditionForm.IsTrue()

myPlayer.RemoveItem(Alias_AndresQuestions.GetRef())

If myRequestValue == 0 && myHankBool == False
	myPlayer.AddItem(Alias_AndresAnswers01.GetRef())

ElseIf myRequestValue == 1 && myHankBool == False
	myPlayer.AddItem(Alias_AndresAnswers02.GetRef())

ElseIf myRequestValue == 0 && myHankBool == True
	myPlayer.AddItem(Alias_AndresAnswers03.GetRef())

ElseIf myRequestValue == 1 && myHankBool == True
	myPlayer.AddItem(Alias_AndresAnswers04.GetRef())
EndIf

;Check for objective completion
If myHankBool
	If City_CY_Psych01_CheckStagesNoHankConditionForm.IsTrue()
		SetStage(200)
	EndIf
Else
	If City_CY_Psych01_CheckStagesConditionForm.IsTrue()
		SetStage(200)
	EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
SetObjectiveCompleted(120)

Actor myPlayer = Game.GetPlayer()
myPlayer.RemoveItem(Alias_HankQuestions.GetRef())
myPlayer.AddItem(Alias_HankAnswers.GetRef())

;Check for objective completion
If City_CY_Psych01_CheckStagesConditionForm.IsTrue()
	SetStage(200)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0121_Item_00
Function Fragment_Stage_0121_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(120, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
SetObjectiveCompleted(130)

Actor myPlayer = Game.GetPlayer()
myPlayer.RemoveItem(Alias_LeonaQuestions.GetRef())
myPlayer.AddItem(Alias_LeonaAnswers.GetRef())

;Check for objective completion
If City_CY_RedTape03_HankGoneConditionForm.IsTrue()
	If City_CY_Psych01_CheckStagesNoHankConditionForm.IsTrue()
		SetStage(200)
	EndIf
Else
	If City_CY_Psych01_CheckStagesConditionForm.IsTrue()
		SetStage(200)
	EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
SetObjectiveCompleted(140)

Actor myPlayer = Game.GetPlayer()
myPlayer.RemoveItem(Alias_SamundQuestions.GetRef())
myPlayer.AddItem(Alias_SamundAnswers.GetRef())

;Check for objective completion
If City_CY_RedTape03_HankGoneConditionForm.IsTrue()
	If City_CY_Psych01_CheckStagesNoHankConditionForm.IsTrue()
		SetStage(200)
	EndIf
Else
	If City_CY_Psych01_CheckStagesConditionForm.IsTrue()
		SetStage(200)
	EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0201_Item_00
Function Fragment_Stage_0201_Item_00()
;BEGIN CODE
Alias_Leona.GetActorRef().Say(City_CY_Psych01_0201_Leona)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Actor myPlayer = Game.GetPlayer()
myPlayer.RemoveItem(Alias_HankQuestions.GetRef())

myPlayer.RemoveItem(Alias_AndresAnswers01.GetRef())
myPlayer.RemoveItem(Alias_AndresAnswers02.GetRef())
myPlayer.RemoveItem(Alias_AndresAnswers03.GetRef())
myPlayer.RemoveItem(Alias_AndresAnswers04.GetRef())
myPlayer.RemoveItem(Alias_HankAnswers.GetRef())
myPlayer.RemoveItem(Alias_LeonaAnswers.GetRef())
myPlayer.RemoveItem(Alias_SamundAnswers.GetRef())


SetObjectiveCompleted(200)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_AndresAnswers01 Auto Const Mandatory

ReferenceAlias Property Alias_AndresAnswers02 Auto Const Mandatory

ReferenceAlias Property Alias_AndresAnswers03 Auto Const Mandatory

ReferenceAlias Property Alias_AndresAnswers04 Auto Const Mandatory

ReferenceAlias Property Alias_HankAnswers Auto Const Mandatory

ReferenceAlias Property Alias_LeonaAnswers Auto Const Mandatory

ReferenceAlias Property Alias_SamundAnswers Auto Const Mandatory

ReferenceAlias Property Alias_AndresQuestions Auto Const Mandatory

ReferenceAlias Property Alias_HankQuestions Auto Const Mandatory

ReferenceAlias Property Alias_LeonaQuestions Auto Const Mandatory

ReferenceAlias Property Alias_SamundQuestions Auto Const Mandatory

GlobalVariable Property City_CY_RedTape02Request01 Auto Const Mandatory

Quest Property City_CY_RedTape03 Auto Const Mandatory

ConditionForm Property City_CY_RedTape03_HankGoneConditionForm Auto Const Mandatory

ConditionForm Property City_CY_Psych01_CheckStagesConditionForm Auto Const Mandatory

ConditionForm Property City_CY_Psych01_CheckStagesNoHankConditionForm Auto Const Mandatory

Quest Property City_CY_Psych01Misc Auto Const Mandatory

Topic Property City_CY_Psych01_0201_Leona Auto Const Mandatory

ReferenceAlias Property Alias_Andres Auto Const Mandatory

ReferenceAlias Property Alias_Hank Auto Const Mandatory

ReferenceAlias Property Alias_Leona Auto Const Mandatory

ReferenceAlias Property Alias_Samund Auto Const Mandatory

Float[] Property MarkerOffset Auto Const

ReferenceAlias Property Alias_SlateMarker Auto Const Mandatory
