Scriptname OutpostCargoLinkMenuScript extends ObjectReference Const

keyword property LinkOutpostCargoLink auto const mandatory
{ keyword to find linked ref of my cargo link }

Event OnActivate(ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer()
        OutpostCargoLinkMarkerScript myCargoLink = GetLinkedRef(LinkOutpostCargoLink) as OutpostCargoLinkMarkerScript
        debug.trace(self + " OnActivate: myCargoLink=" + myCargoLink)
        if myCargoLink
            ; open cargo link menu
            bool includeIntersystem = myCargoLink.RequiresFuel
            keyword requiredKeyword = myCargoLink.CargoLinkMenuKeyword
            debug.trace(self + " opening menu with: includeIntersystem=" + includeIntersystem + " akRequiredKeyword=" + requiredKeyword)
            myCargoLink.ShowWorkshopTargetMenu(abIncludeSameSystem = true, akSameSystemRequiredKeyword = None, abIncludeIntersystem = includeIntersystem, akIntersystemRequiredKeyword = requiredKeyword)
        endif
    endif
EndEvent

