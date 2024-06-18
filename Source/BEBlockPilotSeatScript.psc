Scriptname BEBlockPilotSeatScript extends ReferenceAlias
{Script placed on a ship's pilot seat. Blocks players from sitting in the seat and taking over the ship, optionally until all enemy crew are dead.}

Message property PilotSeatNotAuthorizedMessage Auto Const Mandatory
{Message to display when the player tries to sit in the ship's pilot seat while the block is in place.}

bool property ShouldAllowTakeoverWhenAllCrewDead = False Auto Const
{Default=False; BEScript Quests ONLY. Should we allow the player to sit in the pilot seat and take over the ship once all enemy crew are dead?}


bool activationUnblocked
;Have we unblocked activation because the crew was killed?

Event OnAliasInit()
	ObjectReference myRef = GetRef()
	myRef.BlockActivation(True, False)
	if (ShouldAllowTakeoverWhenAllCrewDead)
		BEScript owningBEQuest = GetOwningQuest() as BEScript
		if (owningBEQuest != None)
			RegisterForCustomEvent(GetOwningQuest() as BEScript, "BEAllCrewDead")
		EndIf
	EndIf
EndEvent

Event OnActivate(ObjectReference akActivator)
	if (activationUnblocked == false) && akActivator == Game.GetPlayer()
		; only need to show a message if PilotSeatFurnitureScript isn't handling activation
		if (GetRef() is PilotSeatFurnitureScript) == false
			PilotSeatNotAuthorizedMessage.Show()
		endif
	EndIf
EndEvent

Event BEScript.BEAllCrewDead(BEScript source, Var[] akArgs)
	ObjectReference myRef = GetRef()
	myRef.BlockActivation(False, False)
	activationUnblocked = True
EndEvent