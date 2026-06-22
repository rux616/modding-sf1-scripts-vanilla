Scriptname TestShipEventsScript extends ReferenceAlias
{testing new ships events}

Event OnInit()

EndEvent

Event OnDeath(ObjectReference akKiller)
  debug.trace("OnDeath works!")
EndEvent

Event OnDying(ObjectReference akKiller)
  debug.trace("OnDying works!")
EndEvent

; Event received when a reference has a crew member assigned.
Event OnCrewAssigned(Actor akCrew, ObjectReference akAssignmentRef, ObjectReference akPreviousAssignmentRef)
	Debug.Trace(akCrew + " assigned to " + akAssignmentRef + " from " + akPreviousAssignmentRef)
EndEvent

; Event received when a reference has a crew member dismissed.
Event OnCrewDismissed(Actor akCrew, ObjectReference akPreviousAssignmentRef)
  Debug.Trace(akCrew + " dismissed from " + akPreviousAssignmentRef)
EndEvent

; Event received when a ship begins or ends far travel - State { Departure = 0, Arrival = 1 }
Event OnShipFarTravel(Location aDepartureLocation, Location aArrivalLocation, int aState)
  if aState==0
    Debug.Trace(self + "Far Travel departure from " + aDepartureLocation + " to " + aArrivalLocation)
  elseIf aState==1
    Debug.Trace(self + "Far Travel arrival at " + aArrivalLocation + " from " + aDepartureLocation)
  endif
EndEvent

; Event received when a ship grav jump event occurs - State { Initiated = 0, AnimStarted = 1, Completed = 2, Failed = 3 }
Event OnShipGravJump(Location aDestination, int aState)
	SpaceshipReference MyShip
	MyShip = Self.GetShipRef()
	debug.trace(MyShip + "GetShipReference works!")

  if aState==0
    Debug.Trace(self + "Grav jump initiated!")
  endIf
  
  if aState==1
    Debug.Trace(self + "Grav jump anim started!")
  endIf
  
  if aState==2
    Debug.Trace(self + "Grav jump complete!")
  endIf
  
  if aState==3
	Debug.Trace(self + "Grav jump failed!")
  endIf
endEvent

Event OnShipTakeOff(bool abComplete)
  if !abComplete
    Debug.Trace(self + "Takeoff initiated!")
  endIf

  if abComplete
    Debug.Trace(self + "Takeoff complete!")
  endIf
endEvent

Event OnShipUndock(bool abComplete, SpaceshipReference akUndocking, SpaceshipReference akParent)
  if !abComplete
    Debug.Trace(akUndocking + "Initiating undock with " + akParent + "...")
  endIf

  if abComplete
    Debug.Trace(akUndocking + "Completed undock with " + akParent + "...")
  endIf
endEvent

Event OnShipDock(bool abComplete, SpaceshipReference akDocking, SpaceshipReference akParent)
  if !abComplete
    Debug.Trace(akDocking + "Initiating docking with " + akParent + "...")
  endIf

  if abComplete
    Debug.Trace(akDocking + "Completed docking with " + akParent + "...")
  endIf
endEvent

Event OnShipSystemPowerChange(ActorValue akSystem, bool abAddPower, bool abDamageRelated)
;/
  debug.trace(akSystem + " has changed")
  if abAddPower
    if abDamageRelated
      Debug.Trace("Power restored after repair")
    else
      Debug.Trace("Power added manually")
    endIf
  else
    if abDamageRelated
      Debug.Trace("Power loss after damage")
    else
      Debug.Trace("Power removed manually")
    endIf
  endIf
/;
endEvent

Event OnShipRefueled(int aFuelAdded)
    debug.trace(self + " Refueled with " + aFuelAdded + " units")
EndEvent

Event OnShipSystemDamaged(ActorValue akSystem, int aBlocksLost, bool aElectromagneticDamage, bool aFullyDamaged)
    if aElectromagneticDamage
        debug.trace(self + " lost " + aBlocksLost + " power block(s) due to EM damage on " + akSystem)
    else
        debug.trace(self + " lost " + aBlocksLost + " power block(s) due to damage on " + akSystem)
    endif
EndEvent

Event OnShipSystemRepaired(ActorValue akSystem, int aBlocksGained, bool aElectromagneticDamage)
    if aElectromagneticDamage
        debug.trace(self + " gained " + aBlocksGained + " power block(s) of EM damage repaired on " + akSystem)
    else
        debug.trace(self + " gained " + aBlocksGained + " power block(s) of damage repaired on " + akSystem)
    endif
EndEvent