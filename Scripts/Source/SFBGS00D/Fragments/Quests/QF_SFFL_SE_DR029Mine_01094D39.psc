;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_SE_DR029Mine_01094D39 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;grab and move SFFLDR029 asteroid mine into a random space cell
SpaceshipReference MineRef = Alias_AsteroidMine.GetShipRef()
MineRef.Reset()
Utility.Wait(0.5)
;MineRef.SetValue(DockingPermission, 0)
MineRef.MoveTo(Alias_MineArrivalMarker.GetRef())
MineRef.Enable()
;setObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;SetObjectiveCompleted(10)
setObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_MineArrivalMarker Auto Const Mandatory

ReferenceAlias Property Alias_AsteroidMine Auto Const Mandatory

ReferenceAlias Property Alias_SFFLDR029_Objective1_Trigger Auto Const Mandatory

ReferenceAlias Property Alias_SFFLDR029_Objective2_Trigger Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory
