Scriptname SFBGS00D:CWAHDisplayTrackScript extends ObjectReference
{Script that manages playing music tracks on the Colony War Action Hero display.}

;Properties
WwiseEvent Property MusicTrack Mandatory Const Auto
MovableStatic Property DisplayEffect Mandatory Const Auto

;Non-Properties
bool IsPlaying = false
int instance1
ObjectReference DisplayEffectRef

Auto State MusicNotPlaying
    Event OnActivate(ObjectReference akActionRef)
        If (IsPlaying == false)
            DisplayEffectRef = self.PlaceAtMe(DisplayEffect)
            instance1 = MusicTrack.Play(self)
            IsPlaying = true
            GotoState("MusicPlaying")
        EndIf
    EndEvent
EndState

State MusicPlaying
    Event OnActivate(ObjectReference akActionRef)
        If (IsPlaying)
            WwiseEvent.StopInstance(instance1)
            DisplayEffectRef.Disable()
            DisplayEffectRef.Delete()
            IsPlaying = false
            GotoState("MusicNotPlaying")
        EndIf
    EndEvent
EndState