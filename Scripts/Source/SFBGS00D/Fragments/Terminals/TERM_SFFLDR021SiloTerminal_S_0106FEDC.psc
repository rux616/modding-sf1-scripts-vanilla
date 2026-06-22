;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Terminals:TERM_SFFLDR021SiloTerminal_S_0106FEDC Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_01
Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
;BEGIN CODE
ShuttleBayDoorManagerScript shuttleBayManager = akTerminalRef.GetLinkedRef() as ShuttleBayDoorManagerScript
SFBGS00D:SFFLDR021_SiloManagerScript siloManager = akTerminalRef.GetLinkedRef(LinkKeyword01) as SFBGS00D:SFFLDR021_SiloManagerScript

shuttleBayManager.OpenShuttleBayDoors()
siloManager.SetIsShuttleBayOpen(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_02
Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
;BEGIN CODE
ShuttleBayDoorManagerScript shuttleBayManager = akTerminalRef.GetLinkedRef() as ShuttleBayDoorManagerScript
SFBGS00D:SFFLDR021_SiloManagerScript siloManager = akTerminalRef.GetLinkedRef(LinkKeyword01) as SFBGS00D:SFFLDR021_SiloManagerScript

shuttleBayManager.CloseShuttleBayDoors()

siloManager.SetIsShuttleBayOpen(False)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Bool Property IsShuttleBayOpen Auto Const

Keyword Property LinkKeyword01 Auto Const
