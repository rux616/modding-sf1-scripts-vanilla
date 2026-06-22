;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RL040Quest_0025A9E2 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;RL040Quest_VictimScene.Start()
setObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
RL040Quest_VictimScene.Stop()
RL040Quest_PirateScene.Start()
Alias_DirectionSwapTrigger.GetRef().Disable()
Alias_GroundEnableMarker.GetRef().Enable()
utility.wait(15)
Alias_ShipEnableMarker.GetRef().Enable()
SetObjectiveCompleted(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
RL040Quest_VictimScene.Stop()
RL040Quest_DisablesRadioScene.Start()
;(Alias_Switch.GetRef() as GenericSwitchScript).SetColor("Red")
Alias_PirateTrigger.GetRef().Disable()
Alias_DirectionSwapTrigger.GetRef().Disable()
Alias_GroundEnableMarker.GetRef().Enable()
utility.wait(10)
Alias_ShipEnableMarker.GetRef().Enable()
SetObjectiveCompleted(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property RL040Quest_PirateScene Auto Const

Scene Property RL040Quest_VictimScene Auto Const

Scene Property RL040Quest_DisablesRadioScene Auto Const

ReferenceAlias Property Alias_ShipEnableMarker Auto Const

ReferenceAlias Property Alias_DirectionSwapTrigger Auto Const

ReferenceAlias Property Alias_GroundEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_Switch Auto Const Mandatory

ReferenceAlias Property Alias_PirateTrigger Auto Const Mandatory
