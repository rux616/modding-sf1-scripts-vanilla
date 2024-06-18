Scriptname LC070PowerCellTerminalScript extends ReferenceAlias Const

Quest Property COM_Quest_SarahMorgan_Q01 Auto Const Mandatory
ReferenceAlias Property PowerCellReceptacleAlias Auto Const Mandatory

Event OnLoad()
    RegisterForRemoteEvent(PowerCellReceptacleAlias.getref(), "OnPowerOn")
EndEvent

Event ObjectReference.OnPowerOn(ObjectReference akSender, ObjectReference akPowerGenerator)
        COM_Quest_SarahMorgan_Q01.setstage(100)
endEvent