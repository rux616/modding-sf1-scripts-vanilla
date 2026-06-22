;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_MQ207C_Nishina02_Securi_00223FEF Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_01
Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
;BEGIN CODE
;Override Lockdown, Facilities
MQ207C.SetStage(618)
akTerminalRef.SetValue(MQ207C_SecurityOverrideActiveValue, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_02
Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
;BEGIN CODE
;Override Lockdown, Accelerator Control
MQ207C.SetStage(625)
akTerminalRef.SetValue(MQ207C_SecurityOverrideActiveValue, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_04
Function Fragment_TerminalMenu_04(ObjectReference akTerminalRef)
;BEGIN CODE
;Override Lockdown, Storage
MQ207C.SetStage(638)
akTerminalRef.SetValue(MQ207C_SecurityOverrideActiveValue, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_06
Function Fragment_TerminalMenu_06(ObjectReference akTerminalRef)
;BEGIN CODE
;Override Lockdown, Accelerator
MQ207C.SetStage(628)
akTerminalRef.SetValue(MQ207C_SecurityOverrideActiveValue, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ207C Auto Const

ActorValue Property MQ207C_SecurityOverrideActiveValue Auto Const Mandatory
