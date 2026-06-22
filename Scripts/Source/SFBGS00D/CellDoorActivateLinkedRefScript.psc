Scriptname SFBGS00D:CellDoorActivateLinkedRefScript extends ReferenceAlias

Int Property StageToCheck Auto Const Mandatory

Auto State PreLoad
	Event OnLoad()
		GoToState("Waiting")
		Self.GetRef().BlockActivation(true, false)
	EndEvent
EndState

State Waiting
	Event OnActivate(ObjectReference akActionRef)
		Actor PlayerRef = Game.GetPlayer()
		if akActionRef == PlayerRef && !GetOwningQuest().GetStageDone(StageToCheck)
			PlayerRef.Activate(Self.GetRef().GetLinkedRef())
		endif
	endEvent
EndState

