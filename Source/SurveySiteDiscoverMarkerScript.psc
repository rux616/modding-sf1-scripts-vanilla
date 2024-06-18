Scriptname SurveySiteDiscoverMarkerScript extends ObjectReference Const

int property SiteType = 0 auto const
{ type of site - TO DO }

float property DiscoveryDistance = 100.0 auto const
{ should be temp - won't need this once we can get the event of the player discovering a map marker }

SQ_ParentScript property SQ_Parent auto const Mandatory

Event OnLoad()
	debug.trace(self + "OnLoad - registering for distance check")
    ; set distance check - TEMP - we should get a discovered event
    RegisterForDistanceLessThanEvent(self, Game.GetPlayer(), DiscoveryDistance)
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
	debug.trace(self + " OnDistanceLessThan event (ID: " + aiEventID + ")");
	; let SQ_Master know I've been discovered
	SQ_Parent.AddSurveySite(self)
EndEvent

function BuildSite()
	debug.trace(self + " BuildSite: disable discovery map marker, enable built map marker")
	; for now, just toggle map marker
	GetLinkedRef().Disable()
endFunction