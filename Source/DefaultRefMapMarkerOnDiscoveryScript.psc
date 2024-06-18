Scriptname DefaultRefMapMarkerOnDiscoveryScript extends ObjectReference Default Const
{Set map marker flags OnMapMarkerDiscovered event}

bool property VisibleOnStarMap = true auto Const
{ Visible on Star Map? }

int property MapMarkerType = -1 auto Const
{ map marker type. See SetMapMarkerType in CS wiki for enum values
    -1 = don't change
}

int property MapMarkerCategory = -1 auto Const
{ map marker category. See SetMapMarkerCategory in CS wiki for enum values
    -1 = don't change
}

Event OnMapMarkerDiscovered()
    debug.trace(self + " OnMapMarkerDiscovered setting VisibleOnStarmap=" + VisibleOnStarMap)
    SetMarkerVisibleOnStarMap(VisibleOnStarMap)

    if MapMarkerType > -1
        debug.trace(self + " setting MapMarkerType=" + MapMarkerType)
        SetMapMarkerType(MapMarkerType)
    EndIf
    if MapMarkerCategory > -1
        debug.trace(self + " setting MapMarkerCategory=" + MapMarkerCategory)
        SetMapMarkerCategory(MapMarkerCategory)
    endif

EndEvent