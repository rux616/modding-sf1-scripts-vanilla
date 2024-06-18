;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_RI01_JobAdRadio_002C9C96 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
If !RI01.IsActive() && !RI01.IsCompleted() && (Game.FindClosestReferenceOfTYpeFromRef(RI01_AdRadio, Game.GetPlayer(), 20) != None)
     RI01.SetStage(100)
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

Quest Property RI01 Auto Const Mandatory

Activator Property RI01_AdRadio Auto Const Mandatory
