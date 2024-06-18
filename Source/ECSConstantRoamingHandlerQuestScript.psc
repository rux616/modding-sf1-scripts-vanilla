Scriptname ECSConstantRoamingHandlerQuestScript extends Quest


Group Quest_Properties
    Int Property StageToSet = -1 Const Auto
    {The stage we want to set, presumably to end the quest}
    LocationAlias Property ShipInteriorLocation Mandatory Const Auto
    {The Location Alias of the Ship's interior that we want to check, in case the player is inside when the quest tries to stop}
    ReferenceAlias Property PlayerShip Mandatory Const Auto
    {The Player's ship}
    ReferenceAlias Property Ship Mandatory Const Auto
    {The ship we want to move}
    ReferenceAlias Property ShipMarker Mandatory Const Auto
    {The Marker we want to send the ship to in the new location when the quest starts}
    ReferenceAlias Property ShipHoldingMarker Mandatory Const Auto
    {The Marker we want to send the ship to in the ship's holding cell before stopping the quest}
EndGroup

Group Timer_Properties
    Int Property ShipMoveTimerID = 1 Const Auto
    Float Property ShipMoveTimerLengthMin = 48.0 Const Auto
    {The minimum time, in game time hours, we want to wait before trying to stop the quest and start it again.}
    Float Property ShipMoveTimerLengthMax = 120.0 Const Auto
    {The maximum time, in game time hours, we want to wait before trying to stop the quest and start it again.}
    Int Property TryAgainTimerID = 2 Const Auto
    Float Property TryAgainTimerLength = 150.0 Const Auto
    {The length, in real time seconds to wait before trying to stop the quest again}
    Int Property UndockTimerID = 3 Const Auto
    Float Property UndockTimerLengthMin = 10.0 Const Auto
    {The minimum time, in real time seconds to wait before trying to stop the quest}
    Float Property UndockTimerLengthMax = 30.0 Const Auto
    {The maximum time, in real time seconds to wait before trying to stop the quest}
EndGroup


;We don't want to disable the Ship or stop the quest if the player is on board or attached to the ship, so we'll keep trying until that's not the case.
;This has the additional benefit of allowing the player to see the Ship Grav Jump away if the timing works out, which should feel more immersive.
Function TryToStopQuest()
    If !GetStageDone(StageToSet)
        ;Don't stop the quest if the player is currently on board the Ship
        If !Game.GetPlayer().IsInLocation(ShipInteriorLocation.GetLocation())
            SpaceshipReference myPlayerShip = PlayerShip.GetShipRef()
            SpaceshipReference myShip = Ship.GetShipRef()
            ;Don't stop the quest if the player is currently docked with the Ship
            If !myPlayerShip.IsDockedWith(myShip)
                myShip.DisableWithGravJump()
                myShip.MoveTo(ShipHoldingMarker.GetRef())
                If StageToSet >= 0
                    SetStage(StageToSet)
                EndIf
            Else
                ;If so, try again later.
                StartTimer(TryAgainTimerLength, TryAgainTimerID)
            EndIf
            
        Else
            ;If so, try again later.
            StartTimer(TryAgainTimerLength, TryAgainTimerID)
        EndIf
    EndIf
EndFunction

Function RandomJump()
    Int iRandom = Utility.RandomInt(0, 1)
    If iRandom == 0
        Float fRandom = Utility.RandomFloat(UndockTimerLengthMin, UndockTimerLengthMax)
        StartTimer(fRandom, UndockTimerID)
        TryToStopQuest()
    EndIf
EndFunction


Event OnTimerGameTime(int aiTimerID)
    TryToStopQuest()
EndEvent

Event OnTimer(int aiTimerID)
    If aiTimerID == TryAgainTimerID
        TryToStopQuest()
    ElseIf aiTimerID == UndockTimerID
        TryToStopQuest()
    EndIf
EndEvent

Event OnQuestInit()
    Float fRandomGameTimeTimer = Utility.RandomFloat(ShipMoveTimerLengthMin, ShipMoveTimerLengthMax)
    StartTimerGameTime(fRandomGameTimeTimer, ShipMoveTimerID)
    SpaceshipReference myShip = Ship.GetShipRef()
    myShip.MoveTo(ShipMarker.GetRef())
    myShip.Enable()
EndEvent
