Scriptname UC04_EmergencyLightRefScript extends ObjectReference Const

GlobalVariable Property UC04_AttackActive Mandatory Const Auto
{Global used to manage the attack state}

Event OnLoad()
    if UC04_AttackActive.GetValue() < 1
        PlayAnimation("TurnOffFull")
    endif
EndEvent