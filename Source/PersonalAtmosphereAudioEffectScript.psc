Scriptname PersonalAtmosphereAudioEffectScript extends ActiveMagicEffect
{Effect script for the Personal Atmosphere spell. Attaches an audio occlusion sphere to the target.}
;
;TODO - GEN-385173 - PlaceAtMe should be able to spawn packins. Starting a quest just to spawn a packin is hacky.

Quest property PersonalAtmosphereFXQuest Auto Const Mandatory
ReferenceAlias property PersonalAtmospherePackin Auto Const Mandatory
;Form property Audio_Occlusion_Artifact_Power_Personal_Atmosphere Auto Const Mandatory

ObjectReference occlusionPivot
ObjectReference occlusionMarker

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	Actor player = Game.GetPlayer()
	if (akTarget == player)
		PersonalAtmosphereFXQuest.Start()
		occlusionPivot = PersonalAtmospherePackin.GetRef()
		;occlusionPivot = Game.GetPlayer().PlaceAtMe(Audio_Occlusion_Artifact_Power_Personal_Atmosphere)
		occlusionMarker = occlusionPivot.GetLinkedRef()
		occlusionMarker.MoveTo(player)
		occlusionMarker.AttachTo(akTarget)
	EndIf
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	if (akTarget == Game.GetPlayer())
		PersonalAtmosphereFXQuest.Stop()
		occlusionPivot.Delete()
		occlusionMarker.Delete()
	EndIf
EndEvent