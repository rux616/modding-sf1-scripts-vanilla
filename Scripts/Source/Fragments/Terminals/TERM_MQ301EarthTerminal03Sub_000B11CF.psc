;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_MQ301EarthTerminal03Sub_000B11CF Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_01
Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
;BEGIN CODE
AudioLogsQuest_MQ301_Earth09.Stop()
AudioLogsQuest_MQ301_Earth10.Stop()
AudioLogsQuest_MQ301_Earth08.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_02
Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
;BEGIN CODE
AudioLogsQuest_MQ301_Earth08.Stop()
AudioLogsQuest_MQ301_Earth10.Stop()
AudioLogsQuest_MQ301_Earth09.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_03
Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
;BEGIN CODE
AudioLogsQuest_MQ301_Earth08.Stop()
AudioLogsQuest_MQ301_Earth09.Stop()
AudioLogsQuest_MQ301_Earth10.Start()

MQ301.SetStage(144)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ301 Auto Const Mandatory

Scene Property AudioLogsQuest_MQ301_Earth07 Auto Const Mandatory

Scene Property AudioLogsQuest_MQ301_Earth06 Auto Const Mandatory

Scene Property AudioLogsQuest_MQ301_Earth08 Auto Const Mandatory

Scene Property AudioLogsQuest_MQ301_Earth09 Auto Const Mandatory

Scene Property AudioLogsQuest_MQ301_Earth10 Auto Const Mandatory
