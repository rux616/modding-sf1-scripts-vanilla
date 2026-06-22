Scriptname TestKurtCreatureBehaviorScript extends Quest
{used to create creatures for testing CCT behaviors}

struct CreatureData
    RefCollectionAlias collectionAlias
    ActorBase creature
endStruct

CreatureData[] property CreatureArray auto Const
{ index should match message box index }

RefCollectionAlias property Creatures auto Const Mandatory
{ holds all created creatures }

ReferenceAlias property SpawnMarker auto const mandatory

Event OnQuestInit()
    debug.trace(self + " OnQuestInit")
EndEvent

Function CreateCreature(int creatureIndex)
    debug.trace(self + " CreateCreature " + creatureIndex)
    CreatureData theData = CreatureArray[creatureIndex]
    if theData
        Actor theCreature = SpawnMarker.GetRef().PlaceActorAtMe(theData.creature)
        theData.collectionAlias.AddRef(theCreature)
        Creatures.AddRef(theCreature)
    endif    
endFunction

function ResetCreatures()
    debug.trace(self + " ResetCreatures")
    ; disable and clear all aliases
    int i = 0
    while i < CreatureArray.Length
        CreatureArray[i].collectionAlias.RemoveAll()
        i += 1       
    endWhile

    Creatures.DisableAll()
    Creatures.RemoveAll()
endFunction


