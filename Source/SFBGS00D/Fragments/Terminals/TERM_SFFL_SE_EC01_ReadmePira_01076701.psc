;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Terminals:TERM_SFFL_SE_EC01_ReadmePira_01076701 Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_01
Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
;BEGIN CODE
;Unlock the linked door.
;akTerminalRef.GetLinkedRef(LinkTerminalDoor).Unlock()

SFFL_BE_EC01.SetStage(360)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property SFFL_BE_EC01 Auto Const Mandatory

Keyword Property LinkTerminalDoor Auto Const Mandatory
