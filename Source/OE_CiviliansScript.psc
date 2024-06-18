Scriptname OE_CiviliansScript extends Quest

    SQ_ParentScript Property SQ_Parent auto const mandatory

    RefCollectionAlias Property MissionTerminals Mandatory Const Auto
    ReferenceAlias Property NPC_Leader Mandatory Const Auto
    ReferenceAlias Property NPC_Merchant Mandatory Const Auto
    Keyword Property OE_Civilians_MissionTerminalAvailable Mandatory Const Auto
    Keyword property VendorContainerKeyword01 auto const mandatory

    RefCollectionAlias Property LivingAreas Mandatory Const Auto
    Keyword Property OE_Civilians_LinkLivingArea Mandatory Const Auto
    
    RefCollectionAlias Property NPCs_All Mandatory Const Auto
    { put all NPCs into this collection after spawning }

    RefCollectionAlias[] Property NPC_Collections Mandatory Const Auto
    { array of all ref collections that NPCs are spawned into }

    ActorValue Property OE_Civilian_NightShift Mandatory Const Auto
    { autofill - use to tag "night shift" civilians for package schedule }

    ActorValue Property OE_Civilians_DIAL_LeaderGender Mandatory Const Auto
    { autofill - use to tag Merchant with leader's gender }
    
    int property SpawnStage = 10 auto Const
    { stage to set when ready to spawn NPCs }

    Keyword Property SQ_TreasureMap_CreateMapStoryEvent Mandatory const Auto
    { story event to send to try to place treasure maps for sale by vendor }

    GlobalVariable property SQ_TreasureMap_CreateAny Mandatory const Auto
    { holds value for story manager to create any type of treasure map (99) }

    group RQ_Settlement
        Keyword Property RQSettlementEvent Mandatory const Auto
        { story event to send to try to start a settlement RQ - send after NPCs are spawned }

        ReferenceAlias property Trigger auto const mandatory
        LocationAlias property OE_Location auto const mandatory

        Quest property settlementQuest auto hidden
        { if a settlement RQ starts, hang on to it here }
    endGroup

    group missionBoardData
        LocationRefType Property Mission_CargoDestinationLocRefType Mandatory Const Auto
        { check location for this ref type - if it has one, make it a cargo destination }

        Keyword Property Mission_CargoDestination Mandatory Const Auto
        { tag cargo destination locations when OE_Civilian starts }

        LocationRefType Property Mission_PassengerDestinationLocRefType Mandatory Const Auto
        { check location for this ref type - if it has one, make it a passenger destination }

        Keyword Property Mission_PassengerDestination Mandatory Const Auto
        { tag passenger destination locations when OE_Civilian starts }
    endGroup

    RETriggerScript triggerRef

Event OnQuestStarted()
    Trace(self, "OnQuestStarted() ")
    ; register for events
    RegisterForRemoteEvent(MissionTerminals, "OnAliasChanged")
    RegisterForRemoteEvent(NPC_Leader, "OnAliasChanged")
    RegisterForRemoteEvent(Trigger, "OnLoad")
    Trace(self, "Registered for OnAliasChanged events - set spawning stage")
	;register for spawn event
	DefaultGroupSpawnQuestScript DefaultGroupSpawnQuestScriptIns = (self as quest) as DefaultGroupSpawnQuestScript
	RegisterForCustomEvent(DefaultGroupSpawnQuestScriptIns, "SpawnGroupDoneEvent")

    ; trigger spawning from DefaultGroupSpawnQuestScript
    SetStage(SpawnStage)

    ; hang on to trigger ref
    triggerRef = Trigger.GetRef() as RETriggerScript
EndEvent

Event RefCollectionAlias.OnAliasChanged(RefCollectionAlias akSender, ObjectReference akObject, bool abRemove)
    Trace(self, "OnAliasChanged() akSender: " + akSender + ", akObject: " + akObject + ", abRemove: " + abRemove)
    CheckAndAddKeyword()
EndEvent

Event ReferenceAlias.OnAliasChanged(ReferenceAlias akSender, ObjectReference akObject, bool abRemove)
    Trace(self, "OnAliasChanged() akSender: " + akSender + ", akObject: " + akObject + ", abRemove: " + abRemove)
    CheckAndAddKeyword()
endEvent

Event ReferenceAlias.OnLoad(ReferenceAlias akSender)
    if akSender == Trigger && settlementQuest == NONE
        Trace(self, "Trigger OnLoad - try to start RQ")
        StartRQ()
    endif
EndEvent

Function CheckAndAddKeyword()
    Trace(self, "CheckAndAddKeyword()")
    ObjectReference LeaderRef = NPC_Leader.GetReference()

    Trace(self, "CheckAndAddKeyword() LeaderRef: " + LeaderRef + ",  MissionTerminals.GetCount(): " +  MissionTerminals.GetCount())

    if MissionTerminals.GetCount() > 0 && LeaderRef
        Trace(self, "CheckAndAddKeyword() adding OE_Civilians_MissionTerminalAvailable keyword to LeaderRef: " + LeaderRef)
        LeaderRef.AddKeyword(OE_Civilians_MissionTerminalAvailable)
    endif
EndFunction

function SetupSpawnedNPCs()
	Trace(self, "SetupSpawnedNPCs()")
    int i = 0
    while i < NPC_Collections.Length
        ; add NPCs to NPCs_All collection
        RefCollectionAlias SpawnCollection = NPC_Collections[i]
        Trace(self, " adding NPCs from " + SpawnCollection)
        NPCs_All.AddRefCollection(SpawnCollection)
        i += 1
    EndWhile

    ; set up living areas, "night shift" for package scheduling
    ObjectReference[] spawnArray = NPCs_All.GetArray()
    Trace(self, " total NPCs: " + spawnArray)
    i = 0
    bool nightShiftToggle = false
    int livingAreasIndex = 0

    while i < spawnArray.Length
        ObjectReference theNPC = spawnArray[i]
        Trace(self, " setting up NPC " + i + ": " + theNPC)
        ; tag every other NPC as night shift
        if nightShiftToggle
            Trace(self, "    NIGHT SHIFT")
            theNPC.SetValue(OE_Civilian_NightShift, 1.0)
        EndIf
        nightShiftToggle = !nightShiftToggle

        ; link to living areas (use them all)
        Trace(self, "    linking to living area " + livingAreasIndex)
        theNPC.SetLinkedRef(LivingAreas.GetAt(livingAreasIndex), OE_Civilians_LinkLivingArea, abPromoteParentRefr = false)
        livingAreasIndex += 1
        if livingAreasIndex >= LivingAreas.GetCount()
            livingAreasIndex = 0
        endif

        i += 1
    EndWhile

    ; tag leader gender on merchant for OE_Dialogue conditions
    Actor merchantRef = NPC_Merchant.GetActorRef()
    Actor LeaderRef = NPC_Leader.GetActorRef()

    if merchantRef && LeaderRef
        ActorBase leaderBase = LeaderRef.GetBaseObject() as ActorBase
        if leaderBase
            LeaderRef.SetValue(OE_Civilians_DIAL_LeaderGender, leaderBase.GetSex())
        endif
    endif
    
EndFunction

Event DefaultGroupSpawnQuestScript.SpawnGroupDoneEvent(DefaultGroupSpawnQuestScript akSender, var[] akArgs)
	Trace(self, "SpawnGroupDoneEvent() args: " + akArgs)
	DefaultGroupSpawnQuestScript DefaultGroupSpawnQuestScriptIns = (self as quest) as DefaultGroupSpawnQuestScript
    if DefaultGroupSpawnQuestScriptIns.GroupSetupCompleted
    	Trace(self, "SpawnGroupDoneEvent(): GroupSetupCompleted - try to start settlement RQ")

        Location myLocation = OE_Location.GetLocation()

        ; spawning is finished
        ; send RQ story event
        StartRQ()

        ; if there's a merchant, send treasure map vendor event
        Actor merchantRef = NPC_Merchant.GetActorRef()
        if merchantRef
            ; get container
            ObjectReference vendorContainer = merchantRef.GetLinkedRef(VendorContainerKeyword01)
            if vendorContainer
                SQ_TreasureMap_CreateMapStoryEvent.SendStoryEvent(akLoc=myLocation, akRef1=vendorContainer, aiValue1=SQ_TreasureMap_CreateAny.GetValueInt())
            endif
        endif

        ; setup spawned NPCs
        SetupSpawnedNPCs()

        ; tag with mission board data if this is visible on the starmap
        if SQ_Parent.VisibleOnStarmap(myLocation)     
            if myLocation.HasRefType(Mission_CargoDestinationLocRefType)
                ; tag as cargo destination
                myLocation.AddKeyword(Mission_CargoDestination)
                Trace(self, " tagged " + myLocation + " as cargo destination")
            endif
            if myLocation.HasRefType(Mission_PassengerDestinationLocRefType)
                ; tag as Passenger destination
                myLocation.AddKeyword(Mission_PassengerDestination)
                Trace(self, " tagged " + myLocation + " as passenger destination")
            endif
        endif
    Else
    	Trace(self, "SpawnGroupDoneEvent(): GroupSetupCompleted = false - wait for next event")
    endif
endEvent

function StartRQ()
    ; send RQ story event if we don't have an RQ yet
    if settlementQuest == NONE
        Quest[] settlementQuests = RQSettlementEvent.SendStoryEventAndWait(akLoc=OE_Location.GetLocation(), akRef1=Trigger.GetRef())
        if settlementQuests
            ; don't stop this quest until my settlement quest has shut down
            settlementQuest = settlementQuests[0]
        	Trace(self, "SpawnGroupDoneEvent(): started settlement quest " + settlementQuest)
            RegisterForRemoteEvent(settlementQuest, "OnQuestShutdown")
            OEScript myOE = ((self as Quest) as OEScript)
            if myOE
                myOE.StopQuestWhenPlayerLeavesPlanet = false
            endif

            ; set owner faction if any - need to wait for settlement quest to be fully started
            if settlementQuest is RQScript && myOE.OwningFaction
                Trace(self, "SpawnGroupDoneEvent(): setting owner faction on settlement quest: " + myOE.OwningFaction)
                int failsafeCount = 0
                while settlementQuest.IsStarting() && failsafeCount < 50
                    Trace(self, "SpawnGroupDoneEvent(): waiting for settlement quest to finish starting up ... " + failsafeCount)
                    failsafeCount += 1
                    Utility.Wait(1.0)
                endWhile
                (settlementQuest as RQScript).SetLocationOwnership(myOE.OwningFaction)
            endif
        endif
    endif
EndFunction

Event Quest.OnQuestShutdown(Quest akSource)
    ; OK to shut down now
    if akSource == settlementQuest
        UnregisterForRemoteEvent(settlementQuest, "OnQuestShutdown")
        settlementQuest = None
        REScript myRE = ((self as Quest) as REScript)
        if myRE
            myRE.StopQuestWhenPlayerLeavesPlanet = true
        endif
    endif
EndEvent

Event OnQuestShutdown()
    ; rearm trigger so OE_Civilians can start there next time
    if triggerRef
    	Trace(self, "OnQuestShutdown(): rearming trigger " + triggerRef)
        triggerRef.ReArmTrigger()
        triggerRef = NONE
    endif
EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "OverlayEncounters",  string SubLogName = "OE_CiviliansScript", bool bShowNormalTrace = true, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "OverlayEncounters",  string SubLogName = "OE_CiviliansScript", bool bShowNormalTrace = true, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction

