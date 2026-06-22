Scriptname SQ_OutpostCreateStarstationScript extends Quest

LocationAlias property planetLocation auto const mandatory

ReferenceAlias property CreatedOrbitalMarker auto const mandatory

ReferenceAlias property CreatedOrbitalPatrolStart auto const mandatory

ReferenceAlias property CreatedOrbitalMapMarker auto const mandatory

ReferenceAlias property Starstation auto const mandatory

RefCollectionAlias property Ships auto const mandatory

Event OnQuestInit()
    debug.trace(self + " planetLocation=" + planetLocation.GetLocation())
    debug.trace(self + " CreatedOrbitalMarker=" + CreatedOrbitalMarker.GetRef())
    debug.trace(self + " CreatedOrbitalPatrolStart=" + CreatedOrbitalPatrolStart.GetRef())
    debug.trace(self + " CreatedOrbitalMapMarker=" + CreatedOrbitalMapMarker.GetRef())
    debug.trace(self + " Starstation=" + Starstation.GetRef())
EndEvent

