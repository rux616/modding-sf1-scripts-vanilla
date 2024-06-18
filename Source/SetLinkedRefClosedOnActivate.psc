Scriptname SetLinkedRefClosedOnActivate extends ObjectReference Const
{Used on doors to keep a paired door shut }

Keyword Property LinkedRefKeyword Const Auto
{OPTIONAL: Keyword to check for on the Linked Ref}

Event OnActivate(ObjectReference akActionRef)
    ObjectReference LinkedRef = GetLinkedRef(LinkedRefKeyword)
    int currOpenState = LinkedRef.GetOpenState()

    if currOpenState  == 1 || currOpenState == 2
        LinkedRef.SetOpen(false)
    endif
EndEvent