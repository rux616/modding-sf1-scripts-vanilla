Scriptname DisableLinkedRefOnDestroyed extends ObjectReference Const
{Disables the Linked Ref when destroyed}

Keyword Property LinkEnable Mandatory Const Auto

Event OnDestroyed(ObjectReference akDestroyer)
    GetLinkedRef(LinkEnable).Disable()
EndEvent