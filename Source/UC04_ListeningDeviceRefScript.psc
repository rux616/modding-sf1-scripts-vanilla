Scriptname UC04_ListeningDeviceRefScript extends ObjectReference Const

Quest Property UC04 Mandatory Const Auto
{Quest to check to unlock this listening device}

Int Property PrereqStage = 300  Const Auto
{Listening devices can only be triggering once this stage is set}

Int Property ShutdownStage = 450  Const Auto
{Listening devices can only be triggering once this stage is set}

Scene Property SceneToPlay Mandatory Const Auto
{Which scene we want this listening device to play}

Event OnLoad()
    if !UC04.GetStageDone(PrereqStage)
        BlockActivation(true, true)
    elseif IsActivationBlocked()
        BlockActivation(false, false)
    endif
EndEvent

Event OnActivate(ObjectReference akActionRef)
    if UC04.GetStageDone(PrereqStage) && akActionRef == Game.GetPlayer()
        ;SendTrespassAlarm(Game.GetPlayer())

        if !SceneToPlay.IsPlaying()
            SceneToPlay.Start()
        EndIf
    endif
EndEvent