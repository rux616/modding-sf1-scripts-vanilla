;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM__010008E6_1 Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_01
Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
;BEGIN CODE
ObjectReference[] linkedSecurityDoors = akTerminalRef.GetLinkedRefChain(LinkTerminalSecurityDoor)
int i = 0
While (i < linkedSecurityDoors.Length)   
     linkedSecurityDoors[i].SetOpen(True)
     linkedSecurityDoors[i].SetLockLevel(253)
     i = i + 1
EndWhile
ObjectReference[] linkedCreatures = akTerminalRef.GetLinkedRefChain(LinkCustom01)
int j = 0
While (j < linkedCreatures.Length)   
     linkedCreatures[j].SetValue(LC012_CreatureAttack, 1)
     j = j + 1
EndWhile
akTerminalRef.SetValue(LC012_CreatureAttack, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_02
Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
;BEGIN CODE
ObjectReference[] linkedSecurityDoors = akTerminalRef.GetLinkedRefChain(LinkTerminalSecurityDoor)
int i = 0
While (i < linkedSecurityDoors.Length)   
     linkedSecurityDoors[i].SetOpen(False)
     linkedSecurityDoors[i].SetLockLevel(253)
     i = i + 1
EndWhile
akTerminalRef.SetValue(LC012_CreatureAttack, 0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkTerminalSecurityDoor Auto Const Mandatory

Keyword Property LinkCustom01 Auto Const Mandatory

ActorValue Property LC012_CreatureAttack Auto Const Mandatory
