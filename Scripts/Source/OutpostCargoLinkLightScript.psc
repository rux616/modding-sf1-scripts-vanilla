Scriptname OutpostCargoLinkLightScript extends ObjectReference Const

Keyword property OutpostCargoLinkLightsKeyword auto Const Mandatory
{ used to get my outpost cargo link }

ActorValue Property OutpostCargoLinkAnimState auto const mandatory
{ actor value to set on myself for code to use as default ship carry weight }

Event OnLoad()
    OutpostCargoLinkMarkerScript myCargoLinkRef = GetLinkedRef(OutpostCargoLinkLightsKeyword) as OutpostCargoLinkMarkerScript
    if myCargoLinkRef
        RegisterForCustomEvent(myCargoLinkRef, "SetAnimationStateEvent")
        ; initialize animation state
        int stateEnum = myCargoLinkRef.GetValueInt(OutpostCargoLinkAnimState)
        SQ_OutpostCargoLinkScript:animData theData = myCargoLinkRef.SQ_OutpostCargoLink.GetAnimationData(stateEnum)
        if theData
            PlayAnimation(theData.lightColorEvent)
            PlayAnimation(theData.lightStateEvent)
        endif
    endif
EndEvent

Event OutpostCargoLinkMarkerScript.SetAnimationStateEvent(OutpostCargoLinkMarkerScript akSender, Var[] akArgs)
	debug.trace(self + " SetAnimationStateEvent event received")
	SQ_OutpostCargoLinkScript:animData theData = akArgs[0] as SQ_OutpostCargoLinkScript:animData
    if theData
        PlayAnimation(theData.lightColorEvent)
        PlayAnimation(theData.lightStateEvent)
    endif
endEvent

Event OnUnload()
    UnregisterForAllCustomEvents()    
EndEvent
