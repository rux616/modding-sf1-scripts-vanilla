;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_UC01_SimShipTerminal_De_0003D5D9 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
;Unlock the Ship Inventory.
akTerminalRef.GetLinkedRef(LinkShipSpaceshipInventory).Unlock()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkShipSpaceshipInventory Auto Const Mandatory
