Scriptname SQ_Airlock_QuestScript extends Quest ;can't be const, used as variable elsewhere
{handles adding/removing actors to a ref collection meaning they are "inside" an airlocked location.Achievements_TrackedStatsScript}

Group Autofill
    RefCollectionAlias Property Alias_InsideActors Mandatory Const Auto
EndGroup

Event OnQuestStarted()
    Trace(self, "OnInit() ")
EndEvent

bool registeredForPlayerEvent
bool registeredForOnPlayerTeleportEvent

;doing this so we can fix existing saves
Function RegisterForOnPlayerFollowerWarp()
    Trace(self, "RegisterForOnPlayerFollowerWarp() ")
    registeredForPlayerEvent = true

    RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerFollowerWarp")
EndFunction

Function RegisterForOnPlayerTeleport()
    Trace(self, "RegisterForOnPlayerTeleport() ")
    registeredForOnPlayerTeleportEvent = true
    
    RegisterForPlayerTeleport()
EndFunction

Event Actor.OnPlayerFollowerWarp(Actor akSender, ObjectReference akFollower)
    Trace(self, "OnPlayerFollowerWarp() akFollower: " + akFollower)

    ;check to see if the player is outside, if so assume they made it outside and might have warped past the airlock
    if Alias_InsideActors.Find(Game.GetPlayer()) < 0 ;not found
        Trace(self, "OnPlayerFollowerWarp() player not in Alias_InsideActors, will remove warping follower as well. akFollower: " + akFollower)
        Alias_InsideActors.RemoveRef(akFollower)
    endif
EndEvent

Event OnPlayerTeleport()
    ;remove player from Alias_InsideActors if they teleport
    Trace(self, "OnPlayerTeleport(): Player teleported.")
    RemoveActorFromInsideActorsAlias(Game.GetPlayer())
EndEvent

Function SetActorInside(Actor ActorToSet, bool SetInside = true)
    Trace(self, "SetActorInside() ActorToSet: " + ActorToSet + ", SetInside: " + SetInside)

    if SetInside
        Alias_InsideActors.AddRef(ActorToSet)
    else
        Alias_InsideActors.RemoveRef(ActorToSet)
    endif

    if registeredForPlayerEvent == false
        RegisterForOnPlayerFollowerWarp()
    endif

    if registeredForOnPlayerTeleportEvent == false
        RegisterForOnPlayerTeleport()
    endif

    ;REMINDER: actors are also removed from alias when they unload vis the SQ_AirlockAliasScript
EndFunction

Function SetActorsInside(Actor[] ActorsToSet, bool SetInside = true)
    int i = 0
    While (i < ActorsToSet.length)
        if ActorsToSet[i] ;could be none if casting array of refs to actors before passing in
            SetActorInside(ActorsToSet[i], SetInside)
        endif
        i += 1
    EndWhile
EndFunction

;called in Update4 patch quest to apply airlock fast travel fix
Function RemoveActorFromInsideActorsAlias(Actor akActor)
    Alias_InsideActors.RemoveRef(akActor)
EndFunction


;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "SQ_Airlock",  string SubLogName = "QuestScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "SQ_Airlock",  string SubLogName = "QuestScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction