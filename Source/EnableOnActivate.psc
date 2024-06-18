Scriptname EnableOnActivate extends ObjectReference Const
{On activate, toggles enable/disable of linked refs}

bool Property toggleEnabled = true Const Auto
{Set LinkedRef to opposite enable/disable state.}
bool Property onlyEnable = true Const Auto
{If true this will only enable, if false only disable. Ignored if toggleEnabled}

Event OnActivate(ObjectReference akActionRef)
    if(toggleEnabled)
    DEbug.Trace("Toggle is Enabled")
        if(GetLinkedRef().IsEnabled())
            GetLinkedRef().Disable()
            Debug.Trace("LinkedRef is Enabled, Disabling")
        Else
            GetLinkedRef().Enable()
        EndIf
    ElseIf(onlyEnable)
        GetLinkedRef().Enable()
    Else
        GetLinkedRef().Disable()
    EndIf
EndEvent