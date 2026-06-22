;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_UC01_SimShipTerminal_Ma_0003D5D7 Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_01
Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
;BEGIN CODE
(UC01_ShipSimulatorHelperQuest as UC01_ShipSimulationQuestScript).TriggerResetTimer()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property UC01_ShipSimulatorHelperQuest Auto Const Mandatory
