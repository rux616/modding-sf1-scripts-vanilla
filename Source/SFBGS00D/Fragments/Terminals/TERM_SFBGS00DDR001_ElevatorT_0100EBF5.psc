;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Terminals:TERM_SFBGS00DDR001_ElevatorT_0100EBF5 Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_01
Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
;BEGIN CODE
akTerminalRef.GetLinkedRef(LinkCustom01).SetOpen()
akTerminalRef.GetLinkedRef(LinkCustom02).SetOpen()
akTerminalRef.GetLinkedRef(LinkCustom03).SetOpen()
akTerminalRef.GetLinkedRef(LinkCustom04).BlockActivation(false)
akTerminalRef.GetLinkedRef(LinkCustom04).Activate(akTerminalRef.GetLinkedRef(LinkCustom04))
WwiseEvent_QST_RL088ArmoredShip_Power_On.Play(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkCustom01 Auto Const Mandatory

Keyword Property LinkCustom02 Auto Const Mandatory

Keyword Property LinkCustom03 Auto Const Mandatory

Keyword Property LinkCustom04 Auto Const Mandatory

WwiseEvent Property WwiseEvent_QST_RL088ArmoredShip_Power_On Auto Const Mandatory
