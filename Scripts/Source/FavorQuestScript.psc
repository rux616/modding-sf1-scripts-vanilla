Scriptname FavorQuestScript extends Quest

Location StartLocation

Event OnQuestStarted()
	Actor PlayerREF = Game.GetPlayer()
	RegisterForRemoteEvent(PlayerREF, "OnLocationChange")
	StartLocation = PlayerREF.GetCurrentLocation()

	;failsafe - if for some reason the quest starts up after completion, shut it down again
	If GetStage() >= 200
		Stop()
	EndIf
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	;whenever the player leaves the Location where this quest started, shut down the quest if the player never picked it up
	;The Story Manager will start the quest again when the player enters the Location again 
	;A condition on the Story Manager node prevents it from starting if the quest has progressed
	;This cuts down on the number of quests we have running

	if akSender.IsInLocation(StartLocation) == 1
		;do nothing
	Else
		If GetStage() < 10
			Stop()
		Else
			;quest has advanced, so we don't need to check to shut down anymore
			UnregisterForRemoteEvent(akSender, "OnLocationChange")
		EndIf
	EndIf
EndEvent