Scriptname SFBGS00D:SFBGS00DDR01DegaussMachineScript extends ObjectReference
{Handles random explosions for degaussing machine}

Explosion Property SFBGS00DDR001_Electrical_Explosion auto const mandatory
WwiseEvent Property SFBGS00DDR01_WwiseEvent_TRP_ElectricalPanel_Explosion auto const mandatory
Keyword Property LinkCustom01 auto const mandatory
{Links to Power Switch that turns on machine}
Keyword Property LinkCustom02 auto const mandatory
{Links to door to room containing machine}

Group Variables
    Int Property InitialDelay = 3 auto const
    {Delay between first and second explosion}
    Int Property MachineResetSeconds = 60 auto const
    {Machine will automatically turn off after this many seconds}
    Int Property TimerLowerBound = 3 auto const
    {Minimum time between explosions}
    Int Property TimerUpperBound = 7 auto const
    {Maximum time between explosions}
EndGroup

Int iMachineTimer = 1
Int iTurnOffTimer = 2

Event OnPowerOn(ObjectReference akPowerGenerator)
    ;fills array with linked xmarkers that are valid explosion locations
    ObjectReference[] DegaussMachineMarkerArray = GetLinkedRefChain()
    ;close door leading to room
    GetLinkedRef(LinkCustom02).SetOpen(false)
    ;first explosion is always in front of the window
    DegaussMachineMarkerArray[0].PlaceAtMe(SFBGS00DDR001_Electrical_Explosion)
    DegaussMachineMarkerArray[0].CreateDetectionEvent(Game.GetPlayer(), 50)
    ;audio is separate to prevent screenshake
    SFBGS00DDR01_WwiseEvent_TRP_ElectricalPanel_Explosion.Play(DegaussMachineMarkerArray[0])
    StartTimer(InitialDelay, iMachineTimer)
    ;timer to prevent machine running forever after player leaves the room
    StartTimer(MachineResetSeconds, iTurnOffTimer)
EndEvent

Event OnPowerOff()
    ;open door leading to room
    GetLinkedRef(LinkCustom02).SetOpen()
    CancelTimer(iTurnOffTimer)
    CancelTimer(iMachineTimer)
EndEvent

Event OnUnload()
    GetLinkedRef(LinkCustom01).SetOpen()
    CancelTimer(iMachineTimer)
    CancelTimer(iTurnOffTimer)
EndEvent

Event OnTimer(int aiTimerID)
    ObjectReference[] DegaussMachineMarkerArray = GetLinkedRefChain()
    if(aiTimerID == iMachineTimer)
        int randomMarker = Utility.RandomInt(0,DegaussMachineMarkerArray.Length-1)
        DegaussMachineMarkerArray[randomMarker].PlaceAtMe(SFBGS00DDR001_Electrical_Explosion)
        DegaussMachineMarkerArray[randomMarker].CreateDetectionEvent(Game.GetPlayer(), 50)
        SFBGS00DDR01_WwiseEvent_TRP_ElectricalPanel_Explosion.Play(DegaussMachineMarkerArray[randomMarker])
        StartTimer(Utility.RandomInt(TimerLowerBound,TimerUpperBound), iMachineTimer)
    elseif(aiTimerID == iTurnOffTimer)
        ;activate switch, which will send an OnPowerOff event
        GetLinkedRef(LinkCustom01).SetOpen()
        CancelTimer(iMachineTimer)
    endif
EndEvent