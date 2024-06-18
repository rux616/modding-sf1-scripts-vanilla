Scriptname DefaultBlockActivationOnLoad extends ObjectReference default
{Blocks activation once on load.}

bool property HideActivationText = true const auto

Bool HasLoaded = FALSE

Event OnLoad()
	if !HasLoaded
		HasLoaded = TRUE
    	BlockActivation(TRUE,HideActivationText)
    endif
EndEvent

Event OnActivate(ObjectReference akActionRef)
    debug.trace(self + " OnActivate " + akActionRef)
EndEvent