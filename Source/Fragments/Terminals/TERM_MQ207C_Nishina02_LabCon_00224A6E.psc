;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_MQ207C_Nishina02_LabCon_00224A6E Extends TerminalMenu Hidden Const

;BEGIN FRAGMENT Fragment_TerminalMenu_02
Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
;BEGIN CODE
;Try to start Frequency Calibration.
MQ207C.TryToStartFrequencyCalibration(akTerminalRef.GetValue(MQ207C_LabControlTerminalUniverseValue) as int)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_03
Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
;BEGIN CODE
;Set the frequency output.
MQ207C.SetFrequencyOutput(akTerminalRef.GetValue(MQ207C_LabControlTerminalUniverseValue) as int, 20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_04
Function Fragment_TerminalMenu_04(ObjectReference akTerminalRef)
;BEGIN CODE
;Set the frequency output.
MQ207C.SetFrequencyOutput(akTerminalRef.GetValue(MQ207C_LabControlTerminalUniverseValue) as int, 22)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_05
Function Fragment_TerminalMenu_05(ObjectReference akTerminalRef)
;BEGIN CODE
;Set the frequency output.
MQ207C.SetFrequencyOutput(akTerminalRef.GetValue(MQ207C_LabControlTerminalUniverseValue) as int, 24)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_06
Function Fragment_TerminalMenu_06(ObjectReference akTerminalRef)
;BEGIN CODE
;Set the frequency output.
MQ207C.SetFrequencyOutput(akTerminalRef.GetValue(MQ207C_LabControlTerminalUniverseValue) as int, 26)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_07
Function Fragment_TerminalMenu_07(ObjectReference akTerminalRef)
;BEGIN CODE
;Set the frequency output.
MQ207C.SetFrequencyOutput(akTerminalRef.GetValue(MQ207C_LabControlTerminalUniverseValue) as int, 28)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_08
Function Fragment_TerminalMenu_08(ObjectReference akTerminalRef)
;BEGIN CODE
;Set the frequency output.
MQ207C.SetFrequencyOutput(akTerminalRef.GetValue(MQ207C_LabControlTerminalUniverseValue) as int, 30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_09
Function Fragment_TerminalMenu_09(ObjectReference akTerminalRef)
;BEGIN CODE
;Set the frequency output.
MQ207C.SetFrequencyOutput(akTerminalRef.GetValue(MQ207C_LabControlTerminalUniverseValue) as int, 32)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_10
Function Fragment_TerminalMenu_10(ObjectReference akTerminalRef)
;BEGIN CODE
;Set the frequency output.
MQ207C.SetFrequencyOutput(akTerminalRef.GetValue(MQ207C_LabControlTerminalUniverseValue) as int, 34)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_11
Function Fragment_TerminalMenu_11(ObjectReference akTerminalRef)
;BEGIN CODE
;Set the frequency output.
MQ207C.SetFrequencyOutput(akTerminalRef.GetValue(MQ207C_LabControlTerminalUniverseValue) as int, 36)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_12
Function Fragment_TerminalMenu_12(ObjectReference akTerminalRef)
;BEGIN CODE
;Set the frequency output.
MQ207C.SetFrequencyOutput(akTerminalRef.GetValue(MQ207C_LabControlTerminalUniverseValue) as int, 38)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_13
Function Fragment_TerminalMenu_13(ObjectReference akTerminalRef)
;BEGIN CODE
;Set the frequency output.
MQ207C.SetFrequencyOutput(akTerminalRef.GetValue(MQ207C_LabControlTerminalUniverseValue) as int, 40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_14
Function Fragment_TerminalMenu_14(ObjectReference akTerminalRef)
;BEGIN CODE
;Try to start Frequency Calibration.
MQ207C.TryToStartFrequencyCalibration(akTerminalRef.GetValue(MQ207C_LabControlTerminalUniverseValue) as int)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_16
Function Fragment_TerminalMenu_16(ObjectReference akTerminalRef)
;BEGIN CODE
;Try to start Frequency Calibration.
MQ207C.TryToStartFrequencyCalibration(akTerminalRef.GetValue(MQ207C_LabControlTerminalUniverseValue) as int)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_TerminalMenu_17
Function Fragment_TerminalMenu_17(ObjectReference akTerminalRef)
;BEGIN CODE
;Try to start Frequency Calibration.
MQ207C.TryToStartFrequencyCalibration(akTerminalRef.GetValue(MQ207C_LabControlTerminalUniverseValue) as int)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MQ207CQuestScript Property MQ207C Auto Const Mandatory

ActorValue Property MQ207C_LabControlTerminalUniverseValue Auto Const Mandatory
