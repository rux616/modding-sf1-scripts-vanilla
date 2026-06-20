;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Packages:PF_SFFL_MS03_Milli_PlayerFol_01035948 Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_Change
Function Fragment_Change(Actor akActor)
;BEGIN CODE
if(!SFFL_MS03.GetStageDone(3010))
   Utility.Wait(1)
   MilliRef.GetRef().MoveTo(WaitingMarkerRef.GetRef())
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property SFFL_MS03 Auto Const Mandatory

ReferenceAlias Property MilliRef Auto Const

ReferenceAlias Property WaitingMarkerRef Auto Const
