;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_CFKey_LastNovaTerminal_001B8704 Extends Terminal Hidden Const

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

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
;TEMP - To be replaced by native terminal functionality once available.
ObjectReference[] linkedDoors = akTerminalRef.GetLinkedRefChain(LinkTerminalDoor)
int i = 0
While (i < linkedDoors.Length)
     linkedDoors[i].Unlock()
     linkedDoors[i].SetOpen(True)
     i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
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

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
;TEMP - To be replaced by native terminal functionality once available.
Actor[] linkedRobots = akTerminalRef.GetLinkedRefChain(LinkTerminalRobot) as Actor[]
int i = 0
While (i < linkedRobots.Length)
     linkedRobots[i].AddToFaction(PlayerAllyFaction)
     linkedRobots[i].RemoveFromFaction(LC043SYFaction)
     linkedRobots[i].RemoveFromFaction(LC043SY01Faction)
     linkedRobots[i].RemoveFromFaction(LC043SY02Faction)
     linkedRobots[i].RemoveFromFaction(LC043SY03Faction)
     linkedRobots[i].SetUnconscious(False)
     i = i + 1
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkTerminalSecurityDoor Auto Const Mandatory
Keyword Property LinkTerminalDoor Auto Const Mandatory
Keyword Property LinkTerminalRobot Auto Const Mandatory
Faction Property PlayerAllyFaction Auto Const Mandatory
Faction Property LC043SYFaction Auto Const Mandatory
Faction Property LC043SY01Faction Auto Const Mandatory
Faction Property LC043SY02Faction Auto Const Mandatory
Faction Property LC043SY03Faction Auto Const Mandatory
