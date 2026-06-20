;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Terminals:TERM_SFFL_AnchorpointSH_Clue_0107DD03 Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_01
Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
;BEGIN CODE
HintGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_02
Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
;BEGIN CODE
Game.GetPlayer().RemoveItem(Clue,1)
ClueGlobal.SetValue(1)
Wwise_Card_Insert.Play(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Key Property Clue Auto Const

GlobalVariable Property ClueGlobal Auto Const

GlobalVariable Property HintGlobal Auto Const

WwiseEvent Property Wwise_Card_Insert Auto Const
