Scriptname SFBGS00D:SFBGS00DGravityAirlockScript extends SQ_Airlock_DoorwayVolumeScript
{Extends SQ_Airlock script to also enable gravity hazard}

Keyword Property SFBGS00DLinkGravityAirlock auto const mandatory
WwiseEvent Property SFBGS00D_WwiseEvent_GravityLock_EnableGravity auto const mandatory
WwiseEvent Property SFBGS00D_WwiseEvent_GravityLock_DisableGravity auto const mandatory


Event ObjectReference.OnClose(ObjectReference akSender, ObjectReference akActionRef)
    Trace(self, "OnClose() akSender: " + akSender + ", akActionRef: " + akActionRef)

    Actor[] actorsInTrigger = GetAllRefsInTrigger() as Actor[] ;none objects handled in other function


    ObjectReference InsideDoor = GetLinkedRef(SQ_Airlock_Link_Door_Inside)
    ObjectReference OutsideDoor = GetLinkedRef(SQ_Airlock_Link_Door_Outside)
    ;the doors are set up such that the inside door is not allowed to start opening until the outside door closes, and visa versa
    ;because i want to catch the moment that a door starts to open, since the player could zip through, I instead watch for the opposite door to close
    if akSender == OutsideDoor ;outside door has closed, inside door has started to open
        SQ_Airlock.SetActorsInside(actorsInTrigger, SetInside = true)
        ;new stuff for gravity airlocks - handles enable state of volume + hazard
        ;gravity on
        SFBGS00D_WwiseEvent_GravityLock_EnableGravity.Play(self)
        GetLinkedRef(SFBGS00DLinkGravityAirlock).Disable()        
        GetLinkedRef(SFBGS00DLinkGravityAirlock).GetLinkedRef(SFBGS00DLinkGravityAirlock).Disable()
    elseif akSender == InsideDoor ;inside door has closed, outside door has started to open.
        SQ_Airlock.SetActorsInside(actorsInTrigger, SetInside = false)
        ;new stuff for gravity airlocks - handles enable state of volume + hazard
        ;gravity off
        SFBGS00D_WwiseEvent_GravityLock_DisableGravity.Play(self)
        GetLinkedRef(SFBGS00DLinkGravityAirlock).Enable()
        GetLinkedRef(SFBGS00DLinkGravityAirlock).GetLinkedRef(SFBGS00DLinkGravityAirlock).Enable()
    endif
EndEvent