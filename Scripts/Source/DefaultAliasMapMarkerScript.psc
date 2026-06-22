Scriptname DefaultAliasMapMarkerScript extends ReferenceAlias Default Const
{default script to set map marker data on a map marker in an alias}

bool property AllowGravJump = false auto Const
{ allow grav jump to the map marker? (only valid for space map markers) }

bool property VisibleOnStarMap = true auto Const
{ Visible on Star Map? }

bool property Discovered = false auto Const
{ set the map marker "discovered"? }

int property UndiscoveredVisibility = -1 auto Const
{ undiscovered visibility: -1 = don't change
  0 = Always (default)
  1 = System
  2 = Planet
}

int property MapMarkerType = -1 auto Const
{ map marker type. See SetMapMarkerType in CS wiki for enum values
    -1 = don't change
 }

int property MapMarkerCategory = -1 auto Const
{ map marker category. See SetMapMarkerCategory in CS wiki for enum values
    -1 = don't change
 }

Message property UnexploredName auto Const
{ OPTIONAL - unexplored name to set on map marker if supplied }

bool property EnableOnInit = true auto Const
{ Enables the map marker on init (usually irrelevant but required for default space cell map markers which are all initially disabled)}

Event OnAliasInit()
    debug.trace(self + "OnAliasInit")
    UpdateMapMarkerFlags()
EndEvent

Event OnAliasChanged(ObjectReference akObject, bool abRemove)
    debug.trace(self + "OnAliasChanged")
    UpdateMapMarkerFlags()
EndEvent

function UpdateMapMarkerFlags()
    ObjectReference mapMarkerRef = GetRef()
    if mapMarkerRef
        debug.trace(self + " setting AllowGravJump=" + AllowGravJump)
        mapMarkerRef.SetMarkerAllowGravJump(AllowGravJump)
        debug.trace(self + " setting VisibleOnStarMap=" + VisibleOnStarMap)
        mapMarkerRef.SetMarkerVisibleOnStarMap(VisibleOnStarMap)
        if UndiscoveredVisibility > -1
            debug.trace(self + " setting UndiscoveredVisibility=" + UndiscoveredVisibility)
            mapMarkerRef.SetMarkerUndiscoveredVisibility(UndiscoveredVisibility)
        EndIf
        if MapMarkerType > -1
            debug.trace(self + " setting MapMarkerType=" + MapMarkerType)
            mapMarkerRef.SetMapMarkerType(MapMarkerType)
        EndIf
        if MapMarkerCategory > -1
            debug.trace(self + " setting MapMarkerCategory=" + MapMarkerCategory)
            mapMarkerRef.SetMapMarkerCategory(MapMarkerCategory)
        endif
        if UnexploredName
            debug.trace(self + " setting UnexploredName=" + UnexploredName)
            mapMarkerRef.SetMapMarkerUnexploredName(UnexploredName)
        endif
        if EnableOnInit
            mapMarkerRef.Enable()
        endif
        if Discovered
            debug.trace(self + " setting Discovered")
            mapMarkerRef.SetMarkerDiscovered()
        endif
    endif
endFunction
