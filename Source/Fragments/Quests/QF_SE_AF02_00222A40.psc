;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_AF02_00222A40 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
SE_AF02_001_HailingScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_00
Function Fragment_Stage_0007_Item_00()
;BEGIN CODE
SpaceshipReference ShipRef = Alias_Ship01.GetShipRef()

If ShipRef.Is3DLoaded()
    ShipRef.DisableWithGravJump()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_01
Function Fragment_Stage_0007_Item_01()
;BEGIN CODE
Alias_Ship01.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0007_Item_02
Function Fragment_Stage_0007_Item_02()
;BEGIN CODE
FailAllObjectives()
Utility.Wait(0.5)
Alias_MapMarker.GetRef().DisableNoWait()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; If you didn't refuse the quest - then proceed
if ( !GetStageDone(7) )
  SetObjectiveDisplayed(10)
  Alias_Ship01.GetShipRef().BlockActivation(true, true)
  ;SE_AF02_004_RaceScene.Start()
else
  ; If the player refused and leaves the ship, then despawn
  Stop()
endif

;Set active to give player immediate target
SetActive()
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
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
if GetStageDone(32)
	;Player Loses
	SE_AF02_006_LoseScene.start()
	Alias_Ship01.GetShipRef().AddItem(Credits, SE_AF02_CreditCount.GetValueInt())
else
	;Player Wins
	SE_AF02_007_WinScene.start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0032_Item_00
Function Fragment_Stage_0032_Item_00()
;BEGIN CODE
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
Alias_Ship01.GetShipRef().BlockActivation(false, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SE_AF02_GateCount.setvalue(1)
SpaceshipReference raceShip = Alias_Ship01.GetShipRef()

raceShip.BlockActivation(false, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
if GetStageDone(32)
    SE_AF02_DestroyShip.SetValue(1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(750)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_playerShip Auto Const Mandatory

Potion Property ShipRepairKit Auto Const Mandatory

ReferenceAlias Property Alias_Ship01 Auto Const Mandatory

Scene Property SE_AF02_004_RaceScene Auto Const

GlobalVariable Property SE_AF02_GateCount Auto Const

MiscObject Property Credits Auto Const

Scene Property SE_AF02_006_LoseScene Auto Const

Scene Property SE_AF02_007_WinScene Auto Const

Scene Property SE_AF02_001_HailingScene Auto Const Mandatory

GlobalVariable Property SE_AF02_CreditCount Auto Const Mandatory

GlobalVariable Property SE_AF02_DestroyShip Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory
