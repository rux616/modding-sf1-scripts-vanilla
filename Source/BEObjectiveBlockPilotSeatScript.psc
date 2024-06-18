Scriptname BEObjectiveBlockPilotSeatScript extends ReferenceAlias
{For BEObjective, a variant of BEBlockPilotSeatScript to handle the alias being force-filled by a different quest.}

RefCollectionAlias property AllCrew Auto Const Mandatory
{BEObjective's AllCrew RefCollectionAlias.}

Message property BE_Objective_SecureShipMessage Auto Const Mandatory
{Message to display when the player tries to sit in the ship's pilot seat while the block is in place.}

;Local variables.
BEScript owningBEQuest
bool blockedUntilAllCrewDead
bool blockedUntilGravityRestored


Function BlockTakeover(BEScript ownerQuest)
	owningBEQuest = ownerQuest
	(GetRef() as PilotSeatFurnitureScript).SuppressDefaultActivationBlockedMessage(True)
	if (AllCrew.GetCount() > 0)
		blockedUntilAllCrewDead = True
		GetRef().BlockActivation(True, False)
		RegisterForCustomEvent(owningBEQuest, "BEAllCrewDead")
	EndIf
	if (owningBEQuest.ShipGravity < 1.0)
		blockedUntilGravityRestored = True 
		GetRef().BlockActivation(True, False)
	EndIf
EndFunction

Event BEScript.BEAllCrewDead(BEScript source, Var[] akArgs)
	blockedUntilAllCrewDead = False
EndEvent


Auto State Waiting
	Event OnActivate(ObjectReference akActivator)
		GotoState("Busy")
		if (blockedUntilAllCrewDead)
			BE_Objective_SecureShipMessage.Show()
		ElseIf (blockedUntilGravityRestored)
			blockedUntilGravityRestored = False
			owningBEQuest.SetShipGravity(1)
		EndIf
		if (blockedUntilAllCrewDead || blockedUntilGravityRestored)
			GotoState("Waiting")
		Else
			GotoState("Done")
			ObjectReference myRef = GetRef()
			myRef.BlockActivation(False, False)
			UnregisterForCustomEvent(owningBEQuest, "BEAllCrewDead")
			myRef.Activate(akActivator)
		EndIf
	EndEvent
EndState

State Busy
EndState

State Done
EndState