;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_Neon_Drug02_XenofreshJo_00227CCC Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_04
Function Fragment_TerminalMenu_04(ObjectReference akTerminalRef)
;BEGIN CODE
; Now the quest can carry on
City_Neon_Drug02.SetStage(250)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property City_Neon_Drug02 Auto Const Mandatory
