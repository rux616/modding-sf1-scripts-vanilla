Scriptname SQ_TreasureMapQuestScript extends Quest

ReferenceAlias property TreasureMap auto const mandatory
{ used by SQ_TreasureMapScript to swap dummy map with the real map with text replacement created by this quest }

ReferenceAlias property Treasure auto const mandatory
{ Treasure ref passed in via event - needs to be moved to the treasure container on startup }

ReferenceAlias property TreasureMapOriginal auto const mandatory
{ passed in via event - used to get properties for creating treasure }

GlobalVariable property TreasureMapQuestCount auto const mandatory
{ global variable that matches this treasure map type, to keep track of how many quests are currently running }

int property ObjectiveID = 10 auto Const

int property ObjectiveStage = 100 auto Const

Event OnQuestStarted()
    ; increment quest count
    TreasureMapQuestCount.Mod(1)
    if CreateTreasure()
        SetObjectiveDisplayed(ObjectiveID)
    Else
        debug.trace(self + " WARNING: failed to create treasure - stopping quest", aiSeverity = 2)
        Game.GetPlayer().RemoveItem(TreasureMap.GetRef(), abSilent=true) ; remove garbage map from player's inventory
        Stop()
    endif
EndEvent

Event OnQuestShutdown()
    ; decrement quest count
    TreasureMapQuestCount.Mod(-1)
EndEvent

Event OnQuestRejected()
    HandleOnQuestRejected()    
EndEvent

Function HandleOnQuestRejected()
    SetObjectiveDisplayed(ObjectiveID, false)
    Stop()
EndFunction

bool Function CreateTreasure()
    debug.trace(self + " CreateTreasure - parent - should never see this")
    ; override on extending scripts
    return false
endFunction