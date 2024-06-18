Scriptname LC107HullBreachScript extends ObjectReference
{Script for the Hull Breach Packins in LC107.}
;
;To simplify editor placement, Hull Breaches begin in a breached state (Health=2).
;Their first damage state (Health=1) swaps their geometry to a marker, making them invisible.
;Their second damage state (Health=0) sets them back to a breached state.

Group AutofillProperties CollapsedOnRef
	LC107QuestScript property LC107 Auto Const Mandatory
	GlobalVariable property LC107VaultInstantBreachesCurrentGlobal Auto Const Mandatory
	Keyword property LC107_LinkHullBreach Auto Const Mandatory
	Keyword property LinkCustom01 Auto Const Mandatory
	Keyword property LinkCustom02 Auto Const Mandatory
EndGroup

int CONST_DamageObjectHealth = 1 Const


Auto State WaitingForInit
	Function InitHullBreach()
		GoToState("WaitingForBreach")
		;Set the breach to the intact state.
		ObjectReference hullBreach = GetLinkedRef(LC107_LinkHullBreach)
		hullBreach.Enable()
		hullBreach.DamageObject(CONST_DamageObjectHealth)
	EndFunction
EndState

State WaitingForBreach
	Function TriggerBreach(bool isQuestWaitingOnBreach=False)
		GoToState("Done")

		;Find our explosion source, if any.
		ObjectReference[] myLinkedRefs = GetRefsLinkedToMe()
		LC107HullBreachExplosionSourceScript myExplosionSource
		int i = 0
		While ((i < myLinkedRefs.Length) && (myExplosionSource == None))
			myExplosionSource = myLinkedRefs[i] as LC107HullBreachExplosionSourceScript
			if (myExplosionSource != None)
				myLinkedRefs.Remove(i)
			EndIf
			i = i + 1
		EndWhile

		;Trigger the explosion source, if any.
		if (myExplosionSource != None)
			myExplosionSource.TriggerBreach()
		EndIf

		;Enable the Hull Breach, VFX, and Hazard.
		ObjectReference myBreach = GetLinkedRef(LC107_LinkHullBreach)
		myBreach.DamageObject(CONST_DamageObjectHealth)
		ObjectReference myVFX = GetLinkedRef(LinkCustom01)
		myVFX.EnableNoWait()
		ObjectReference myHazard = GetLinkedRef(LinkCustom02)
		myHazard.EnableNoWait()

		;If the quest was waiting on this breach, we've done enough to allow it to proceed.
		if (isQuestWaitingOnBreach)
			LC107VaultInstantBreachesCurrentGlobal.Mod(1)
		EndIf

		;Then process any other linked refs.
		i = 0
		While (i < myLinkedRefs.Length)
			if (myLinkedRefs[i] != None)
				if ((myLinkedRefs[i] as LC107HullBreachExplosionSourceScript) != None)
					(myLinkedRefs[i] as LC107HullBreachExplosionSourceScript).TriggerBreach()
				ElseIf ((myLinkedRefs[i] as TrapPipeSpray) != None)
					(myLinkedRefs[i] as TrapPipeSpray).BreakPipe()
				Else
					myLinkedRefs[i].EnableNoWait()
				EndIf
			EndIf
			i = i + 1
		EndWhile
	EndFunction
EndState

State Done
EndState


Function InitHullBreach()
	GoToState("WaitingForBreach")
	;Set the breach to the intact state.
	ObjectReference hullBreach = GetLinkedRef(LC107_LinkHullBreach)
	hullBreach.EnableNoWait()
	hullBreach.DamageObject(CONST_DamageObjectHealth)
EndFunction

Function TriggerBreach(bool isQuestWaitingOnBreach=False)
	;If the quest was waiting on this breach, it's already triggered, so just return immediately.
	if (isQuestWaitingOnBreach)
		LC107VaultInstantBreachesCurrentGlobal.Mod(1)
	EndIf
EndFunction