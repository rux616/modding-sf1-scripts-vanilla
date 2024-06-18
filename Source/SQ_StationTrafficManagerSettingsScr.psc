Scriptname SQ_StationTrafficManagerSettingsScr extends ObjectReference
{Settings object for the Station Traffic Manager.}

Group SystemProperties CollapsedOnRef
    int property MinRefreshTime = 5 Auto Const
    {Default=5. Minimum time between traffic system spawning and undocking updates.}

    int property MaxRefreshTime = 15 Auto Const
    {Default=15. Maximum time between traffic system spawning and undocking updates.}

    int property MinSpawnDelay = 15 Auto Const
    {Default=15. Minimum delay between spawning new ships.}

    float property PercentEasy = 0.6 Auto Const
    {Default=0.5. Percent of traffic ships spawned at Easy difficulty.}

    float property PercentMedium = 0.3 Auto Const
    {Default=0.4. Percent of traffic ships spawned at Medium difficulty.}

    float property PercentHard = 0.1 Auto Const
    {Default=0.1. Percent of traffic ships spawned at Hard difficulty.}

    float property CombatTimestampElapsedDelay = 0.20 Auto Const
    {Default=0.20. If CombatTimestampGlobal is not None or set to 0, don't spawn ships if the current game time
     has advanced less than CombatTimestampElapsedDelay from the timestamp.}
EndGroup

Group StandardProperties
    Formlist property TrafficShiplist Auto Const ;MandatoryOnRef
    {MANDATORY for refs. Formlist of ships to be used for traffic at this location.}

    Faction[] property TrafficShipFactions Auto Const
    {OPTIONAL. Array of factions to apply to traffic ships at this location. Useful for adding station docking factions, etc.}

    int property MaxShips = 8 Auto Const
    {Default=8. Maximum number of traffic ships in this cell.}

    int property InitialShipsMin = 2 Auto Const
    {Default=2. Minimum number of initial ships to spawn.}

    int property InitialShipsMax = 4 Auto Const
    {Default=4. Maximum number of initial ships to spawn.}

    GlobalVariable property CombatTimestampGlobal Auto Const
    {OPTIONAL. If set, the global variable to use as a timestamp when combat is started in this space cell.}
EndGroup

Group StationProperties
    int property MaxShipsInteractingWithStation = 3 Auto Const
    {Default=3. Maximum number of traffic ships that can be interacting with the station in any way.
    Includes fixed, docking, docked, and departing ships.}

    int property DockingDelayMin = 30 Auto Const
    {Default=30. Minimum delay between when a ship docks with the station and when it can undock.}

    int property DockingDelayMax = 45 Auto Const
    {Default=45. Maximum delay between when a ship docks with the station and when it can undock.}

    int property SafeSpawnDistanceFromStation = 750 Auto Const
    {Default=750. Minimum distance at which ships should spawn from the station.}
EndGroup
