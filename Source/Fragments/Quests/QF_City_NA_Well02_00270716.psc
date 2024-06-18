;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_NA_Well02_00270716 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
City_NA_Well01.SetStage(200)


Alias_LouisaReyez.GetReference().MoveTo(Alias_Louisa_Startmarker.GetReference())
Game.GetPlayer().MoveTo(Alias_Startmarker.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

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
City_NA_Well02_002_Zoe_Louisa.Start()
Alias_LouisaReyez.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
Alias_ZoeKaminski.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
Alias_LouisaReyez.GetActorReference().EvaluatePackage()
City_NA_Well02_004_Zoe_Louisa_Stage40.Start()
Alias_ZoeKaminski.GetActorReference().EvaluatePackage()
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
Alias_ZoeKaminski.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)
Alias_ZoeKaminski.GetActorReference().EvaluatePackage()
Alias_BoxDoor01.GetReference().Lock(False)
City_NA_Well02_Stage60_LouisaFollowUp.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
JunctionBoxScene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
If JunctionBoxScene01.IsPlaying()
JunctionBoxScene01.Stop()
SetObjectiveCompleted(50)
endif

SetObjectiveCompleted(60)
City_NA_Well02_007_Stage70Scene.Start()
SetObjectiveDisplayed(70)
SetObjectiveDisplayed(71)
pCity_NA_Well02.SetObjectiveDisplayedAtTop(70)
Alias_BoxDoor02.GetReference().Lock(False)
Alias_BoxDoor03.GetReference().Lock(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
If GetStageDone(110)==0
JunctionBoxScene02.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN CODE
SetObjectiveCompleted(71)
SetObjectiveDisplayed(70,0)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
If JunctionBoxScene02.IsPlaying()
JunctionBoxScene02.Stop()
SetObjectiveCompleted(71)
SetObjectiveDisplayed(70,0)
endif

if IsObjectiveDisplayed(80)
SetObjectiveDisplayed(80,0)
endif
SetObjectiveCompleted(100)
SetObjectiveDisplayed(110)
City_NA_Well02_011_Stage110Scene.Start()
Alias_BoxDoor04.GetReference().Lock(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
if GetStageDone(90)==0
JunctionBoxScene03.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN CODE
SetObjectiveCompleted(70)
SetObjectiveDisplayed(71,0)
SetObjectiveDisplayed(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
If JunctionBoxScene03.IsPlaying()
JunctionBoxScene03.Stop()
SetObjectiveCompleted(70)
SetObjectiveDisplayed(71,0)
endif

if IsObjectiveDisplayed(100)
SetObjectiveDisplayed(100,0)
endif
if IsObjectivedisplayed(80)
SetObjectiveCompleted(80)
endif
SetObjectiveDisplayed(110)
if GetStageDone(90)==0
City_NA_Well02_009_Stage90Scene.Start()
endif
Alias_BoxDoor04.GetReference().Lock(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0115_Item_00
Function Fragment_Stage_0115_Item_00()
;BEGIN CODE
City_NA_Well02_012_Stage115Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
JunctionBoxScene04.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110)
SetObjectiveDisplayed(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
If JunctionBoxScene04.IsPlaying()
JunctionBoxScene04.Stop()
endif


if IsObjectiveCompleted(110)==0
SetObjectiveCompleted(110)
endif
SetObjectiveCompleted(120)
SetObjectiveDisplayed(150)
City_NA_Well02_014_Stage150Scene.Start()
Alias_ApartmentDoor.GetReference().SetLockLevel(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0151_Item_00
Function Fragment_Stage_0151_Item_00()
;BEGIN CODE
SetObjectiveCompleted(150)
SetObjectiveDisplayed(151)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0152_Item_00
Function Fragment_Stage_0152_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Digipick, 3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
SetObjectiveCompleted(151)
SetObjectiveDisplayed(160)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN CODE
SetObjectiveCompleted(160)
SetObjectiveDisplayed(170)
SetObjectiveDisplayed(180)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
SetObjectiveCompleted(180)
SetObjectiveDisplayed(170,0)
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
SetObjectiveCompleted(170)
SetObjectiveDisplayed(180,0)
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
CompleteAllObjectives()

if GetStageDone(180)
City_NA_Well02_WrapUp_Stage180Done.Start()
else
City_NA_Well02_WrapUp_Stage190Done.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property City_NA_Well02_002_Zoe_Louisa Auto Const Mandatory

ReferenceAlias Property Alias_LouisaReyez Auto Const Mandatory

ReferenceAlias Property Alias_Louisa_StartMarker Auto Const Mandatory

ReferenceAlias Property Alias_StartMarker Auto Const Mandatory

ReferenceAlias Property Alias_ZoeKaminski Auto Const Mandatory

Scene Property City_NA_Well02_007_Stage70Scene Auto Const Mandatory

Scene Property City_NA_Well02_009_Stage90Scene Auto Const Mandatory

Scene Property City_NA_Well02_011_Stage110Scene Auto Const Mandatory

Scene Property City_NA_Well02_012_Stage115Scene Auto Const Mandatory

Scene Property City_NA_Well02_004_Zoe_Louisa_Stage40 Auto Const Mandatory

Scene Property City_NA_Well02_013_Stage120Scene Auto Const Mandatory

Scene Property City_NA_Well02_014_Stage150Scene Auto Const Mandatory

Scene Property JunctionBoxScene01 Auto Const

Quest Property City_NA_Well01 Auto Const Mandatory

Scene Property JunctionBoxScene02 Auto Const

Scene Property JunctionBoxScene03 Auto Const

Scene Property JunctionBoxScene04 Auto Const

ReferenceAlias Property Alias_BoxDoor01 Auto Const Mandatory

ReferenceAlias Property Alias_BoxDoor02 Auto Const Mandatory

ReferenceAlias Property Alias_BoxDoor03 Auto Const Mandatory

ReferenceAlias Property Alias_BoxDoor04 Auto Const Mandatory

Scene Property City_NA_Well02_Stage60_LouisaFollowUp Auto Const Mandatory

ReferenceAlias Property Alias_ApartmentDoor Auto Const Mandatory

MiscObject Property Digipick Auto Const Mandatory

ReferenceAlias Property Alias_Slate Auto Const Mandatory

Scene Property City_NA_Well02_WrapUp_Stage190Done Auto Const Mandatory

Scene Property City_NA_Well02_WrapUp_Stage180Done Auto Const Mandatory

Quest Property pCity_NA_Well02 Auto Const Mandatory
