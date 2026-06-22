;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_NA_Botany01_00270718 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_StartMarker.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
PointerQuest.SetStage(1000)

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(10)
SetObjectiveCompleted(10)
endif
SetObjectiveDisplayed(20)
;enable sensor refs
Alias_Sensor_Bridge.GetReference().Enable()
Alias_Sensor_Commercial.GetReference().Enable()
Alias_Sensor_Residential.GetReference().Enable()
Alias_Sensor_Suburbs.GetReference().Enable()

;disable misc pointer
PointerQuest.SetStage(1000)

; Flag the other pointer, too
City_NA_GuardPointer_Botany.SetStage(200)

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
if GetStageDone(40)==1 && GetStageDone(50)== 1 && GetStageDone(70)==1
SetStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
if GetStageDone(30)==1 && GetStageDone(50)== 1 && GetStageDone(70)==1
SetStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
if GetStageDone(40)==1 && GetStageDone(30)== 1 && GetStageDone(70)==1
SetStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0056_Item_00
Function Fragment_Stage_0056_Item_00()
;BEGIN CODE
if GetStageDone(58)==0
SetObjectiveDisplayed(58)
endif

Alias_Kid.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0058_Item_00
Function Fragment_Stage_0058_Item_00()
;BEGIN CODE
If GetStageDone(56)==0
SetStage(56)
endif
if IsObjectiveDisplayed(58)
SetObjectiveCompleted(58)
endif
SetObjectiveDisplayed(60)

Alias_Kid.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0061_Item_00
Function Fragment_Stage_0061_Item_00()
;BEGIN CODE
SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0062_Item_00
Function Fragment_Stage_0062_Item_00()
;BEGIN CODE
SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0063_Item_00
Function Fragment_Stage_0063_Item_00()
;BEGIN CODE
SetStage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
Game.GetPlayer().Additem(Alias_Sensor_Commercial.GetReference(), 1)
Game.GetPlayer().RemoveItem(Credits, (City_NA_Botany01_WenPayment.GetValue() as int))
SetStage(70)

;get rid of "Steal sensor" objective if it's displayed
if IsObjectiveDisplayed(69)
SetObjectiveDisplayed(69, false)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0066_Item_00
Function Fragment_Stage_0066_Item_00()
;BEGIN CODE
Game.GetPlayer().Additem(Alias_Sensor_Commercial.GetReference(), 1)
SetStage(70)


;get rid of "Steal sensor" objective if it's displayed
if IsObjectiveDisplayed(69)
SetObjectiveDisplayed(69, false)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0068_Item_00
Function Fragment_Stage_0068_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(69)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0069_Item_00
Function Fragment_Stage_0069_Item_00()
;BEGIN CODE
SetObjectiveCompleted(69)
SetObjectiveDisplayed(60,0)

SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
if GetStageDone(40)==1 && GetStageDone(50)== 1 && GetStageDone(30)==1
SetStage(100)
endif

if IsObjectiveDisplayed(60)
SetObjectiveCompleted(60)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(110)
Game.GetPlayer().RemoveItem(Alias_Sensor_Suburbs.GetReference())
Game.GetPlayer().RemoveItem(Alias_Sensor_Bridge.GetReference())
Game.GetPlayer().RemoveItem(Alias_Sensor_Residential.GetReference())
Game.GetPlayer().RemoveItem(Alias_Sensor_Commercial.GetReference())

City_NA_Botany01_006_KeltonScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110)
SetObjectiveDisplayed(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
CompleteAllObjectives()
City_NA_Botany02.Start()
Stop()

Botany2Timer.SetValue(DaysPassed.GetValue() + 1)

Botany02Pointer.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Sensor_Suburbs Auto Const Mandatory

ReferenceAlias Property Alias_Sensor_Bridge Auto Const Mandatory

ReferenceAlias Property Alias_Sensor_Commercial Auto Const Mandatory

ReferenceAlias Property Alias_Sensor_Residential Auto Const Mandatory

Quest Property City_NA_Botany02 Auto Const Mandatory

ReferenceAlias Property Alias_StartMarker Auto Const Mandatory

Scene Property City_NA_Botany01_006_KeltonScene Auto Const Mandatory

GlobalVariable Property City_NA_Botany01_WenPayment Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

ReferenceAlias Property Alias_Kid Auto Const Mandatory

Quest Property PointerQuest Auto Const

GlobalVariable Property Botany2Timer Auto Const

GlobalVariable Property DaysPassed Auto Const

Quest Property Botany02Pointer Auto Const

ReferenceAlias Property Alias_KeltonFrush Auto Const Mandatory

Quest Property City_NA_GuardPointer_Botany Auto Const Mandatory
