Scriptname OutpostBuilderMenuScript extends ObjectReference Const

Keyword Property LinkOutpostBuilder auto const mandatory
{ linked ref keyword to builder }

Event OnActivate(ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer()
        ObjectReference myBuilder = GetLinkedRef(LinkOutpostBuilder)
        debug.trace(self + " OnActivate myBuilder=" + myBuilder)
        if myBuilder
            myBuilder.ShowWorkshopBuilderMenu()
        Else
            ShowWorkshopBuilderMenu()
        endif
    endif
EndEvent