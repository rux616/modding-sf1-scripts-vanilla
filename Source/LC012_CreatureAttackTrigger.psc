Scriptname LC012_CreatureAttackTrigger extends ObjectReference Const

Faction Property MQ202PetrovEnemyFaction Const Auto
{Faction to add to the creature}
Faction Property MQ202PetrovFaction Const Auto
{Faction to remove from the creature}
Keyword Property LinkCustom01 Const Auto
{Link to the chain of creatures from the door}
ActorValue Property LC012_CreatureAttack Const Auto
{The Actor value to set, used by the LC012_CreatureAttackPackage}

; When the door opens, get all the linked creatures, set their faction and set an AV on each.
Event OnOpen(ObjectReference akActionRef)
    ObjectReference[] LinkedRefs = GetLinkedRefChain(LinkCustom01)
    int i = 0
    while (i < LinkedRefs.length)
        LinkedRefs[i].SetValue(LC012_CreatureAttack, 1)
        (LinkedRefs[i] as Actor).RemoveFromFaction(MQ202PetrovFaction)
        (LinkedRefs[i] as Actor).AddToFaction(MQ202PetrovEnemyFaction)
        (LinkedRefs[i] as Actor).EvaluatePackage()
        i += 1
    endwhile
EndEvent