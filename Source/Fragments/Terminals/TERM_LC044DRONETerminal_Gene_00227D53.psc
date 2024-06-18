;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_LC044DRONETerminal_Gene_00227D53 Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_01
Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
;BEGIN CODE
LC044_DRONEDemoRunning.SetValue(1)
If RI04.GetStageDone(375) && !RI04.GetStageDone(1000) && !LC044_EavesdroppingScene.GetStageDone(100)
     LC044_EavesdroppingScene.SetStage(100)
Else
     DialogueFCRyujinTower_MiniBot_DemoScene.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property LC044DRONEEavesdroppingScene Auto Const

GlobalVariable Property LC044_DRONEDemoRunning Auto Const Mandatory

Scene Property DialogueFCRyujinTower_MiniBot_DemoScene Auto Const Mandatory

Quest Property RI04 Auto Const Mandatory

ObjectReference Property RI_DemoMiniBotRef Auto Const Mandatory

Quest Property LC044_EavesdroppingScene Auto Const Mandatory
