Scriptname SQ_TreasureMapScript extends ObjectReference

Keyword property StoryManagerEventKeyword auto const mandatory

ObjectReference property SQ_TreasureMapHoldingCellMarker auto const mandatory
{ autofill }

Form property Treasure auto const mandatory
{ treasure that will be created and placed in quest location }

ObjectMod property TreasureMod auto Const
{ OPTIONAL: mod to add to treasure when created - obviously can only be used for weapons or armor (and only if the Treasure is one or the other)
    TEMP: this will be removed once this task is done: GEN-424645
 }

int property TreasureLocation = 0 auto Const
{ sent with story event as Value1: 
  0 = surface
  1 = resources
  2 = space
}

int property TreasureProximity = 2 auto Const
{ sent with story event as Value2:
    0 = local area (find location in current block pattern)
    1 = same planet
    2 = same system
    3 = different system
}

int property TreasureQuantityMin = 1 auto Const
{ this is used for cases where more than 1 item of treasure is needed (usually for resource maps) }

int property TreasureQuantityMax = 1 auto Const

bool property TreasureAllTheSameThing = true auto Const
{ true = additional treasure will use base object of first treasure created for all additional items - so it will be a uniform stack
  false = additional treaure will use whatever settings on the Treasure leveled list - so it could be a range of items}

SQ_TreasureMapQuestScript property myQuest auto hidden
{ filled when treasure quest is started }

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
    debug.trace(self + " OnContainerChanged akNewContainer=" + akNewContainer && " myQuest=" + myQuest)
    ; when player picks me up, need to start quest
    if myQuest == NONE
        if akNewContainer == Game.GetPlayer()
            StartTreasureQuest()
        endif
    endif
endEvent

function StartTreasureQuest()
    debug.trace(self + " StartTreasureQuest")
    ObjectReference treasureRef = SQ_TreasureMapHoldingCellMarker.PlaceAtMe(Treasure)
    SQ_TreasureMapScript treasureMapRef = SQ_TreasureMapHoldingCellMarker.PlaceAtMe(GetBaseObject()) as SQ_TreasureMapScript

    SQ_TreasureMapQuestScript[] myQuests = StoryManagerEventKeyword.SendStoryEventAndWait(akRef1 = treasureRef, akRef2 = treasureMapRef, aiValue1=TreasureLocation, aiValue2=TreasureProximity) as SQ_TreasureMapQuestScript[]

    if myQuests.Length > 0
        myQuest = myQuests[0]
        debug.trace(self + " StartTreasureQuest: started " + myQuest+ " IsStarting? " + myQuest.IsStarting())
        ; wait for quest to finish starting - SendStoryEventandWait returns before quests are completely started
        int failsafeCount = 0
        while myQuest.IsStarting() && failsafeCount < 100
            debug.trace(self + " waiting for quest to start... " + failsafeCount)
            utility.wait(0.1)
            failsafeCount += 1
        endWhile
        ; NOTE: we're doing this all here because the treasure map may not be a ref and therefore can't be passed to the quest

        ; silently remove myself from player, add "real" map
        ObjectReference player = Game.GetPlayer()
        player.RemoveItem(self, abSilent=true)
        player.AddItem(myQuest.TreasureMap.GetRef(), abSilent=true)
    Else
        debug.trace(self + " StartTreasureQuest: WARNING - failed to start treasure quest")
    endif
endFunction