Scriptname RL039_DoorBarricade extends ObjectReference Const
{When this locked door barricade is unlocked it is disabled, plays a sound, and unlocks and makes usable a linked door.}

Keyword Property LinkToBarricadedDoor Mandatory Const Auto
Message Property DoorActivationOverrideName Mandatory Const Auto
Message Property DoorActivationInfoMessage Mandatory Const Auto

int Property LockLevel = 254 Const Auto

Event OnCellLoad()
    ObjectReference linkedDoor = GetLinkedRef(LinkToBarricadedDoor)

    if(linkedDoor)
        linkedDoor.SetLockLevel(LockLevel)
        linkedDoor.Lock()
        linkedDoor.SetActivateTextOverride(DoorActivationOverrideName)
        
        RegisterForRemoteEvent(linkedDoor, "OnActivate")
    EndIf
EndEvent

event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
    DoorActivationInfoMessage.Show()
EndEvent

Event OnActivate(ObjectReference akActionRef)
    ;Play sound
    ObjectReference linkedDoor = GetLinkedRef(LinkToBarricadedDoor)

    if(linkedDoor)
        linkedDoor.Lock(false)
        linkedDoor.SetActivateTextOverride(None)

        UnregisterForRemoteEvent(linkedDoor, "OnActivate")
    EndIf

    ;Disable this object
    self.DisableNoWait()
EndEvent
