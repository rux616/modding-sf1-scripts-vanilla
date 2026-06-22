;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_RL082TerminalStorage_001A946F Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
AirlockDoor01.lock()
AirlockDoor01.SetLockLevel(253)
AirlockDoor02.unlock()
RL082TAWarehouse.setGravityScale(0.0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property RL082_EavesdroppingSceneTest Auto Const

ObjectReference Property AirlockDoor01 Auto Const

ObjectReference Property AirlockDoor02 Auto Const

ObjectReference Property HavokObject01 Auto Const

Cell Property RL082TAWarehouse Auto Const

Int Property currentElement Auto Const
