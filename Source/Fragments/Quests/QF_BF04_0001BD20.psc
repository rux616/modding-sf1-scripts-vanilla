;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BF04_0001BD20 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
SetStage(10)
SetStage(20)
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
SetObjectiveDisplayed(50)
SetObjectiveDisplayed(60)
Game.GetPlayer().AddItem(Alias_CF06Microdrive.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Dialogue Marker
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;Dialogue Marker
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60)
If IsObjectiveDisplayed(50) == 1
SetObjectiveDisplayed(50,0)
EndIf
If IsObjectiveDisplayed(70) == 1
SetObjectiveDisplayed(70,0)
EndIf
Alias_CF06_Komiko.GetActorRef().AddItem(Alias_CF06GenerdynePass.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
If GetStageDone(110) == 0
SetObjectiveCompleted(50)
SetObjectiveDisplayed(70)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
SetObjectiveCompleted(70)
If IsObjectiveDisplayed(60) == 1
SetObjectiveDisplayed(60,0)
EndIf
Game.GetPlayer().AddItem(Alias_CF06GenerdynePass.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(50) == 1
SetObjectiveDisplayed(50,0)
Endif
If IsObjectiveDisplayed(60) == 1
SetObjectiveDisplayed(60,0)
Endif
If IsObjectiveDisplayed(70) == 1
SetObjectiveDisplayed(70,0)
EndIf
Game.GetPlayer().AddItem(Alias_CF06GenerdynePass.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(40)
SetObjectiveDisplayed(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
SetObjectiveCompleted(80)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100,1)
Game.GetPlayer().RemoveItem(Alias_CF06Microdrive.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110,1)
SetObjectiveDisplayed(120,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
SetObjectiveCompleted(120,1)
SetObjectiveDisplayed(130,1)
Alias_CF06Naeva.GetActorRef().Moveto(CF06NaevaTalkMarker)
Alias_CF06Naeva.GetActorRef().Enable()

;if quest City_NA_Viewport02 has already started, make Bayu eligible
if City_NA_Viewport02.IsRunning() 
City_NA_Viewport02.SetStage(22)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(130,1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_CF06Microdrive Auto Const Mandatory

ReferenceAlias Property Alias_CF06Evidence Auto Const Mandatory

ReferenceAlias Property Alias_CF06GenerdynePass Auto Const Mandatory

GlobalVariable Property CF06Count Auto Const Mandatory

ReferenceAlias Property Alias_CF06Naeva Auto Const Mandatory

ObjectReference Property CF06NaevaTalkMarker Auto Const Mandatory

Quest Property City_NA_Viewport02 Auto Const Mandatory

ReferenceAlias Property Alias_CF06_Komiko Auto Const Mandatory
