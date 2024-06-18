Scriptname TestEventsScript extends ObjectReference  
{sends out traces for several events}
import debug

Actor Player

Event OnLoad()
	trace("========EVENT OnLoad: "+self+" ===========")
	Player = game.GetPlayer()
endEvent

Event OnUnLoad()
	trace("========EVENT OnUnLoad===========")
endEvent

Event OnCellAttach()
	trace("========EVENT OnCellAttach===========")
endEvent

Event OnCellDetach()
	trace("========EVENT OnCellDetach===========")
endEvent

Event OnTriggerEnter(ObjectReference akActionRef)
	trace("========EVENT OnTriggerEnter: "+akActionRef+" ===========")
endEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	trace("========EVENT OnTriggerLeave: "+akActionRef+" ===========")
endEvent