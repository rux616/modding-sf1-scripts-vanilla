Scriptname SQ_PlayerClearLocationScript extends Quest

GlobalVariable property SQ_ClearedLocationCount auto const mandatory
{ count how many locations the player has cleared }

Keyword[] property KeywordsToCheck auto Const
{ dungeon will be counted if it has any of these keywords }

Event OnStoryExploredLocation(Location akOldLocation)
    debug.trace(self + " OnStoryExploredLocation " + akOldLocation)
    int i = 0
    bool locationCounts = false
    while i < KeywordsToCheck.Length && locationCounts == false
        locationCounts = akOldLocation.HasKeyword(KeywordsToCheck[i])
        i += 1
    EndWhile
    if locationCounts
        SQ_ClearedLocationCount.Mod(1.0)
        debug.trace(self + "     qualifying location: increment " + SQ_ClearedLocationCount + " to " + SQ_ClearedLocationCount.GetValueInt())
    endif
    Stop()
EndEvent