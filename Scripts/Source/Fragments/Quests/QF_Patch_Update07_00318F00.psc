;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Patch_Update07_00318F00 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;LC088_Space: If running, reregister for location change events.
if (LC088_Space.IsRunning())
     LC088_Space.Patch_RegisterForUnityChangeLocation()
EndIf

;LC082: If running, move the Vigilance to its expected location.
if (LC082.IsRunning())
     LC082.Patch_MoveVigilanceToExpectedLocation()
EndIf

;LC088_Vigilance: If running, stop premature targeting of Ikande/Toft.
if (LC088_Vigilance.IsRunning())
     LC088_Vigilance.Patch_StopPrematureTargeting()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_01
Function Fragment_Stage_0000_Item_01()
;BEGIN CODE
Actor Tomo = Alias_Tomo.GetActorRef()
If Tomo.IsDisabled()
   Tomo.Enable()
   Tomo.EvaluatePackage()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_02
Function Fragment_Stage_0000_Item_02()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

lc088_spacequestscript Property LC088_Space Auto Const Mandatory

lc088_vigilancequestscript Property LC088_Vigilance Auto Const Mandatory

ReferenceAlias Property Alias_Tomo Auto Const

LC082_VigilanceQuestScript Property LC082 Auto Const Mandatory
