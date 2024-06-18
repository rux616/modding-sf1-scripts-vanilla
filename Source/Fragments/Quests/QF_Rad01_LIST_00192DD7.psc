;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Rad01_LIST_00192DD7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Alias_Papers.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Game.GetPlayer().additem(Rad01_Book)
Game.GetPlayer().additem(Rad01_Book01)
SetStage(100)
SetStage(200)
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

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(190)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0199_Item_00
Function Fragment_Stage_0199_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(190) == 0
 SetObjectiveDisplayed(190)
 SetObjectiveCompleted(190)
endif

if IsObjectiveDisplayed(190) == 1
SetObjectiveCompleted(190)
endif

if IsObjectiveCompleted(100) == 0
 SetObjectiveSkipped(100) 
endif

if GetStageDone(299) || GetStageDone(500)
   SetStage(900)
endif
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

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0299_Item_00
Function Fragment_Stage_0299_Item_00()
;BEGIN CODE
SetObjectiveCompleted(250)
Rad01_RecruitTutorialComplete.SetValue(1)
if GetStageDone(199)
   SetStage(900)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveFailed(250)
Rad01_RecruitTutorialComplete.SetValue(1)
if GetStageDone(199)
   SetStage(900)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
;we are leaving this quest running for other dialogue, etc.
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Papers Auto Const Mandatory

GlobalVariable Property Rad01_RecruitTutorialComplete Auto Const Mandatory

Book Property Rad01_Book Auto Const Mandatory

Book Property Rad01_Book01 Auto Const
