Scriptname UC04_QuestScript extends Quest

;Loc Vars
Guard CountGuard
Guard FollowerStateGuard

Group RefCollections
    RefCollectionAlias Property SpaceportGuards Mandatory Const Auto
    {Ref collection that contains all the guards in the spaceport}

    RefCollectionAlias Property CoweringNPCs Mandatory Const Auto
    {Collection of NPCs we want to stand around cowering during the sequence}

    RefCollectionAlias Property DisableNPCs Mandatory Const Auto
    {Collection of NPCs we want to disable during the sequence}

    RefCollectionAlias Property KneelingNPCs Mandatory Const Auto
    {Collection of NPCs we want to kneel in place during the sequence}

    RefCollectionAlias Property CaptiveCollection Mandatory Const Auto
    {Collection used to keep appropriate NPCs out of combat}

    RefCollectionAlias Property Shutters Mandatory Const Auto
    {Ref collection for the minister hall shutters}

    RefCollectionAlias Property PrimaryFloorManagers Mandatory Const Auto
    {Floor marker objects for the main MAST floors. These get turned off during the main attack sequence}

    RefCollectionAlias Property VanguardCourseFloorManagers Mandatory Const Auto
    {Floor marker objects for the Vanguard course floor. These get turned off during the main attack sequence}

    RefCollectionAlias Property VanguardRecruitmentFloorManagers Mandatory Const Auto
    {Floor marker objects for the Vanguard recruitment floor. These get turned off during the main attack sequence}

    RefCollectionAlias Property AttackPathFloorManagers Mandatory Const Auto
    {Floor marker objects for the that make up the path the player takes to the attack. Get turned off temporarily during the initial conversation and then turned back on during the attack}

    RefCollectionAlias Property EmergencyLights Mandatory Const Auto
    {Collection of the emergency lights around the spaceport tarmac}

    RefCollectionAlias Property SpaceportCrew Mandatory Const Auto
    {Collection that contains all the spawned crew (so we can turn 'em off during the attack)}

    RefCollectionAlias Property RunInGuards Mandatory Const Auto
    {Collection of the guards we want to start outside the spaceport fight and then run in later}

    RefCollectionAlias Property IACrew Mandatory Const Auto
    {All the workers in the Minister Hall floor}   

    RefCollectionAlias Property BackUpMinisterHallGuards Mandatory Const Auto
    {Ref coll for the guards that come in post-post-explosion scene}

    RefCollectionAlias Property LodgeDoorTriggers Mandatory Const Auto
    {SF-1629: Message triggers informing the player the Lodge is locked until the attack is complete}
EndGroup

Group Aliases
    ReferenceAlias Property FireTeamMarineCaptain Mandatory Const Auto
    {Alias for the fire team captain Marine}

    ReferenceAlias Property FireTeamMarine Mandatory Const Auto
    {Alias for the fire team assault Marine}

    ReferenceAlias Property Hadrian Mandatory Const Auto
    {Ref alias for Hadrian}

    ReferenceAlias Property Obj400Marker Mandatory Const Auto
    {Ref alias from which we're triggering the interior alarm}

    ReferenceAlias[] Property MinisterHallNPCs Mandatory Const Auto
    {Array of individual aliases for all the NPCs in the Minister Hall}
EndGroup

Group Stages
    int Property MindControlShoutPrereqStage = 600 Const Auto
    {Only have Hadrian shout about mind control if this stage has already been set}

    int Property MindControlShoutShutdownStage = 850 Const Auto
    {Only have Hadrian shout about mind control if this stage hasn't already been set}

    int Property StageToSetOnMindControl = 820 Auto Const
    {Stage to be set during the attack sequence if an NPC gets mind controlled}

    int Property StageToSetOnPlayerMindControl = 825 Auto Const
    {Stage to be set during the attack sequence if the player gets mind controlled}
EndGroup

Group MiscObjects
    InputEnableLayer Property AttackEnableLayer Auto
    {Var used to save out the enable layer used to manage the player's behavior during the attack}

    GlobalVariable Property UC04_SecurityDeathCount Mandatory Const Auto RequiresGuard(CountGuard)
    {Global used to track how many guards have died during the attack}

    GlobalVariable Property UC04_MarineFollowerState Mandatory Const Auto RequiresGuard(FollowerStateGuard)
    {Global used to track if the Marines are actively following the player or not}

    GlobalVariable Property UC04_HadrianWarningShoutDistance Auto Const Mandatory
    {Hadrian needs to be this close to a mind control event to comment on it}

    SQ_FollowersScript Property SQ_Followers Mandatory Const Auto
    {Followers script. Used to get Marines into the proper states}

    UCParentFactionQuestScript Property DialogueUCFactionAlwaysOn Mandatory Const Auto
    {Used to register for successful mind control attacks}

    WwiseEvent Property WEF_QST_UC04_Shutters_Close Mandatory Const Auto
    {Shutter closing sound}

    Topic Property UC04_UCSecurity_WitnessMindControl Mandatory Const Auto
    {Topic used to get UC Security to respond to the player's actions}

    FormList Property VoicesDialogueUCSecurity Mandatory Const Auto
    {Form list of UC security voicetypes}

    MagicEffect Property CrTerrormorphMindControlEffect_NPC Mandatory Const Auto
    {Magic effect used to check for mind controlled NPCs}

    Location Property CityNewAtlantisLocation Mandatory Const Auto
    {New Atlantis location object}

    Faction Property AvailableCrewFaction Mandatory Const Auto
    {Faction used to check if crew have been current hired by the player}

    WwiseEvent Property WwiseEvent_QST_UC04_NewAtlantis_Terrormorph_Alarm_Interior Mandatory Const Auto
    {Event used to trigger the alarm inside the cabinet chamber}

    Keyword Property UC04_Spaceport_RunIn_Start_LinkedRef Mandatory Const Auto
    {Keyword used to link the run-in guards to their starting points}
EndGroup

; Local vars
int iIntAlarmIndex

Function RegisterForMindControlEvents()
        RegisterForCustomEvent(DialogueUCFactionAlwaysOn, "MindControlTriggered")
EndFunction

Function UnregisterForMindControlEvents()
        UnRegisterForCustomEvent(DialogueUCFactionAlwaysOn, "MindControlTriggered")
EndFunction

Event UCParentFactionQuestScript.MindControlTriggered(UCParentFactionQuestScript akSender, Var[] kargs)
    trace(self, "UC04: Mind control event received. Sender: " + akSender + ". Vars: "+ kargs)
    if GetStageDone(MindControlShoutPrereqStage) && !GetStageDone(MindControlShoutShutdownStage)

        Actor ControlTarget = kargs[1] as Actor
    
        if ControlTarget
            if ControlTarget == Game.GetPlayer()

                if !GetStageDone(StageToSetOnPlayerMindControl) && Hadrian.GetRef().GetDistance(ControlTarget) <= UC04_HadrianWarningShoutDistance.GetValue()
                    SetStage(StageToSetOnPlayerMindControl)
                endif
            else
                Actor ShoutTarget = FindLivingGuard()

                if ShoutTarget
                    ShoutTarget.Say(UC04_UCSecurity_WitnessMindControl)
                endif
            endif
        endif
    endif
EndEvent

Actor Function FindLivingGuard()
    int i = 0
    int iCount = SpaceportGuards.GetCount()
    Actor TargetGuard

    while i < iCount && TargetGuard == none
        Actor currAct = SpaceportGuards.GetAt(i) as Actor

        if !currAct.IsDead() && !currAct.HasMagicEffect(CrTerrormorphMindControlEffect_NPC) && VoicesDialogueUCSecurity.HasForm(currAct.GetVoiceType())
            TargetGuard = currAct
        endif

        i += 1
    endwhile

    return TargetGuard
EndFunction

Function DEBUGTriggerMindControlShout()
    Actor ShoutTarget = FindLivingGuard()
    trace(self, "Shout Target: " + ShoutTarget)

    if ShoutTarget
        ShoutTarget.Say(UC04_UCSecurity_WitnessMindControl)
    endif
EndFunction

Function ToggleShutter(bool bOpen = true)

    if !bOpen
        WEF_QST_UC04_Shutters_Close.Play(Shutters.GetAt(0))
    endif

    int i = 0
    int iCount = Shutters.GetCount()

    while i < iCount
       ObjectReference currRef = Shutters.GetAt(i)

        if bOpen
            currRef.PlayAnimation("Open")
        else
            currRef.PlayAnimation("Close")
        endif
        i += 1

    endwhile
EndFunction

Function SetUpAttackState(bool bDisable = true)
    int i = 0
    int iCount = DisableNPCs.GetCount()

    while i < iCount
        ObjectReference currRef = DisableNPCs.GetAt(i)

        if bDisable
            currRef.Disable()
            trace(self, "Disabling NPC: " + currRef + ". IsDisabled? " + currRef.IsDisabled())
        else
            currRef.Enable()
            trace(self, "Enabling NPC: " + currRef + ". IsDisabled? " + currRef.IsDisabled())
        endif

        i += 1
    endwhile

    int j = 0
    int jCount = CoweringNPCs.GetCount()

    while j < jCount
        Actor currAct = CoweringNPCs.GetAt(j) as Actor

        currAct.EvaluatePackage()
        currAct.MoveToPackageLocation()

        if bDisable
            CaptiveCollection.AddRef(currAct)
            currAct.IgnoreFriendlyHits(true)
        else
            CaptiveCollection.RemoveRef(currAct)
            currAct.IgnoreFriendlyHits(false)
        endif

        j += 1
    endwhile

    int k = 0
    int kCount = KneelingNPCs.GetCount()

    while k < kCount
        Actor currAct = KneelingNPCs.GetAt(k) as Actor

        currAct.EvaluatePackage()

        if bDisable
            CaptiveCollection.AddRef(currAct)
            currAct.IgnoreFriendlyHits(true)
        else
            CaptiveCollection.RemoveRef(currAct)
            currAct.IgnoreFriendlyHits(false)
        endif

        k += 1
    endwhile

    int l = 0
    int lCount = SpaceportCrew.GetCount()

    while l < lCount
        Actor currACT = SpaceportCrew.GetAt(l) as Actor
        Location currLoc = currAct.GetCurrentLocation()

        if currACT.IsEnabled() && (currLoc == CityNewAtlantisLocation || currLoc.IsChild(CityNewAtlantisLocation)) && !currACT.IsInFaction(AvailableCrewFaction)
            currACT.Disable()
        endif
        ;There is no renenabling done for this set. JP assures me they'll reset automatically the next time the player pops by

        l += 1
    endwhile
EndFunction

Function ResetLivingSpaceportGuards()
    int i = 0
    int iCount = SpaceportGuards.GetCount()

    while i < iCount
        Actor currAct = SpaceportGuards.GetAt(i) as Actor

        ;Reset all the living guards, just in case
        ;Dead guards get reset from stage 1000 of DialogueUCFactionNewAtlantis
        ;Which is triggered through a timer on DialogueUCFactionAlwaysOn on UC04 is done
        if !currAct.IsDead()
            currAct.Reset()
        endif

        i += 1
    endwhile
EndFunction

;Called from scripts on the Marines and guard to count how many NPCs have died during this experience
Function IncrementGuardDeathCount()
    LockGuard CountGuard
        UC04_SecurityDeathCount.Mod(1)
    EndLockGuard
EndFunction

Function ToggleElevatorCollAccessibility(RefCollectionAlias akTargetColl, bool bMakeAccessible = false)
    int i = 0
    int iCount = akTargetColl.GetCount()

    while i < iCount
        LoadElevatorFloorScript myElev = akTargetColl.Getat(i) as LoadElevatorFloorScript
        myElev.SetAccessible(bMakeAccessible)

        trace(self, "Setting elevator: " + myElev + "to accessible: " + bMakeAccessible +"  Is it: " + myElev.IsAccessible())

        i += 1
    endwhile
EndFunction

Function LockAllDoors(RefCollectionAlias akTargetColl, bool bLock = false)
    int i = 0
    int iCount = akTargetColl.GetCount()

    while i < iCount
        ObjectReference myDoor = akTargetColl.Getat(i)

        if bLock
            myDoor.BlockActivation(true, true)
        else
            myDoor.BlockActivation(false, false)
        endif

        i += 1
    endwhile
EndFunction

Function ToggleMarineFollowers(int iForceState = -1)
    LockGuard FollowerStateGuard
    int iFollowerState = UC04_MarineFollowerState.GetValueInt()
    Actor CapACT = FireTeamMarineCaptain.GetActorRef()
    Actor MarACT = FireTeamMarine.GetActorRef()

    if iForceState >= 0
        ;We want to force the system on in these cases, so set the toggle to "on" for the moment so it'll get switched below
        if iForceState == 0
            iFollowerState = 1
        ;We want to force the system on in these cases, so set the toggle to "off" for the moment so it'll get switched below
        elseif iForceState == 1
            iFollowerState = 0
        endif
    endif

    if iFollowerState < 1
        UC04_MarineFollowerState.SetValue(1)
        SQ_Followers.SetRoleActive(CapACT, false)
        SQ_Followers.SetRoleActive(MarACT, false)
        SQ_Followers.CommandFollow(CapACT)
        SQ_Followers.CommandFollow(MarACT)
    else
        UC04_MarineFollowerState.SetValue(0)
        SQ_Followers.SetRoleInactive(CapACT, false)
        SQ_Followers.SetRoleInactive(MarACT, false)
    endif

    CapACT.EvaluatePackage()
    MarACT.EvaluatePackage()
    EndLockGuard    
EndFunction

;These NPCs all get turned back on later in the quest line via DialogueUCFactionNewAtlantis
Function DisableRefifDeadRefCollection()
    int i = 0 
    int iCount = SpaceportGuards.GetCount()

    while i < iCount
        Actor currAct = SpaceportGuards.GetAt(i) as Actor

        if currAct.IsDead()
            currAct.Disable()
        endif

        i += 1
    endwhile
EndFunction

Function ToggleEmergencyLights(bool bOn = true)
    int i = 0
    int iCount = EmergencyLights.GetCount()

    while i < iCount
        ObjectReference currRef = EmergencyLights.GetAt(i)

        if currRef.Is3DLoaded()

            if bOn
                currRef.PlayAnimation("Red")
                currRef.PlayAnimation("TurnOnPulse")
            else
                currRef.PlayAnimation("TurnOffFull")
            endif
        endif

        i += 1
    EndWhile
EndFunction

Function ToggleInteriorAlarm(bool bActivate = true)
    trace(self, "Toggling interior alarm on?: " + bActivate)
    if bActivate
        iIntAlarmIndex = WwiseEvent_QST_UC04_NewAtlantis_Terrormorph_Alarm_Interior.Play(Obj400Marker.GetRef())
        trace(self, "Activated! Saving off instance: " + iIntAlarmIndex)
    else
        trace(self, "Turning off interior alarm instance: " + iIntAlarmIndex)
        WwiseEvent.StopInstance(iIntAlarmIndex)
    endif
EndFunction

Function MoveRunInGuardsToStartLocations()
    int i = 0
    int iCount = RunInGuards.GetCount()

    while i < iCount
        Actor currAct = RunInGuards.GetAt(i) as Actor
        trace(self, "Run In Actor: " + currAct)
                
        if currAct
            ObjectReference StartRef = currAct.GetLinkedRef(UC04_Spaceport_RunIn_Start_LinkedRef)
            trace(self, "Run-IN starting destination: " + StartRef)

            if StartRef
                currAct.EvaluatePackage()
                currAct.MoveTo(StartRef)
                trace(self, "Distance between actor and run-in start: " + currAct.GetDistance(StartRef))
            endif
        endif

        i += 1
    endwhile

EndFunction

Function TogglePerkOnCollection(RefCollectionAlias akTargetColl, Perk akTargetPerk, bool bAdd = true)
    int i = 0
    int iCount = akTargetColl.GetCount()

    while i < iCount
        Actor currAct = akTargetColl.GetAt(i) as Actor

        if bAdd
            if !currAct.IsDead()
                currAct.AddPerk(akTargetPerk)
            endif
        else
            if currACT.HasPerk(akTargetPerk)
                currAct.RemovePerk(akTargetPerk)
            endif
        endif

        i += 1
    endwhile

EndFunction

Function ToggleMinistersHallNPCsGhosted(bool abSetGhosted = true)
    int i = 0
    int iLength = MinisterHallNPCs.Length

    while i < iLength
        Actor currAct = MinisterHallNPCs[i].GetActorRef()

        if currAct
            currAct.SetGhost(abSetGhosted)
        endif

        i += 1
    endwhile

    IACrew.SetGhost(abSetGhosted)
    BackUpMinisterHallGuards.SetGhost(abSetGhosted)
EndFunction
;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC04", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction