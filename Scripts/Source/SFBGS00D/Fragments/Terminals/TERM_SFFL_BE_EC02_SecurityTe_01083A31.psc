;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Terminals:TERM_SFFL_BE_EC02_SecurityTe_01083A31 Extends TerminalMenu Hidden Const

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

Quest Property SFFL_BE_EC02 Auto Const Mandatory

RefCollectionAlias Property lockedDoors Auto Const

ReferenceAlias Property CockpitDoor Auto Const
