;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_BQ01_TerminalMenu_TownH_0027D895 Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_00
Function Fragment_TerminalMenu_00(ObjectReference akTerminalRef)
;BEGIN CODE
BarrettCommitmentQuest.SetStage(310)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_01
Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
;BEGIN CODE
BarrettCommitmentQuest.SetStage(315)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property Barrett_Q01 Auto Const Mandatory

Quest Property BarrettCommitmentQuest Auto Const Mandatory
