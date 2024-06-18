;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFCydoniaZ01_0022E140 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_MapMarker.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Denis.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
ObjectReference myLeech = Alias_DeadLeech.GetRef()
myLeech.Enable()
(myLeech as Actor).Kill()
Alias_Ship.GetRef().Enable()
Alias_RefsToEnable.EnableAll()
Alias_MapMarker.GetRef().Enable()
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0201_Item_00
Function Fragment_Stage_0201_Item_00()
;BEGIN CODE
FFCydoniaZ01_0201_Companion_Leech.Start()
SetObjectiveDisplayed(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0251_Item_00
Function Fragment_Stage_0251_Item_00()
;BEGIN CODE
SetObjectivecompleted(200)
If GetStageDone(252)
	SetStage(300)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0252_Item_00
Function Fragment_Stage_0252_Item_00()
;BEGIN CODE
SetObjectiveCompleted(250)
If GetStageDone(251)
	SetStage(300)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Game.GetPlayer().SetValue(FFCydoniaZ01_Foreknowledge_AV, 1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Ship Auto Const Mandatory

ReferenceAlias Property Alias_Denis Auto Const Mandatory

Scene Property FFCydoniaZ01_0201_Companion_Leech Auto Const Mandatory

ActorValue Property FFCydoniaZ01_Foreknowledge_AV Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory

RefCollectionAlias Property Alias_RefsToEnable Auto Const Mandatory

ReferenceAlias Property Alias_DeadLeech Auto Const Mandatory
