;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_UC_NA_CL_AEGISScene_001D0F0D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Alias_Pilot.GetRef().Enable()
Alias_Citizen.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
UC_NA_CL_TolimanScene_Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
if !GetStageDone(200)
  UC_NA_CL_TolimanScene_Scene.Stop()
  UC_NA_CL_AEGISScene_PlayerDetected.Start()
  SetStage(160)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0999_Item_00
Function Fragment_Stage_0999_Item_00()
;BEGIN CODE
Alias_Pilot.GetRef().Disable()
Alias_Citizen.GetRef().Disable()
Alias_Trigger.GetRef().Disable()
SetStage(1000)
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

Scene Property UC_NA_CL_TolimanScene_Scene Auto Const Mandatory

ReferenceAlias Property Alias_Pilot Auto Const Mandatory

ReferenceAlias Property Alias_Citizen Auto Const Mandatory

ReferenceAlias Property Alias_Trigger Auto Const Mandatory

Scene Property UC_NA_CL_AEGISScene_PlayerDetected Auto Const Mandatory
