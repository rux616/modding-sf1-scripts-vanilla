;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Perks:PRKF_SQ_Wounded_PlayerRescue_0071FFC8 Extends Perk Hidden Const

;BEGIN FRAGMENT Fragment_Entry_00
Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
SQ_Captive.SendCaptiveSetFree(captive = akTargetRef as Actor, playerIsLiberator = true, showInventory = false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Entry_01
Function Fragment_Entry_01(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
SQ_Captive.SendCaptiveSetFree(captive = akTargetRef as Actor, playerIsLiberator = true, showInventory = true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SQ_CaptiveScript Property SQ_Captive Auto Const Mandatory
