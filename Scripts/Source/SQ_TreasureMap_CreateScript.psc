Scriptname SQ_TreasureMap_CreateScript extends ObjectReference
{ place this script on a container to create treasure map(s) in it on load
  NOTE: only 1 scripted container per location! }

Keyword Property SQ_TreasureMap_CreateMapStoryEvent Mandatory const Auto
{ story event to send to try to place treasure maps for sale by vendor }

int property TreasureMapType = -1 auto Const
{ specify which type of treasure map is allowed for this container:
    -1 = any
    0 = surface
    1 = resources
    2 = space
}

int property TreasureMapProximityRestriction = -1 auto Const
{ specify any "proximity" that isn't allowed for this vendor (sent with story event as Value2):
    -1 = no restriction
    0 = local area
    1 = same planet - if restricted, also prevent local area
    2 = same system
    3 = different system
}


GlobalVariable property SQ_TreasureMap_CreateAny Mandatory const Auto
{ holds value for story manager to create any type of treasure map (99) }

; variables
Quest[] myQuests

Event OnLoad()
    ; send story event to create treasure map in this container if no quests running yet
    if CheckQuests() == false
        debug.trace(self + " OnLoad - no treasure quests running, create treasure map(s)")
        int aiValue1 = TreasureMapType
        if aiValue1 < 0
            aiValue1 = SQ_TreasureMap_CreateAny.GetValueInt()
        endif
        int aiValue2 = TreasureMapProximityRestriction
        if aiValue2 < 0
            aiValue2 = SQ_TreasureMap_CreateAny.GetValueInt()
        endif

        myQuests = SQ_TreasureMap_CreateMapStoryEvent.SendStoryEventAndWait(akLoc=GetCurrentLocation(), akRef1=self, aiValue1=aiValue1, aiValue2=aiValue2)
    endif
EndEvent

bool function CheckQuests()
    debug.trace(self + " CheckQuests myQuests.Length=" + myQuests.Length)
    bool isQuestRunning = false

    int i = myQuests.Length-1
    while i >= 0
        Quest theQuest = myQuests[i]
        debug.trace(self + " theQuest.IsRunning=" + theQuest.IsRunning())
        if theQuest.IsRunning()
            isQuestRunning = true
        Else
            myQuests.Remove(i)
        EndIf
        i -= 1
    EndWhile

    return isQuestRunning
endFunction