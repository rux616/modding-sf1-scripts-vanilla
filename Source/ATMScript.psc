Scriptname ATMScript extends ObjectReference
{script for hackable ATM script}

Keyword property ATMLink_Door auto const mandatory
{ keyword for linked ref to fake locked door to hack }

Keyword property ATMLink_Container auto const mandatory
{ keyword for linked ref to container holding credits }

auto state locked 
    Event OnInit()
        SetupLockedState()
    EndEvent

    Event OnBeginState(string asOldState)
        SetupLockedState()
    EndEvent

    Event OnActivate(ObjectReference akActionRef)
        if akActionRef == Game.GetPlayer()
            ; get linked door, hack it
            ObjectReference myDoor = GetLinkedRef(ATMLink_Door)
            if myDoor
                if myDoor.IsLocked()
                    myDoor.Activate(akActionRef)
                Else
                    ; shouldn't be here
                    GotoState("hacked")
                endif
            endif
        endif
    EndEvent

    Event ObjectReference.OnLockStateChanged(ObjectReference akSource)
        debug.trace(self + " lock state changed")
        StealFromATM()
    endEvent
endState

state hacked
    Event OnBeginState(string asOldState)
        debug.trace(self + " OnBeginState hacked")
        BlockActivation(true, true)
    EndEvent
endState

Event ObjectReference.OnLockStateChanged(ObjectReference akSource)
    debug.trace(self + " lock state changed - if locked, go back to locked state")
    if akSource.IsLocked()
        GotoState("locked")
    endif
endEvent

Guard stealGuard ProtectsFunctionLogic
int tempStealCount = 0

function StealFromATM()
    tempStealCount += 1
    debug.trace(self + " StealFromATM start" + tempStealCount)
    LockGuard stealGuard
        if GetState() == "locked"
            debug.trace(self + " StealFromATM: locked state")
            ObjectReference myDoor = GetLinkedRef(ATMLink_Door)

            if myDoor && myDoor.IsLocked() == false
                debug.trace(self + " StealFromATM: door is unlocked, go to hacked state")
                GotoState("hacked")
                
                ; get credits container
                ObjectReference myContainer = GetLinkedRef(ATMLink_Container)
                if myContainer
                    MiscObject credits = Game.GetCredits()
                    int creditsAmount = myContainer.GetItemCount(credits)
                    debug.trace(self + " StealFromATM: " + creditsAmount + " credits")
                    ; try calling steal alarm on container before removing items
                    myContainer.SendStealAlarm(Game.GetPlayer())
                    ; give credits to player
                    myContainer.RemoveAllItems(akTransferTo=Game.GetPlayer(), abKeepOwnership=true)
                    ; also temporarily create them in the world to allow steal alarm to work
                    ObjectReference stealRef = myContainer.PlaceAtMe(credits, creditsAmount, abInitiallyDisabled=false)
                    debug.trace(self + " StealFromATM: calling steal alarm on " + stealRef + " value=" + stealRef.GetGoldValue())
                    stealRef.SetFactionOwner(myContainer.GetFactionOwner())
                    stealRef.SendStealAlarm(Game.GetPlayer()) ; always blame the player
                    stealRef.Disable()
                endif
            endif
        endif
    EndLockGuard
    debug.trace(self + " StealFromATM end")
endFunction

function SetupLockedState()
    ObjectReference myDoor = GetLinkedRef(ATMLink_Door)
    debug.trace(self + " SetupLockedState myDoor=" + myDoor)
    if myDoor && myDoor.IsLocked()
        RegisterForRemoteEvent(myDoor, "OnLockStateChanged")
    Else
        debug.trace(self + " no linked container or unlocked container - making this non-interactive")
        ; can't do anything with this ATM, make it non-interactive
        gotoState("hacked")
    endif
    BlockActivation()
EndFunction