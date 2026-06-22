;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_BQ01_TerminalMenu_TownH_0027D897 Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_00
Function Fragment_TerminalMenu_00(ObjectReference akTerminalRef)
;BEGIN CODE
Game.GetPlayer().SetValue(AV_SelfAddress, 79)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_01
Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
;BEGIN CODE
Game.GetPlayer().SetValue(AV_SelfAddress, 72)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_02
Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
;BEGIN CODE
int SelfAddress = Game.GetPlayer().GetValue(AV_SelfAddress) as Int

If SelfAddress == 71
   BarrettCommitmentQuest.SetStage(71)
ElseIf SelfAddress == 72
   BarrettCommitmentQuest.SetStage(72)
ElseIf SelfAddress == 73
   BarrettCommitmentQuest.SetStage(73)
ElseIf SelfAddress == 74
   BarrettCommitmentQuest.SetStage(74)
ElseIf SelfAddress == 75
   BarrettCommitmentQuest.SetStage(75)
Else
   BarrettCommitmentQuest.SetStage(79)
EndIf 

BarrettCommitmentQuest.SetStage(85)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_03
Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
;BEGIN CODE
Game.GetPlayer().SetValue(AV_SelfAddress, 71)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_04
Function Fragment_TerminalMenu_04(ObjectReference akTerminalRef)
;BEGIN CODE
Game.GetPlayer().SetValue(AV_SelfAddress, 74)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_05
Function Fragment_TerminalMenu_05(ObjectReference akTerminalRef)
;BEGIN CODE
Game.GetPlayer().SetValue(AV_SelfAddress, 73)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_06
Function Fragment_TerminalMenu_06(ObjectReference akTerminalRef)
;BEGIN CODE
Game.GetPlayer().SetValue(AV_SelfAddress, 75)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BarrettCommitmentQuest Auto Const Mandatory


ActorValue Property AV_SelfAddress Auto Const Mandatory
