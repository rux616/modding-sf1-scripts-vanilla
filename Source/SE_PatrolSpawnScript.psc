Scriptname SE_PatrolSpawnScript extends Quest
{Handles spawning ships for SE_Patrol encounters.  Deadcounts must be defined in SEScript and RECollectionAlias scripts for each group}

Formlist Property PatrollerShipList Auto Const Mandatory
{Formlists that contain all of the ships that can spawn for this encounter}

ReferenceAlias property Alias_PatrolMarker03 Auto Const Mandatory
{Path the ships will patrol at}

ReferenceAlias[] property PatrolShips auto const
{Array of individual ReferenceAliases that each ship will go into}

RefCollectionAlias property Alias_AttackersRC Auto Const Mandatory
{RefCol for holding the ships once spawned}

int property minShips = 2 Auto Const 
{The min and max number of ships that can spawn in the patrol}

int property offsetDistance = 300 Auto Const
{How far apart the ships spawn from each other within the group}

SEScript SEQuestScript
float percentMaxSpeed = 1.0

Event OnQuestInit()

        SEQuestScript = ((self as Quest) as SEScript)
        SpawnShips(PatrollerShipList, Alias_AttackersRC, Alias_PatrolMarker03,0)

EndEvent

Function SpawnShips(FormList akCurrentGroup, RefCollectionAlias akRefColToAddTo, ReferenceAlias akSpawnMarker, int DeadGroup)

        int i = 0
        int maxShips = PatrolShips.length
        int GroupSize = Utility.RandomInt(minShips,maxships)
        debug.trace(self + " SpawnShips: rolling between " + minShips + " and " + maxShips + " ships: spawning " + GroupSize)
        float[] offsets = new float[6]

        while i < GroupSize
            ObjectReference ADMarker = akSpawnMarker.GetRef()
            offsets[1] = i * offsetDistance
            SpaceshipReference newShip = ADMarker.PlaceShipAtMe(akCurrentGroup.GetAt(Utility.RandomInt(0,akCurrentGroup.GetSize()-1)),akOffsetValues=offsets,abPlayFx=false)
            newShip.SetForwardVelocity(percentMaxSpeed)
            akRefColToAddTo.AddRef(newShip)
            PatrolShips[i].ForceRefTo(newShip)
            i = i + 1
        EndWhile

        if (SEQuestScript)
                SEQuestScript.UpdateDeadCountGroupSize(DeadGroup, akRefColToAddTo.GetCount())
        EndIf
EndFunction