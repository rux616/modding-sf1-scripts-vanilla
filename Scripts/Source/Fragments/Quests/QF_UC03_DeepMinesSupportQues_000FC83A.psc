;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_UC03_DeepMinesSupportQues_000FC83A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
UC03_PlayerKilledSpacerBoss.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
LoadElevatorFloorScript IntElevator = Alias_ElevatorFloorMarker_Int.GetRef() as LoadElevatorFloorScript
LoadElevatorFloorScript ExtElevator = Alias_ElevatorFloorMarker_Ext.GetRef() as LoadElevatorFloorScript
ExtElevator.SetAccessible(true)
IntElevator.SetAccessible(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_SpacerEnableMarker.GetRef().Disable()
Alias_SpacerEnableMarker_Ext.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property UC03_PlayerKilledSpacerBoss Auto Const Mandatory

ReferenceAlias Property Alias_SpacerEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_ElevatorFloorMarker_Int Auto Const Mandatory

ReferenceAlias Property Alias_ElevatorFloorMarker_Ext Auto Const Mandatory

ReferenceAlias Property Alias_SpacerEnableMarker_Ext Auto Const Mandatory
