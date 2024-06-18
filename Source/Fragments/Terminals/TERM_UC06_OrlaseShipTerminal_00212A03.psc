;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_UC06_OrlaseShipTerminal_00212A03 Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_02
Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
;BEGIN CODE
;Unlock the Ship Inventory.
akTerminalRef.GetLinkedRef(LinkShipSpaceshipInventory).Unlock()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkShipSpaceshipInventory Auto Const Mandatory
