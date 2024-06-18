;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_UC03_TradeAuthority_Pub_00227D37 Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_03
Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, UC03_JakobsDebtAmount.GetValueInt())
UC03_JakobsDebtAmount.SetValue(0)

if !UC03.GetStageDone(890) && !UC03.GetStageDone(880)
  UC03.SetStage(880)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Credits Auto Const Mandatory

GlobalVariable Property UC03_JakobsDebtAmount Auto Const Mandatory

Quest Property UC03 Auto Const Mandatory
