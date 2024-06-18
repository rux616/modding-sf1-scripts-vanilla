Scriptname DefaultCollectionSetGroupFaction extends RefCollectionAlias default
{sets a group faction on the aliased actors}

Faction Property GroupFaction Mandatory Const Auto
{ group faction to set on the aliased actors }

Group Debug_Properties
    Bool Property ShowTraces = false Auto Const
    {(Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives.}
EndGroup

Event OnAliasInit()
	DefaultScriptFunctions.Trace(self, "OnAliasInit()", ShowTraces)
    SetGroupFactionOnAll()
EndEvent

Event OnAliasChanged(ObjectReference akObject, bool abRemove)
	DefaultScriptFunctions.Trace(self, "OnAliasChanged() akObject=" + akObject + " abRemove=" + abRemove, ShowTraces)
    if abRemove == false
        SetGroupFaction(akObject as Actor)
    endif
EndEvent

function SetGroupFactionOnAll()
    int i = 0
    int count = GetCount()
    while i < count
        Actor actorRef = GetActorAt(i)
        SetGroupFaction(actorRef)
        i += 1
    EndWhile
endFunction

Function SetGroupFaction(Actor actorToUpdate)
    if actorToUpdate
    	DefaultScriptFunctions.Trace(self, "SetGroupFaction() setting group faction " + GroupFaction + " on " + actorToUpdate, ShowTraces)
        actorToUpdate.SetGroupFaction(GroupFaction)
    endif
endFunction
