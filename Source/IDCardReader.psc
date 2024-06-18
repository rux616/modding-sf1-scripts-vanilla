Scriptname IDCardReader extends ObjectReference
{Script for ID Card Readers}

Group RequiredProperties
    Key property IDCard Auto Const
    {The ID Card required by this card reader. If not present, all activations will fail.}
EndGroup

Group OptionalProperties
    bool property ShouldAutoReset = False Auto Const
    {Default=False. If true, return to the Waiting state after a successful activation, instead of remaining in the Success state.}

    bool property ShouldDisplaySuccessMessage = False Auto Const
    {Default=False. If true, display IDCardReaderSuccessMessage when used successfully.}

    Quest property QuestToCheck Auto Const
    {Default=None. If set, QuestToCheck's PrereqStage must be set in order for activation to succeed.}

    int property PrereqStage = -1 Auto Const
    {Default=-1. If set, QuestToCheck's PrereqStage must be set in order for activation to succeed.}
EndGroup

Group AutofillProperties CollapsedOnBase
    Keyword property LinkIDReader Auto Const Mandatory
    Message property IDCardReaderSuccessMessage Auto Const Mandatory
    Message property IDCardReaderFailMissingCardMessage Auto Const Mandatory
    Message property IDCardReaderFailMissingPrereqMessage Auto Const Mandatory
    Message property IDCardReaderNotRespondingMessage Auto Const Mandatory
EndGroup

bool Property bDoorOpen Auto

CustomEvent IDReaderActivated
CustomEvent IDReaderActivatedSuccess
CustomEvent IDReaderActivatedFailure

Auto State WaitingForInit
    Event OnLoad()
        BlockActivation()
        GotoState("IDReaderWaiting")
    EndEvent
EndState


State IDReaderWaiting
    Event OnActivate(ObjectReference akActionRef)
        GotoState("Busy")
        Var[] kargs = new Var[1]
        kargs[0] = akActionRef
        SendCustomEvent("IDReaderActivated", kargs)
        if ((IDCard == None) || (akActionRef.GetItemCount(IDCard) == 0))
            ;Fail: The player doesn't have the card.
            SendCustomEvent("IDReaderActivatedFailure", kargs)
            if (IDCardReaderFailMissingCardMessage != None)
                PlayAnimation("StateD_Play")
                if akActionRef == game.getplayer()
                    IDCardReaderFailMissingCardMessage.Show()
                endif
            endif
            GotoState("IDReaderWaiting")
        ElseIf ((QuestToCheck != None) && (PrereqStage >= 0) && (!QuestToCheck.GetStageDone(PrereqStage)))
            ;Fail: The prereq stage isn't set.
            SendCustomEvent("IDReaderActivatedFailure", kargs)
            if (IDCardReaderFailMissingPrereqMessage != None && akActionRef == game.getplayer())
                IDCardReaderFailMissingPrereqMessage.Show()
            endif
            GotoState("IDReaderWaiting")
        Else
            ;Success
            SendCustomEvent("IDReaderActivatedSuccess", kargs)
            PlayAnimationAndWait("Play01", "Done")
            if (ShouldDisplaySuccessMessage && (IDCardReaderSuccessMessage != None) && akActionRef == game.getplayer())
                IDCardReaderSuccessMessage.show()
            endif
            if ShouldAutoReset
                GotoState("IDReaderWaiting")
            else
                GotoState("SuccessIDReaderState")
            endif
        IDReaderOpenDoor()
        endif
    EndEvent
EndState

State SuccessIDReaderState
    Event OnActivate(ObjectReference akActionRef)
	    ;do nothing/blocking any interaction
	EndEvent
EndState

State LockdownIDReaderState
    Event OnActivate(ObjectReference akActionRef)
        GotoState("Busy")
        if IDCardReaderNotRespondingMessage != none
            PlayAnimationAndWait("Play04", "Done")
            if akActionRef == game.getplayer()
                IDCardReaderNotRespondingMessage.show()
            endif
        endif
        GotoState("LockdownIDReaderState")
	EndEvent
EndState

State Busy
EndState

Function IDReaderOpenDoor(bool shouldBeOpen=true)
    ObjectReference linkedRef = GetLinkedRef(LinkIDReader) 
    int openState = linkedRef.GetOpenState()
    if (openState == 1 || openState == 2) ; Open or opening
        linkedRef.SetOpen(false)
    elseif (openState == 3 || openState == 4) ; Closed or closing
        linkedRef.SetOpen(true)
    endIf
    debug.trace(self + " Door Opened ")
    linkedRef.lock(!shouldBeOpen)
EndFunction

;Functions to call to go directly to different states

Function GotoSuccessState()
    PlayAnimation("Play01")
    IDReaderOpenDoor(true)
    GotoState("SuccessIDReaderState")
EndFunction

Function ResetIDCardReader()
    PlayAnimation("StateA_Idle")
    IDReaderOpenDoor(false)
    GotoState("IDReaderWaiting")
EndFunction

Function GotoWaitState()
    GotoState("IDReaderWaiting")
EndFunction

Function GotoLockdownState()
    PlayAnimation("StateC_Idle")  
    GotoState("LockdownIDReaderState")
EndFunction