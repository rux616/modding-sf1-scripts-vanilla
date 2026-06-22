Scriptname UC06_TurretOnlineScript extends SpaceshipReference Const

Faction Property PlayerFriendFaction Auto Const Mandatory

Float Property WaitTime Auto Const Mandatory

ActorValue Property HideShipFromHUDValue Mandatory Const Auto

int iTurnOnWaitID = 1 const

Function SetTurretOnline()
    StartTimer(WaitTime, iTurnOnWaitID)
EndFunction

Event OnTimer(int aiTimerID)
    if aiTimerID == iTurnOnWaitID
        SetValue(HideShipFromHUDValue, 0.0)
        Self.SetUnconscious(false)
        Self.RemoveFromFaction(PlayerFriendFaction)
    endif
EndEvent