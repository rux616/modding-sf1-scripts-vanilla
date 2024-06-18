;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFCydoniaZ08_0030B819 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
If FFCydoniaZ08Misc.IsRunning()
	FFCydoniaZ08Misc.SetStage(1000)
EndIf



Alias_DeviceActivator.GetRef().Enable()

SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_Device.GetRef())
Alias_DevicePlaced.GetRef().Enable()
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_DevicePlaced Auto Const Mandatory

Quest Property FFCydoniaZ08Misc Auto Const Mandatory

ReferenceAlias Property Alias_DeviceActivator Auto Const Mandatory

ReferenceAlias Property Alias_Device Auto Const Mandatory
