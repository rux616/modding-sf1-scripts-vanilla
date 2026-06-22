Scriptname SFBGS00D:SFFL_SE_EC07Script extends Quest

Event OnInit()
    RegisterPlayer()
EndEvent

Function RegisterPlayer()
    RegisterForPlayerTeleport()
    Debug.Trace("Player registered for teleport!")
EndFunction

;Used to prevent players from breaking quest by Fast Travelling before they say goodbye to Ruby
;This will be treated the same as if the player takes off in their ship before saying goodbye

Event OnPlayerTeleport()
    Debug.Trace("Player teleported!")
EndEvent

Event OnPlayerFastTravel()
    Debug.Trace("Player fast traveled!")
    if (IsStageDone(600) && !IsStageDone(700))
        SFFL_SE_EC07_610_RubyExitsShip.Stop()
        SetStage(800)
    endif
EndEvent

Scene Property SFFL_SE_EC07_610_RubyExitsShip Auto Const Mandatory
