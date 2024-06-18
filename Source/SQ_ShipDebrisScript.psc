Scriptname SQ_ShipDebrisScript extends Quest

Keyword property SQ_ShipDebrisKeyword auto const mandatory
{ add keyword to orbit location when quest is running to block other quests from starting up here }

LocationAlias property OrbitLocation auto const mandatory
{ add keyword to this location }
Event OnQuestStarted()
    debug.trace(self + " OnQuestInit OrbitLocation=" + OrbitLocation.GetLocation())
    AddKeywordToLocation()
EndEvent

Event OnQuestShutdown()
    AddKeywordToLocation(false)
EndEvent

function AddKeywordToLocation(bool addKeyword = true)
    Location theOrbitLocation = OrbitLocation.GetLocation()

    if addKeyword
        theOrbitLocation.AddKeyword(SQ_ShipDebrisKeyword)
    Else
        theOrbitLocation.RemoveKeyword(SQ_ShipDebrisKeyword)
    EndIf
endFunction