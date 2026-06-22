Scriptname TestLockLinkedRefChildrenScript extends ObjectReference Const

Event OnActivate(ObjectReference akActionRef)
    ObjectReference[] linkedRefs = GetRefsLinkedToMe(NONE)
    int i = 0
    while i < linkedRefs.Length
        linkedRefs[i].Lock()
        i += 1
    endWhile
EndEvent