Scriptname SE_AttackDefendScript extends Quest
{Handles spawning ships for SE_Attack encounters.  Deadcounts must be defined in SEScript and RECollectionAlias scripts for each group}

RefCollectionAlias property Alias_AttackersRC Auto Const Mandatory
{RefcollectionAlias that holds all of the enemy ships}

RefCollectionAlias property Alias_DefendersRC Auto Const Mandatory
{RefcollectionAlias that holds all of the enemy ships}


ActorValue property Health Auto Const Mandatory

float percentMaxSpeed = 1.0

float percentMaxDamage = 0.7
float percentMinDamage = 0.1

int AttackersDeadGroup = 0
int DefendersDeadGroup = 1

SEScript SEQuestScript

Event OnQuestStarted()
        SEQuestScript = ((self as Quest) as SEScript)
        SetupShips(Alias_AttackersRC, AttackersDeadGroup)
        SetupShips(Alias_DefendersRC, DefendersDeadGroup)
EndEvent

Function SetupShips(RefCollectionAlias akCurrentRefCol, int DeadGroup)
        debug.trace(self + " SetupShips " + akCurrentRefCol + " group " + DeadGroup)
        int i=0
        int GroupSize = akCurrentRefCol.GetCount()
        int DeadCount = 0
        
        while i<GroupSize


                SpaceshipReference currentShip = akCurrentRefCol.GetAt(i) as SpaceshipReference
                        if (currentShip.IsAIEnabled())
                                currentShip.SetForwardVelocity(percentMaxSpeed)
                                float DamagePercent = Utility.RandomFloat(percentMinDamage,percentMaxDamage)
                                currentShip.DamageValue(Health, currentShip.GetValue(Health) * DamagePercent)
                                DeadCount += 1
                        EndIf
                i=i+1
        EndWhile

        if (SEQuestScript)
                debug.trace(self + "    updating group size to " + DeadCount)
                SEQuestScript.UpdateDeadCountGroupSize(DeadGroup, DeadCount)
        EndIf

EndFunction