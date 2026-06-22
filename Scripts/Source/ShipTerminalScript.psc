Scriptname ShipTerminalScript extends ObjectReference

int MenuItemID_ReleaseDockingClamps = 1 const

ActorValue property SpaceshipDockingclamps auto const mandatory
{ docking clamps actor value - will be > 0 when a ship initiates docking with another ship }

TerminalMenu property DefaultShipTerminal auto const mandatory
{ top level ship terminal }

Event OnActivate(ObjectReference akActionRef)
	debug.trace(self + " OnActivate")
	; initialize docking clamp entry
	CheckForDockingClamps()
EndEvent

Event OnTerminalMenuItemRun(int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
	debug.trace(self + "**********************")
	debug.trace(self + "**** OnTerminalMenuItemRun: auiMenuItemID=" + auiMenuItemID + " akTerminalBase=" + akTerminalBase)
	debug.trace(self + "**********************")
	if akTerminalBase == DefaultShipTerminal
		if auiMenuItemID == MenuItemID_ReleaseDockingClamps
			SpaceshipReference myShip = GetCurrentShipRef()
			if myShip && myShip.GetValue(SpaceshipDockingclamps) > 0
				myShip.ModValueTo(SpaceshipDockingClamps, 0)
			endif
		endif
	endif
endEvent

Function CheckForDockingClamps()
	; for now, set AV on terminal to match ship
	SpaceshipReference myShip = GetCurrentShipRef()
	SetValue(SpaceshipDockingclamps, myShip.GetValue(SpaceshipDockingclamps))
EndFunction
