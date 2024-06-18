Scriptname PlayBinkOverLoadScript extends ObjectReference

OBJECTREFERENCE PROPERTY DestinationMarker AUTO

EVENT OnTriggerEnter(ObjectReference akActionRef)

		SELF.Activate(SELF)

		;Game.PlayBink("White.bik", false, false, false)
		;Debug.Trace("Playing Movie...")
		;Game.getPlayer().moveTo(DestinationMarker)

ENDEVENT
