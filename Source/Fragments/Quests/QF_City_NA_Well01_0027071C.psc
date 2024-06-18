;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_NA_Well01_0027071C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Game.GetPlayer().Moveto(Alias_StartMarker.GetReference())
SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;set global value for Story Manager startup node
StoryManager_NewAtlantisLoad.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

; Complete pointer
City_NA_GuardPointer_Well.SetStage(200)
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
Alias_LouisaReyez.GetActorRef().EvaluatePackage()

; Complete pointer
City_NA_GuardPointer_Well.SetStage(200)

;unlock the first junction box
Alias_BoxDoor01.GetReference().Lock(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
JunctionBox01Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
if JunctionBox01Scene.IsPlaying()
JunctionBox01Scene.Stop()
SetObjectiveCompleted(20)
endif

City_NA_Well01_003_Stage50Scene.Start()
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)

;unlock the next junction box
Alias_BoxDoor02.GetReference().Lock(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
JunctionBox02Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0085_Item_00
Function Fragment_Stage_0085_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
if JunctionBox02Scene.IsPlaying()
JunctionBox02Scene.Stop()
SetObjectiveCompleted(50)
endif


City_NA_Well01_005_Stage100Scene.Start()
SetObjectiveCompleted(90)
SetObjectiveDisplayed(100)

;unlock the next junction box
Alias_BoxDoor03.GetReference().Lock(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
JunctionBox03Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0135_Item_00
Function Fragment_Stage_0135_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(140)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
if JunctionBox03Scene.IsPlaying()
JunctionBox03Scene.Stop()
SetObjectiveCompleted(100)
endif


City_NA_Well01_007_Stage150Scene.Start()
SetObjectiveCompleted(140)
SetObjectiveDisplayed(150)

;unlock the remaining junction box
Alias_BoxDoor04.GetReference().Lock(False)
Alias_Puzzle_BoxDoor01.GetReference().Lock(False)
Alias_Puzzle_BoxDoor02.GetReference().Lock(False)
Alias_Puzzle_BoxDoor03.GetReference().Lock(False)
Alias_Puzzle_BoxDoor04.GetReference().Lock(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN CODE
JunctionBox04Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0175_Item_00
Function Fragment_Stage_0175_Item_00()
;BEGIN CODE
SetObjectiveCompleted(150)
SetObjectiveDisplayed(180)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0185_Item_00
Function Fragment_Stage_0185_Item_00()
;BEGIN CODE
Alias_Puzzle_BlockingDoor.GetReference().Lock(False)
Alias_Puzzle_BlockingDoor.GetReference().SetOpen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
if JunctionBox04Scene.IsPlaying()
JunctionBox04Scene.Stop()
SetObjectiveCompleted(150)
endif


City_NA_Well01_009_Stage190Scene.Start()
SetObjectiveCompleted(180)
SetObjectiveDisplayed(190)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
CompleteAllObjectives()
City_NA_Well02.Start()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_StartMarker Auto Const Mandatory

Scene Property City_NA_Well01_003_Stage50Scene Auto Const Mandatory

Scene Property City_NA_Well01_005_Stage100Scene Auto Const Mandatory

Scene Property City_NA_Well01_007_Stage150Scene Auto Const Mandatory

Scene Property City_NA_Well01_009_Stage190Scene Auto Const Mandatory

Quest Property City_NA_Well02 Auto Const Mandatory

Scene Property JunctionBox01Scene Auto Const

Scene Property JunctionBox02Scene Auto Const

Scene Property JunctionBox03Scene Auto Const

Scene Property JunctionBox04Scene Auto Const

ReferenceAlias Property Alias_LouisaReyez Auto Const Mandatory

Quest Property City_NA_GuardPointer_Well Auto Const Mandatory

ReferenceAlias Property Alias_BoxDoor01 Auto Const Mandatory

ReferenceAlias Property Alias_BoxDoor02 Auto Const Mandatory

ReferenceAlias Property Alias_BoxDoor03 Auto Const Mandatory

ReferenceAlias Property Alias_BoxDoor04 Auto Const Mandatory

ReferenceAlias Property Alias_Puzzle_BoxDoor01 Auto Const Mandatory

ReferenceAlias Property Alias_Puzzle_BoxDoor02 Auto Const Mandatory

ReferenceAlias Property Alias_Puzzle_BoxDoor03 Auto Const Mandatory

ReferenceAlias Property Alias_Puzzle_BoxDoor04 Auto Const Mandatory

ReferenceAlias Property Alias_Puzzle_BlockingDoor Auto Const Mandatory

GlobalVariable Property StoryManager_NewAtlantisLoad Auto Const Mandatory
