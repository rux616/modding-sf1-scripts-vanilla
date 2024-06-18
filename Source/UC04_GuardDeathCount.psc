Scriptname UC04_GuardDeathCount extends RefCollectionAlias

GlobalVariable Property UC04_AttackActive Mandatory Const Auto
{Global used to track if the attack if still currently active}

Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
    if UC04_AttackActive.GetValue() >= 1
        (GetOwningQuest() as UC04_QuestScript).IncrementGuardDeathCount()
    endif
EndEvent