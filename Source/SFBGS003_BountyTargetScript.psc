Scriptname SFBGS003_BountyTargetScript extends ReferenceAlias

{Randomizes bounty, sets stage when scanning targets}

Quest Property SFBGS003_ScannerBountyDialogueQuest auto const
Message Property SFBGS003_ScannerBountyMessage auto const
ActorValue Property SFBGS003_BountyWantedAliveAV auto const

Event OnLoad()
    RegisterForRemoteEvent(GetActorRef(), "OnScanned")
    (GetRef() as Actor).SetValue(SFBGS003_BountyWantedAliveAV, (Utility.RandomInt(0,1) as Float))
    ;will also need to add a scanner keyword for alive vs deadoralive, based on which was chosen
EndEvent

Event OnScanned()
   SFBGS003_ScannerBountyDialogueQuest.SetStage(10)
    SFBGS003_ScannerBountyMessage.Show()
    UnregisterForAllRemoteEvents()
EndEvent