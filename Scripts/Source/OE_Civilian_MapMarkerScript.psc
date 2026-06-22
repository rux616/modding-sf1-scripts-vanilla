Scriptname OE_Civilian_MapMarkerScript extends ObjectReference Const
{sets the name to standard name based on NPC type on init, if visible on starmap}

SQ_ParentScript property SQ_Parent auto const mandatory

Event OnInit()
    debug.trace(self + " OnInit")
    SQ_Parent.CheckForRenameMapMarker(self)
EndEvent
