;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_MQ301EarthTerminal02Sub_0021C75F Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_01
Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
;BEGIN CODE
AudioLogsQuest_MQ301_Earth06.Stop()
AudioLogsQuest_MQ301_Earth07.Stop()
AudioLogsQuest_MQ301_Earth06.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_02
Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
;BEGIN CODE
AudioLogsQuest_MQ301_Earth06.Stop()
AudioLogsQuest_MQ301_Earth07.Stop()
AudioLogsQuest_MQ301_Earth07.Start()

MQ301.SetStage(143)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ301 Auto Const Mandatory

Scene Property AudioLogsQuest_MQ301_Earth07 Auto Const Mandatory

Scene Property AudioLogsQuest_MQ301_Earth06 Auto Const Mandatory
