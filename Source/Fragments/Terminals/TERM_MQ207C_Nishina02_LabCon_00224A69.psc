;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_MQ207C_Nishina02_LabCon_00224A69 Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_02
Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
;BEGIN CODE
;Try to start degaussing.
MQ207C.TryToStartDegaussing(akTerminalRef.GetValue(MQ207C_LabControlTerminalUniverseValue) as int)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_04
Function Fragment_TerminalMenu_04(ObjectReference akTerminalRef)
;BEGIN CODE
;Try to start degaussing.
MQ207C.TryToStartDegaussing(akTerminalRef.GetValue(MQ207C_LabControlTerminalUniverseValue) as int)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MQ207CQuestScript Property MQ207C Auto Const Mandatory

ActorValue Property MQ207C_LabControlTerminalUniverseValue Auto Const Mandatory
