;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_NA_Viewport03_0027071A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Startmarker.GetReference())
City_NA_Viewport01.SetStage(1000)
City_NA_Viewport02.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Alias_Fizz.GetReference().Enable()
Alias_SashaAlessio.GetReference().Enable()
City_NA_Viewport03_SpeechChallenges.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
SetStage(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
Alias_Sub12Door.GetReference().Lock(False)
Alias_SashaAlessio.GetReference().Enable()
Alias_SashaAlessio.GetActorReference().EvaluatePackage()
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
SetObjectiveDisplayed(30)
if GetStageDone(15)==0
SetStage(15)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(30)
SetObjectiveDisplayed(30,0)
endif
if IsObjectiveDisplayed(20)
SetObjectiveCompleted(20)
endif
if IsObjectiveDisplayed(40)
SetObjectiveCompleted(40)
endif
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
City_NA_Viewport03_003B_Fizz_PreScene.Start()
SetStage(100)
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

;BEGIN FRAGMENT Fragment_Stage_0111_Item_00
Function Fragment_Stage_0111_Item_00()
;BEGIN CODE
City_NA_Viewport03_GangFaction.SetEnemy(PlayerFaction)
Alias_Fizz.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0119_Item_00
Function Fragment_Stage_0119_Item_00()
;BEGIN CODE
SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetStage(180)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0121_Item_00
Function Fragment_Stage_0121_Item_00()
;BEGIN CODE
Alias_Fizz.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetStage(180)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(180)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
SetObjectiveCompleted(180)
SetObjectiveDisplayed(190)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
CompleteAllObjectives()

if City_NA_Viewport02.GetStageDone(130)
    City_NA_Viewport02_Location.SetValue(1)
elseif City_NA_Viewport02.GetStageDone(140)
    City_NA_Viewport02_Location.SetValue(2)
elseif City_NA_Viewport02.GetStageDone(150)
    City_NA_Viewport02_Location.SetValue(3)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
Alias_StateChangeMarker.GetReference().Enable()
City_NA_Viewport03_PostQuest.Start()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_StartMarker Auto Const Mandatory

Faction Property City_NA_Viewport03_GangFaction Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory

ReferenceAlias Property Alias_Fizz Auto Const Mandatory

Quest Property City_NA_Viewport01 Auto Const Mandatory

Quest Property City_NA_Viewport02 Auto Const Mandatory

ReferenceAlias Property Alias_BackupActor01 Auto Const Mandatory

ReferenceAlias Property Alias_BackupActor02 Auto Const Mandatory

ReferenceAlias Property Alias_Sub12Door Auto Const Mandatory

ReferenceAlias Property Alias_SashaAlessio Auto Const Mandatory

Scene Property City_NA_Viewport03_003B_Fizz_PreScene Auto Const Mandatory

GlobalVariable Property City_NA_Viewport02_Location Auto Const Mandatory

Quest Property City_NA_Viewport03_PostQuest Auto Const Mandatory

ReferenceAlias Property Alias_StateChangeMarker Auto Const Mandatory

Quest Property City_NA_Viewport03_SpeechChallenges Auto Const Mandatory
