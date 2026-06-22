;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Terminals:TERM_SFFLDR021SiloTerminal_0106FEE1_1 Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_01
Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
;BEGIN CODE
SFBGS00D:SFFLDR021_SiloManagerScript siloManager = akTerminalRef.GetLinkedRef(SiloManagerLinkKeyword) as SFBGS00D:SFFLDR021_SiloManagerScript

siloManager.LaunchMissileSequence()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property SiloManagerLinkKeyword Auto Const
