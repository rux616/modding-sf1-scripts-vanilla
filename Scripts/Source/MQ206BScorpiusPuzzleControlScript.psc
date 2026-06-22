Scriptname MQ206BScorpiusPuzzleControlScript extends ObjectReference
{Master Functions for the Scorpius Puzzle sequence. Puzzle is controlled by 4 buttons that moves a beam of light into the correct position to solve.}

Keyword Property MQ206BScorpius_BeamAnimHelper Mandatory Const Auto
Keyword Property MQ206BScorpius_ButtonDown Mandatory Const Auto
Keyword Property MQ206BScorpius_ButtonLeft Mandatory Const Auto
Keyword Property MQ206BScorpius_ButtonRight Mandatory Const Auto
Keyword Property MQ206BScorpius_ButtonUp Mandatory Const Auto
Keyword Property MQ206BScorpius_Statue Mandatory Const Auto
Keyword Property MQ206BScorpius_Trigger Mandatory Const Auto
Keyword Property MQ206BScorpius_BeamLight Mandatory Const Auto

Keyword Property MQ206BScorpius_LensFlareFX Mandatory Const Auto

String Property sBeamOpacity = "Amount" Const Auto
Float Property fBeamStrength_Start = 0.5 Const Auto
float Property fBeamStrength_Reset = 0.0 Const Auto
Float Property fBeamStrength_Full = 1.0 Const Auto

String Property sMovement_LeftRight = "Rotation" Const Auto
String Property sMovement_UpDown = "Position" Const Auto
Float Property fMovement_Initial = 0.5 Const Auto
Float Property fMovementUpDown_Initial = 0.5 Const Auto

String Property sStatuePuzzleAnim_Start = "Play01" Const Auto
String Property sStatuePuzzleAnim_Reset = "Reset" Const Auto
string Property sPuzzleSolutionAnim = "Stage2" Const Auto
string Property sPuzzleSolutionAnim_Reset = "Stage1" Const Auto

Guard BeamPositionGuard
Float fCurrentPosition_LeftRight RequiresGuard(BeamPositionGuard)
Float fCurrentPosition_UpDown RequiresGuard(BeamPositionGuard)

Float Property fSolutionPosition_LeftRight = 0.2 Const Auto
Float Property fSolutionPosition_UpDown = 0.4 Const Auto

Float Property ButtonMoveAmount = 0.1 Const Auto

Quest Property MQ206B Mandatory Const Auto
Int Property MQ206BCompleteStage = 800 Const Auto
Int Property MQ206BPuzzleStartedStage = 720 Const Auto

WwiseEvent Property WwiseEvent_QST_ScorpiusStatue_Beam_Move Mandatory Const Auto
WwiseEvent Property WwiseEvent_QST_ScorpiusStatue_Glyph_Activate_Down Mandatory Const Auto
WwiseEvent Property WwiseEvent_QST_ScorpiusStatue_Glyph_Activate_Left Mandatory Const Auto
WwiseEvent Property WwiseEvent_QST_ScorpiusStatue_Glyph_Activate_Right Mandatory Const Auto
WwiseEvent Property WwiseEvent_QST_ScorpiusStatue_Glyph_Activate_Up Mandatory Const Auto
WwiseEvent Property WwiseEvent_QST_ScorpiusStatue_Success Mandatory Const Auto

ObjectReference ButtonLeftREF
ObjectReference ButtonRightREF
ObjectReference ButtonUpREF
ObjectReference ButtonDownREF

Guard PuzzleSetupGuard ProtectsFunctionLogic

Auto State InitialLoadState
    Event OnLoad()
        ObjectReference StatueTriggerREF = Self.GetLinkedRef(MQ206BScorpius_Trigger)
        RegisterForRemoteEvent(StatueTriggerREF, "OnTriggerEnter")
    EndEvent

    ;the first time the puzzle loads, wait until the player is close to start
    Event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
        ObjectReference StatueTriggerREF = Self.GetLinkedRef(MQ206BScorpius_Trigger)
        If (akSender == StatueTriggerREF) && (akActionRef == Game.GetPlayer())
            UnRegisterForRemoteEvent(StatueTriggerREF, "OnTriggerEnter")
            StartPuzzle()
            MQ206B.SetStage(MQ206BPuzzleStartedStage)
        EndIf
    EndEvent
EndState

State WaitingToStart
    Event OnLoad()
        StartPuzzle()
    EndEvent
EndState

