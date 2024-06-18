Scriptname LC088_VigilanceEnemyRefColScript extends RefCollectionAlias
{Essentially a variant of DefaultCollectionAliasOnDeath for LC088_Vigilance.
The quest script calls RemoveEnemyRef to remove robots and turrets the player has hacked or otherwise disabled
as part of a quest event, something not supported by the standard default script.}

int property StageToSet = -1 Auto Const Mandatory
{Stage to set when all enemies have been killed or otherwise removed from the collection.}

bool property UseOnDyingInstead = False Auto Const
{Default=False. Use the OnDying event, instead of OnDeath?}

Guard EnemyRefColGuard ProtectsFunctionLogic


Event OnDying(ObjectReference akSenderRef, ObjectReference akKiller)
	if (UseOnDyingInstead)
		RemoveEnemyRef(akSenderRef)
	EndIf
EndEvent

Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
	if (!UseOnDyingInstead)
		RemoveEnemyRef(akSenderRef)
	EndIf
EndEvent


Function RemoveEnemyRef(ObjectReference refToRemove)
	LockGuard(EnemyRefColGuard)
		RemoveRef(refToRemove)
		if (GetCount() == 0)
			GetOwningQuest().SetStage(StageToSet)
		EndIf
	EndLockGuard
EndFunction