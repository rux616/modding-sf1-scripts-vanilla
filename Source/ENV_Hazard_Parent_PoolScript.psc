Scriptname ENV_Hazard_Parent_PoolScript extends ENV_Hazard_ParentScript const
{see also: ENV_Hazard_ParentScript
Attach this script to the Packin's PrefabPackinPivotDummy reference.
And make sure all the refs in the packin are LinkedRef'd with keyword ENV_Link_PackinMember to the PrefabPackinPivotDummy (that this script is on)}

int ChanceAmbientFX = 50 const ; on a d100

Event OnLoad()
	;Not going to a "done" state so that this script can remain const
	;under the belief that is less costly than storing states for all pool hazards
	;And it's okay if ambient FX come and go when the pool loads
	Trace(self, "OnLoad()")
	RollAndSetAmbientEnableState(ChanceAmbientFX)
EndEvent

Function RollAndSetAmbientEnableState(int Chance)
	Trace(self, "RollAndSetAmbientEnableState() Chance: " + Chance)
	ObjectReference[] ambientFXRefs = GetPackinChildren()

	Trace(self, "RollAndSetAmbientEnableState() pre-keyword check ambientFXRefs: " + ambientFXRefs)

	ambientFXRefs = CommonArrayFunctions.GetReferencesWithMatchingKeyword(ambientFXRefs, ENV_FXType_Ambient)

	Trace(self, "RollAndSetAmbientEnableState() ambientFXRefs: " + ambientFXRefs)

	int i = 0
	While (i < ambientFXRefs.length)
		if Game.GetDieRollSuccess(Chance)
			Trace(self, "RollAndSetAmbientEnableState() success! enabling ambientFXRefs[i]: " + ambientFXRefs[i])
			ambientFXRefs[i].EnableNoWait()
		else
			Trace(self, "RollAndSetAmbientEnableState() fail! disabling ambientFXRefs[i]: " + ambientFXRefs[i])
			ambientFXRefs[i].DisableNoWait()
		endif
		
		i += 1
	EndWhile
EndFunction



Function DebugEnableAllAmbientFX() DebugOnly Private
	Trace(self, "DebugEnableAllAmbientFX()")
	RollAndSetAmbientEnableState(100)
EndFunction

Function DebugDisableAllAmbientFX() DebugOnly Private
	Trace(self, "DebugDisableAllAmbientFX()")
	RollAndSetAmbientEnableState(0)
EndFunction