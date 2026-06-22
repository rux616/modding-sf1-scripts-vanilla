Scriptname TestBleedoutRecovery extends Actor
ActorValue Property Health Mandatory Const Auto

bool bDownNPC
Event OnLoad()

    ;Switch behaviors each time we load into this joint
    if !bDownNPC
        SetNoBleedoutRecovery(false)
        DamageValue(Health, 10000)
        bDownNPC = true
    else
        bDownNPC = false
    endif    
EndEvent