State IdleState
    Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
        If akSender == ButtonLeftREF
            GoToState("MovingBeamState")
            WwiseEvent_QST_ScorpiusStatue_Glyph_Activate_Left.Play(ButtonLeftREF) ;play button audio
            MoveBeamLeft()
        ElseIf akSender == ButtonRightREF
            GoToState("MovingBeamState")
            WwiseEvent_QST_ScorpiusStatue_Glyph_Activate_Right.Play(ButtonRightREF) ;play button audio
            MoveBeamRight()
        ElseIf akSender == ButtonUpREF
            GoToState("MovingBeamState")
            WwiseEvent_QST_ScorpiusStatue_Glyph_Activate_Up.Play(ButtonUpREF) ;play button audio
            MoveBeamUp()
        ElseIf akSender == ButtonDownREF
            GoToState("MovingBeamState")
            WwiseEvent_QST_ScorpiusStatue_Glyph_Activate_Down.Play(ButtonDownREF) ;play button audio
            MoveBeamDown()
        EndIf

        ;return to idle state so player can activate buttons again
        GotoState("IdleState")
    EndEvent
EndState

Event OnUnload()
    ResetPuzzle() ;always reset everything if this unloads
EndEvent

State MovingBeamState
    ;empty state to prevent activation spamming
EndState

Event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
    ;do nothing
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
    ;do nothing
EndEvent

Function StartPuzzle()
    ;put a lock in case StartPuzzle and ResetPuzzle run at the same time
    LockGuard PuzzleSetupGuard
        ObjectReference StatueREF = Self.GetLinkedRef(MQ206BScorpius_Statue)
        ObjectReference BeamLightREF = Self.GetLinkedRef(MQ206BScorpius_BeamLight)
        ObjectReference BeamHelperREF = Self.GetLinkedRef(MQ206BScorpius_BeamAnimHelper)

        ButtonLeftREF = Self.GetLinkedRef(MQ206BScorpius_ButtonLeft)
        ButtonRightREF = Self.GetLinkedRef(MQ206BScorpius_ButtonRight)
        ButtonUpREF = Self.GetLinkedRef(MQ206BScorpius_ButtonUp)
        ButtonDownREF = Self.GetLinkedRef(MQ206BScorpius_ButtonDown)

        ;register for the button events for the puzzle
        RegisterForRemoteEvent(ButtonLeftREF, "OnActivate")
        RegisterForRemoteEvent(ButtonRightREF, "OnActivate")
        RegisterForRemoteEvent(ButtonUpREF, "OnActivate")
        RegisterForRemoteEvent(ButtonDownREF, "OnActivate")

        ;put statue in the correct animation state
        StatueREF.PlayAnimation(sStatuePuzzleAnim_Start)
        BeamLightREF.PlayAnimation(sStatuePuzzleAnim_Start)

        ;make sure beam position is reset
        BeamHelperREF.SetAnimationVariableFloat(sMovement_LeftRight, fMovement_Initial)
        BeamHelperREF.SetAnimationVariableFloat(sMovement_UpDown, fMovementUpDown_Initial)

        ;make sure beam of light is visible
        BeamLightREF.SetAnimationVariableFloat(sBeamOpacity, fBeamStrength_Start)

        ;variables to track beam position should reset
        LockGuard BeamPositionGuard
            fCurrentPosition_LeftRight = fMovement_Initial
            fCurrentPosition_UpDown = fMovementUpDown_Initial
        EndLockGuard
    EndLockGuard
    GoToState("IdleState")
EndFunction

Function ResetPuzzle()
    ;put a lock in case StartPuzzle and ResetPuzzle run at the same time
    LockGuard PuzzleSetupGuard
        GoToState("WaitingToStart")
        ObjectReference StatueREF = Self.GetLinkedRef(MQ206BScorpius_Statue)
        ObjectReference BeamLightREF = Self.GetLinkedRef(MQ206BScorpius_BeamLight)
        ObjectReference BeamHelperREF = Self.GetLinkedRef(MQ206BScorpius_BeamAnimHelper)

        ButtonLeftREF = Self.GetLinkedRef(MQ206BScorpius_ButtonLeft)
        ButtonRightREF = Self.GetLinkedRef(MQ206BScorpius_ButtonRight)
        ButtonUpREF = Self.GetLinkedRef(MQ206BScorpius_ButtonUp)
        ButtonDownREF = Self.GetLinkedRef(MQ206BScorpius_ButtonDown)

        ;unregister for button events and clear vars
        UnRegisterForRemoteEvent(ButtonLeftREF, "OnActivate")
        UnRegisterForRemoteEvent(ButtonRightREF, "OnActivate")
        UnRegisterForRemoteEvent(ButtonUpREF, "OnActivate")
        UnRegisterForRemoteEvent(ButtonDownREF, "OnActivate")

        ButtonLeftREF = None
        ButtonRightREF = None
        ButtonUpREF = None
        ButtonDownREF = None

        ;reset statue animation state
        StatueREF.PlayAnimation(sStatuePuzzleAnim_Reset)
        BeamLightREF.PlayAnimation(sStatuePuzzleAnim_Reset)

        ;make sure beam of light is reset
        BeamLightREF.SetAnimationVariableFloat(sBeamOpacity, fBeamStrength_Reset)
        BeamHelperREF.SetAnimationVariableFloat(sMovement_LeftRight, fMovement_Initial)
        BeamHelperREF.SetAnimationVariableFloat(sMovement_UpDown, fMovement_Initial)
    EndLockGuard
