ScriptName VendorInfoScript extends TopicInfo const

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	debug.trace(self + "showing barter menu " + akSpeakerRef)
	;if we're calling this on the player, grab whoever the player is talking to and show barter menu, otherwise just show barter menu
	if utility.IsGameMenuPaused() == false
		Actor vendorRef = NONE
		SpaceshipReference vendorShipRef = NONE
		If akSpeakerRef == Game.GetPlayer()
			vendorRef = (akSpeakerRef as Actor).GetDialogueTarget()
		Else
			vendorRef = (akSpeakerRef as Actor)
			if vendorRef == None
				vendorShipRef = (akSpeakerRef as SpaceshipReference)
			endif
		EndIf
		if vendorShipRef
			debug.trace(self + " calling ShowBarterMenu on " + vendorShipRef)
			;wait a second to allow the audio to finish
			Utility.Wait(0.2)
			vendorShipRef.ShowBarterMenu()
		elseif vendorRef
			debug.trace(self + " calling ShowBarterMenu on " + vendorRef)
			;wait a second to allow the audio to finish
			Utility.Wait(0.2)
			vendorRef.ShowBarterMenu()
		endif
	endif
endEvent