;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_LC168_StorageTerminal_D_002D4A51 Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_01
Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
;BEGIN CODE
;Unlock Linked Door
akTerminalRef.GetLinkedRef(LinkCustom01).Unlock()
akTerminalRef.GetLinkedRef(LinkCustom01).SetOpen()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkCustom01 Auto Const
