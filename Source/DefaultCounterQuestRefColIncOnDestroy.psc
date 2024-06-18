ScriptName DefaultCounterQuestRefColIncOnDestroy extends RefCollectionAlias Default hidden
{Once this ALIAS dies it increments the counter on its Quest's DefaultCounterQuest script.}

Group Required_Properties
	int Property RequiredDestructionStage = -1 Auto Const Mandatory

	int property TargetRemainingCount = -1 Auto Const Mandatory
	{After incrementing, if there are this many objects left in the collection or fewer, set RemainingStage.}

	int property RemainingStage = -1 Auto Const Mandatory
	{After incrementing, if there are TargetRemainingCount objects left in the collection or fewer, set this stage.}
EndGroup

Group Optional_Properties
	Bool Property CheckForDestructionStageInstead = FALSE Auto Const
	{If true the Increment will happen when this actor recieves the OnDying() event instead, which happens the instant the actor dies, unlike the
	OnDeath() event which can happen several seconds later.}

	bool property MaintainTargetValue = False Auto Const
	{Default: FALSE. Before incrementing, always set the counter's Target Value to match the length of this collection.}

	bool property RemoveWhenDestroyed = False Auto Const
	{Default: FALSE. After incrementing, remove the alias from the collection. If MaintainTargetValue=TRUE, also decrement the counter by 1. It essentially stays at 0 while the list shrinks.}
EndGroup

Auto STATE WaitingForDeath
	;Event OnDestroyed()
	;	if !CheckForDestructionStageInstead
	;		Increment(akSenderRef)
	;	endif
	;EndEvent

	Event OnDestructionStageChanged(ObjectReference akSenderRef, int aiOldStage, int aiCurrentStage)
	    if CheckForDestructionStageInstead
	    	if RequiredDestructionStage == aiCurrentStage || RequiredDestructionStage == -1
	    		Increment(akSenderRef)
	    	endif
	    endif
	EndEvent
	
EndSTATE

Function Increment(ObjectReference akSenderRef)
	if (MaintainTargetValue)
		(GetOwningQuest() as DefaultCounterQuest).TargetValue = GetCount()
	EndIf
	(GetOwningQuest() as DefaultCounterQuest).Increment()
	if (RemoveWhenDestroyed)
		Self.RemoveRef(akSenderRef)
		if (MaintainTargetValue)
			(GetOwningQuest() as DefaultCounterQuest).Decrement()
		EndIf
	EndIf
	if ((GetCount() <= TargetRemainingCount) && (RemainingStage > -1))
		GetOwningQuest().SetStage(RemainingStage)
	EndIf
EndFunction