Scriptname LC122_HandlerDeathScript extends Actor Const

Event OnDeath(ObjectReference akKiller)
  if (akKiller == Game.GetPlayer())
	ObjectReference enableMarker = GetLinkedRef()
	enableMarker.Disable()
  endIf
endEvent