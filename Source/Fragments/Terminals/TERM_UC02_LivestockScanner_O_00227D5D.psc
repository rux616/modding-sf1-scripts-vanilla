;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_UC02_LivestockScanner_O_00227D5D Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_01
Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
;BEGIN CODE
if UC02_TrackerSystemTuned.GetValue() <= 0
  if UC02_LivestockTrackerEnabled.GetValue() <= 0
    UC02_LivestockTrackerEnabled.SetValue(1)
  endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_04
Function Fragment_TerminalMenu_04(ObjectReference akTerminalRef)
;BEGIN CODE
if !UC02_ScannerQuest.IsRunning()
   UC02_ScannerQuest.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property UC02_LivestockTrackerEnabled Auto Const Mandatory

Quest Property UC02_ScannerQuest Auto Const Mandatory

GlobalVariable Property UC02_TrackerSystemTuned Auto Const Mandatory
