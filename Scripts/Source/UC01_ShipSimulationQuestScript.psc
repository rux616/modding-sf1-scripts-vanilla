Scriptname UC01_ShipSimulationQuestScript extends Quest Conditional

;If we end up doing subwaves, I'd build them using these
Struct EnemyWave
    FormList BaseEnemyList
    {Required form list of initial enemies to spawn in}

    int Difficulty = 2 
    {What difficulty level the NPCs should be spawned in}
EndStruct

Group Objects
    FormList Property UC01_SimEnemyShips_FormList Mandatory Const Auto
    {List of enemy ships}

    EnemyWave[] Property EnemyTierLists Mandatory Const Auto
    {Array of structs of enemy tiers, as well as the difficulty they should be spawned at}

    ActorValue Property Health Mandatory Const Auto
    {Health value}

    ActorValue Property SpaceshipCrew Mandatory Const Auto
    {Spaceship crew value (used to get the ships to stop fighting)}

    WwiseEvent Property ResetShipSoundEvent Mandatory Const Auto
    {Sound to play when the player's ship is being reset}

    GlobalVariable Property UC01_ShipSim_CurrentTier Mandatory Const Auto
    {Global used to track the player's progression through the sequence}

    GlobalVariable Property UC01_ShipSim_TotalEnemyCount Mandatory Const Auto
    {The total number of enemies the player has to face in order to complete the sequence totally}

    GlobalVariable Property  UC01_ShipSim_MinTierRequired Mandatory Const Auto
    {How many enemies the player has to kill in order to pass}

    GlobalVariable Property UC01_ShipSim_PlayerDeaths Mandatory Const Auto
    {Global var used to track the number of ship deaths. Only saves out after the first go around}

    InputEnableLayer Property SimShipEnablePlayer Auto
    {Enable layer that manages the player's controls during the sequence}

    GlobalVariable Property UC01_ShipSim_CurrentWaveEnemyCountDefeated Mandatory Auto
    {Global used to track how many enemies we've defeated in the current wave}

    GlobalVariable Property UC01_ShipSim_CurrentWaveEnemyCountTotal Mandatory Const Auto
    {Global used to track how many total enemies we'll be fighting each wave}

    GlobalVariable Property UC01_ShipSim_Debug_InifinitePerks Mandatory Const Auto
    {If set to 1, we don't clean up the player's perks between rounds}

    ActorValue Property WeaponGroup1SystemHealth Mandatory Const Auto
    {Spaceship Weapon Group 1 health (used to repair the ship)}

    ActorValue Property WeaponGroup2SystemHealth Mandatory Const Auto
    {Spaceship Weapon Group 2 health (used to repair the ship)}

    ActorValue Property WeaponGroup3SystemHealth Mandatory Const Auto
    {Spaceship Weapon Group 3 health (used to repair the ship)}

    ActorValue Property EngineSystemHealth Mandatory Const Auto
    {Spaceship Engine health (used to repair the ship)}

    ActorValue Property ShieldSystemHealth Mandatory Const Auto
    {Spaceship Shield health (used to repair the ship)}

    ActorValue Property GravDriveSystemHealth Mandatory Const Auto
    {Spaceship Grav Drive health (used to repair the ship)}

    ActorValue Property ReactorSystemHealth Mandatory Const Auto
    {Spaceship Reactor health (used to repair the ship)}

    ActorValue Property ShipSystemEngineEMHealth Mandatory Const Auto
    {Spaceship Engine EM health (used to repair the ship)}

    ActorValue Property ShipSystemGravDriveEMHealth Mandatory Const Auto
    {Spaceship Grav Drive EM health (used to repair the ship)}

    ActorValue Property ShipSystemShieldsEMHealth Mandatory Const Auto
    {Spaceship Shields EM health (used to repair the ship)}

    ActorValue Property ShipSystemWeaponEMHealth Mandatory Const Auto
    {Spaceship Weapon EM health (used to repair the ship)}

    ActorValue Property SpaceshipWeaponGroup1EMHealth Mandatory Const Auto
    {Spaceship Weapon Group 1 EM health (used to repair the ship)}

    ActorValue Property SpaceshipWeaponGroup2EMHealth Mandatory Const Auto
    {Spaceship Weapon Group 1 EM health (used to repair the ship)}

    ActorValue Property SpaceshipWeaponGroup3EMHealth Mandatory Const Auto
    {Spaceship Weapon Group 1 EM health (used to repair the ship)}

    Perk[] Property UpgradePerks Mandatory Const Auto
    {Array of all the upgrade perks the player can use during this sequence that get removed after a round}

    Scene Property UC01_ShipSimQuest_400b_Upgrade_Manager Mandatory Const Auto
    {Upgrade scene. Triggered by all the upgrades, which then loop through each other and trigger the 
    appropriate ones to avoid concatinating. I am super up for better suggestions on how to handle this.}

    GlobalVariable Property UC01_ShipSim_SpawnWaitTimer Mandatory Const Auto
    {If we're spawning a large group of enemies, how long should we regularly wait?}

    Potion Property ShipRepairKit Mandatory Const Auto
    {Player gets one repair kit per tier}

    GlobalVariable Property UC01_RepairKitPerTier Mandatory Const Auto
    {Global used to turn on giving the player a reapir kit every Tier if we want that}

    GlobalVariable Property UC01_RestoreRepairKitsOnFail Mandatory Const Auto
    {Global var used to manage if we want to restore the player's repair kits after they fail}

    ActorValue[] Property ShipActorValues Mandatory Const Auto
    {Array of actor values that we repair on the ship when it's downed}

    Message Property UC01_ShipSim_ExitPilotSeat Mandatory Const Auto
    {Message to show for MKB urging the player to get out of their seat}

    Message Property UC01_ShipSim_ExitPilotSeat_Controller Mandatory Const Auto
    {Message to show for Gamepad urging the player to get out of their seat}

    GlobalVariable Property UC01_ShipSim_Debug_AllySpawned_Basic Mandatory Const Auto
    {Global var for the Ship Sim basic ally}

    GlobalVariable Property UC01_ShipSim_Debug_AllySpawned_Debug Mandatory Const Auto
    {Global var for the Ship Sim debug ally}

    GlobalVariable Property UC01_ShipSim_Debug_PerkApplied_Shields Mandatory Const Auto
    {Global var for the Ship Sim shields debug bonus}

    GlobalVariable Property UC01_ShipSim_Debug_PerkApplied_Weapons Mandatory Const Auto
    {Global var for the Ship Sim weapons debug bonus}
EndGroup

Group Aliases
    RefCollectionAlias Property EnemySpawns Mandatory Const Auto
    {Ref collection for the enemy spawns}

    ReferenceAlias Property ActiveEnemy Mandatory Const Auto
    {Alias to hold the active opponent for the player}

    RefCollectionAlias Property ActiveEnemies Mandatory Const Auto
    {RefColl to hold all the enemies for a given tier}

    ReferenceAlias Property ExitRock Mandatory Const Auto
    {The rock that manages the exit for the experience}

    ReferenceAlias Property SimShip Mandatory Const Auto
    {Alias for the player's ship}

    ReferenceAlias Property currEnemySpawn Auto Const Mandatory
    {Alias used to hold the spawn point of the current enemy}

    ReferenceAlias Property nextEnemySpawn Auto Const Mandatory
    {Conditional alias used to find spawn points an appropriate distance away from the player}

    RefCollectionAlias Property AlliedShips Mandatory Const Auto
    {Holding collection for any allied ships the player's calling in}

    ReferenceAlias Property ShipSimSeat Mandatory Const Auto
    {Alias for the Sim Ship's seat. Used to check if the player's still sitting in it}
EndGroup

Group Scenes
    Scene Property UC01_ShipSimulatorHelperQuest_300_NewTargetAvailable Mandatory Const Auto
    {New target available scene}

    Scene Property UC01_ShipSimulatorHelperQuest_300a_TargetDefeated Mandatory Const Auto
    {Enemy defeated scene}

    Scene Property UC01_ShipSimulatorHelperQuest_601_PrepareForNextOpponent Mandatory Const Auto
    {Scene to play after the player's reset the sequence}
EndGroup

Group Vars
    float Property CountdownTimer = 8.0 Const Auto
    {How long to wait after telling the player the next wave is coming to spawn them}

    float Property ResetTimerLength = 0.25 Const Auto
    {How long to wait until kicking off the reset sequence}

    float Property GetUpTimerLength = 14.0 Const Auto
    {How long to wait to check and tell the player to get out of their seat again}

    int Property WaitForNextEnemyObj = 250 Const Auto
    {Objective directing player to wait for the next enemy}

    int Property EngageEnemyObj = 300 Const Auto
    {Objective index directing the player to attack the new enemy}

    int Property PlayerPassedStage = 400 Const Auto
    {Stage to set if the player's successfully passed the sequence}

    int Property ProceedToPilotsSeatObjIndex = 100 Const Auto
    {Objective index for directing the player to sit in the pilot's seat}

    int Property TriggerResetObjIndex = 350 Const Auto
    {Objective index for directing the player to reset the sequence}
EndGroup

Group Properties
    bool Property bResetRequired Auto Conditional
    {Used to track if the quest is in need of reseting}

    bool Property bSequencePaused Auto Conditional
    {Used to track if the quest is paused (player hasn't both reset the sequence AND reentered the pilots seat)}

    bool Property bSequenceInited Auto Conditional
    {Used to track if the combat sequence has been started}

    int Property FailureCount Auto Conditional
    {Count how many times the player has failed. Open up new dialogue options if it's more than once}
EndGroup

;LOCAL VARS
int iTimerID = 1 const
int iUpgradeSceneTimerID = 2 const
int iResetTimerID = 3 const
bool bSequenceComplete
int iGetUpTimerID = 4 const

Event OnQuestStarted()
    ;Reset the enemy tier
    UC01_ShipSim_CurrentTier.SetValue(0)

    ;Save out how many enemies the player needs to survive to win
    UC01_ShipSim_TotalEnemyCount.SetValue(EnemyTierLists.Length)

    ;Reset all the debug globals
    ResetDebugGlobals()
EndEvent

Function ResetDebugGlobals()
    UC01_ShipSim_Debug_AllySpawned_Basic.SetValue(0)
    UC01_ShipSim_Debug_AllySpawned_Debug.SetValue(0)
    UC01_ShipSim_Debug_InifinitePerks.SetValue(0)
    UC01_ShipSim_Debug_PerkApplied_Shields.SetValue(0)
    UC01_ShipSim_Debug_PerkApplied_Weapons.SetValue(0)
EndFunction

Function ApplyShipPerk(Perk akPerkToApply)
    SimShip.GetShipRef().AddPerk(akPerkToApply)
EndFunction

Function BeginSequence()
    StartCooldownTimer()

    ;Unlock the Rock (allows the player to exit the sequence)
    bSequenceInited = true
    (ExitRock as UC01_RockAliasScript).StartSequence()
EndFunction

Function StartNewWave()
    if !bSequenceComplete
        SpawnEnemies()
    endif
EndFunction

Function SpawnEnemies()
    ;Prep the spawn points
    int h = 0
    int hCount = EnemySpawns.GetCount()
    ObjectReference[] TempSpawns = new ObjectReference[hCount]

    ;Copy all the spawns into a temp array
    while h < hCount
       TempSpawns[h] = EnemySpawns.GetAt(h)
       trace(self, "TempSpawn Entry index " + h + ": " + TempSpawns[h] + ". EnemySpawns index " + h + ": " + EnemySpawns.GetAt(h))

        h += 1
    endwhile

    ;Now, to the ships!
    int currWave = UC01_ShipSim_CurrentTier.GetValueInt()
    trace(self, "currWave: " + currWave)
    FormList currList = EnemyTierLists[currWave].BaseEnemyList
    int currDifficulty = EnemyTierLists[currWave].Difficulty
    trace(self, "Enemy Tier List: " + currList)
    trace(self, "Current Tier difficulty: " + currDifficulty)
    int i = 0
    int iCount = currList.GetSize()
    bool waitAfterEveryShipSpawn = iCount > 3
    float fWaitTimer = UC01_ShipSim_SpawnWaitTimer.GetValue()
    trace(self, currList + " size: " + iCount)

    while i < iCount
        ;Pick a spawn 
        int iRand = Utility.RandomInt(0, TempSpawns.Length - 1)

        ObjectReference EnemySpawn = TempSpawns[iRand]

        ;If we're all out of enemy spawns, refill the list and grab the first one in there
        if EnemySpawn == none
            h = 0
            while h < hCount
                TempSpawns.Add(EnemySpawns.GetAt(h))
                trace(self, "TempSpawn Entry index " + h + ": " + TempSpawns[h] + ". EnemySpawns index " + h + ": " + EnemySpawns.GetAt(h))

                h += 1
            endwhile

            ;Grab the first new spawn in the list
            EnemySpawn = TempSpawns[0]
            iRand = 0
        endif

        trace(self, "Enemy spawn: " + EnemySpawn)

        Form CurrentEnemy = currList.GetAt(i)
        SpaceshipReference NewEnemy = EnemySpawn.PlaceShipAtMe(CurrentEnemy, aiLevelMod = currDifficulty)
        trace(self, "Next enemy in the list is: " + CurrentEnemy) 
        trace(self, "Spawned object ref: " + NewEnemy)

        if CurrentEnemy != none && NewEnemy != none
            ActiveEnemies.AddRef(NewEnemy)
            TempSpawns.Remove(iRand)
        endif

        
        if waitAfterEveryShipSpawn
            Utility.Wait(fWaitTimer)
        elseif i != 0 && i % 2 == 0 ;Add a semi-regular wait to improve performance
            Utility.Wait(fWaitTimer)
        endif 

        i += 1
    endwhile

    if ActiveEnemies.GetCount() > 0

        UC01_ShipSimulatorHelperQuest_300_NewTargetAvailable.Start()
        SetObjectiveDisplayed(WaitForNextEnemyObj, false, false)

        ;Update the objective with the proper number of enemies
        UC01_ShipSim_CurrentWaveEnemyCountTotal.SetValue(iCount)
        UpdateCurrentInstanceGlobal(UC01_ShipSim_CurrentWaveEnemyCountTotal)
        SetObjectiveDisplayedAtTop(EngageEnemyObj)

        int j = 0
        int jCount = ActiveEnemies.GetCount()

        while j < jCount
            SpaceshipReference currEnemy = ActiveEnemies.GetAt(j) as SpaceshipReference
            currEnemy.EnableWithGravJump()
            trace(self, "NewEnemy is enabled: " + currEnemy.IsEnabled()) 
            j += 1
        endwhile                    
    else
        Game.Warning("ERROR: UC01 Sim Enemy ship list is empty or has non-ship objects in it. Quest can't progress!")
    endif
EndFunction

Function EnemyDefeated()
    trace(self, "Enemy defeated.")
    if !bSequenceComplete && !bSequencePaused

        SetObjectiveDisplayed(EngageEnemyObj, abdisplayed=False)
        UC01_ShipSim_CurrentTier.Mod(1)
        trace(self, "Enemy defeated. New Kill Count: " + UC01_ShipSim_CurrentTier.GetValueInt())

        if UC01_ShipSim_CurrentTier.GetValue() >= UC01_ShipSim_MinTierRequired.GetValue()
            SetStage(PlayerPassedStage)
        endif

        ;This scene is used to determine the player's progress. 
        ;Conditions in the second phase compare the Kill Count global to the total number of enemies
        ;And then either start the loop again or wrap things up
        UC01_ShipSimulatorHelperQuest_300a_TargetDefeated.Start()
    else
        trace(self, "Sequence is paused: " + bSequencePaused + " or completed: " + bSequenceComplete)
    endif
EndFunction

Function ClearShipUpgrades()
    if UC01_ShipSim_Debug_InifinitePerks. GetValue() < 1.0
        int i = 0
        int iLength = UpgradePerks.Length

        while i < iLength
            Perk currPerk = UpgradePerks[i]
            SpaceshipReference PlayerShip = SimShip.GetRef() as SpaceshipReference
            
            if PlayerShip.HasPerk(currPerk)
                PlayerShip.RemovePerk(currPerk)
            endif
            i += 1
        endwhile
    EndIf
EndFunction

Function PauseSequence()
    Trace(self, "Sequence paused!")
    bSequencePaused = true
    bResetRequired = true

    ClearShipUpgrades()

    CancelTimer(iTimerID)

    ;Pause the current enemies
    int i = 0
    int iCount = ActiveEnemies.GetCount()

    while i < iCount
        SpaceshipReference currRef = ActiveEnemies.GetAt(i) as SpaceshipReference
        currRef.SetUnconscious(true)
        currRef.SetGhost(true)
        i += 1
    endwhile

    SetObjectiveFailed(EngageEnemyObj)
EndFunction

Function DirectPlayerToReset()
    ;SetObjectiveCompleted(TriggerResetObjIndex, false)
    SetObjectiveDisplayed(TriggerResetObjIndex)
    ToggleGetUpTimer()
EndFunction

Function DirectPlayerToPilotsSeat()
    ToggleGetUpTimer(false)
    SetObjectiveDisplayed(TriggerResetObjIndex)
EndFunction

Function TriggerResetTimer()
    StartTimer(ResetTimerLength, iResetTimerID)
EndFunction

Function ResetSequence()
    Trace(self, "Reseting sequence!")
    bResetRequired = false
    FailureCount += 1

    ;Turn off the get up warning
    ToggleGetUpTimer(false)

    ;Remove the current enemies
    int i = ActiveEnemies.GetCount() - 1

    while i >= 0
        ObjectReference currObj = ActiveEnemies.GetAt(i)
        SpaceshipReference currRef = currObj as SpaceshipReference
        currRef.DisableWithGravJump()
        ActiveEnemies.RemoveRef(currObj)
        Trace(self, "Enemy " + i + ": currRef: " + currRef + ". currObj: " + currObj + " Disabled: " + currRef.IsDisabled())
        i -= 1
    endwhile

    Trace(self, "Player's kill value is now: " + UC01_ShipSim_CurrentTier.GetValue())

    RepairPlayerShip()

    ;Restore the player's repair kits so there's always three
    if UC01_RestoreRepairKitsOnFail.GetValueInt() > 0
        SpaceshipReference PlayerShip = SimShip.GetRef() as SpaceshipReference
        int iKitsToAdd = 3 - PlayerShip.GetItemCount(ShipRepairKit)

        if iKitsToAdd > 0
            PlayerShip.AddItem(ShipRepairKit, iKitsToAdd, abSilent = true)    
        endif
    endif

    UC01_ShipSim_CurrentWaveEnemyCountDefeated.SetValue(0)
    UpdateCurrentInstanceGlobal(UC01_ShipSim_CurrentWaveEnemyCountDefeated)
    SetObjectiveDisplayed(TriggerResetObjIndex, abdisplayed=False)
    ;SetObjectiveCompleted(ProceedToPilotsSeatObjIndex, false)
    SetObjectiveDisplayed(ProceedToPilotsSeatObjIndex)
EndFunction

Function ResumeCombatSequence()
    bSequencePaused = false
    Trace(self, "Resuming sequence and playing wrap-up scene.")

    UC01_ShipSimulatorHelperQuest_601_PrepareForNextOpponent.Start()
EndFunction

Function RepairPlayerShip()
    SpaceshipReference PlayerShip = SimShip.GetRef() as SpaceshipReference

    bool PlayRepairSound = CheckForRepairAudio()

    PlayerShip.RestoreValue(Health, PlayerShip.GetValue(Health))
    Trace(self, "Player's ship " + PlayerShip + " health is now: " + PlayerShip.GetValue(Health))

    PlayerShip.RestoreValue(WeaponGroup1SystemHealth, 1000000)
    PlayerShip.RestoreValue(WeaponGroup2SystemHealth, 1000000)
    PlayerShip.RestoreValue(WeaponGroup3SystemHealth, 1000000)
    PlayerShip.RestoreValue(EngineSystemHealth, 1000000)
    PlayerShip.RestoreValue(ShieldSystemHealth, 1000000)
    PlayerShip.RestoreValue(GravDriveSystemHealth, 1000000)
    PlayerShip.RestoreValue(ReactorSystemHealth, 1000000)
    PlayerShip.RestoreValue(ShipSystemEngineEMHealth, 1000000)
    PlayerShip.RestoreValue(ShipSystemGravDriveEMHealth, 1000000)
    PlayerShip.RestoreValue(ShipSystemShieldsEMHealth, 1000000)
    PlayerShip.RestoreValue(ShipSystemWeaponEMHealth, 1000000)
    PlayerShip.RestoreValue(SpaceshipWeaponGroup1EMHealth, 1000000)
    PlayerShip.RestoreValue(SpaceshipWeaponGroup2EMHealth, 1000000)
    PlayerShip.RestoreValue(SpaceshipWeaponGroup3EMHealth, 1000000)

    if UC01_RepairKitPerTier.GetValueInt() > 0 && PlayerShip.GetItemCount(ShipRepairKit) < 1
        PlayerShip.AddItem(ShipRepairKit, 1, abSilent = true)
    endif

    if PlayRepairSound
        ResetShipSoundEvent.PlayAndWait(SimShip.GetRef())
    endif
EndFunction

bool Function CheckForRepairAudio()
    int i = 0
    int iLength = ShipActorValues.Length
    bool bPlayRepairSound = false
    SpaceshipReference PlayerShip = SimShip.GetRef() as SpaceshipReference

    while i < iLength && !bPlayRepairSound
        ActorValue currValue = ShipActorValues[i]

        if PlayerShip.GetBaseValue(currValue) != PlayerShip.GetValue(currValue)
            bPlayRepairSound = true
        endif
        i += 1
    endwhile

    return bPlayRepairSound
EndFunction

Function SpawnPlayerAlly(Form akBaseObject)
    ;Spawn ally ship near player
    SpaceshipReference NewAlly = SimShip.GetRef().PlaceShipNearMe(akBaseObject)
    NewAlly.IgnoreFriendlyHits()
    AlliedShips.AddRef(NewAlly)
EndFunction

Function StartCooldownTimer(float fTimerOverride = -1.0)
    trace(self, "Cooldown timer started. Length: " + CountdownTimer + ". ID: " + iTimerID + ". fTimerOverride: " + fTimerOverride) 

    if fTimerOverride > -1.0
        StartTimer(fTimerOverride, iTimerID)
    else
        StartTimer(CountdownTimer, iTimerID)
    endif
    SetObjectiveDisplayed(ProceedToPilotsSeatObjIndex, AbDisplayed=False)
    SetObjectiveDisplayed(EngageEnemyObj, false, false)
    ;SetObjectiveCompleted(EngageEnemyObj, false)
    SetObjectiveDisplayedAtTop(WaitForNextEnemyObj)
    RepairPlayerShip()
EndFunction

Function ShutdownSimulation()
    bSequenceComplete = true
    CancelTimer(iTimerID)
    ActiveEnemy.GetActorRef().SetUnconscious()
EndFunction

Function TriggerUpgradeScene()
    StartTimer(0.5, iUpgradeSceneTimerID)
EndFunction

ObjectReference Function FindEnemySpawn()
    trace(self, "Finding new enemy spawn.") 
    ObjectReference NextSpawn
    ObjectReference MostRecentEnemySpawn = currEnemySpawn.GetRef()
    trace(self, "Most recent spawn: " + MostRecentEnemySpawn + ". Distance from player: " + MostRecentEnemySpawn.GetDistance(SimShip.GetRef())) 
    ObjectReference FallbackSpawn = EnemySpawns.GetAt(Utility.RandomInt(0, EnemySpawns.GetCount() - 1))
    trace(self, "Fallback spawn: " + FallbackSpawn + ". Distance from player: " + FallbackSpawn.GetDistance(SimShip.GetRef())) 

    nextEnemySpawn.RefillAlias()
    ObjectReference PossibleNextSpawn = nextEnemySpawn.GetRef()
    trace(self, "Refilled alias spawn: " + PossibleNextSpawn + ". Distance from player: " + PossibleNextSpawn.GetDistance(SimShip.GetRef())) 

    if nextEnemySpawn && PossibleNextSpawn != MostRecentEnemySpawn
        NextSpawn = PossibleNextSpawn
    else
        NextSpawn = FallbackSpawn
    endif
    
    trace(self, "Chosen spawn: " + NextSpawn + ". Distance from player: " + NextSpawn.GetDistance(SimShip.GetRef())) 
    return NextSpawn
EndFunction

Function SetEnemyScale(float fScaletoSet = 5.0)
    int i = 0
    int iCount = ActiveEnemies.GetCount()

    while i < iCount
        ObjectReference currRef = ActiveEnemies.GetAt(i)
        currRef.SetScale(fScaletoSet)

        i += 1
    endwhile
EndFunction

Event OnTimer(int aiTimerID)
    trace(self, "Timer complete with ID: " + aiTimerID)
    if !bSequenceComplete && aiTimerID == iTimerID
        trace(self, "Starting new wave from Timer cooldown.")
        StartNewWave()
    elseif aiTimerID == iUpgradeSceneTimerID
        UC01_ShipSimQuest_400b_Upgrade_Manager.Start()
    elseif aiTimerID == iResetTimerID
        ResetSequence()
    elseif aiTimerID == iGetUpTimerID
        CheckForGetUpMessage()
    endif
EndEvent

Function ToggleGetUpTimer(bool bStart = true)
    if bStart
        StartTimer(GetUpTimerLength, iGetUpTimerID)
    else
        CancelTimer(iGetUpTimerID)
    endif
EndFunction

Function CheckForGetUpMessage()
    if bSequencePaused 
        if Game.GetPlayer().GetFurnitureUsing() == ShipSimSeat.GetRef()
            if Game.UsingGamepad()
                UC01_ShipSim_ExitPilotSeat_Controller.ShowAsHelpMessage("", afDuration = 5, afInterval=0, aiMaxTimes=1)
            else
                UC01_ShipSim_ExitPilotSeat.ShowAsHelpMessage("", afDuration = 5, afInterval=0, aiMaxTimes=1)
            endIf
        endif

        ToggleGetUpTimer()
    endif
EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC01", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction