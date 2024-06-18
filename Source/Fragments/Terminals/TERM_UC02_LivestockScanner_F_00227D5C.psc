;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_UC02_LivestockScanner_F_00227D5C Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_05
Function Fragment_TerminalMenu_05(ObjectReference akTerminalRef)
;BEGIN CODE
;If this is the first time the player is tuning
;set the "tuned" global
;So they don't have to do this again
if UC02_TrackerSystemTuned.GetValue() <= 0
  UC02_TrackerSystemTuned.SetValue(1)
endif

if !UC02_ScannerQuest.IsRunning()
  UC02_ScannerQuest.Start()
endif

if UC02.GetStageDone(605) && !UC02.GetStageDone(700)
  UC02.SetStage(607)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property UC02_ScannerQuest Auto Const Mandatory

Quest Property UC02 Auto Const Mandatory

GlobalVariable Property UC02_TrackerSystemTuned Auto Const Mandatory