EndFunction

Function MoveBeamLeft()
    LockGuard BeamPositionGuard
        ObjectReference BeamHelperREF = Self.GetLinkedRef(MQ206BScorpius_BeamAnimHelper)
        ;move the beam by a specific amount each button press
        fCurrentPosition_LeftRight = fCurrentPosition_LeftRight - ButtonMoveAmount
        ;clamp values to the min/max values for the animation
        If fCurrentPosition_LeftRight < 0.0
            fCurrentPosition_LeftRight = 0.0
        ElseIf fCurrentPosition_LeftRight > 1.0
            fCurrentPosition_LeftRight = 1.0
        EndIf
        WwiseEvent_QST_ScorpiusStatue_Beam_Move.Play(BeamHelperREF) ;play beam audio
        BeamHelperREF.SetAnimationVariableFloat(sMovement_LeftRight, fCurrentPosition_LeftRight)        
        CheckSolutionPosition()
    EndLockGuard
EndFunction

Function MoveBeamRight()
    LockGuard BeamPositionGuard
        ObjectReference BeamHelperREF = Self.GetLinkedRef(MQ206BScorpius_BeamAnimHelper)
        ;move the beam by a specific amount each button press
        fCurrentPosition_LeftRight = fCurrentPosition_LeftRight + ButtonMoveAmount
        ;clamp values to the min/max values for the animation
        If fCurrentPosition_LeftRight < 0.0
            fCurrentPosition_LeftRight = 0.0
        ElseIf fCurrentPosition_LeftRight > 1.0
            fCurrentPosition_LeftRight = 1.0
        EndIf
        WwiseEvent_QST_ScorpiusStatue_Beam_Move.Play(BeamHelperREF) ;play beam audio
        BeamHelperREF.SetAnimationVariableFloat(sMovement_LeftRight, fCurrentPosition_LeftRight)
        CheckSolutionPosition()
    EndLockGuard
EndFunction

Function MoveBeamUp()
    LockGuard BeamPositionGuard
        ObjectReference BeamHelperREF = Self.GetLinkedRef(MQ206BScorpius_BeamAnimHelper)
        ;move the beam by a specific amount each button press
        fCurrentPosition_UpDown = fCurrentPosition_UpDown + ButtonMoveAmount
        ;clamp values to the min/max values for the animation
        If fCurrentPosition_UpDown < 0.0
            fCurrentPosition_UpDown = 0.0
        ElseIf fCurrentPosition_UpDown > 1.0
            fCurrentPosition_UpDown = 1.0
        EndIf
        WwiseEvent_QST_ScorpiusStatue_Beam_Move.Play(BeamHelperREF) ;play beam audio
        BeamHelperREF.SetAnimationVariableFloat(sMovement_UpDown, fCurrentPosition_UpDown)
        CheckSolutionPosition()
    EndLockGuard
EndFunction

Function MoveBeamDown()
    LockGuard BeamPositionGuard
        ObjectReference BeamHelperREF = Self.GetLinkedRef(MQ206BScorpius_BeamAnimHelper)
        ;move the beam by a specific amount each button press
        fCurrentPosition_UpDown = fCurrentPosition_UpDown - ButtonMoveAmount
        ;clamp values to the min/max values for the animation
        If fCurrentPosition_UpDown < 0.0
            fCurrentPosition_UpDown = 0.0
        ElseIf fCurrentPosition_UpDown > 1.0
            fCurrentPosition_UpDown = 1.0
        EndIf
        WwiseEvent_QST_ScorpiusStatue_Beam_Move.Play(BeamHelperREF) ;play beam audio
        BeamHelperREF.SetAnimationVariableFloat(sMovement_UpDown, fCurrentPosition_UpDown)
        CheckSolutionPosition()
    EndLockGuard
EndFunction

Function CheckSolutionPosition() RequiresGuard(BeamPositionGuard)
    If (fCurrentPosition_LeftRight == fSolutionPosition_LeftRight) && (fCurrentPosition_UpDown == fSolutionPosition_UpDown)
        ObjectReference BeamLightREF = Self.GetLinkedRef(MQ206BScorpius_BeamLight)
        ObjectReference StatueREF = Self.GetLinkedRef(MQ206BScorpius_Statue)

        ;play audio
        WwiseEvent_QST_ScorpiusStatue_Success.Play(StatueREF)

        ;make sure beam of light is at full brightness
        BeamLightREF.SetAnimationVariableFloat(sBeamOpacity, fBeamStrength_Full)

        ;Play the Lens Flare vfx
        Self.GetLinkedRef(MQ206BScorpius_LensFlareFX).PlayAnimation("Stage2")

        ;play anim on statue
        StatueREF.PlayAnimation(sPuzzleSolutionAnim)

        ;update quest
        MQ206B.SetStage(MQ206BCompleteStage)
    EndIf

    ;wait a small amount between checks
    Utility.Wait(0.1)
EndFunction