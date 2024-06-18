Scriptname SpaceProjectileSpellEffectScript extends ActiveMagicEffect

Spell property LC088_DefensiveBatteryFireProjectileSpell Auto Const Mandatory
Spell property Debug_SpaceProjectileSpell Auto Const Mandatory
Activator property ProjectileSourceMarker01 Auto Const Mandatory
Static property XMarkerHeading Auto Const Mandatory
ActorValue property DebugHazardValue Auto Const Mandatory

ObjectReference hazardTarget
ObjectReference[] hitProjectileSources


Group HitProjectile
	float property CONST_HitProjectile_SpawnDelayMin = 1.0 Auto Const
	float property CONST_HitProjectile_SpawnDelayMax = 1.0 Auto Const

	int property CONST_HitProjectile_SpawnDistanceMin = 200 Auto Const
	int property CONST_HitProjectile_SpawnDistanceMax = 500 Auto Const

	float property CONST_HitProjectile_ForwardArcChanceForPlayer = 1.0 Auto Const
	int property CONST_HitProjectile_ForwardArcDegrees = 20 Auto Const

	int property CONST_HitProjectileSourcesCount = 10 Auto Const
EndGroup

int CONST_RandomSeedMin = -100000 Const
int CONST_RandomSeedMax = 100000 Const

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	Debug.Trace("SpaceProjectileSpellEffectScript Starts")
	hazardTarget = akTarget
	hitProjectileSources = new ObjectReference[CONST_HitProjectileSourcesCount]
	RegisterForRemoteEvent(akTarget as SpaceshipReference, "OnLocationChange")
	StartTimer(0)
EndEvent

Event SpaceshipReference.OnLocationChange(SpaceshipReference akSource, Location akOldLoc, Location akNewLoc)
	Debug.Trace("Location Changed")
	hazardTarget.RestoreValue(DebugHazardValue, 10000)
	hazardTarget.DispelSpell(Debug_SpaceProjectileSpell)
EndEvent

Event OnTimer(int timerID)
	float currentHazardValue = hazardTarget.GetValue(DebugHazardValue)
	Debug.Trace("Hazard Value: " + currentHazardValue)
	if (currentHazardValue < 0)
		hazardTarget.RestoreValue(DebugHazardValue, 10000)
		ObjectReference sourceToDelete = hitProjectileSources[0]
		if (sourceToDelete != None)
			sourceToDelete.Delete()
		EndIf
		hitProjectileSources.Remove(0)

		float[] offsets = new float[6]
		offsets[0] = 0;Utility.RandomFloat(CONST_HitProjectile_SpawnDistanceMin, CONST_HitProjectile_SpawnDistanceMax) * 0.4 * Utility.RandomFloat(-1, 1)
		offsets[1] = Utility.RandomFloat(CONST_HitProjectile_SpawnDistanceMin, CONST_HitProjectile_SpawnDistanceMax)
		offsets[2] = 0;Utility.RandomFloat(CONST_HitProjectile_SpawnDistanceMin, CONST_HitProjectile_SpawnDistanceMax) * 0.4 * Utility.RandomFloat(-1, 1)
		ObjectReference projectileSource = hazardTarget.PlaceAtMe(ProjectileSourceMarker01, akOffsetValues=offsets)

		LC088_DefensiveBatteryFireProjectileSpell.Cast(projectileSource, hazardTarget)
		hitProjectileSources.Add(projectileSource)

		StartTimer(Utility.RandomFloat(CONST_HitProjectile_SpawnDelayMin, CONST_HitProjectile_SpawnDelayMax))
	Else
		Debug.Trace("SpaceProjectileSpellEffectScript Ends")
		hazardTarget.DispelSpell(Debug_SpaceProjectileSpell)
	EndIf
EndEvent