Scriptname TestEnableDisableRefOnTrigger extends ObjectReference

bool Property enableLinkedRef auto const
bool Property useLinkedRefChain auto const

Event OnTriggerEnter(ObjectReference akActionRef)
    if(akActionRef != Game.GetPlayer())
        return
    EndIf

    ObjectReference[] linkRefs

    if(useLinkedRefChain)
        linkRefs = GetLinkedRefChain()
    Else
        linkRefs = new ObjectReference[1] 
        linkRefs[0] = GetLinkedRef()
    EndIf

    int i = 0
    while(i < linkRefs.Length)
        if(enableLinkedRef)
            linkRefs[i].Enable()
        else
            linkRefs[i].Disable()
        endIf

        i = i + 1
    endWhile
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
    if(akActionRef != Game.GetPlayer())
        return
    EndIf
    
    ObjectReference[] linkRefs

    if(useLinkedRefChain)
        linkRefs = GetLinkedRefChain()
    Else
        linkRefs = new ObjectReference[1] 
        linkRefs[0] = GetLinkedRef()
    EndIf

    int i = 0
    while(i < linkRefs.Length)
        if(enableLinkedRef)
            linkRefs[i].Disable()
        else
            linkRefs[i].Enable()
        endIf

        i = i + 1
    endWhile
EndEvent
