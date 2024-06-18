;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM__01000A81 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
ObjectReference[] linkedRefChain = akTerminalRef.GetLinkedRefChain()
int i = 0
While i < linkedRefChain.Length
     linkedRefChain[i].Unlock()
     i += 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
