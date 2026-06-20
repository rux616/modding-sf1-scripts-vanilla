;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_R03_PassengerHandler_0108F673 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;move NPCs from out from underneath ship and place them near the ramp,
;and have them evaluate their packages

Actor Captain = Alias_Captain.GetActorRef()
Actor CommsOfficer = Alias_CommsOfficer.GetActorRef()

Captain.MoveTo(Alias_LandingDeckMarker.GetRef())
CommsOfficer.MoveTo(Alias_LandingDeckMarker.GetRef())

Utility.Wait(3)

Captain.EvaluatePackage()
CommsOfficer.EvaluatePackage()

setstage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Captain Auto Const Mandatory

ReferenceAlias Property Alias_CommsOfficer Auto Const Mandatory

ReferenceAlias Property Alias_LandingDeckMarker Auto Const Mandatory
