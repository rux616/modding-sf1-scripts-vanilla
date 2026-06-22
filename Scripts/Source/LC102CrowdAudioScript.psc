Scriptname LC102CrowdAudioScript extends ObjectReference

Keyword property CrowdAudioMarkerKeyword auto Const
Keyword property CrowdFleeAudioMarkerKeyword auto Const
int property MinCrowdPopulation = 10 auto const

event OnCellLoad()
    Actor player = Game.GetPlayer() as Actor
    RegisterForRemoteEvent(player, "OnCombatStateChanged")

    int playerCombatState = player.GetCombatState()

    if(playerCombatState == 0)
        DisableFleeAudio()
        EvaluateActorPopulation()
    elseif(playerCombatState == 1)
        DisableCrowdAudio()
        EnableFleeAudio()
    endIf
endEvent

event OnUnload()
    Actor player = Game.GetPlayer() as Actor
    UnregisterForRemoteEvent(player, "OnCombatStateChanged")
endEvent

event Actor.OnCombatStateChanged(Actor akSender, ObjectReference akTarget, int aeCombatState)
    if(aeCombatState == 0)
        DisableFleeAudio()
        EvaluateActorPopulation()
    elseif(aeCombatState == 1)
        DisableCrowdAudio()
        EnableFleeAudio()
    endIf
endEvent

function EvaluateActorPopulation()
    int objCount = GetTriggerObjectCount()

    if(objCount < MinCrowdPopulation)
        DisableCrowdAudio()
    else
        EnableCrowdAudio()
    endIf
endFunction

function EnableCrowdAudio()
        ObjectReference crowdAudioMarkerRef = GetLinkedRef(CrowdAudioMarkerKeyword)
            
        if(crowdAudioMarkerRef != None && crowdAudioMarkerRef.IsEnabled() == false)
            crowdAudioMarkerRef.Enable()
        endIf
endFunction

function DisableCrowdAudio()
        ObjectReference crowdAudioMarkerRef = GetLinkedRef(CrowdAudioMarkerKeyword)
            
        if(crowdAudioMarkerRef != None && crowdAudioMarkerRef.IsEnabled() == true)
            crowdAudioMarkerRef.Disable()
        endIf
endFunction

function EnableFleeAudio()
    ObjectReference crowdFleeAudioMarkerRef = GetLinkedRef(CrowdFleeAudioMarkerKeyword)
        
    if(crowdFleeAudioMarkerRef != None && crowdFleeAudioMarkerRef.IsEnabled() == false)
        crowdFleeAudioMarkerRef.Enable()
    endIf
endFunction

function DisableFleeAudio()
    ObjectReference crowdFleeAudioMarkerRef = GetLinkedRef(CrowdFleeAudioMarkerKeyword)
        
    if(crowdFleeAudioMarkerRef != None && crowdFleeAudioMarkerRef.IsEnabled() == true)
        crowdFleeAudioMarkerRef.Disable()
    endIf
endFunction

