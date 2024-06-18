;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_RL010ElevatorControlsTe_0005038F Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_01
Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
;BEGIN CODE
LoadElevatorManagerScript loadElevatorManager = akTerminalRef.GetLinkedRef() as LoadElevatorManagerScript

loadElevatorManager.SetElevatorOperational(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_02
Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
;BEGIN CODE
LoadElevatorManagerScript loadElevatorManager = akTerminalRef.GetLinkedRef() as LoadElevatorManagerScript

loadElevatorManager.SetElevatorOperational(false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
