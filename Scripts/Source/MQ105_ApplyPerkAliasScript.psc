Scriptname MQ105_ApplyPerkAliasScript extends ReferenceAlias

Perk Property MQ105_CompanionStealth Mandatory Const Auto
{Perk to apply to the NPC}

Event OnAliasInit()
    Actor currAct = GetActorRef()
    if currAct != none
        currAct.AddPerk(MQ105_CompanionStealth)
    endif
EndEvent

Event OnAliasChanged(ObjectReference akObject, bool abRemove)
    Actor currAct = akObject as Actor
    if currAct != none
        if abRemove
            if currAct.HasPerk(MQ105_CompanionStealth)
                currAct.RemovePerk(MQ105_CompanionStealth)
            endif
        else
            if !currAct.HasPerk(MQ105_CompanionStealth)
                currAct.AddPerk(MQ105_CompanionStealth)
            endif
        endif
    endif
EndEvent

Event OnAliasShutdown()
    Actor currAct = GetActorRef()
    if currAct != none && currAct.HasPerk(MQ105_CompanionStealth)
        currAct.RemovePerk(MQ105_CompanionStealth)
    endif
EndEvent