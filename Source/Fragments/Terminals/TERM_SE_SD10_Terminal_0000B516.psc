;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_SE_SD10_Terminal_0000B516 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
;Unlock the linked door.
akTerminalRef.GetLinkedRef(LinkCustom01).Unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
;Open the linked door.
akTerminalRef.GetLinkedRef(LinkCustom02).Unlock()
utility.wait(1)
akTerminalRef.GetLinkedRef(LinkCustom02).SetOpen()
utility.wait(2)
DR018_EavesdroppingScene01.SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkCustom01 Auto Const

Keyword Property LinkCustom02 Auto Const

Quest Property DR018_EavesdroppingScene01 Auto Const
