Scriptname MQ104BComputerScript extends ReferenceAlias

Message Property MQ104BSensorArrayMSG_01_Main Mandatory Const Auto
Message Property MQ104BSensorArrayMSG_02_ReplacePowerFail Mandatory Const Auto
Message Property MQ104BSensorArrayMSG_02_ReplacePowerSuccess Mandatory Const Auto
Message Property MQ104BSensorArrayMSG_03_OutpostSuccess Mandatory Const Auto
Message Property MQ104BSensorArrayMSG_04_InfoSuccess Mandatory Const Auto
MiscObject Property Mfg_Power_Circuit Mandatory Const Auto
Int Property NumReqPowerCircuit=3 Const Auto
Int Property ReplacePowerSuccessStage=40 Const Auto
Int Property ReplacePowerFailStage=45 Const Auto
Int Property OutpostSuccessStage=50 Const Auto
Int Property InfoSuccessStage=55 Const Auto

Event OnActivate(ObjectReference akActionRef)
    If akActionRef == Game.GetPlayer()
        Quest MQ104B = GetOwningQuest()
        Int iButtonPressed
        iButtonPressed = MQ104BSensorArrayMSG_01_Main.Show()
        If iButtonPressed == 1
            MQ104BSensorArrayMSG_02_ReplacePowerFail.Show()
            MQ104B.SetStage(ReplacePowerFailStage)
        ElseIf iButtonPressed == 2
            MQ104BSensorArrayMSG_03_OutpostSuccess.Show()
            MQ104B.SetStage(OutpostSuccessStage)
        ElseIf iButtonPressed == 3
            MQ104BSensorArrayMSG_04_InfoSuccess.Show()
            MQ104B.SetStage(InfoSuccessStage)
        EndIf
    EndIf
EndEvent