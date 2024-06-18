Scriptname SFBGS003TASupportQuestScript extends Quest

ActorValue Property SFBGS003_PlayerTrackerNameAV Mandatory Const Auto
ReferenceAlias Property PlayerTrackerNameMarker Mandatory Const Auto
Message[] Property PlayerTrackerNameData Mandatory Const Auto

GlobalVariable Property SFBGS003_Bounties_Alive_Total Mandatory Const Auto
GlobalVariable Property SFBGS003_Bounties_Dead_Total Mandatory Const Auto
GlobalVariable Property SFBGS003_Bounties_Total Mandatory Const Auto

;Guards
Guard SetBountyAliveDataGuard ProtectsFunctionLogic
Guard SetBountyDeadDataGuard ProtectsFunctionLogic
Guard SetBountyTotalDataGuard ProtectsFunctionLogic

;The player gets to choose a Tracker callsign at the end of SFTA00. We're setting that data here on the player for Text Replacement to be used elsewhere.
;To use the name in text replacement for book, terminals, etc, you'll want to make a linked external alias ref on your quest called PlayerTrackerNameMarker that 
;you will with the PlayerTrackerNameMarker on the SFBGS003_TrackersAllianceSupportQuest. 
;To use it in dialogue on that quest, use <Alias.CurrentName=PlayerTrackerNameMarker>
Function SetPlayerTrackerName()
    Int iName = Game.GetPlayer().GetValue(SFBGS003_PlayerTrackerNameAV) as Int

    If iName != 0
        PlayerTrackerNameMarker.GetRef().SetOverrideName(PlayerTrackerNameData[iName])
    EndIf
EndFunction


Function SetBountiesAliveTotal()
    LockGuard SetBountyAliveDataGuard
        SFBGS003_Bounties_Alive_Total.Mod(1)
        SetBountyTotalGlobal()
    EndLockguard
EndFunction

Function SetBountiesDeadTotal()
    LockGuard SetBountyDeadDataGuard
        SFBGS003_Bounties_Dead_Total.Mod(1)
        SetBountyTotalGlobal()
    EndLockguard
EndFunction

Function SetBountyTotalGlobal()
    LockGuard SetBountyTotalDataGuard
        SFBGS003_Bounties_Total.SetValue(SFBGS003_Bounties_Alive_Total.GetValue() + SFBGS003_Bounties_Dead_Total.GetValue())
        UpdateCurrentInstanceGlobal(SFBGS003_Bounties_Total)
    EndLockGuard
EndFunction
