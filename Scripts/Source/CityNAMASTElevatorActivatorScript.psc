Scriptname CityNAMASTElevatorActivatorScript extends ObjectReference Conditional

Message Property MASTElevatorMessage Auto Const Mandatory



GlobalVariable Property MASTDestinationGlobal Auto



Event OnActivate (ObjectReference akActionRef)

int iButton

	iButton = MASTElevatorMessage.Show()

	if iButton == 0
		MASTDestinationGlobal.SetValue(0)
		Game.FastTravel(CabinetMarker)
	elseif iButton == 1
		MASTDestinationGlobal.SetValue(1)
		Game.FastTravel(ScienceMarker)
	elseif iButton == 2
		MASTDestinationGlobal.SetValue(2)
		Game.FastTravel(MilitaryMarker)
	elseif iButton == 3
		MASTDestinationGlobal.SetValue(3)
		Game.FastTravel(LobbyMarker)
	elseif iButton == 4
		Game.FastTravel(NATMarker)
	elseif iButton == 5
		Game.FastTravel(VanguardMarker)
	elseif iButton == 6
		Game.FastTravel(SubsectionMarker)
	endif

EndEvent
ObjectReference Property LobbyMarker Auto Const

ObjectReference Property SubsectionMarker Auto Const

ObjectReference Property VanguardMarker Auto Const

ObjectReference Property MilitaryMarker Auto Const

ObjectReference Property ScienceMarker Auto Const

ObjectReference Property CabinetMarker Auto Const

ObjectReference Property NATMarker Auto Const
