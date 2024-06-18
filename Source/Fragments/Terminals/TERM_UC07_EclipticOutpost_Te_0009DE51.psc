;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_UC07_EclipticOutpost_Te_0009DE51 Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_02
Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
;BEGIN CODE
(Dialogue1OfAKindUC07 as OneOfAKindQuestScript).OpenCageGate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_03
Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
;BEGIN CODE
UC07_Niira_PreventCageRelease.SetValue(1)

if UC07.IsRunning()
  UC07.SetStage(615)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_04
Function Fragment_TerminalMenu_04(ObjectReference akTerminalRef)
;BEGIN CODE
UC07_Niira_PreventCageRelease.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property Dialogue1OfAKindUC07 Auto Const Mandatory

GlobalVariable Property UC07_Niira_PreventCageRelease Auto Const Mandatory

Quest Property UC07 Auto Const Mandatory
