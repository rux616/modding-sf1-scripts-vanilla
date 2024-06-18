Scriptname MS02Script extends Quest Const

Faction Property CrimeFactionCrucible Auto Const Mandatory
Faction Property CrucibleFaction Auto Const Mandatory
Faction Property PlayerEnemyFaction Auto Const Mandatory
Faction Property PlayerFriendFaction Auto Const Mandatory
Faction Property MS02_PragmatistsFaction Auto Const Mandatory
Faction Property MS02_BelieversFaction Auto Const Mandatory
Faction Property MS02_RenegadesFaction Auto Const Mandatory
GlobalVariable Property MS02_CluesCollected Auto Const Mandatory

RefCollectionAlias Property Believers Mandatory Const Auto
RefCollectionAlias Property Neutral Mandatory Const Auto
RefCollectionAlias Property Pragmatists Mandatory Const Auto
RefCollectionAlias Property Renegades Mandatory Const Auto
RefCollectionAlias Property Everyone Mandatory Const Auto
ReferenceAlias Property Amanirenas Mandatory Const Auto
ReferenceAlias Property FDR Mandatory Const Auto
ReferenceAlias Property GenghisKhan Mandatory Const Auto
ReferenceAlias Property AdaLovelace Mandatory Const Auto
ReferenceAlias Property AmeliaEarhart Mandatory Const Auto
ReferenceAlias Property HH_Holmes Mandatory Const Auto

Int Property GenghisDeadStage01 = 1632 Const Auto
Int Property GenghisDeadStage02 = 1730 Const Auto
Int Property AmanirenasDeadStage01 = 1634 Const Auto
Int Property AmanirenasDeadStage02 = 1832 Const Auto
Int Property FDRDeadStage = 1834 Const Auto
Int Property FightingStoppedStage = 1871 Const Auto
Int Property StopOnHitCheckStage = 1873 Const Auto

int Function CountClues()

    int nCluesFound = 0

    ; Counting the clues - maybe make this a loop at some point?
    if ( GetStageDone(1001) )
        nCluesFound += 1
    endif
    if ( GetStageDone(1002) )
        nCluesFound += 1
    endif
    if ( GetStageDone(1003) )
        nCluesFound += 1
    endif
    if ( GetStageDone(1004) )
        nCluesFound += 1
    endif
    if ( GetStageDone(1005) )
        nCluesFound += 1
    endif
    if ( GetStageDone(1006) )
        nCluesFound += 1
    endif
    if ( GetStageDone(1007) )
        nCluesFound += 1
    endif

    ; Update the global and refresh the objective text
    MS02_CluesCollected.SetValue(nCluesFound)
    UpdateCurrentInstanceGlobal(MS02_CluesCollected)
    SetObjectiveDisplayed(1000, true, true)    

    ; If you found all 7 flag the quest
    if ( nCluesFound >= 7 )
        SetStage(1100)
    endif

EndFunction

Function GoHostile(Actor aTarg)
    aTarg.SetEssential(FALSE)
    aTarg.RemoveFromFaction(CrucibleFaction)
    aTarg.RemoveFromFaction(CrimeFactionCrucible)
    aTarg.RemoveFromFaction(PlayerFriendFaction)
    aTarg.AddToFaction(PlayerEnemyFaction)
    
    aTarg.StartCombat(Game.GetPlayer())
EndFunction

;Remove the base Crucible faction and Crime Faction from everyone in preparation for the civil war.
Function RemoveFactions()
    Actor myFDR = FDR.GetActorRef()
    Actor myAmani = Amanirenas.GetActorRef()
    Actor myGenghis = GenghisKhan.GetActorRef()
    Actor myAda = AdaLovelace.GetActorRef()
    Actor MyAmelia = AmeliaEarhart.GetActorRef()
    Actor myHolmes = HH_Holmes.GetActorRef()
    
    Neutral.RemoveFromFaction(CrimeFactionCrucible)
    Neutral.RemoveFromFaction(CrucibleFaction)

    myFDR.RemoveFromFaction(CrimeFactionCrucible)
    myFDR.RemoveFromFaction(CrucibleFaction)
    myAmani.RemoveFromFaction(CrimeFactionCrucible)
    myAmani.RemoveFromFaction(CrucibleFaction)
    myGenghis.RemoveFromFaction(CrimeFactionCrucible)
    myGenghis.RemoveFromFaction(CrucibleFaction)
    myAda.RemoveFromFaction(CrimeFactionCrucible)
    myAda.RemoveFromFaction(CrucibleFaction)
    myAmelia.RemoveFromFaction(CrimeFactionCrucible)
    myAmelia.RemoveFromFaction(CrucibleFaction)
    myHolmes.RemoveFromFaction(CrimeFactionCrucible)
    myHolmes.RemoveFromFaction(CrucibleFaction)

    Pragmatists.RemoveFromFaction(CrimeFactionCrucible)
    Pragmatists.RemoveFromFaction(CrucibleFaction)
    Believers.RemoveFromFaction(CrimeFactionCrucible)
    Believers.RemoveFromFaction(CrucibleFaction)
    Renegades.RemoveFromFaction(CrimeFactionCrucible)
    Renegades.RemoveFromFaction(CrucibleFaction)
EndFunction

