Scriptname POI064_SetLinkRefAggressiveOnDoorOpen extends ObjectReference Const

ActorValue Property Aggression Mandatory Const Auto
{Aggression actor value}

float Property NewValue = 2.0 Const Auto
{New value to set the linked ref's aggression once the door is open}

Event OnOpen(ObjectReference akActionRef)
    ObjectReference myAct = GetLinkedRef() as Actor

    if myAct != none
        myAct.SetValue(Aggression, NewValue)
    endif
EndEvent
