Scriptname SFBGS00D:SFFL_SE_EC08_QuestScript extends Quest
{Quest script for EC08, generates ships and selects correct BE}

Function SpawnShips(int numberofShipsToSpawn)

    Debug.Trace("Number of ships in array: " + DerelictShips.GetCount())

    ;Make sure it's not above the total amount of ships in the cell
    int icount = DerelictShips.GetCount()
    if (numberOfShipsToSpawn > icount)
        numberofShipsToSpawn = icount
    endif

    Debug.Trace("Number of derelict ships to spawn: " + NumberOfShipsToSpawn)

    ;Disable ships that aren't needed
    while (DerelictShips.GetCount() - NumberOfShipsToSpawn > 0)
        int RandomShip = Utility.RandomInt(0,DerelictShips.GetCount()-1)
        SpaceshipReference derelict = DerelictShips.GetShipAt(RandomShip) as SpaceshipReference
        derelict.Disable()
        DerelictShips.RemoveRef(derelict)
        Debug.Trace("Ship " + derelict + " disabled.")
    endwhile
EndFunction

Function SetupDerelict(int intactShip)
    
    ;Make sure we have at lesat one boardable derelict ship
    if (intactShip > 0)
        ;Pick a ship at random and set it up as a derelict
        SpaceshipReference savedDerelict = DerelictShips.GetRandom() as SpaceshipReference
        savedDerelict.SetValue(DockingPermission,0)
        savedDerelict.SetValue(SpaceshipCrew,0)

        ;Determine if we need to force a BE type on it
        ;Values are 0 for Generic BE
        ;1 for Corpses
        ;2 for Hazards
        ;3 for Heat Leeches
        int beType = -1 as Int
        float randomDerelictStatus = 0 as float

        if (BE_EC08_Corpses.GetValueInt() > 0)
            beType = 1
        elseif (BE_EC08_Hazards.GetValueInt() > 0)
            beType = 2
        elseif (BE_EC08_Leeches.GetValueInt() > 0)
            beType = 3
        elseif (BE_EC08_Generic.GetValueInt() > 0)
            beType = 0
        else
            randomDerelictStatus = Utility.RandomFloat()
        endif

        if (beType == 1 || (beType < 0 && randomDerelictStatus > 0.6))
            savedDerelict.AddKeyword(DerelictShip_Corpses_Keyword)
            SetStage(40)
            Debug.Trace("Ship " + savedDerelict + " has corpses.")
        elseif (beType == 2 || (beType < 0 && randomDerelictStatus > 0.4))
            savedDerelict.AddKeyword(DerelictShip_Hazards_Keyword)
            SetStage(50)
            Debug.Trace("Ship " + savedDerelict + " has hazards.")
        elseif (beType > 2 || (beType < 0 && randomDerelictStatus > 0.25))
            savedDerelict.AddKeyword(DerelictShip_HeatLeeches_Keyword)
            SetStage(60)
            Debug.Trace("Ship " + savedDerelict + " has heat leeches.")
        else
            SetStage(30)
            Debug.Trace("Ship " + savedDerelict + " is generic derelict.")
        endif

        BoardableDerelict.ForceRefTo(savedDerelict)
        DerelictShips.RemoveRef(savedDerelict)
        Debug.Trace("Ship " + savedDerelict + " kept alive.")
        
        ;Set variable distance for self-destruct function
        BE_EC08_SelfDestructDistRandom.SetValue(BE_EC08_SelfDestructDist.GetValue() + Utility.RandomFloat(0.0,175.0))
        Debug.Trace("Random self-destruct distance set to " + BE_EC08_SelfDestructDistRandom.GetValue() + " meters.")                
    else
        Debug.Trace("No boardable derelict ships.")
    endif

    ;Destroy remaining ship
    int icount = DerelictShips.GetCount() as Int
    while (icount > 0)
        SpaceshipReference derelict = DerelictShips.GetShipAt(icount - 1) as SpaceshipReference
        if derelict.Is3DLoaded()
            ;Wait up to 1 second to stagger ship destruction
            Utility.Wait(Utility.RandomFloat())
            derelict.KillSilent()
            Debug.Trace("Ship " + derelict + " destroyed.")
        Else
            ;set keyword on ship, will be destroyed by EC08RegisterDerelictShip when Loaded
            derelict.AddKeyword(DestroyShipWhenLoaded)
        Endif
        icount -= 1
    endwhile

    SetStage(20)

EndFunction
RefCollectionAlias Property DerelictShips Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory

ActorValue Property SpaceshipCrew Auto Const Mandatory

GlobalVariable Property BE_EC08_SelfDestructDist Auto Const Mandatory

GlobalVariable Property BE_EC08_SelfDestructDistRandom Auto Const Mandatory

ReferenceAlias Property BoardableDerelict Auto Const Mandatory

GlobalVariable Property BE_EC08_Corpses Auto Const Mandatory

GlobalVariable Property BE_EC08_Hazards Auto Const Mandatory

GlobalVariable Property BE_EC08_Leeches Auto Const Mandatory

GlobalVariable Property BE_EC08_Generic Auto Const Mandatory

Keyword Property DerelictShip_Corpses_Keyword Auto Const Mandatory

Keyword Property DerelictShip_Hazards_Keyword Auto Const Mandatory

Keyword Property DerelictShip_HeatLeeches_Keyword Auto Const Mandatory

Keyword Property DestroyShipWhenLoaded Auto Const Mandatory
