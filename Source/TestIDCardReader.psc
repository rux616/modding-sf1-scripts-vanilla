Scriptname TestIDCardReader extends ObjectReference Const

ConditionForm Property ConditionFormToTest Auto Const
	{If set, this condition form must be true for script to excecute it's functionality}
Bool Property AutoOpen Mandatory Const Auto
    {If true, linked reference will recieve SetOpen}



;On Activate
; Check for Keycard
; If Keycard condition is true, then open or unlock Link Ref Chain.

Event OnActivate(ObjectReference akActionRef)
    if (ConditionFormToTest.IsTrue(akActionRef))
        ;User has keycard
        ObjectReference[] LinkedRefs = GetLinkedRefChain()
        int i = 0
        while (i < LinkedRefs.length)
            LinkedRefs[i].Lock(false)
            if (AutoOpen)
                LinkedRefs[i].SetOpen(true)
            EndIf
            i += 1
        endwhile
    EndIf
EndEvent