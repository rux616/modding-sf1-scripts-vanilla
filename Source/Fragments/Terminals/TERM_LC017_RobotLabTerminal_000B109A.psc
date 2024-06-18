;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_LC017_RobotLabTerminal_000B109A Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
;TEMP - To be replaced by native terminal functionality once available.
ObjectReference[] linkedSecurityDoors = akTerminalRef.GetLinkedRefChain(LinkTerminalSecurityDoor)
int i = 0
While (i < linkedSecurityDoors.Length)
     linkedSecurityDoors[i].Unlock()
     linkedSecurityDoors[i].SetOpen(True)
     i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkTerminalSecurityDoor Auto Const Mandatory
