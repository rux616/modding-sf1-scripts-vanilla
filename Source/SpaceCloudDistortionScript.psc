Scriptname SpaceCloudDistortionScript extends SpaceCloudManagerScript
{Script for Space Distortion Clouds. Ships in these clouds are given a perk that reduces incoming damage.}

Group DistortionCloudProperties
	Perk property EffectPerk Auto Const
	{Perk to apply to ships within the cloud.}
EndGroup


Function ApplyCloudEffect(SpaceshipReference target, float currentTime)
	if (target.GetValue(UpdateTimestampValue) == 0)
		;Debug.Trace("--Adding perk to " + target)
		target.AddPerk(EffectPerk)
		if (target == PlayerShip.GetShipRef())
			Game.GetPlayer().AddPerk(EffectPerk)
		EndIf
	EndIf
EndFunction

Function RemoveCloudEffect(SpaceshipReference target)
	;Debug.Trace("--Removing perk from " + target)
	target.RemovePerk(EffectPerk)
	if (target == PlayerShip.GetShipRef())
		Game.GetPlayer().RemovePerk(EffectPerk)
	EndIf
EndFunction