ScriptName DefaultCounterQuestRefColIncOnDeath extends RefCollectionAlias Default hidden
{Once this ALIAS dies it increments the counter on its Quest's DefaultCounterQuest script.}


Group Optional_Properties
	int property TargetRemainingCount = -1 Auto Const
	{After incrementing, if there are this many objects left in the collection or fewer, set RemainingStage.}

	int property RemainingStage = -1 Auto Const
	{After incrementing, if there are TargetRemainingCount objects left in the collection or fewer, set this stage.}

	Bool Property CheckForOnDyingInstead = FALSE Auto Const
	{DefaultL FALSE. If true the Increment will happen when this actor recieves the OnDying() event instead, which happens the instant the actor dies, unlike the
	OnDeath() event which can happen several seconds later.}

	bool property RemoveWhenDead = False Auto Const
	{Default: FALSE. After incrementing, remove the alias from the collection. If MaintainTargetValue=TRUE, also decrement the counter by 1. It essentially stays at 0 while the list shrinks.}

	bool property MaintainTargetValue = False Auto Const
	{Default: FALSE. Before incrementing, always set the counter's Target Value to match the length of this collection.}
EndGroup

Auto STATE WaitingForDeath
	Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
		if !CheckForOnDyingInstead
			Increment(akSenderRef)
		endif
	EndEvent

	Event OnDying(ObjectReference akSenderRef, ObjectReference akKiller)
		if CheckForOnDyingInstead
			Increment(akSenderRef)
		endif
	EndEvent

EndSTATE

Function Increment(ObjectReference akSenderRef)
	if (MaintainTargetValue)
		(GetOwningQuest() as DefaultCounterQuest).TargetValue = GetCount()
	EndIf
	(GetOwningQuest() as DefaultCounterQuest).Increment()
	if (RemoveWhenDead)
		Self.RemoveRef(akSenderRef)
		if (MaintainTargetValue)
			(GetOwningQuest() as DefaultCounterQuest).Decrement()
		EndIf
	EndIf
	if ((GetCount() <= TargetRemainingCount) && (RemainingStage > -1))
		GetOwningQuest().SetStage(RemainingStage)
	EndIf
EndFunction