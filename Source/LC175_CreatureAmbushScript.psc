Scriptname LC175_CreatureAmbushScript extends ReferenceAlias

ActorValue Property Aggression Auto Const Mandatory

Faction Property CaptiveFaction Auto Const Mandatory

Keyword Property LC175_CreatureLinkKeyword Auto Const Mandatory

Event OnOpen(ObjectReference akActionRef)
    ObjectReference[] CagedAnimalRef = GetRef().GetLinkedRefChain(LC175_CreatureLinkKeyword)
    int i = 0
    While i < CagedAnimalRef.Length
        (CagedAnimalRef[i] as Actor).RemoveFromFaction(CaptiveFaction)
        CagedAnimalRef[i].SetValue(Aggression, 1)
        i += 1
    endWhile
endEvent