;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_SY_Deimos_SalesSubTermi_00227CF3 Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_01
Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
;BEGIN CODE
City_CY_RedTape01ApplicationTotal.SetValue(City_CY_RedTape01Application01.GetValue() + City_CY_RedTape01Application02.GetValue() + City_CY_RedTape01Application03.GetValue() + City_CY_RedTape01Application04.GetValue() + City_CY_RedTape01Application05.GetValue())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property City_CY_RedTape01Application01 Auto Const Mandatory

GlobalVariable Property City_CY_RedTape01Application02 Auto Const Mandatory

GlobalVariable Property City_CY_RedTape01Application03 Auto Const Mandatory

GlobalVariable Property City_CY_RedTape01Application04 Auto Const Mandatory

GlobalVariable Property City_CY_RedTape01Application05 Auto Const Mandatory

GlobalVariable Property City_CY_RedTape01ApplicationTotal Auto Const Mandatory
