Scriptname CityNewAtlantisNATTriggerScript extends ObjectReference

Message Property NATTriggerMessage Auto Const
Quest Property NATControlQuest Auto Const Mandatory
Scene Property NATTransitScene Auto Const Mandatory
GlobalVariable Property NATDestinationGlobal Auto
Message Property CityNewAtlantisNATMessage_Disallowed_Combat Mandatory Const Auto
{autofill}

Event Scene.OnEnd(Scene akSource)
	gotoState("Normal")
EndEvent

auto state Normal
	Event OnBeginState(string asOldState)
		BlockActivation(FALSE, FALSE)
		UnRegisterForRemoteEvent(NATTransitScene, "OnEnd")
	EndEvent

	Event OnActivate(ObjectReference akActionRef)
		if akActionRef==Game.GetPlayer()
			gotoState("Busy")

			;check if allowed
			bool disallowed_Combat = Game.AreHostileActorsNear() || Game.IsGuardPursuingPlayer()
			if disallowed_Combat
				CityNewAtlantisNATMessage_Disallowed_Combat.Show()
				gotoState("Normal")
				return
			endif

			Self.SetOpen()
			Utility.Wait(0.13)
			int iButton
			iButton = NATTriggerMessage.Show()
			if iButton == -1
				gotoState("Normal")
			elseif iButton == 0
				NATDestinationGlobal.SetValue(0)
				NATTransitScene.Start()
			elseif iButton == 1
				NATDestinationGlobal.SetValue(1)
				NATTransitScene.Start()
			elseif iButton == 2
				NATDestinationGlobal.SetValue(2)
				NATTransitScene.Start()
			elseif iButton == 3
				NATDestinationGlobal.SetValue(3)
				NATTransitScene.Start()
			endif
		endif
	EndEvent
endState

state Busy
	Event OnBeginState(string asOldState)
		BlockActivation(TRUE, TRUE)
		RegisterForRemoteEvent(NATTransitScene, "OnEnd")
	EndEvent
endState