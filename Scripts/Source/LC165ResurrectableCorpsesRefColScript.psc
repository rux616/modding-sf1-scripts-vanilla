Scriptname LC165ResurrectableCorpsesRefColScript extends RefCollectionAlias
{Actors in this Ref Collection are killed on first cell load, and set up to be resurrected during one of the LC165 Battles.}
;
;We have to use this script instead of just using StartsDead because actors set to StartsDead don't get
;an AI process and can't be resurrected.

bool property ShouldKillOnLoad = True Auto Const
bool property ShouldDisableAfterKill = False Auto Const

Faction property LC165StarbornEnemyFaction Auto Const Mandatory
ActorValue property Confidence Auto Const Mandatory
ActorValue property Aggression Auto Const Mandatory
ActorValue property LC165_ResurrectableCorpseKilledOnLoadValue Auto Const Mandatory
Keyword property DMP_Combat_FleeTo Auto Const Mandatory

int CONST_CorpseSettleDelay = 2 Const
int CONST_Confidence_Foolhardy = 4 Const
int CONST_Aggression_VeryAggressive = 2 Const


Event OnCellLoad(ObjectReference akSenderRef)
	if (ShouldKillOnLoad)
		Actor sourceActor = akSenderRef as Actor
		if (sourceActor != None)
			if (sourceActor.GetValue(LC165_ResurrectableCorpseKilledOnLoadValue) == 0)
				sourceActor.Kill()
				if (ShouldDisableAfterKill)
					sourceActor.DisableNoWait()
				EndIf
			EndIf
		EndIf
	EndIf
EndEvent

Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
	Actor sourceActor = akSenderRef as Actor
	if (sourceActor != None)
		sourceActor.RemoveFromAllFactions()
		sourceActor.AddToFaction(LC165StarbornEnemyFaction)
		sourceActor.SetValue(Confidence, CONST_Confidence_Foolhardy)
		sourceActor.SetValue(Aggression, CONST_Aggression_VeryAggressive)
		sourceActor.SetValue(LC165_ResurrectableCorpseKilledOnLoadValue, 1)
		sourceActor.SetLinkedRef(None, DMP_Combat_FleeTo)
	EndIf
EndEvent