;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_CF_JasmineTerminal_LC_01001007_2 Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_01
Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
;BEGIN CODE
;TEMP - To be replaced by native terminal functionality once available.
Actor[] linkedRobots = akTerminalRef.GetLinkedRefChain(LinkTerminalRobot) as Actor[]
int i = 0
While (i < linkedRobots.Length)
     linkedRobots[i].SetUnconscious(True)
     i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_02
Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
;BEGIN CODE
;TEMP - To be replaced by native terminal functionality once available.
Actor[] linkedRobots = akTerminalRef.GetLinkedRefChain(LinkTerminalRobot) as Actor[]
int i = 0
While (i < linkedRobots.Length)
     linkedRobots[i].RemoveFromAllFactions()
     linkedRobots[i].AddToFaction(PlayerAllyFaction)
     linkedRobots[i].SetUnconscious(False)
     i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkTerminalSecurityDoor Auto Const Mandatory

Keyword Property LinkTerminalRobot Auto Const Mandatory

Faction Property PlayerAllyFaction Auto Const Mandatory
