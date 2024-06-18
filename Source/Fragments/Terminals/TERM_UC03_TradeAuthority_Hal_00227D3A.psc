;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_UC03_TradeAuthority_Hal_00227D3A Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_01
Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
;BEGIN CODE
if !UC03.GetStageDone(899)
  UC03_JakobsDebtAmount.SetValue(UC03_JakobsDebtNewValue_01.GetValueInt())
  UC03.UpdateCurrentInstanceGlobal(UC03_JakobsDebtAmount)
endif

if UC03.GetStageDone(510) && !UC03.GetStageDone(700)
  UC03.SetStage(700)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_02
Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
;BEGIN CODE
if !UC03.GetStageDone(899)
    UC03_JakobsDebtAmount.SetValue(UC03_JakobsDebtNewValue_02.GetValueInt())
  UC03.UpdateCurrentInstanceGlobal(UC03_JakobsDebtAmount)
endif 

if UC03.GetStageDone(510) && !UC03.GetStageDone(700)
  UC03.SetStage(700)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_03
Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
;BEGIN CODE
if !UC03.GetStageDone(899)
  UC03_JakobsDebtAmount.SetValue(UC03_JakobsDebtNewValue_00.GetValueInt())
  UC03.UpdateCurrentInstanceGlobal(UC03_JakobsDebtAmount)
endif

if UC03.GetStageDone(510) && !UC03.GetStageDone(700)
  UC03.SetStage(700)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_04
Function Fragment_TerminalMenu_04(ObjectReference akTerminalRef)
;BEGIN CODE
if !UC03.GetStageDone(899)
    UC03_JakobsDebtAmount.SetValue(UC03_JakobsDebtNewValue_03.GetValueInt())
  UC03.UpdateCurrentInstanceGlobal(UC03_JakobsDebtAmount)
endif

if UC03.GetStageDone(510) && !UC03.GetStageDone(700)
  UC03.SetStage(700)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_05
Function Fragment_TerminalMenu_05(ObjectReference akTerminalRef)
;BEGIN CODE
if !UC03.GetStageDone(899)
    UC03_JakobsDebtAmount.SetValue(UC03_JakobsDebtNewValue_04.GetValueInt())
  UC03.UpdateCurrentInstanceGlobal(UC03_JakobsDebtAmount)
endif

if UC03.GetStageDone(510) && !UC03.GetStageDone(700)
  UC03.SetStage(700)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_06
Function Fragment_TerminalMenu_06(ObjectReference akTerminalRef)
;BEGIN CODE
if !UC03.GetStageDone(899)
    UC03_JakobsDebtAmount.SetValue(UC03_JakobsDebtNewValue_05.GetValueInt())
  UC03.UpdateCurrentInstanceGlobal(UC03_JakobsDebtAmount)
endif

if UC03.GetStageDone(510) && !UC03.GetStageDone(700)
  UC03.SetStage(700)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_07
Function Fragment_TerminalMenu_07(ObjectReference akTerminalRef)
;BEGIN CODE
if !UC03.GetStageDone(899)
  UC03_JakobsDebtAmount.SetValue(1)
  UC03.UpdateCurrentInstanceGlobal(UC03_JakobsDebtAmount)
endif

if UC03.GetStageDone(510) && !UC03.GetStageDone(700)
  UC03.SetStage(700)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property UC03_JakobsDebtAmount Auto Const Mandatory

Quest Property UC03 Auto Const Mandatory

GlobalVariable Property UC03_JakobsDebtNewValue_00 Auto Const Mandatory

GlobalVariable Property UC03_JakobsDebtNewValue_01 Auto Const Mandatory

GlobalVariable Property UC03_JakobsDebtNewValue_02 Auto Const Mandatory

GlobalVariable Property UC03_JakobsDebtNewValue_03 Auto Const Mandatory

GlobalVariable Property UC03_JakobsDebtNewValue_04 Auto Const Mandatory

GlobalVariable Property UC03_JakobsDebtNewValue_05 Auto Const Mandatory
