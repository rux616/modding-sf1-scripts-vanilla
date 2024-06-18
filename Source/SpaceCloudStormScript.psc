Scriptname SpaceCloudStormScript extends SpaceCloudManagerScript
{Script for Space Storm Clouds. Ships in these clouds are periodically hit by SpaceStormBolt lightning spells.}

Group StormCloudProperties
	Spell[] property SpaceStormBolts Auto Const
	{Array of full-strength Space Storm Bolt spells to cast. Variants are used to vary the damage a bit.}

	Spell property SpaceStormBolt_DamageVariantHalf Auto Const
	{A half-strength Space Storm Bolt, cast when we roll to have two bolts strike in quick succession.}

	ActorValue property SpaceStormBoltTimestampValue Auto Const
	{Actor value used to timestamp when a bolt was last cast on each target.}

	float property SpaceStormBoltCastDelayMin = 1.0 Auto Const
	{Minimum delay between bolts.}

	float property SpaceStormBoltCastDelayMax = 2.0 Auto Const
	{Maximum delay between bolts.}

	float property SpaceStormBoltChanceTwoBolts = 0.2 Auto Const
	{Chance that, when we go to cast a SpaceStormBolt, we fire two half-strength bolts instead of a single full-strength bolt.}

	float property SpaceStormBoltTwoBoltDelayMin = 0.1 Auto Const
	{Minimum delay between double bolts.}

	float property SpaceStormBoltTwoBoltDelayMax = 0.5 Auto Const
	{Maximum delay between double bolts.}
EndGroup

Group Debug
	Spell property Debug_SpaceStormBolt_DamageVariantRatio Auto Const
	ActorValue property Debug_SpaceStormBolt_TestEffectRatioValue Auto Const
EndGroup	


Function ApplyCloudEffect(SpaceshipReference target, float currentTime)
	float effectSpellTimestamp = target.GetValue(SpaceStormBoltTimestampValue)
	if (effectSpellTimestamp == 0)
		Debug.Trace("--Setting initial spell timer for " + target)
		target.SetValue(SpaceStormBoltTimestampValue, currentTime + Utility.RandomFloat(0, SpaceStormBoltCastDelayMax))
	ElseIf ((currentTime > effectSpellTimestamp) || (currentTime < (effectSpellTimestamp - SpaceStormBoltCastDelayMax)))
		Debug.Trace("--Casting spell at " + target)
		if (target.GetValue(Debug_SpaceStormBolt_TestEffectRatioValue))
			Debug_SpaceStormBolt_DamageVariantRatio.Cast(target, target)
		ElseIf (Utility.RandomFloat(0,1) < SpaceStormBoltChanceTwoBolts)
			SpaceStormBolt_DamageVariantHalf.Cast(target, target)
			Utility.Wait(Utility.RandomFloat(SpaceStormBoltTwoBoltDelayMin, SpaceStormBoltTwoBoltDelayMax))
			SpaceStormBolt_DamageVariantHalf.Cast(target, target)
		Else
			Spell selectedBolt = SpaceStormBolts[Utility.RandomInt(0, SpaceStormBolts.Length-1)]
			selectedBolt.Cast(target, target)
		EndIf
		target.SetValue(SpaceStormBoltTimestampValue, currentTime + Utility.RandomFloat(SpaceStormBoltCastDelayMin, SpaceStormBoltCastDelayMax))
	Else
		Debug.Trace("--Not yet time to cast a spell at " + target)
	EndIf
EndFunction

Function RemoveCloudEffect(SpaceshipReference target)
	;Debug.Trace("--Zeroing out spell timer for " + target)
	target.SetValue(SpaceStormBoltTimestampValue, 0)
EndFunction