;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_CF03_Stage211_Mathis_Armo_00168AA9 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
ObjectReference weaponCase = Alias_CF03_ArmoryWeaponCase.GetRef()
weaponCase.BlockActivation(True, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_Begin
Function Fragment_Phase_03_Begin()
;BEGIN CODE
ObjectReference weaponCase = Alias_CF03_ArmoryWeaponCase.GetRef()
weaponCase.Unlock()
weaponCase.SetOpen(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_05_Begin
Function Fragment_Phase_05_Begin()
;BEGIN CODE
GetOwningQuest().SetStageNoWait(213)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_CF03_ArmoryWeaponCase Auto Const

ReferenceAlias Property Alias_CF03_ArmoryWeaponCaseCollision Auto Const
