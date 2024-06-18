Scriptname FFCydoniaZ04_BlockActivation extends ObjectReference
{Blocks activation once on load to prevent the prompt from showing up prematurely. Unblocks Activation when enabled}


bool property HideActivationText = true const auto

Bool HasLoaded = FALSE

Event OnLoad()
    If IsDisabled() == 1
        BlockActivation(TRUE,HideActivationText)
    Else
        BlockActivation(FALSE,False)
    EndIf
EndEvent


Event OnActivate(ObjectReference akActionRef)
    debug.trace(self + " OnActivate " + akActionRef)
EndEvent