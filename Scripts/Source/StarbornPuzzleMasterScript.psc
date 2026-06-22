Scriptname StarbornPuzzleMasterScript extends ObjectReference Const

WwiseEvent Property AMBStarbornTempleTestTone_A1_D_p0Event Mandatory Const Auto
WwiseEvent Property AMBStarbornTempleTestTone_A1_D_p1Event Mandatory Const Auto
WwiseEvent Property AMBStarbornTempleTestTone_A1_D_p2Event Mandatory Const Auto
WwiseEvent Property AMBStarbornTempleTestTone_A1_D_p3Event Mandatory Const Auto

WwiseEvent Property AMBStarbornTempleTestTone_B2_Fs_p0Event Mandatory Const Auto
WwiseEvent Property AMBStarbornTempleTestTone_B2_Fs_p1Event Mandatory Const Auto
WwiseEvent Property AMBStarbornTempleTestTone_B2_Fs_p2Event Mandatory Const Auto
WwiseEvent Property AMBStarbornTempleTestTone_B2_Fs_p3Event Mandatory Const Auto

WwiseEvent Property AMBStarbornTempleTestTone_C3_A_p0Event Mandatory Const Auto
WwiseEvent Property AMBStarbornTempleTestTone_C3_A_p1Event Mandatory Const Auto
WwiseEvent Property AMBStarbornTempleTestTone_C3_A_p2Event Mandatory Const Auto
WwiseEvent Property AMBStarbornTempleTestTone_C3_A_p3Event Mandatory Const Auto

ObjectReference Property Ring1Dummy Mandatory Const Auto
ObjectReference Property Ring2Dummy Mandatory Const Auto
ObjectReference Property Ring3Dummy Mandatory Const Auto

ObjectReference Property CompletionSoundMarker Mandatory Const Auto
ObjectReference Property CompletionSoundMarker2 Mandatory Const Auto
ObjectReference Property PuzzleOpenMarker Mandatory Const Auto
ObjectReference Property RampMoveMarker Mandatory Const Auto
ObjectReference Property Ramp Mandatory Const Auto
ObjectReference Property BottomRing Mandatory Const Auto



int Property Ring1Solution = 1 Mandatory Const Auto
{this is the position ring 1 needs to be in to solve this puzzle}
int Property Ring2Solution = 1 Mandatory Const Auto
{this is the position ring 2 needs to be in to solve this puzzle}
int Property Ring3Solution = 1 Mandatory Const Auto
{this is the position ring 3 needs to be in to solve this puzzle}

WwiseEvent Property AMBStarbornTempleTestPuzzleSuccessEvent Mandatory Const Auto
WwiseEvent Property sFailureEvent Mandatory Const Auto
WwiseEvent Property sWallOpeningEvent Mandatory Const Auto


Event OnActivate(ObjectReference akActionRef)
    (Ring1Dummy as StarbornPuzzleScript).iCurrentPosition
    (Ring2Dummy as StarbornPuzzleScript).iCurrentPosition
    (Ring3Dummy as StarbornPuzzleScript).iCurrentPosition
    PlayTones()
    if (Ring1Dummy as StarbornPuzzleScript).iCurrentPosition == 1 && (Ring2Dummy as StarbornPuzzleScript).iCurrentPosition == 1 && (Ring3Dummy as StarbornPuzzleScript).iCurrentPosition == 1
        CorrectPattern()
    Else
        ;IncorrectPattern()
    EndIf

EndEvent

Function PlayTones()
int iCurrentFirstTone = 1
int iCurrentSecondTone = 1
int iCurrentThirdTone = 1
    If (Ring1Dummy as StarbornPuzzleScript).iCurrentPosition == 1
        iCurrentFirstTone = 1
        AMBStarbornTempleTestTone_A1_D_p0Event.Play(CompletionSoundMarker)
        utility.Wait(2)
    EndIf
    If (Ring1Dummy as StarbornPuzzleScript).iCurrentPosition == 2
        iCurrentFirstTone = 2
        AMBStarbornTempleTestTone_A1_D_p1Event.Play(CompletionSoundMarker)
        utility.Wait(2)
    EndIf
    If (Ring1Dummy as StarbornPuzzleScript).iCurrentPosition == 3
        iCurrentFirstTone = 3
        AMBStarbornTempleTestTone_A1_D_p2Event.Play(CompletionSoundMarker)
        utility.Wait(2)
    EndIf
    If (Ring1Dummy as StarbornPuzzleScript).iCurrentPosition == 4
        iCurrentFirstTone = 4
        AMBStarbornTempleTestTone_A1_D_p3Event.Play(CompletionSoundMarker)
        utility.Wait(2)
    EndIf
    If (Ring2Dummy as StarbornPuzzleScript).iCurrentPosition == 1
        iCurrentSecondTone = 1
        AMBStarbornTempleTestTone_B2_Fs_p0Event.Play(CompletionSoundMarker)
        utility.Wait(2)
    EndIf
    If (Ring2Dummy as StarbornPuzzleScript).iCurrentPosition == 2
        iCurrentSecondTone = 2
        AMBStarbornTempleTestTone_A1_D_p1Event.Play(CompletionSoundMarker)
        utility.Wait(2)
    EndIf
    If (Ring2Dummy as StarbornPuzzleScript).iCurrentPosition == 3
        iCurrentSecondTone = 3
        AMBStarbornTempleTestTone_A1_D_p2Event.Play(CompletionSoundMarker)
        utility.Wait(2)
    EndIf
    If (Ring2Dummy as StarbornPuzzleScript).iCurrentPosition == 4
        iCurrentSecondTone = 4
        AMBStarbornTempleTestTone_A1_D_p3Event.Play(CompletionSoundMarker)
        utility.Wait(2)
    EndIf
    If (Ring3Dummy as StarbornPuzzleScript).iCurrentPosition == 1
        iCurrentThirdTone = 1
        AMBStarbornTempleTestTone_C3_A_p0Event.Play(CompletionSoundMarker)
        utility.Wait(2)
    EndIf
    If (Ring3Dummy as StarbornPuzzleScript).iCurrentPosition == 2
        iCurrentThirdTone = 2
        AMBStarbornTempleTestTone_A1_D_p1Event.Play(CompletionSoundMarker)
        utility.Wait(2)
    EndIf
    If (Ring3Dummy as StarbornPuzzleScript).iCurrentPosition == 3
        iCurrentThirdTone = 3
        AMBStarbornTempleTestTone_A1_D_p2Event.Play(CompletionSoundMarker)
        utility.Wait(2)
    EndIf
    If (Ring3Dummy as StarbornPuzzleScript).iCurrentPosition == 4
        iCurrentThirdTone = 4
        AMBStarbornTempleTestTone_A1_D_p3Event.Play(CompletionSoundMarker)
        utility.Wait(2)
    EndIf
EndFunction

Function CorrectPattern()
    ;AMBStarbornTempleTestTone_A1_D_p0Event
    ;AMBStarbornTempleTestTone_B2_Fs_p0Event
    ;AMBStarbornTempleTestTone_C3_A_p0Event
    ;Utility.Wait(6)
    AMBStarbornTempleTestPuzzleSuccessEvent.Play(CompletionSoundMarker)
    Utility.Wait(2)
    BottomRing.TranslateToRef(PuzzleOpenMarker, 1.0, 30)
    ;sWallOpeningEvent.Play(CompletionSoundMarker2)
    Utility.Wait(2)
    Ramp.TranslateToRef(RampMoveMarker, 1.0)
    EndFunction

Function IncorrectPattern()
    sFailureEvent.Play(CompletionSoundMarker)
EndFunction