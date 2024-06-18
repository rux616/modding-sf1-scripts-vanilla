;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_UC01_VanguardRegistrati_00227D84 Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_01
Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
;BEGIN CODE
CrimeFactionUC.PlayerPayCrimeGold(false, false)
;Game.GetPlayer().RemoveItem(Credits, CrimeFactionUC.GetCrimeGold())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Credits Auto Const Mandatory

Faction Property CrimeFactionUC Auto Const Mandatory
