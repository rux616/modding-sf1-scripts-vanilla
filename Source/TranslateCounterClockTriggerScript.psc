Scriptname TranslateCounterClockTriggerScript extends ObjectReference

ObjectReference Property myRing Mandatory Const Auto
ObjectReference Property Ring2 Mandatory Const Auto
ObjectReference Property Ring3 Mandatory Const Auto
ObjectReference Property sSuccessMarker Mandatory Const Auto
ObjectReference Property Ramp Mandatory Const Auto
ObjectReference Property RampPositionMarker Mandatory Const Auto
ObjectReference Property RingsTranslateToMarker Const Auto
ObjectReference Property SPDoorTop Const Auto
ObjectReference Property SPDoorBottom Const Auto
ObjectReference Property SPDoorTopMoveToMarker Const Auto
ObjectReference Property SPDoorBottomMoveToMarker Const Auto

WwiseEvent Property sSuccess Mandatory Const Auto

bool PlayerInTrigger = true
Event OnTriggerEnter(ObjectReference akActionRef)
PlayerInTrigger = true
    While (PlayerInTrigger)
    float currentAngleX = myRing.GetAngleX()
    float currentAngleY = myRing.GetAngleY()
    float currentAngleZ = myRing.GetAngleZ()
    float currentPositionX = myRing.GetPositionX()
    float currentPositionY = myRing.GetPositionY()
    float currentPositionZ = myRing.GetPositionZ()
    myRing.TranslateTo(currentPositionX, currentPositionY, currentPositionZ, currentAngleX, currentAngleY, currentAngleZ - 0.2, 250)
    Utility.Wait(0.1)
    EndWhile
EndEvent
Event OnTriggerLeave(ObjectReference akActionRef)
    PlayerInTrigger = false
    myRing.StopTranslation()
    CheckPositions()
EndEvent

Function CheckPositions()
    If ((myRing.GetAngleZ() <= 2.0) && (myRing.GetAngleZ() >= -2.0)) && ((Ring2.GetAngleZ() <= 2.0) && (Ring2.GetAngleZ() >= -2.0)) && ((Ring3.GetAngleZ() <= 2.0) && (Ring3.GetAngleZ() >= -2.0))
        Utility.Wait(1)
        sSuccess.Play(sSuccessMarker)
        Ramp.TranslateToRef(RampPositionMarker, 1.0)
        myRing.SetScale(0.9)
        myRing.TranslateToRef(RingsTranslateToMarker, 1.0)
        Ring2.SetScale(1.1)
        Ring2.TranslateToRef(RingsTranslateToMarker, 1.0)
        Ring3.SetScale(0.8)
        Ring3.TranslateToRef(RingsTranslateToMarker, 1.0)
        SPDoorTop.TranslateToRef(SPDoorTopMoveToMarker, 10)
        SPDoorBottom.TranslateToRef(SPDoorBottomMoveToMarker, 10)
    EndIf
EndFunction