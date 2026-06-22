Scriptname DLC03:SFTA00AliasHannibalScannedScript extends ReferenceAlias

Int Property StageToSetOnScanned = 358 Const Auto
ActorValue Property SFBGS003_SQ_Bounty_isScannedAV Mandatory Const Auto

Event OnLoad()
    Actor myHannibal = GetActorRef()
    If myHannibal.GetValue(SFBGS003_SQ_Bounty_isScannedAV) <= 0
        RegisterForRemoteEvent(myHannibal, "OnScanned")
        myHannibal.SetValue(SFBGS003_SQ_Bounty_isScannedAV, 0)
    EndIf
EndEvent


; Sets the stage on the quest when Hannibal is scanned
Event OnScanned()
    Debug.Trace(self + " OnScanned() SetStage: " + StageToSetOnScanned)
    GetOwningQuest().SetStage(StageToSetOnScanned)
    UnregisterForRemoteEvent(GetActorRef(), "OnScanned")
EndEvent