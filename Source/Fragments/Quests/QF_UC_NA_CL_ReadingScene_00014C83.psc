;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_UC_NA_CL_ReadingScene_00014C83 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Alias_Pilot.GetRef().Enable()
Alias_Citizen.GetRef().Enable()
Alias_Functionary02.GetRef().Enable()
Alias_RecruitM02.GetRef().Enable()
Alias_AudienceM02Freestar.GetRef().Enable()
Alias_Audience05.GetRef().Enable()
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

;BEGIN FRAGMENT Fragment_Stage_0999_Item_00
Function Fragment_Stage_0999_Item_00()
;BEGIN CODE
Alias_Pilot.GetRef().Disable()
Alias_Citizen.GetRef().Disable()
Alias_Functionary02.GetRef().Disable()
Alias_RecruitM02.GetRef().Disable()
Alias_AudienceM02Freestar.GetRef().Disable()
Alias_Audience05.GetRef().Disable()
Alias_Trigger.GetRef().Disable()
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Reenable the disabled benches
Alias_Benches.EnableAll()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property UC_NA_CL_TolimanScene_Scene Auto Const Mandatory

ReferenceAlias Property Alias_Pilot Auto Const Mandatory

ReferenceAlias Property Alias_Citizen Auto Const Mandatory

ReferenceAlias Property Alias_Trigger Auto Const Mandatory

ReferenceAlias Property Alias_Functionary02 Auto Const Mandatory

ReferenceAlias Property Alias_RecruitM02 Auto Const Mandatory

ReferenceAlias Property Alias_AudienceM02Freestar Auto Const Mandatory

ReferenceAlias Property Alias_Audience05 Auto Const Mandatory

RefCollectionAlias Property Alias_Benches Auto Const Mandatory
