Scriptname StarbornCylinderPuzzleMasterScript extends ObjectReference

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

WwiseEvent Property Tone1Event Const Auto
WwiseEvent Property Tone2Event Const Auto
WwiseEvent Property Tone3Event Const Auto

bool Property bCounterClockwise = false Const Auto
bool Property bCylinderPuzzle = false Const Auto
bool Property bVertRingsPuzzle = false Const Auto
bool Property bFiveRingsSuccess = false Const Auto


float currentAngleY
float currentAngleZ
float currentPositionX
float currentAngleX
float currentPositionY
float currentPositionZ

WwiseEvent Property sSuccessEvent Mandatory Const Auto

bool PlayerInTrigger = false
Event OnTriggerEnter(ObjectReference akActionRef)
    PlayerInTrigger = true
    While (PlayerInTrigger)
        currentAngleY = myRing.GetAngleY()
        currentAngleX = myRing.GetAngleX()
        currentAngleZ = myRing.GetAngleZ()
        currentPositionX = myRing.GetPositionX()
        currentPositionY = myRing.GetPositionY()
        currentPositionZ = myRing.GetPositionZ()
        If (bCylinderPuzzle)
            If (bCounterClockwise == true)
                myRing.TranslateTo(currentPositionX, currentPositionY, currentPositionZ, currentAngleX, currentAngleY - 0.5, currentAngleZ, 0, 1)
            Else
                myRing.TranslateTo(currentPositionX, currentPositionY, currentPositionZ, currentAngleX, currentAngleY + 0.5, currentAngleZ, 0, 1)
            EndIf
        ElseIf (bVertRingsPuzzle == true)
            If (bCounterClockwise)
                myRing.TranslateTo(currentPositionX, currentPositionY, currentPositionZ, currentAngleX - 0.4, currentAngleY, currentAngleZ, 100)
            Else
                myRing.TranslateTo(currentPositionX, currentPositionY, currentPositionZ, currentAngleX + 0.4, currentAngleY, currentAngleZ, 100)
            EndIf
        EndIf
        Utility.Wait(0.2)
    EndWhile
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
    PlayerInTrigger = false
    myRing.StopTranslation()
    If (bVertRingsPuzzle)
        VRingsCheckPosition()
    ElseIf (bCylinderPuzzle) && (bFiveRingsSuccess)
        FiveRingsCheckPosition()
    elseif (bCylinderPuzzle)
        CylinderCheckPosition()
    EndIf
EndEvent


Function CylinderCheckPosition()
    If ((myRing.GetAngleY() <= 2.0) && (myRing.GetAngleY() >= -2.0)) && ((Ring2.GetAngleY() <= 2.0) && (Ring2.GetAngleY() >= -2.0)) && ((Ring3.GetAngleY() <= 2.0) && (Ring3.GetAngleY() >= -2.0))
        Utility.Wait(1)
        Tone1Event.Play(sSuccessMarker)
        Utility.Wait(1)
        Tone2Event.Play(sSuccessMarker)
        Utility.Wait(1)
        Tone3Event.Play(sSuccessMarker)
        Utility.Wait(2)
        sSuccessEvent.Play(sSuccessMarker)
        Ramp.TranslateToRef(RampPositionMarker, 1.0)
        myRing.SetScale(0.9)
        myRing.TranslateToRef(RingsTranslateToMarker, 1.0)
        Ring2.SetScale(1.1)
        Ring2.TranslateToRef(RingsTranslateToMarker, 1.0)
        Ring3.SetScale(0.8)
        Ring3.TranslateToRef(RingsTranslateToMarker, 1.0)
    EndIf
EndFunction

Function VRingsCheckPosition()
    If ((myRing.GetAngleX() <= 2.0) && (myRing.GetAngleX() >= -2.0)) && ((Ring2.GetAngleX() <= 2.0) && (Ring2.GetAngleX() >= -2.0)) && ((Ring3.GetAngleX() <= 2.0) && (Ring3.GetAngleX() >= -2.0))
        Utility.Wait(1)
        sSuccessEvent.Play(sSuccessMarker)
        SPDoorTop.TranslateToRef(SPDoorTopMoveToMarker, 10)
        SPDoorBottom.TranslateToRef(SPDoorBottomMoveToMarker, 10)
        Ramp.TranslateToRef(RampPositionMarker, 8)
    EndIf
EndFunction

Function FiveRingsCheckPosition()
    If ((myRing.GetAngleY() <= 2.0) && (myRing.GetAngleY() >= -2.0)) && ((Ring2.GetAngleY() <= 2.0) && (Ring2.GetAngleY() >= -2.0)) && ((Ring3.GetAngleY() <= 2.0) && (Ring3.GetAngleY() >= -2.0))
        Utility.Wait(1)
        sSuccessEvent.Play(sSuccessMarker)
        myRing.TranslateToRef(RingsTranslateToMarker, 1.0)
        Ring2.TranslateToRef(RingsTranslateToMarker, 1.0)
        Ring3.TranslateToRef(RingsTranslateToMarker, 1.0)
    EndIf
EndFunction

