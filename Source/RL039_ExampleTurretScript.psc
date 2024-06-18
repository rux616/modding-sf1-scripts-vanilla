Scriptname RL039_ExampleTurretScript extends Actor

float property initialWaitTime auto const
float property randomWaitTimeMin auto const
float property randomWaitTimeMax auto const
float property randomFireTimeMin auto const
float property randomFireTimeMax auto const
int property hitsPerFire auto const
WwiseEvent property fireSoundEvent auto Const
Keyword property RL039_ExplosionMarker auto Const

bool attackBlob
ExpandingBiomassScript target_expandingBiomassScript
ObjectReference explosionMarker

Event OnCellLoad()
    ObjectReference target = GetLinkedRef()
    target_expandingBiomassScript = target as ExpandingBiomassScript

    explosionMarker = GetLinkedRef(RL039_ExplosionMarker)
    explosionMarker.Disable()

    Utility.Wait(initialWaitTime)

    attackBlob = true
    ShootAtTarget()
EndEvent

Event OnDeath(ObjectReference akKiller)
    attackBlob = false

    DisableNoWait()
EndEvent

function ShootAtTarget()
    while(attackBlob)
        float fireTime = Utility.RandomFloat(randomFireTimeMin, randomFireTimeMax)

        target_expandingBiomassScript.TakeHits(hitsPerFire)

        int fireSoundId = fireSoundEvent.Play(self)
        explosionMarker.Enable()

        Utility.Wait(fireTime)

        WwiseEvent.StopInstance(fireSoundId)
        explosionMarker.Disable()

        float waitTime = Utility.RandomFloat(randomWaitTimeMin, randomWaitTimeMax)

        Utility.Wait(waitTime)
    endWhile
endFunction

Event OnCombatStateChanged(ObjectReference akTarget, int aeCombatState)
    if(aeCombatState != 0)
        attackBlob = false
    elseif(!IsDead())
        attackBlob = true
        ShootAtTarget()
    endIf
EndEvent