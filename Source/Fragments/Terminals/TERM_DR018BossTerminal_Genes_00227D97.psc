;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DR018BossTerminal_Genes_00227D97 Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_02
Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
;BEGIN CODE
;Unlock the linked door.
akTerminalRef.GetLinkedRef(LinkCustom01).Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_03
Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
;BEGIN CODE
;Open the linked door.
akTerminalRef.GetLinkedRef(LinkCustom02).Unlock()
akTerminalRef.GetLinkedRef(LinkCustom02).SetOpen()

;LVC - If this terminal is being used in
;the Gagarin quest "Missed Connections"
;Don't play the scene that triggers 
;(since it's not pirates here)
if !akTerminalRef.HasKeyword(UC_GG_Mark_DoorTerminal_Keyword)
  DR018_DoorOpenScene.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkCustom01 Auto Const

Keyword Property LinkCustom02 Auto Const

Scene Property DR018_DoorOpenScene Auto Const

Keyword Property UC_GG_Mark_DoorTerminal_Keyword Auto Const Mandatory
