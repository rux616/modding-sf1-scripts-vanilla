Scriptname DefaultAliasSetGroupFaction extends ReferenceAlias default
{sets a group faction on the aliased actor}

Faction Property GroupFaction Mandatory Const Auto
{ group faction to set on the aliased actor }

Group Debug_Properties
    Bool Property ShowTraces = false Auto Const
    {(Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives.}
EndGroup

Event OnAliasInit()
	DefaultScriptFunctions.Trace(self, "OnAliasInit()", ShowTraces)
    SetGroupFaction()
EndEvent

Event OnAliasChanged(ObjectReference akObject, bool abRemove)
	DefaultScriptFunctions.Trace(self, "OnAliasChanged() akObject=" + akObject + " abRemove=" + abRemove, ShowTraces)
    if abRemove == false
        SetGroupFaction()
    endif
EndEvent

Function SetGroupFaction()
    Actor actorRef = GetActorReference()
    if actorRef
    	DefaultScriptFunctions.Trace(self, "SetGroupFaction() setting group faction " + GroupFaction + " on " + actorRef, ShowTraces)
        actorRef.SetGroupFaction(GroupFaction)
    endif
endFunction
