Scriptname LISTShipVendorInfoScript extends TopicInfo Const

SQ_PlayerShipScript Property playerShipScript Mandatory Const Auto

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	debug.trace(self + "try to show hangar menu for speaker " + akSpeakerRef)
	;if we're calling this on the player, grab whoever the player is talking to and show menu, otherwise just show menu
	if utility.IsGameMenuPaused() == false
        Actor theVendor
        ObjectReference landingMarker = playerShipScript.PlayerShipLandingMarker.GetRef()

		if (akSpeakerRef == Game.GetPlayer())
            theVendor = (akSpeakerRef as Actor).GetDialogueTarget()
		else
            theVendor = akSpeakerRef as Actor
		endIf

        if (theVendor && landingMarker)

           	landingMarker.ShowHangarMenu(0, theVendor)
        endif
	endif
endEvent