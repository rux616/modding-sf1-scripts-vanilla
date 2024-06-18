Scriptname RL083_AssemblyLine extends Quest

ObjectReference Property PanelTop01 Const Auto
ObjectReference Property PanelTop02 Const Auto
ObjectReference Property PanelSideL01 Const Auto
ObjectReference Property PanelSideL02 Const Auto
ObjectReference Property PanelSideL03 Const Auto
ObjectReference Property PanelSideL04 Const Auto
ObjectReference Property PanelSideL05 Const Auto
ObjectReference Property PanelSideR01 Const Auto
ObjectReference Property PanelSideR02 Const Auto
ObjectReference Property PanelSideR03 Const Auto
ObjectReference Property PanelSideR04 Const Auto
ObjectReference Property PanelSideR05 Const Auto
ObjectReference Property PanelFront Const Auto
ObjectReference Property WelderBot01 Const Auto
ObjectReference Property WelderBot02 Const Auto
ObjectReference Property WelderBot03 Const Auto
ObjectReference Property WelderBot04 Const Auto
ObjectReference Property HatchDoor Const Auto

Function StartConstruct()
    WelderBot01.PlayAnimation("Play01")
    WelderBot02.PlayAnimation("Play01")
    WelderBot03.PlayAnimation("Play01")
    WelderBot04.PlayAnimation("Play01")

    Utility.Wait(2)
    PanelTop01.PlayAnimation("Play01")
    Utility.Wait(1)
    PanelTop02.PlayAnimation("Play01")
    Utility.Wait(1)
    PanelSideL01.PlayAnimation("Play01")
    Utility.Wait(0.25)
    PanelSideL02.PlayAnimation("Play01")
    Utility.Wait(0.25)
    PanelSideL03.PlayAnimation("Play01")
    Utility.Wait(0.25)
    PanelSideL04.PlayAnimation("Play01")
    Utility.Wait(0.25)
    PanelSideL05.PlayAnimation("Play01")
    Utility.Wait(1)
    PanelSideR01.PlayAnimation("Play01")
    Utility.Wait(0.25)
    PanelSideR02.PlayAnimation("Play01")
    Utility.Wait(0.25)
    PanelSideR03.PlayAnimation("Play01")
    Utility.Wait(0.25)
    PanelSideR04.PlayAnimation("Play01")
    Utility.Wait(0.25)
    PanelSideR05.PlayAnimation("Play01")
    Utility.Wait(1)
    PanelFront.PlayAnimation("Play01")
    Utility.Wait(13)

    WelderBot01.PlayAnimation("Play02")
    WelderBot02.PlayAnimation("Play02")
    WelderBot03.PlayAnimation("Play02")
    WelderBot04.PlayAnimation("Play02")
    HatchDoor.SetOpen()
EndFunction