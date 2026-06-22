Scriptname LC102LifeSupportSwitchScript extends ObjectReference

GlobalVariable property LC102LifeSupportResetCount auto const
WwiseEvent property WwiseEvent_QST_CF04_LifeSupport_Power_Off auto const
WwiseEvent property LifeSupportMachineOffEvent auto const

bool lifeSupportMachineReset = false

event OnActivate(ObjectReference akActionRef)
    if(lifeSupportMachineReset == false)
        self.BlockActivation(true, true)

        ObjectReference machineRunningSoundMarker = GetLinkedRef()

        if(machineRunningSoundMarker)
            machineRunningSoundMarker.Disable()
        endIf

        LifeSupportMachineOffEvent.Play(self)

        LC102LifeSupportResetCount.value += 1

        if(LC102LifeSupportResetCount.value >= 3)
            WwiseEvent_QST_CF04_LifeSupport_Power_Off.Play(self)
        endIf

        lifeSupportMachineReset = true
    endIf
endEvent