Scriptname ShipVendorInfoVehicleScript extends TopicInfo

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	debug.trace(self + "try to show hangar menu for speaker " + akSpeakerRef)
	;if we're calling this on the player, grab whoever the player is talking to and show menu, otherwise just show menu
	if utility.IsGameMenuPaused() == false
        SQ_ShipServicesActorScript theVendor
		If akSpeakerRef == Game.GetPlayer()
            theVendor = (akSpeakerRef as Actor).GetDialogueTarget() as SQ_ShipServicesActorScript
		Else
            theVendor = akSpeakerRef as SQ_ShipServicesActorScript
		EndIf
        if theVendor && theVendor.myLandingMarker
        	debug.trace(self + "showing ship hangar menu: landing marker=" + theVendor.myLandingMarker + ", vendor=" + theVendor)
			;wait a second to allow the audio to finish
    	    Utility.Wait(0.2)
           	theVendor.myLandingMarker.ShowHangarMenu(1, theVendor)
        endif
	endif
endEvent
