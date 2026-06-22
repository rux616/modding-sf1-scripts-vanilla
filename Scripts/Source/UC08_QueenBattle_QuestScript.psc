Scriptname UC08_QueenBattle_QuestScript extends Quest

Group Globals
    GlobalVariable Property UC08_AB_SwitchCount Mandatory Const Auto
    {Used to track the number of switches thrown}

    GlobalVariable Property UC08_AB_AnomalyLocked Mandatory Const Auto
    {Global used to lock the queen place for a little bit after each radar blast}    

    GlobalVariable Property UC08_AB_AnomalyTargetsThrallsThreshold Mandatory Const Auto
    {Global var tracking how many Thralls can still be around before the Queen can come
    after the player again}

    GlobalVariable Property UC08_AB_AnomalyLockCount Mandatory Const Auto
    {Global var tracking how many times we check for thralls before allow the Queen to go back to killing the player}

    GlobalVariable Property UC08_AB_BroadcastDamageMultipler Mandatory Const Auto
    {Global used to decide what health percentage should be removed from the anomaly per hit from the broadcast towers}
EndGroup

Group Scenes
    Scene Property UC08_QueenBattle_PercivalHad_FirstSwitch Auto Const Mandatory
    {Scene to play when the 1st switch is thrown}

    Scene Property UC08_QueenBattle_PercivalHad_SecondSwitch Auto Const Mandatory
    {Scene to play when the 2nd switch is thrown}

    Scene Property UC08_QueenBattle_PercivalHad_ThirdSwitch Auto Const Mandatory
    {Scene to play when the 3rd switch is thrown}
EndGroup

