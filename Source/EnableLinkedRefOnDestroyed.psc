Scriptname EnableLinkedRefOnDestroyed extends ObjectReference Const
{Enables the Linked Ref when destroyed}

Keyword Property LinkEnable Mandatory Const Auto

Event OnDestroyed(ObjectReference akDestroyer)
    GetLinkedRef(LinkEnable).Enable()
EndEvent