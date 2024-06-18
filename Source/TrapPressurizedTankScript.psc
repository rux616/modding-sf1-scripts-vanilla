Scriptname TrapPressurizedTankScript extends ObjectReference
{Script that handles the pressurized tank trap}

group TrapPressurizedTankData
    Float property randomAngleRange = 45.0 auto const
    {Random range for force applied during boost. 0 = fly straight.}
    Float property flyForce = 50.0 auto const
    {magnitude of the impluse applied on direction modification}
    Float Property impulsePeriod = 1.0 Const Auto
endGroup

group Audio
    WwiseEvent Property WwiseEvent_TRP_PressurizedTank_AirRelease Mandatory Const Auto
endGroup

auto State IdleState
    Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
        Debug.Trace("Out destruction stage changed from " + aiOldStage + " to " + aiCurrentStage)
        GotoState("FlyingState")
    EndEvent
EndState

State FlyingState
    Event OnBeginState(string asOldState)
        StartTimer(impulsePeriod)
        WwiseEvent_TRP_PressurizedTank_AirRelease.Play(self)
    EndEvent

    Event OnTimer(int aiTimerID)
        ;Determine impulse direction and apply impulse
        float eulerAngleX = self.getAngleX()+Utility.RandomFloat(-1*randomAngleRange, randomAngleRange)
        float eulerAngleY = self.getAngleY()+Utility.RandomFloat(-1*randomAngleRange, randomAngleRange)

        float cosX = math.cos(eulerAngleX)
        float cosY = math.cos(eulerAngleY)

        float sinX = math.sin(eulerAngleX)
        float sinY = math.sin(eulerAngleY)

        float angleX = sinY
        float angleY = -sinX * cosY
        float angleZ = cosX * cosY

        self.ApplyHavokImpulse(angleX, angleY, angleZ, flyForce)
        StartTimer(impulsePeriod)
    EndEvent

    Event OnDestroyed(ObjectReference akDestroyer)
        GotoState("DestroyedState")
    EndEvent
EndState

State DestroyedState

EndState