Scriptname DBTestPCMAIScript extends Quest

RefCollectionAlias property FoundPackins auto const mandatory

ReferenceAlias property NearbyPackin auto const mandatory

Scene property DBTestPCMAI_InvestigatePackinScene auto const mandatory

int property AtTargetLocationStage = 100 auto Const


Event OnQuestInit()
    ; run timer to check for nearby packin periodically if none found
    if NearbyPackin.GetRef() == None
        debug.trace(" OnQuestInit- no nearby packin found")
        CheckForNearbyPackin()
    else
        debug.trace(" OnQuestInit- found nearby packin - start scene")
        DBTestPCMAI_InvestigatePackinScene.Start()
    endif
EndEvent

; call on timer, and when scene ends
bool Function CheckForNearbyPackin()
    debug.trace(" CheckForNearbyPackin - adding current packin " + NearbyPackin.GetRef() + " to FoundPackins collection")
    ; add current nearbyPackin to FoundPackins collection
    FoundPackins.AddRef(NearbyPackin.GetRef())
    ; find another one
    NearbyPackin.ClearAndRefillAlias()
    if NearbyPackin.GetRef()
        debug.trace(" CheckForNearbyPackin - found packin - start scene")
        DBTestPCMAI_InvestigatePackinScene.Stop()
        utility.wait(1.0)
        DBTestPCMAI_InvestigatePackinScene.Start()
    endif
    if GetStageDone(AtTargetLocationStage) == false
        debug.trace(" CheckForNearbyPackin - no packin - run timer")
        StartTimer(10.0)
    Else
        debug.trace(" CheckForNearbyPackin - at target location - done looking for packins")
    endif
EndFunction

Event OnTimer(int aiTimerID)
    if DBTestPCMAI_InvestigatePackinScene.IsPlaying()
        ; always run timer as a failsafe
        StartTimer(10.0)
    else
        ; if scene isn't running, try to find a new packin
        CheckForNearbyPackin()
    endif
EndEvent
