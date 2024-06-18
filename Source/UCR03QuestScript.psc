Scriptname UCR03QuestScript extends Quest Conditional

Struct EnemyShipDatum
    SpaceshipBase ShipToSpawn
    {Leveled list we want to spawn}

    GlobalVariable MinEnemies
    {Minimum number of enemy ships to spawn}

    GlobalVariable MaxEnemies
    {Maximum number of enemy ships to spawn}

    int DialogueIndex = -1
    {This enemy type's dialogue index (if we end up writing custom dialogue per enemy type)}

    Faction BlockingFaction
    {If the player has this faction, don't chose this group}
EndStruct

EnemyShipDatum[] Property EnemyShipData Mandatory Auto
{Collection of data to determine which enemy ships we're spawning}

GlobalVariable Property UCR03_MostRecentEnemyType Mandatory Const Auto
{Global used to prevent the player from getting the same enemy type over and over}

GlobalVariable Property UCR03_SpawnDistanceOffset Mandatory Const Auto
{Global containing the standard offset for spawning in the enemies for this quest}

ReferenceAlias Property GeneralMarker Mandatory Const Auto
{Alias of the general marker in the space (around which all the NPCs will be spawned)}

RefCollectionAlias Property Enemies Mandatory Const Auto
{Holding collection for spawned opponents}

ReferenceAlias Property PatrolingEnemy Mandatory Const Auto
{Alias to give at least one of the ship a patrol}

ReferenceAlias Property PlayerShip Mandatory Const Auto
{Ref alias to the player's current ship}

ActorValue Property Aggression Mandatory Const Auto
{Aggression actor value (to ensure all these enemies are always out for blood)}

float Property DebugShipSpawnOffset = 250.0 Auto Const
{Offset used to make sure the spawned enemy ships don't spawn right on the player}

int Property EnemyIndex Auto
{Index to know which enemy type we've gotten}

int Property EnemyDialogueIndex = -1 Auto Conditional
{Index used to keep track of Tuala's custom lines}

int Property OffsetDistanceZ = 300 Auto Const
{How much we want to offset each ship from its peers as we spawn them in on the Z axis}

int Property OffsetDistanceY = 100 Auto Const
{How much we want to offset each ship from its peers as we spawn them in on the Y axis}

int Property OffsetRandomizer = 30 Const Auto
{Rnadomizer number added to the offsets so they don't all look so uniform}

;Local vars
int iFailSafeLoops = 20 Const

Function SelectEnemySeed()
    int iMostRecentEnemy = UCR03_MostRecentEnemyType.GetValueInt()
    int iRandomSeed
    int i = 0
    bool bFoundEnemy

    while !bFoundEnemy && i < iFailSafeLoops

        int iRandMax = EnemyShipData.Length - 1
        iRandomSeed = Utility.RandomInt(0, iRandMax)
        EnemyShipDatum currDatum = EnemyShipData[iRandomSeed]
        trace(self, "Selecting enemy type for this round. Current seed: " + iRandomSeed + " containing ships from: " + currDatum.ShipToSpawn + ". Last enemy index was: " + iMostRecentEnemy)

        ;Make sure the player's not a part of the faction we're trying to spawn as enemies
        ;This handling's here pretty much exclusively for the Crimson Fleet
        if currDatum.BlockingFaction != none && Game.GetPlayer().IsInFaction(currDatum.BlockingFaction)
            trace(self, "This group: " + currDatum.ShipToSpawn + " has a blocking faction and the player's in it: " + Game.GetPlayer().IsInFaction(currDatum.BlockingFaction) + ". Remove them as an option and start over.")
            EnemyShipData.Remove(iRandomSeed)
        else 
            if iRandomSeed != iMostRecentEnemy
                bFoundEnemy = true
                EnemyDialogueIndex = currDatum.DialogueIndex
                EnemyIndex = iRandomSeed
                trace(self, "Got one. EnemyIndex set to: " + EnemyIndex + ". EnemyDialogueIndex: " + EnemyDialogueIndex)
            endif
        endif

        i += 1
    endwhile
EndFunction

Function SpawnEnemies(bool bSpawnAtPlayer = false)
    trace(self, "Starting SpawnEnemies().")

    ;Grab the index we saved off at the start
    int iDatumIndex = EnemyIndex

    ;If the iDatumIndex is out of range, just set it to zero
    if iDatumIndex < 0 || iDatumIndex >= EnemyShipData.Length
        iDatumIndex = 0
    endif

    EnemyShipDatum currEnemy = EnemyShipData[iDatumIndex]
    trace(self, "Enemy for this round is: " + currEnemy.ShipToSpawn)

    int iNumEnemiesToSpawn = Utility.RandomInt(currEnemy.MinEnemies.GetValueInt(), currEnemy.MaxEnemies.GetValueInt())
    int i = 0

    trace(self, "Number of enemies to spawn: " + iNumEnemiesToSpawn + ". Min: " + currEnemy.MinEnemies.GetValueInt() + ". Max: " + currEnemy.MaxEnemies.GetValueInt())

    while i < iNumEnemiesToSpawn
        ObjectReference currSpawn = GeneralMarker.GetRef()
   		float[] offsets = new float[6]

        if !bSpawnAtPlayer
            
            ;Add some randomization to the X displacement
            int iRandY = Utility.RandomInt(0, 2)
            int iRandomizer = Utility.RandomInt(0, 2)
            int iRandomizerValue

            if iRandomizer < 1
                iRandomizerValue = OffsetRandomizer
            elseif iRandomizer == 1
                iRandomizerValue = OffsetRandomizer * -1
            else
                iRandomizerValue = 0
            endif

            if iRandY < 1
                offsets[0] = OffsetDistanceY + iRandomizerValue
            elseif iRandY == 1
                offsets[0] = (OffsetDistanceY * -1) + iRandomizerValue
            else
                offsets[0] = (OffsetDistanceY * (i + iNumEnemiesToSpawn)) + iRandomizerValue
            endif

            offsets[1] = UCR03_SpawnDistanceOffset.GetValueInt() + iRandomizer
        else
            offsets[1] = DebugShipSpawnOffset
            currSpawn = PlayerShip.GetRef()
        endif

        SpaceshipReference newShip = currSpawn.PlaceShipAtMe(currEnemy.ShipToSpawn, akOffsetValues = offsets)
        Enemies.AddRef(newShip)
        newShip.SetValue(Aggression, 2.0)

        ;trace(self, "Next spawnpoint is at index: " + iSpawnPointIndex)
        trace(self, "Spawnpoint is : " + currSpawn)
        trace(self, "New ship spawned is: " + newShip)

        if PatrolingEnemy.GetRef() == none
            PatrolingEnemy.ForceRefTo(newShip)
            trace(self, "Enemy added to Patroling Enemy alias: " + PatrolingEnemy.GetRef())
        endif

        i += 1
    endwhile
EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UCR03", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction