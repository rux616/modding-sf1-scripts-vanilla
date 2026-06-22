;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MS06Intro_00258695 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_ECSConstantShip.GetRef().SetOverrideName(MS06_UnidentifiedShipNameMSG)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
MS06Intro_Jiro_BeaconMessage_Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
MS06.Start()
If GetStageDone(400)
	SetStage(1000)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
;Set the value to track that the player has tried hailing the ECS Constant.
MS06ECSConstantHailed.SetValue(1)

MS06.SetStage(300)

If GetStageDone(200)
	SetStage(1000)
EndIf
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

Quest Property MS06 Auto Const Mandatory
Scene Property MS06Intro_Jiro_BeaconMessage_Scene Auto Const

GlobalVariable Property MS06ECSConstantHailed Auto Const Mandatory

ReferenceAlias Property Alias_ECSConstantShip Auto Const Mandatory

Message Property MS06_UnidentifiedShipNameMSG Auto Const Mandatory

Message Property MS06_ParadisoOrbitNameMSG Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory
