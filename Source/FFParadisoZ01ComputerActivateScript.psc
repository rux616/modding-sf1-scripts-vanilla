Scriptname FFParadisoZ01ComputerActivateScript extends ObjectReference Const

Int Property FixComputerStage = 300 Const Auto
Int Property ComputerFixedStage = 460 Const Auto
Perk Property Security Mandatory Const Auto
Quest Property FFParadisoZ01 Mandatory Const Auto
Message Property FFParadisoZ01_ComputerMSG Mandatory Const Auto
Message Property FFParadisoZ01_ComputerMSGFail Mandatory Const Auto

Event OnLoad()
    If FFParadisoZ01.GetStageDone(FixComputerStage) && !FFParadisoZ01.GetStageDone(ComputerFixedStage)
        BlockActivation(False, False)
    Else
        BlockActivation(True, True)
    EndIf
EndEvent

Event OnActivate(ObjectReference akActionRef)
    If Game.GetPlayer().HasPerk(Security) && FFParadisoZ01.GetStageDone(FixComputerStage) && !FFParadisoZ01.GetStageDone(ComputerFixedStage)
        FFParadisoZ01_ComputerMSG.Show()
    Else
        FFParadisoZ01_ComputerMSGFail.Show()
    EndIf
EndEvent