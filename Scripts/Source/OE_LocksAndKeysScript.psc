Scriptname OE_LocksAndKeysScript extends Quest

struct LockedObjectDatum
    ReferenceAlias LockedObjectAlias
    {the ReferenceAlias with the container or terminal that should be locked and needs a key/password}
    RefCollectionAlias PossibleKeySpawnMarkersAlias
    {Ref Collection holding all the possible Spawn Markers (we will need to test if they are LinkedRef after the quest starts and everything is persisting)}
    ReferenceAlias KeySpawnMarkerAlias
    {the ReferenceAlias with the marker where the key/password should be placed (will pick one of the refs in PossibleKeySpawnMarkersAlias that is linked Ref to the LockedObjectAlias ref)}
    ReferenceAlias KeyAlias
    {the ReferenceAlias that will have the created key/password forced into it}

    bool EnableIfPlaceKeyFails = true
    {if true (default), even if we can't place the key, still enable LockedObjectAlias.}

    bool LockIfPlaceKeyFails = true
    {if true (default), even if we can't place the key, still lock LockedObjectAlias.}
endstruct


LockedObjectDatum[] Property LockedObjectData Mandatory Const Auto



Event OnQuestStarted()
    Trace(self, "OnQuestStarted()")


    int i = 0
    While (i < LockedObjectData.length)
        LockedObjectDatum currentLockedObjectDatum = LockedObjectData[i]
        
        ObjectReference lockedRef = currentLockedObjectDatum.LockedObjectAlias.GetReference()
         ReferenceAlias keyAlias = currentLockedObjectDatum.KeyAlias

        ObjectReference spawnMarkerRef
        ObjectReference[] possibleKeySpawnMarkerRefs = currentLockedObjectDatum.PossibleKeySpawnMarkersAlias.GetArray()

        int j = 0
        While (spawnMarkerRef == None && j < possibleKeySpawnMarkerRefs.length)
            ObjectReference currentRef = possibleKeySpawnMarkerRefs[j]
            
            if currentRef.GetLinkedRef() == lockedRef
                spawnMarkerRef = currentRef
            endif

            j += 1
        EndWhile

        if spawnMarkerRef == None
            Warning(self, "OnQuestStarted() could not find LinkedRef spawnMarkerRef in possibleKeySpawnMarkerRefs:" + possibleKeySpawnMarkerRefs)
        endif

        Trace(self, "OnQuestStarted() currentLockedObjectDatum: " + currentLockedObjectDatum)
        Trace(self, "OnQuestStarted() lockedRef: " + lockedRef)
        Trace(self, "OnQuestStarted() spawnMarkerRef: " + spawnMarkerRef)

        ObjectReference keyRef

        if lockedRef && spawnMarkerRef && keyAlias
            currentLockedObjectDatum.KeySpawnMarkerAlias.ForceRefTo(spawnMarkerRef)
            keyRef = spawnMarkerRef.PlaceLockedRefKeyAtMe(lockedRef)
            
            Trace(self, "OnQuestStarted() keyRef: " + keyRef)
            
            keyAlias.ForceRefTo(keyRef)
        endif

        if keyRef || currentLockedObjectDatum.EnableIfPlaceKeyFails
            lockedRef.Enable()
        endif

        if keyRef || currentLockedObjectDatum.LockIfPlaceKeyFails
            lockedRef.Lock()
        endif

        i += 1
    EndWhile
EndEvent

Function DebugMoveToKey(int keyIndex = 0)
    Game.GetPlayer().MoveTo(LockedObjectData[keyIndex].KeyAlias.GetReference())
EndFunction

Function DebugMoveToLockedObject(int objectIndex = 0)
    Game.GetPlayer().MoveTo(LockedObjectData[objectIndex].LockedObjectAlias.GetReference())
EndFunction


;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "OverlayEncounters",  string SubLogName = "OE_LocksAndKeysScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "OverlayEncounters",  string SubLogName = "OE_LocksAndKeysScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction