;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_Akila_Ashta01_0021625F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_PlayerStartMarker.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
; Teleport Keoni when appropriate
Actor aTarg = Alias_Keoni.GetActorRef()
aTarg.Enable()
aTarg.MoveTo(City_Akila01_KeoniStartMarker)

; Make it so the Bailey city life scene is now closed off
DialogueFCAkilaCity.SetStage(2015)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(8)

; Start up the intro conversation
City_Akila01_Scene01_StartScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveCompleted(8)
SetObjectiveDisplayed(10)

; EVP so she moves immediately
Alias_Keoni.GetActorRef().EvaluatePackage()
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

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(20)
SetObjectiveCompleted(20)
endif
if IsObjectiveDisplayed(25)
SetObjectiveCompleted(25)
endif
SetObjectiveDisplayed(30)

;add quest items to player's inventory
Game.GetPlayer().AddItem(Alias_Sensor01.GetReference())
Game.GetPlayer().AddItem(Alias_Sensor02.GetReference())
Game.GetPlayer().AddItem(Alias_Sensor03.GetReference())
Game.GetPlayer().AddItem(Alias_Sensor04.GetReference())

;enable activators in world
Alias_SensorActivator01.GetReference().Enable()
Alias_SensorActivator02.GetReference().Enable()
Alias_SensorActivator03.GetReference().Enable()
Alias_SensorActivator04.GetReference().Enable()

;debug
if GetStageDone(20)==0
Game.GetPlayer().MoveTo(Alias_Sensor_Static01.GetReference())
endif

; EVP so she moves immediately
Alias_Keoni.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0031_Item_00
Function Fragment_Stage_0031_Item_00()
;BEGIN CODE
Alias_Sensor_Static01.GetReference().Enable()
Game.GetPlayer().RemoveItem(Alias_Sensor01.GetReference())

if GetStageDone(34) && GetStageDone(32) && GetStageDone(33)
SetStage(40)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0032_Item_00
Function Fragment_Stage_0032_Item_00()
;BEGIN CODE
Alias_Sensor_Static02.GetReference().Enable()
Game.GetPlayer().RemoveItem(Alias_Sensor02.GetReference())

if GetStageDone(31) && GetStageDone(34) && GetStageDone(33)
SetStage(40)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0033_Item_00
Function Fragment_Stage_0033_Item_00()
;BEGIN CODE
Alias_Sensor_Static03.GetReference().Enable()
Game.GetPlayer().RemoveItem(Alias_Sensor03.GetReference())

if GetStageDone(31) && GetStageDone(32) && GetStageDone(34)
SetStage(40)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0034_Item_00
Function Fragment_Stage_0034_Item_00()
;BEGIN CODE
Alias_Sensor_Static04.GetReference().Enable()
Game.GetPlayer().RemoveItem(Alias_Sensor04.GetReference())

if GetStageDone(31) && GetStageDone(32) && GetStageDone(33)
SetStage(40)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)
SetObjectiveDisplayed(55)
Alias_Keoni.GetActorReference().EvaluatePackage()

; Enable the Wall Guard
Alias_TowerGuard.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0059_Item_00
Function Fragment_Stage_0059_Item_00()
;BEGIN CODE
SetObjectiveCompleted(50)
SetStage(65)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
if !IsObjectiveDisplayed(55)
  SetObjectiveCompleted(55, FALSE)
endif

Alias_TowerGuard.GetActorReference().EvaluatePackage()
Alias_Keoni.GetActorReference().EvaluatePackage()
utility.wait(5)
SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
SetObjectiveCompleted(55)
SetObjectiveCompleted(50)
SetObjectiveDisplayed(70)

Alias_Keoni.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
CompleteAllObjectives()

City_Akila_Ashta02.SetStage(10)
City_Akila_Ashta02.SetActive()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_PlayerStartMarker Auto Const Mandatory

ReferenceAlias Property Alias_Sensor_Static01 Auto Const Mandatory

ReferenceAlias Property Alias_Sensor01 Auto Const Mandatory

ReferenceAlias Property Alias_Sensor02 Auto Const Mandatory

ReferenceAlias Property Alias_Sensor_Static02 Auto Const Mandatory

ReferenceAlias Property Alias_Sensor03 Auto Const Mandatory

ReferenceAlias Property Alias_Sensor_Static03 Auto Const Mandatory

ReferenceAlias Property Alias_Sensor04 Auto Const Mandatory

ReferenceAlias Property Alias_Sensor_Static04 Auto Const Mandatory

ReferenceAlias Property Alias_SensorActivator01 Auto Const Mandatory

ReferenceAlias Property Alias_SensorActivator02 Auto Const Mandatory

ReferenceAlias Property Alias_SensorActivator03 Auto Const Mandatory

ReferenceAlias Property Alias_SensorActivator04 Auto Const Mandatory

ReferenceAlias Property Alias_Keoni Auto Const Mandatory

Quest Property City_Akila_Ashta02 Auto Const Mandatory

ReferenceAlias Property Alias_TowerGuard Auto Const Mandatory

Scene Property City_Akila01_Scene01_StartScene Auto Const Mandatory

ObjectReference Property City_Akila01_KeoniStartMarker Auto Const Mandatory

Quest Property DialogueFCAkilaCity Auto Const Mandatory