Group Spells
    Spell Property CCT_HitSpell_BigStagger Mandatory Const Auto
    {Spell used to stagger all the critters in the area when a radar blast goes off}

    Spell Property UC08_CrTerrormorphMindControl_Permanent Mandatory Const Auto
    {Spell used to denote which team this NPC is on. In this case, the Queen's}

    Spell Property UC08_CrTerrormorphMindControl_PlayerAlly Mandatory Const Auto
    {Spell used to denote which team this NPC is on. In this case, the player's}
EndGroup

Group Aliases
    RefCollectionAlias Property AllHostileThralls Mandatory Const Auto
    {Collection that contains all the enemy creatures involved in the fight}

    RefCollectionAlias Property ActiveHostiles Mandatory Const Auto
    {Collection that contains only the active enemy critters}

    RefCollectionAlias Property AllAlliedThralls Mandatory Const Auto
    {Collection that contains all the allied creatures involved in the fight}

    RefCollectionAlias Property ActiveAlliedThralls Mandatory Const Auto
    {Collection that contains just the living creatures allied with the player}

    RefCollectionAlias Property TowerAmbushes Mandatory Const Auto
    {Collection used to contain the hand-placed Terrormorph ambushes in this sequence}

    ReferenceAlias Property Queen Mandatory Const Auto
    {Alias for the morph queen}

    ReferenceAlias Property Hadrian Mandatory Const Auto
    {Ref alias for Hadrian}

    ReferenceAlias Property Kaiser Mandatory Const Auto
    {Ref alias for Kaiser}

    ReferenceAlias Property ActiveSignalMarker Mandatory Const Auto
    {Holding alias for the signal sound marker's that's currently active}

    ReferenceAlias[] Property SignalMarkers Mandatory Const Auto
    {Array of ref aliases for each of the Queen's "signal" sounds}

    ReferenceAlias Property ActiveQueenCombatTarget Mandatory Const Auto
    {Holding alias for the Queen's current combat target}

    RefCollectionAlias Property AcelesPlantThralls Mandatory Const Auto
    {Ref collection for all the thralls back at the Aceles plant}
EndGroup

Group Factions 
    Faction Property TerrormorphMindControlFaction Auto Const Mandatory
    {Faction used to denote which thralls are enemies and which aren't}

    Faction Property PlayerAllyFaction Mandatory Const Auto
    {Player ally faction. Applied to all allied NPCs as they spawn/swap states}

    Faction Property UC08_PlayerAlignedNPCAllyFaction Mandatory Const Auto
    {Faction applied to enemy thralls to get them fighting the Queen}

    Faction Property UC08_TerrormorphAnomalyFriendFaction Mandatory Const Auto
    {Faction removed from the player's ally critters to get them fighting the Queen}
EndGroup

Group Ints
    int Property iSignalIntroTimerLength = 10 Auto Const
    {How long we should wait before triggering the Signal gameplay intro scene}

    int Property iQueenLockTimerLength = 30 Auto Const
    {How long we should lock the Queen in place after a blast}

    int Property iSignalIntroStage = 155 Auto Const
    {Stage to set to trigger the Signal Intro scene}

    int Property iQueenDeadStage = 900 Auto Const
    {Stage to set to trigger the Signal Intro scene}
EndGroup

Group MiscObjs
    bool Property bBroadcastSceneActive Auto
    {Set true if there's a  broadcast scene actively playing at the moment}

    Explosion Property UC08_BroadcastBlastImpact Mandatory Const Auto
    {Explosion used to trigger the broadcast blast}

    WwiseEvent Property QST_UC08_Creature_Battle_Reveal_WEF Mandatory Const Auto
    {Sound played when allied creatures are revealed}

    ActorValue Property AmbushTriggered Mandatory Const Auto
    {Actor value used to trigger the NPC's ambush state}

    ActorValue Property Health Mandatory Const Auto
    {Health actor value}
EndGroup

;LOCAL VARS
int iSignalIntroTimerID = 1 const
int iQueenLockTimerID = 2 const
int iBroadcastSceneDelayTimerID = 3 const
int iQueenLockFailsafeCount = 0

Function TriggerRadarBlast(ObjectReference akBlastSource, RefCollectionAlias akMorphSupportCollection, RefCollectionAlias akThrallSupportCollection)
    if !GetStageDone(iQueenDeadStage)
        trace(self, "Radar blast triggered! Blast source: " + akBlastSource + ". Morph Collection: " + akMorphSupportCollection)
        ;Increment the call to the number of switches
        UC08_AB_SwitchCount.Mod(1)

        ;Trigger the blast explosion near the player
        ObjectReference PlayREF = Game.GetPlayer()
        PlayREF.PlaceAtMe(UC08_BroadcastBlastImpact)

        Actor QAct = Queen.GetActorRef() 
        if !QAct.IsDead()
            CCT_HitSpell_BigStagger.Cast(QAct)
            float fBlastDamage = QAct.GetBaseValue(Health) * UC08_AB_BroadcastDamageMultipler.GetValue()
            trace(self, "Starting lockdown process for the Queen. Damaging her to the tune of: " + fBlastDamage)
            QAct.DamageValue(Health, fBlastDamage)
            trace(self, "Updated Queen health: " + QAct.GetValue(Health))
        endif

        ;Have Percival tell the player what's going on
        PlayBroadcastScene()

        ;Update the signal marker
        UpdateSignalMarker()

        ;Get all the critters and stagger them
        StaggerCreatures()

        ;If this is the final switch, call in the support morphs for this group
        if !QAct.IsDead()
            int currSwitchCount = UC08_AB_SwitchCount.GetValueInt()
            if currSwitchCount == 1
                ActiveAlliedThralls.AddRefCollection(akThrallSupportCollection)
                QST_UC08_Creature_Battle_Reveal_WEF.Play(PlayREF)
                PrepAllyColl(akThrallSupportCollection)
            elseif currSwitchCount == 2
                ActiveAlliedThralls.AddRefCollection(akMorphSupportCollection)
                QST_UC08_Creature_Battle_Reveal_WEF.Play(PlayREF)
                PrepAllyColl(akMorphSupportCollection)
            else
                ActiveAlliedThralls.AddRefCollection(akMorphSupportCollection)
                ActiveAlliedThralls.AddRefCollection(akThrallSupportCollection)
                QST_UC08_Creature_Battle_Reveal_WEF.Play(PlayREF)
                PrepAllyColl(akMorphSupportCollection)
                PrepAllyColl(akThrallSupportCollection)
            endif
        endif
    endif

    ;Temporarily get the queen looking elsewhere
    LockQueen()
EndFunction

Function PlayBroadcastScene()
    if !Queen.GetActorRef().IsDead()
        int currVal = UC08_AB_SwitchCount.GetValueInt()

        ;Play the appropriate scene
        if currVal == 1
            UC08_QueenBattle_PercivalHad_FirstSwitch.Start()
        elseif currVal == 2
            UC08_QueenBattle_PercivalHad_SecondSwitch.Start()
        elseif currVal == 3
            UC08_QueenBattle_PercivalHad_SecondSwitch.Stop()
            UC08_QueenBattle_PercivalHad_ThirdSwitch.Start()
        endif
    endif
EndFunction

Function StaggerCreatures()
    ;Roll through all the bad guys thralls and turn an ever increasing portion of them to the player's side, while also staggering
    ;Get all the tower thralls in the Active Hostile list if they're alive and kicking
    trace(self, "Get tower ambushes added to the active list. ")
    int h = 0
    int hCount = AllHostileThralls.GetCount()

    while h < hCount
        Actor currACT = AllHostileThralls.GetAt(h) as Actor

        if currACT && currACT.IsEnabled() && currACT.GetValue(AmbushTriggered) >= 1.0
            ActiveHostiles.AddRef(currACT)
            trace(self, "Thrall: " + currACT + " in ActiveHostiles list: " + ActiveHostiles.Find(currACT))
        endif

        h += 1
    EndWhile

    trace(self, "Starting turning the hostiles. ")
    int i = ActiveHostiles.GetCount() - 1
    int k = 0
    int kCount = ActiveHostiles.GetCount()
    int iActiveCount = 0

    ;Loop through all the hostile NPCs and see which ones have actually been released
    while k < kCount
        Actor currACT = ActiveHostiles.GetAt(k) as Actor
        if currAct.IsEnabled() && currACT.GetValue(AmbushTriggered) >= 1.0
            iActiveCount += 1
        endif

        k += 1
    endwhile

    int j = 0
    int jTurncoats 
    int currVal = UC08_AB_SwitchCount.GetValueInt()

    ;If this is the last switch, grab all the baddies left. Otherwise, get just a portion of them
    if currVal == 3
        jTurncoats = ActiveHostiles.GetCount()
    else
        jTurncoats = Math.Floor(iActiveCount / (4 - UC08_AB_SwitchCount.GetValueInt()))
    endif
    trace(self, "i: " + i + ". k: " + k + ". iActiveCount: " + iActiveCount + ". Turncoat count: " + jTurncoats + ". AllHostiles: " + AllHostileThralls.GetCount())

    while i >= 0 && j <= jTurncoats
        Actor currACT = ActiveHostiles.GetAt(i) as Actor
        trace(self, "i: " + i + ". Checking NPC: " + currACT + " for turning. Enabled: " + currACT.IsEnabled() + ". Dead: " + currACT.IsDead() + ". Ambush val: " + currACT.GetValue(AmbushTriggered))

        if !currACT.IsDisabled() && !currACT.IsDead() && currACT.GetValue(AmbushTriggered) >= 1.0
            currACT.StopCombat()
            currACT.StopCombatAlarm()
            currACT.RemoveFromFaction(TerrormorphMindControlFaction)
            currACT.AddToFaction(PlayerAllyFaction)
            currACT.AddToFaction(UC08_PlayerAlignedNPCAllyFaction)
            currAct.IgnoreFriendlyHits()
            AllAlliedThralls.AddRef(currAct)
            currACT.RemoveSpell(UC08_CrTerrormorphMindControl_Permanent)
            AllHostileThralls.RemoveRef(currACT)
            ActiveHostiles.RemoveRef(currACT)

            if !currACT.IsDead()
                ActiveAlliedThralls.AddRef(currACT)
            endif

            currACT.StopCombat()
            currACT.StopCombatAlarm()

            currAct.EvaluatePackage()
            trace(self, "Formerly hostile NPC: " + currAct + " now on the player's side.")

            currACT.StartCombat(Queen.GetActorRef())

            j += 1
        endif

        i -= 1
    endwhile

    ;Roll through the player's thralls and hit' em with the stagger spell
    int a = 0
    int aCount = AllAlliedThralls.GetCount()
    trace(self, "Starting stagger.")

    while a < aCount
        Actor currAct = AllAlliedThralls.GetAt(a) as Actor

        if currAct.IsEnabled() && !currAct.IsDead() && currACT.GetValue(AmbushTriggered) >= 1.0
            ;CCT_HitSpell_BigStagger.Cast(currAct)
            trace(self, "Staggering allied NPC: " + currAct)
        endif

        a += 1
    endwhile
EndFunction

Function LockQueen()
    Actor QAct = Queen.GetActorRef() 
    ;Give the Queen a preferred combat target and have her keep looking for others 
    if !QAct.IsDead()
        Actor CombatTarget = FindNewQueenCombatTarget()
        if CombatTarget
            ActiveQueenCombatTarget.ForceRefTo(CombatTarget)
            QAct.StartCombat(CombatTarget, true)
            UC08_AB_AnomalyLocked.SetValue(1)
        endif

        ;Make sure we've removed all the dead NPCs from the ActiveAllies collection
        int i = ActiveAlliedThralls.GetCount() - 1

        while i >= 0
            Actor currACT = ActiveAlliedThralls.GetAt(i) as Actor

            if currACT.IsDead()
                ActiveAlliedThralls.RemoveRef(currACT)
            endif

            i -= 1
        endwhile

        StartTimer(iQueenLockTimerLength, iQueenLockTimerID)
    endif
EndFunction

Event Actor.OnDeath(Actor akSender, ObjectReference akKiller)
    if UC08_AB_AnomalyLocked.GetValue() >= 1.0
        UnregisterForRemoteEvent(akSender, "OnDeath")
        UnregisterForRemoteEvent(akSender, "OnEnterBleedout")
        Actor CombatTarget = FindNewQueenCombatTarget()

        if CombatTarget
            ActiveQueenCombatTarget.ForceRefTo(CombatTarget)
            Queen.GetActorRef().StartCombat(CombatTarget, true)
        endif
    endif
EndEvent

Event Actor.OnEnterBleedout(Actor akSender)  
    if UC08_AB_AnomalyLocked.GetValue() >= 1.0
        UnregisterForRemoteEvent(akSender, "OnDeath")
        UnregisterForRemoteEvent(akSender, "OnEnterBleedout")
        Actor CombatTarget = FindNewQueenCombatTarget()

        if CombatTarget
            ActiveQueenCombatTarget.ForceRefTo(CombatTarget)
            Queen.GetActorRef().StartCombat(CombatTarget, true)
        endif
    endif
EndEvent

Function StartSignalIntroTimer()
    StartTimer(iSignalIntroTimerLength, iSignalIntroTimerID)
EndFunction

Event OnTimer(int aiTimerID)
    if aiTimerID == iSignalIntroTimerID
        SetStage(iSignalIntroStage)
    elseif aiTimerID == iQueenLockTimerID

        ;Unlock the ability for the Queen to find the player as a preferred combat target
        UC08_AB_AnomalyLocked.SetValue(0)
        UnregisterForRemoteEvent(ActiveQueenCombatTarget.GetActorRef(), "OnDeath")
    endif
EndEvent

Function RemoveMindControlSpell()
    int i = 0
    int iCount = AllHostileThralls.GetCount()

    While (i < iCount)
        Actor currThrall = AllHostileThralls.GetAt(i) as Actor
        currThrall.RemoveSpell(UC08_CrTerrormorphMindControl_Permanent)
        CCT_HitSpell_BigStagger.Cast(currThrall)
        currThrall.AddToFaction(PlayerAllyFaction)
        currThrall.AddToFaction(UC08_PlayerAlignedNPCAllyFaction)
        currThrall.IgnoreFriendlyHits()
        currThrall.EvaluatePackage()
        currThrall.StopCombat()
        currThrall.StopCombatAlarm()

        i += 1
    EndWhile

    ;Have Kaiser and Hadrian stand down, too
    Hadrian.GetActorRef().StopCombat()
    Kaiser.GetActorRef().StopCombat()

    ;Get all the allied critters moving around
    int j = 0
    int jCount = AllAlliedThralls.GetCount()

    While (j < jCount)
        Actor currAct = AllAlliedThralls.GetAt(j) as Actor
        currAct.StopCombat()
        currAct.StopCombatAlarm()
        currAct.EvaluatePackage()

        j += 1
    EndWhile
EndFunction

Function KillActiveHostiles()
    ActiveHostiles.KillAll()
EndFunction

Function UpdateSignalMarker()
    ObjectReference currRef = ActiveSignalMarker.GetRef()
    currRef.Disable()
    ActiveSignalMarker.Clear()
    int currSwitchCount = UC08_AB_SwitchCount.GetValueInt() - 1

    ObjectReference nextSignal = SignalMarkers[currSwitchCount].GetRef()

    if nextSignal != none
        nextSignal.Enable()
        ActiveSignalMarker.ForceRefTo(nextSignal)
    endif
EndFunction

Actor Function FindNewQueenCombatTarget()
    Actor QAct = Queen.GetActorRef()
    int i = 0
    int iFailsafeCount = 5
    Actor NewTarget
    Actor SearchSource = QAct
    trace(self, "Evaluating Queen combat targets.")

    while i < iFailsafeCount && NewTarget == none
        Actor PossibleTarget = Game.FindRandomActorFromRef(SearchSource, 40.0)
        trace(self, "New possible combat target: " + PossibleTarget + " closest to source: " + SearchSource)

        if PossibleTarget.IsInFaction(UC08_PlayerAlignedNPCAllyFaction) && !PossibleTarget.IsDead()
            trace(self, "New target: " + PossibleTarget + " is enemy of Queen! Get at 'em!")
            NewTarget = PossibleTarget
        else
            trace(self, "Possible target is Queen ally. Eval next target.")
            SearchSource = PossibleTarget
        endif

        i += 1
    endwhile

    if NewTarget
        RegisterForRemoteEvent(NewTarget, "OnDeath")
        RegisterForRemoteEvent(NewTarget, "OnEnterBleedOut")    
    endif

    trace(self, "New combat target is: " + NewTarget)
    return NewTarget
EndFunction

Function PrepAllyColl(RefCollectionAlias akTargetColl)
    int i = 0
    int iCount = akTargetColl.GetCount()

    while i < iCount
        Actor currAct = akTargetColl.GetAt(i) as Actor

        currAct.RemoveFromFaction(UC08_TerrormorphAnomalyFriendFaction)
        currACT.AddToFaction(PlayerAllyFaction)
        currAct.AddToFaction(UC08_PlayerAlignedNPCAllyFaction)
        currAct.IgnoreFriendlyHits()
        currAct.SetValue(AmbushTriggered, 1.0)
        currAct.EvaluatePackage()

        i += 1
    endwhile

EndFunction

Function CleanUpPlantThralls()
    int i = 0
    int iCount = AcelesPlantThralls.GetCount()

    while i < iCount
        Actor currAct = AcelesPlantThralls.GetAt(i) as Actor

        if !currAct.IsDead()
            currAct.Disable()
        endif

        i += 1
    endwhile
EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC08", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction