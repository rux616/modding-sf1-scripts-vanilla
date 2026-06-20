;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Terminals:TERM_SFFL_SE_EC08_DerelictCo_0107D42C Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_01
Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
;BEGIN CODE
lockedDoors.SetOpen(true)

cockpitDoor.GetRef().SetOpen(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_02
Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
;BEGIN CODE
lockedDoors.SetOpen(false)

cockpitDoor.GetRef().SetOpen(false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property lockedDoors Auto Const Mandatory

ReferenceAlias Property cockpitDoor Auto Const Mandatory
