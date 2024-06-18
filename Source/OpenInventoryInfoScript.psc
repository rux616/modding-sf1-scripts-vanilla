Scriptname OpenInventoryInfoScript extends TopicInfo Const
{opens actor's inventory on the info OnEnd event}

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	debug.trace(self + " OnEnd " + akSpeakerRef)
	;if we're calling this on the player, grab whoever the player is talking to and open the inventory menu, otherwise just open inventory menu
	if utility.IsGameMenuPaused() == false
		; wait for info to actually finish
		utility.wait(0.2)
		If akSpeakerRef == Game.GetPlayer()
			(akSpeakerRef as Actor).GetDialogueTarget().OpenInventory(true)
		Else
			(akSpeakerRef as Actor).OpenInventory(true)
		EndIf
	endif
endEvent