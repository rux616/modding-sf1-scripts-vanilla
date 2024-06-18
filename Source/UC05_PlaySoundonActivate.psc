Scriptname UC05_PlaySoundonActivate extends ObjectReference

WwiseEvent Property SuccessSound Auto Const Mandatory

WwiseEvent Property FailureSound Auto Const Mandatory

Quest Property myQuest Auto Const Mandatory

Int Property HasKey Auto Const Mandatory

Int Property AccessGranted Auto Const Mandatory

Keyword Property BlockPlayerActivation Auto Const Mandatory

auto STATE waiting
    Event OnActivate(ObjectReference akActionRef)
    ;Play success sound if player has the codes and has yet to use them
        goToState("busy")
        if akActionRef == Game.GetPlayer() && myQuest.GetStageDone(HasKey) && !myQuest.GetStageDone(AccessGranted)
                SuccessSound.PlayAndWait(Self)
                Self.AddKeyword(BlockPlayerActivation)
        endif
        goToState("waiting")
    endEvent
endSTATE

STATE busy
endSTATE
