Scriptname NeonCityEnableMapMarkerScript extends ObjectReference Const

Event OnLoad()
    ObjectReference[] myRefs = GetRefsLinkedToMe()
    if myRefs.Length > 0
        ; if disabled, enable and discover
        ObjectReference myMapMarker = myRefs[0]
        if myMapMarker.IsDisabled()
            debug.trace(self + " myMapMarker=" + myMapMarker)
            myMapMarker.EnableNoWait()
            myMapMarker.SetMarkerDiscovered()
            myMapMarker.OnMapMarkerDiscovered()
            myMapMarker.SetMarkerVisibleOnStarMap()
        endif
    endif
EndEvent