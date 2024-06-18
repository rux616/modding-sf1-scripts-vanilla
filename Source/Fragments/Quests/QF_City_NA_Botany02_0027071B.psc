;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_NA_Botany02_0027071B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
SetStage(1)
Game.GetPlayer().MoveTo(City_NA_Botany01_StartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Alias_EmilioHadek.GetRef().Enable()
Alias_KeltonFrush.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

;get rid of misc objective pointer
Botany02Pointer.SetStage(1000)

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
if (IsObjectiveDisplayed(10))
SetObjectiveCompleted(10)
endif
SetObjectiveDisplayed(20)

;get rid of misc objective pointer
Botany02Pointer.SetStage(1000)

;enable Emilio
Alias_EmilioHadek.GetRef().Enable()
Utility.Wait(2)
Alias_EmilioHadek.GetActorRef().EvaluatePackage()

SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;SetObjectiveCompleted(20)
;SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;If IsObjectiveDisplayed(20)
;SetObjectiveCompleted(20)
;endif

;If IsObjectiveDisplayed(30)
;SetObjectiveCompleted(30)
;endif

SetObjectiveCompleted(20)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(40)
  SetObjectiveDisplayed(40,0)
endif

If IsObjectiveDisplayed(30)
  SetObjectiveDisplayed(30,0)
endif 

If IsObjectiveDisplayed(20)
  SetObjectiveDisplayed(20,0)
endif

if GetStageDone(180) == 0
SetObjectiveDisplayed(150)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
if isObjectiveDisplayed(20)
  SetObjectiveDisplayed(20,0)
endif

if isObjectiveDisplayed(40)
  SetObjectiveDisplayed(40,0)
endif

if IsObjectiveDisplayed(60)
SetObjectiveCompleted(60)
endif

if IsObjectiveDisplayed(20)
SetObjectiveCompleted(20)
endif

if IsObjectiveDisplayed(150)
SetObjectiveCompleted(150)
endif

SetObjectiveDisplayed(180)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_Dataslate.GetRef())
CompleteAllObjectives()
Botany03.Start()
Stop()

;Set a 24 hour timer before Botany03
Botany3Timer.SetValue(DaysPassed.GetValue() + 1)

Botany03Pointer.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_EmilioHadek Auto Const Mandatory

ReferenceAlias Property Alias_DataSlate Auto Const Mandatory

ObjectReference Property City_NA_Botany01_StartMarker Auto Const Mandatory

ReferenceAlias Property Alias_KeltonFrush Auto Const Mandatory

Quest Property City_NA_Botany03 Auto Const Mandatory

Quest Property Botany02Pointer Auto Const

Quest Property Botany03Pointer Auto Const

GlobalVariable Property Botany3Timer Auto Const

GlobalVariable Property DaysPassed Auto Const

Quest Property Botany03 Auto Const
