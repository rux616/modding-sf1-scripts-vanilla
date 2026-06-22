;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_MQ301EarthTerminal01Sub_0021CE26 Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_01
Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
;BEGIN CODE
AudioLogsQuest_MQ301_Earth01.Stop()
AudioLogsQuest_MQ301_Earth02.Stop()
AudioLogsQuest_MQ301_Earth03.Stop()
AudioLogsQuest_MQ301_Earth01.Start()
MQ301.SetStage(141)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_02
Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
;BEGIN CODE
AudioLogsQuest_MQ301_Earth01.Stop()
AudioLogsQuest_MQ301_Earth02.Stop()
AudioLogsQuest_MQ301_Earth03.Stop()
AudioLogsQuest_MQ301_Earth02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_03
Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
;BEGIN CODE
AudioLogsQuest_MQ301_Earth01.Stop()
AudioLogsQuest_MQ301_Earth02.Stop()
AudioLogsQuest_MQ301_Earth03.Stop()
AudioLogsQuest_MQ301_Earth03.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ301 Auto Const Mandatory

Scene Property AudioLogsQuest_MQ301_Earth01 Auto Const Mandatory

Scene Property AudioLogsQuest_MQ301_Earth02 Auto Const Mandatory

Scene Property AudioLogsQuest_MQ301_Earth03 Auto Const Mandatory
