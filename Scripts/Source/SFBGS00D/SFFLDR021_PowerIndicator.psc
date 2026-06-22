Scriptname SFBGS00D:SFFLDR021_PowerIndicator extends ObjectReference

Keyword Property SiloMissileManager Auto Const Mandatory

Event OnPowerOn(ObjectReference akPowerGenerator)
    ;Add 1 to the batterycount variable in the silomagerscript avery time the player put a battery in a receptacle
    SFBGS00D:SFFLDR021_SiloManagerScript siloManager = GetLinkedRef(SiloMissileManager) as SFBGS00D:SFFLDR021_SiloManagerScript
    if siloManager != None
        siloManager.IncrementBatteryCount()
    endif
EndEvent