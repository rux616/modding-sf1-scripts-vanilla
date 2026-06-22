Scriptname DoorBarricade extends ObjectReference
{When this locked door barricade is unlocked it is disabled, plays a sound, and unlocks and makes usable a linked door.}

Keyword Property LinkToBarricadedDoor Mandatory Const Auto
int Property LockLevel = 251 Const Auto
WwiseEvent Property WwiseEvent_DRS_Barricade_Unlock Const Auto

Auto State Initial
    Event OnCellLoad()
        SetupBarricade()
    EndEvent
EndState

Function SetupBarricade()
    EnableNoWait()
    if(GetLinkedRef(LinkToBarricadedDoor))
        if GetLockLevel() != 0
            GetLinkedRef(LinkToBarricadedDoor).BlockActivation(true, true)
            GetLinkedRef(LinkToBarricadedDoor).SetLockLevel(LockLevel)
            GetLinkedRef(LinkToBarricadedDoor).Lock()
        Else
            Debug.Trace("Door is not locked. Disabling Barricade")
            self.DisableNoWait()
        endif
    Else
        Debug.Trace("Missing Link from Baricade to Door.")
    EndIf
    GoToState("Done")
EndFunction

Event OnLockStateChanged()
    if(!IsLocked())
        Debug.Trace("The door is unlocked")
        ;Play sound
        if(GetLinkedRef(LinkToBarricadedDoor))
            ;Unlock the Linked Door
            WwiseEvent_DRS_Barricade_Unlock.Play(GetLinkedRef(LinkToBarricadedDoor))
            ;Playing sound on door so that the disabled barrier doesn't end the sound.
            GetLinkedRef(LinkToBarricadedDoor).Lock(false)
            ;Make the Door Activatable.
            GetLinkedRef(LinkToBarricadedDoor).BlockActivation(false)
        EndIf
        ;Disable this object
        self.DisableNoWait()
    EndIf
EndEvent

Event OnReset()
    Debug.Trace("This object was reset")

    GoToState("Initial")
    if GetLinkedRef() == none
        SetupBarricade()
    endif
EndEvent

State Done
    ; Do nothing
endState