Scriptname DefaultPlayAnimationOnLoadScript extends ObjectReference Default

string Property AnimationToPlay Mandatory Const Auto
bool property PlayAnimationOnlyOnce = false auto const

Auto State PlayAnim
    Event OnLoad()
        If (PlayAnimationOnlyOnce)
           GotoState("Done") 
        EndIf
        
        PlayAnimation(AnimationToPlay)
    EndEvent
EndState

State Done
    
EndState
