Scriptname UC08_AB_ActiveAlliesCollScript extends RefCollectionAlias

int Property WrapUpStage = 900 Auto Const
{Stage denoting the sequence is done}

Faction Property UC08_PlayerAlignedNPCAllyFaction Mandatory Const Auto
{Faction applied to the player's allied critters}

Faction Property PlayerAllyFaction Mandatory Const Auto
{Faction applied to the player's allied critters}

Faction Property PlayerEnemyFaction Mandatory Const Auto
{Faction applied to the player's allied critters if the player kills any of them after the fight}

int Property iFreebieCount = 1 Const Auto
{How many free kills I'll let the player get before turning the NPCs on the player}

;Local var
bool bDoOnce
int iKillCount

Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
    RemoveRef(akSenderRef)

    ;This sequence is finished and the player has killed one of the thralls. Have the rest turn on them
    if !bDoOnce && akKiller == Game.GetPlayer() && GetOwningQuest().GetStageDone(WrapUpStage)

        if iKillCount < iFreebieCount
            iKillCount += 1
        else
            bDoOnce = true
            TurnAlliesToFoes()
        endif
    endif
EndEvent

Function TurnAlliesToFoes()
    int i = 0
    int iCount = GetCount()

    while i < iCount
        Actor currACT = GetAt(i) as Actor

        currACT.RemoveFromFaction(UC08_PlayerAlignedNPCAllyFaction)
        currACT.RemoveFromFaction(PlayerAllyFaction)
        currACT.AddToFaction(PlayerEnemyFaction)

        i += 1
    endwhile
EndFunction
