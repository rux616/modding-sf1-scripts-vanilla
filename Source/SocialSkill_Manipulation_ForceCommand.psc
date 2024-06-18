Scriptname SocialSkill_Manipulation_ForceCommand extends ActiveMagicEffect

Faction Property CharmFaction Auto Const Mandatory

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
Actor myTarget = akTarget as Actor
	myTarget.AddToFaction(CharmFaction)
	myTarget.SetCanDoCommand(true)
	myTarget.SetCommandState(true)
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
Actor myTarget = akTarget as Actor
	myTarget.RemoveFromFaction(CharmFaction)
	myTarget.SetCanDoCommand(false)
	myTarget.SetCommandState(false)
EndEvent
