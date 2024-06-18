Scriptname UC04_KilledByPlayerScript extends ReferenceAlias

GlobalVariable Property UC04_AttackActive Mandatory Const Auto
{Global used to track if the attack if still currently active}

int Property StagetoSet = 730 Auto Const
{Stage to set if this NPC was killed by the player}

Event OnDeath(ObjectReference akKiller)
    if UC04_AttackActive.GetValue() >= 1
        if akKiller == Game.GetPlayer()
            GetOwningQuest().SetStage(StagetoSet)
        endif
    endif
EndEvent