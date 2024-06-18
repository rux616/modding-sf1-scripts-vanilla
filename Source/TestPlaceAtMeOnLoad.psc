Scriptname TestPlaceAtMeOnLoad extends ObjectReference
{using for testing}

Form property CreatedForm auto const mandatory

Keyword property LinkKeyword auto Const

float property CreateTimer = 5.0 auto Const
{ how long to wait before creating }
bool created = false

Event OnLoad()
    if created == false
        created = true
        StartTimer(CreateTimer)
    endif 
EndEvent

Event OnTimer(int aiTimerID)
    ObjectReference newRef = PlaceAtMe(CreatedForm)
    ObjectReference linkedRef = GetLinkedRef(LinkKeyword)
    if linkedRef
        newRef.SetLinkedRef(linkedRef, LinkKeyword)
    endif
EndEvent