;Add everyone to a Ref Collection so that we can put a package on them later to stop combat.
Function AddEveryone()
    Actor myFDR = FDR.GetActorRef()
    Actor myAmani = Amanirenas.GetActorRef()
    Actor MyGenghis = GenghisKhan.GetActorRef()
    Actor myAda = AdaLovelace.GetActorRef()
    Actor MyAmelia = AmeliaEarhart.GetActorRef()
    Actor myHolmes = HH_Holmes.GetActorRef()

    Everyone.AddRef(myFDR)
    Everyone.AddRef(myAmani)
    Everyone.AddRef(MyGenghis)
    Everyone.AddRef(myAda)
    Everyone.AddRef(MyAmelia)
    Everyone.AddRef(myHolmes)
    Everyone.AddRefCollection(Pragmatists)
    Everyone.AddRefCollection(Believers)
    Everyone.AddRefCollection(Renegades)
    Everyone.AddRefCollection(Neutral)
EndFunction

;Extra scripting to make sure there are no available avenues for combat lingering after the fight is resolved.
Function EveryoneStopFighting()
    Actor myFDR = FDR.GetActorRef()
    Actor myAmani = Amanirenas.GetActorRef()
    Actor MyGenghis = GenghisKhan.GetActorRef()

    AddEveryone()

    Everyone.RemoveFromFaction(PlayerEnemyFaction)

    ;This should flush their enemy list and make sure they're allies once again, to prevent lingering combat issues.
    MS02_RenegadesFaction.SetEnemy(MS02_PragmatistsFaction, TRUE, TRUE)
    MS02_RenegadesFaction.SetEnemy(MS02_BelieversFaction, TRUE, TRUE)

    MS02_PragmatistsFaction.SetEnemy(MS02_RenegadesFaction, TRUE, TRUE)
    MS02_PragmatistsFaction.SetEnemy(MS02_BelieversFaction, TRUE, TRUE)

    MS02_BelieversFaction.SetEnemy(MS02_PragmatistsFaction, TRUE, TRUE)
    MS02_BelieversFaction.SetEnemy(MS02_RenegadesFaction, TRUE, TRUE)

    MS02_RenegadesFaction.SetAlly(MS02_PragmatistsFaction)
    MS02_RenegadesFaction.SetAlly(MS02_BelieversFaction)

    MS02_PragmatistsFaction.SetAlly(MS02_RenegadesFaction)
    MS02_PragmatistsFaction.SetAlly(MS02_BelieversFaction)

    MS02_BelieversFaction.SetAlly(MS02_PragmatistsFaction)
    MS02_BelieversFaction.SetAlly(MS02_RenegadesFaction)

    Everyone.EvaluateAll()

    ;Remove the Faction members from their factions. We don't need them anymore, since the conflict is resolved and they can cause issues.
    myFDR.RemoveFromFaction(MS02_PragmatistsFaction)
    Pragmatists.RemoveFromFaction(MS02_PragmatistsFaction)
    
    myAmani.RemoveFromFaction(MS02_BelieversFaction)
    Believers.RemoveFromFaction(MS02_BelieversFaction)

    myGenghis.RemoveFromFaction(MS02_RenegadesFaction)
    Renegades.RemoveFromFaction(MS02_RenegadesFaction)

    Everyone.StopCombatAlarm()
    Everyone.StopCombat()

    ;Remove combat alarm from the player, just in case.
    Game.GetPlayer().StopCombatAlarm()

    SetStage(FightingStoppedStage)
    Everyone.EvaluateAll()
EndFunction

;Add the NPCs back to the base Crucible Faction and the Crime Faction so they can function normally, as expected.
Function ResetBaseFactions()
    SetStage(StopOnHitCheckStage)
    Actor myFDR = FDR.GetActorRef()
    Actor myAmani = Amanirenas.GetActorRef()
    Actor MyGenghis = GenghisKhan.GetActorRef()
    Actor myAda = AdaLovelace.GetActorRef()
    Actor MyAmelia = AmeliaEarhart.GetActorRef()
    Actor myHolmes = HH_Holmes.GetActorRef()
    
    myFDR.AddToFaction(CrimeFactionCrucible)
    myFDR.AddToFaction(CrucibleFaction)
    
    myAmani.AddToFaction(CrimeFactionCrucible)
    myAmani.AddToFaction(CrucibleFaction)

    myGenghis.AddToFaction(CrimeFactionCrucible)
    myGenghis.AddToFaction(CrucibleFaction)

    myAda.AddToFaction(CrimeFactionCrucible)
    myAda.AddToFaction(CrucibleFaction)
    
    myAmelia.AddToFaction(CrimeFactionCrucible)
    myAmelia.AddToFaction(CrucibleFaction)

    myHolmes.AddToFaction(CrimeFactionCrucible)
    myHolmes.AddToFaction(CrucibleFaction)
    
    Pragmatists.AddToFaction(CrimeFactionCrucible)
    Pragmatists.AddToFaction(CrucibleFaction)

    Believers.AddToFaction(CrimeFactionCrucible)
    Believers.AddToFaction(CrucibleFaction)
    
    Renegades.AddToFaction(CrimeFactionCrucible)
    Renegades.AddToFaction(CrucibleFaction)

    Neutral.AddToFaction(CrimeFactionCrucible)
    Neutral.AddToFaction(CrucibleFaction) 

    ;Get the NPCs out of their packages and Clear the Everyone RefCollectionAlias since we no longer need it.
    Everyone.EvaluateAll()
    Everyone.RemoveAll()
EndFunction