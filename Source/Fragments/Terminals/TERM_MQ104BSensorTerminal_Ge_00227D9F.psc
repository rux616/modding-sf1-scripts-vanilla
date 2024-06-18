;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_MQ104BSensorTerminal_Ge_00227D9F Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_01
Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
;BEGIN CODE
MQ104B.SetStage(100)
AudioLogs_MQ104B_BarrettHeller.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ104B Auto Const Mandatory

Scene Property AudioLogs_MQ104B_BarrettHeller Auto Const Mandatory
