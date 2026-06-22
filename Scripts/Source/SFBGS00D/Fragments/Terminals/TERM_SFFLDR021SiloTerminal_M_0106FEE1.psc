;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Terminals:TERM_SFFLDR021SiloTerminal_M_0106FEE1 Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_01
Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
;BEGIN CODE
SFBGS00D:SFFLDR021_SiloManagerScript siloManager = akTerminalRef.GetLinkedRef(LinkKeyword01) as SFBGS00D:SFFLDR021_SiloManagerScript

;siloManager.LaunchMissileSequence()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Bool Property IsShuttleBayOpen Auto Const

Keyword Property LinkKeyword01 Auto Const
