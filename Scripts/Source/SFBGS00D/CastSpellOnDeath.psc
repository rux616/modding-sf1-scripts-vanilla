Scriptname SFBGS00D:CastSpellOnDeath extends ActiveMagicEffect

Spell Property SpellToCastOnDeath Auto Const Mandatory

Event OnDeath(ObjectReference akKiller)
	Actor targetActor = GetTargetActor()
	If targetActor
		SpellToCastOnDeath.Cast(targetActor)
	EndIf
EndEvent