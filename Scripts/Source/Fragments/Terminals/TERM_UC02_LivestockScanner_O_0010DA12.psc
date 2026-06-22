;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_UC02_LivestockScanner_O_0010DA12 Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_01
Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
;BEGIN CODE
if UC02_ScannerQuest.IsRunning()
  UC02_ScannerQuest.SetStage(1000)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property UC02_LivestockTrackerEnabled Auto Const Mandatory

Quest Property UC02_ScannerQuest Auto Const Mandatory
