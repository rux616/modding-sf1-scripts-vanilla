Scriptname SFBGS003_SQ_Bounty_QuestScript extends Quest
{This script handles bounty requests for MB and any other Quest that utilizes the Bounty system. 
Autofill all properties first.}

Group BountyTarget_Settings
    ReferenceAlias property BountyTargetAlias Auto Const Mandatory
    {Required. Primary Bounty Target Actor. This is the Actor that is going to be arrested or killed.}
    ActorValue Property Aggression Auto Const Mandatory
    {Autofill. NPC Aggression Actor Value. Used to make the Bounty Target aggressive.}
EndGroup

Group Bounty_Functionality
    ReferenceAlias property GuardAlias auto const 
    {Optional - Nearby guard actor, used for arrest behavior.}
    ReferenceAlias property ArrestFurniture Auto Const
    {Autofill. ReferenceAlias for the furniture used by the SQ_Captive system.}
    Furniture Property NPCSitFloorCaptive_Kneeling Auto Const hidden 
    {Autofill. If ArrestFurniture is blank, use this backup form. }
    Keyword Property SFBGS003_SQ_BGS003_Actor_Surrendered_Keyword Auto Const hidden
    {Autofill. Applied to the Bounty Target to force package evaluation.}
    Keyword Property SFBGS003_SQ_BGS003_Actor_Flee_Keyword Auto Const hidden
    {Autofill. Applied to the Bounty Target to force package evaluation.}
    ActorValue Property SFBGS003_SQ_Bounty_AmountAV auto mandatory hidden
    {Autofill. This value is set by the Bounty Alias script.}
    GlobalVariable property SFBGS003_BountyScanner_Timestamp auto hidden
    {Autofill. Contains the time when a bounty quest last ran successfully. Used by StoryManager conditions.}
    GlobalVariable property SFBGS003_CooldownNextBounty auto const hidden 
    {Autofill. Cooldown time (in hours) between allowing a new quest to spin up. Used by StoryManager conditions.}
    MiscObject property Credits auto hidden
    {Autofill. Used to reward bounty.}
    Faction property PlayerEnemyFaction auto hidden 
    {Autofill. Used when Bounty Target doesn't surrender.}
    ReferenceAlias property Companion Auto Const
    {Autofill. Optional. This is the Player's current companion filled by SQ_Companions.}
EndGroup 

Group Quest_Stages
    int property SetupCompleteStage = 5 auto const 
    {Autofill. This stage is set by SFBGS003_SQ_BountyTarget_AliasScript when the NPC is finished being set up.}
    int property QuestReadyStage = 90 auto const 
    {Sets a stage when the Bounty Quest has been fully set up and ready for the Player.}    
    int property BountyScannedStage = 100 auto const 
    {Autofill. The OnScanned event on SFBGS003_SQ_BountyTarget_AliasScript sets this stage.}
    int property ConfrontTargetObjective = 100 auto const 
    {This is the "Confront the Bounty Target" Objective, which is set when the NPC has been scanned.}
    int property SurrenderedStage = 600 Auto Const 
    {When the NPC surrenders, set this stage.}
    int property OnDeathStage = 700 auto const  
    int property FailedBountyStage = 950 auto const
    {Stage that's set when the Player kills a bounty that is not Wanted:Dead }
    int property OnUnconsciousStage = 750 auto const 
    {If set, this NPC has been rendered unconscious via EM weapon attacks. This qualifies as an "Alive Capture".}
EndGroup 

Group AutoFill_Properties 
    Keyword Property SFBGS003_Keyword_WantedDead auto const mandatory 
    {Autofill. Keyword is applied to the NPC after it is randomly selected.}
    Keyword Property SFBGS003_Keyword_WantedAlive auto const mandatory 
    {Autofill. Keyword is applied to the NPC after it is randomly selected.}    
    ActorValue Property SFBGS003_BountyWantedAliveAV auto const mandatory 
    {Autofill. Used by DO to set the Wanted status on the UI.} 
    LocationAlias Property BountyTargetLocation auto 
    {Autofill. Optional. Used to swap NPC's display name if at a major settlement. OEs can fill this.} 
    GlobalVariable Property SFBGS003_Global_BountySpawnChance auto 
    {Autofill. Used to determine the chance for the next BountyScannerQuest to spawn. }
EndGroup 

;-- Local variables 
bool BountyTargetKilled = False     ; Used to determine Reward

GlobalVariable property SFBGS003_Bounties_Total auto 
Quest property SFBGS003_TrackersAllianceSupportQuest auto 

Event OnQuestInit()
    int NextQuestChance = SFBGS003_Global_BountySpawnChance.GetValueInt()
    Actor BountyTargetREF = BountyTargetAlias.GetActorRef()

    If NextQuestChance <= 10
        NextQuestChance = Utility.RandomInt(80,100)
    Else 
        NextQuestChance -= Utility.RandomInt(5,20)
    EndIf 
    Math.Clamp(NextQuestChance,0,100)
    Trace(Self, "NextQuestChance: " + NextQuestChance ) 

    SFBGS003_Global_BountySpawnChance.SetValueInt(NextQuestChance)

    Trace(Self, "BountyTargetREF: " + BountyTargetREF )
    Actor PlayerRef = Game.GetPlayer()
    If Companion
        Actor CompanionRef = Companion.GetActorRef()
    EndIf 
    RegisterForRemoteEvent(BountyTargetREF, "OnDeath")
    RegisterForRemoteEvent(BountyTargetREF, "OnDying")
    RegisterForRemoteEvent(BountyTargetREF, "OnUnconscious")
EndEvent 

; When the Quest Starts, determine whether the Bounty allows the NPC to be "arrested" (aka Captured Alive)
Event OnQuestStarted()
    SetBountyWantedAV()  
EndEvent 

Event OnStageSet(int auiStageID, int auiItemID)
    Trace(self, " auiStageID=" + auiStageID)
    Actor BountyTargetREF = BountyTargetAlias.GetActorRef()

    ; Enable the Bounty Target after initial setup. This stage is set by Alias Script setup.
    If auiStageID == SetupCompleteStage
        BountyTargetREF.Enable()
        SetStage(QuestReadyStage)
        
        Trace(self, " BountyQuest is ready. Waiting on Player to scan BountyTarget: " + BountyTargetREF )
    EndIf 

    ; Player scanned the Bounty Target. Update Objectives and Packages.
    If auiStageID == BountyScannedStage
        Self.SetActive()    
        SetObjectiveDisplayed(ConfrontTargetObjective)    
        ; The Package uses the Keyword to determine usage. 
        BountyTargetREF.EvaluatePackage()   
        Trace(self, " Bounty Target:" + BountyTargetREF + " was scanned" )
    EndIf 

    If auiStageID == SurrenderedStage
        ; Alert the Guards; move to a stage fragment.  
        SummonGuard()
    EndIf 
EndEvent

Function SendOELocation(LocationAlias akNewLocation)
    BountyTargetLocation = akNewLocation
EndFunction 

; Determines a bounty status and sets the AV for UI to use in the Scanner Display. 
;    1.0 = Wanted Dead OR Alive
;    2.0 = Wanted Dead (only)
;    3.0 = Wanted Alive (only) 
Function SetBountyWantedAV()
    Actor BountyTargetREF = BountyTargetAlias.GetActorRef()
    int WantedBounty = 0
    int NumBounties = SFBGS003_Bounties_Total.GetValue() as Int

    ; If Player hasn't completed 10 bounties, only offer Wanted: Dead or Alive bounties.
    If NumBounties >= 10 
        WantedBounty = Utility.RandomInt(1,3)
    Else 
        WantedBounty = 1 
    EndIf 
    Trace(Self, " NumBounties: " + NumBounties + ", WantedBounty (1=Dead or Alive, 2=Dead, 3=Alive): " + WantedBounty)

    ; Set the AV used by the UI 
    If BountyTargetREF == NONE
        BountyTargetREF = BountyTargetAlias.GetActorRef()
        Trace(Self, " BountyTargetREF set to none. Fixing ref to " + BountyTargetAlias.GetActorRef() )
    EndIf 

    BountyTargetREF.SetValue(SFBGS003_BountyWantedAliveAV, WantedBounty)

    If WantedBounty <= 2
        BountyTargetREF.AddKeyword(SFBGS003_Keyword_WantedDead)
        Trace(self, "BountyTargetREF: " + BountyTargetREF + " has keyword " + SFBGS003_Keyword_WantedDead)
    EndIf  
    
    If WantedBounty != 2 
        BountyTargetREF.AddKeyword(SFBGS003_Keyword_WantedAlive)
        Trace(self, "BountyTargetREF: " + BountyTargetREF + " has keyword " + SFBGS003_Keyword_WantedAlive)
    EndIf 

    Trace(Self, " WantedAV: " + BountyTargetREF.GetValue(SFBGS003_BountyWantedAliveAV) )
EndFunction 


; This value is checked on the story manager conditions
Function SetTimestamp()
    float NextTimestamp = Utility.GetCurrentGameTime() + SFBGS003_CooldownNextBounty.GetValue()
    SFBGS003_BountyScanner_Timestamp.SetValue(NextTimestamp)
EndFunction 

; Bounty Target surrenders: Force NPC to use the appropriate furniture and packages for surrendering.
;   Called by Stage Fragment.
Function NPCSurrendered()
    ObjectReference SurrenderFurniture = ArrestFurniture.GetRef()
    Actor BountyTargetREF = BountyTargetAlias.GetActorRef()

    Trace(self, "NPC Surrendered()")

    ; Adjust Factions for Surrender State
    BountyTargetREF.RemoveFromFaction(PlayerEnemyFaction)
    BountyTargetREF.StopCombat()

    ; Adjust Keywords used by Packages
    BountyTargetREF.AddKeyword(SFBGS003_SQ_BGS003_Actor_Surrendered_Keyword)    

    ; Furniture setup. Check if furniture override is valid, if not, use the default furniture.
    If SurrenderFurniture == NONE
        SurrenderFurniture = BountyTargetREF.PlaceAtMe(NPCSitFloorCaptive_Kneeling)
    EndIf 

    ; Force the Bounty Target to use the ArrestFurniture.  
    SurrenderFurniture.MoveTo(BountyTargetREF)
    SurrenderFurniture.EnableNoWait()
    ArrestFurniture.ForceRefTo(SurrenderFurniture)
    BountyTargetREF.EvaluatePackage()
EndFunction 

; Player selected Combat option or NPC Failed Speech Challenge and PreferCombat = true.
Function AttackPlayer()
    Actor GuardNPC = None 
    Actor BountyTargetREF = BountyTargetAlias.GetActorRef()

    ; Remove Bounty Target protections
    BountyTargetREF.RemoveFromAllFactions()
    BountyTargetREF.AddtoFaction(PlayerEnemyFaction)
    BountyTargetREF.SetEssential(False)
    BountyTargetREF.SetProtected(False)

    ; Make the Bounty Target hostile
    BountyTargetREF.SetValue(Aggression, 1)
    BountyTargetREF.StartCombat(Game.GetPlayer())
    BountyTargetREF.EvaluatePackage()
EndFunction 

; If a Guard is available, they have several behaviors possible: 
;   * Guard the surrendered Bounty Target 
;   * Attack the fleeing/in-combat Bounty Target 
Function SummonGuard()
    Actor GuardNPC = GuardAlias.GetActorRef() 
    Actor BountyTargetREF = BountyTargetAlias.GetActorRef()

    ; Check for a closer guard, just in case they've wandered.
    GuardAlias.RefillAlias() 
    GuardNPC = GuardAlias.GetActorRef()

    ; If a Guard is available and the NPC is not dead, check to see what the guard functionality should be.
    If GuardNPC && !BountyTargetKilled
        If SurrenderedStage
            BountyTargetREF.SetCrimeFaction(GuardNPC.GetCrimeFaction())
        Else 
            BountyTargetREF.AddtoFaction(PlayerEnemyFaction)
        EndIf 
        GuardNPC.TryToEvaluatePackage()
    EndIf 
EndFunction     

; Bounty Target flees. Package is activated by keywords. 
Function NPCFlees()
    Actor BountyTargetREF = BountyTargetAlias.GetActorRef()

    ; Adjust Keywords used by Packages
    BountyTargetREF.RemoveKeyword(SFBGS003_SQ_BGS003_Actor_Surrendered_Keyword)    
    BountyTargetREF.AddKeyword(SFBGS003_SQ_BGS003_Actor_Flee_Keyword)    
    BountyTargetREF.EvaluatePackage()
    Trace(self, "NPC flees.")
EndFunction 

; Bounty Target is dying. Ensure they can be killed. 
Event Actor.OnDying(Actor akSender, ObjectReference akKiller)
    Actor BountyTargetREF = BountyTargetAlias.GetActorRef()

    Trace(self, "Bounty Target is Dying.")
    BountyTargetREF.SetEssential(False)
    BountyTargetREF.SetProtected(False)
    BountyTargetREF.StopCombat()
EndEvent

Event Actor.OnDeath(Actor akSender, ObjectReference akKiller)
    Trace(self, "Bounty Target is dead.")
    Actor BountyTargetREF = BountyTargetAlias.GetActorRef()
    Actor CompanionRef = Companion.GetActorRef()
    Actor PlayerRef = Game.GetPlayer()
    BountyTargetKilled = True 

    ; If the NPC was killed by the Player or their Companion, then it counts as completing the bounty. 
    If BountyTargetREF.HasKeyword(SFBGS003_Keyword_WantedDead) && (akKiller == PlayerRef || akKiller == CompanionRef)
        SetStage(OnDeathStage)
    Else 
        SetStage(FailedBountyStage)
    EndIf 
EndEvent

; If the NPC becomes Unconscious via EM weapons, this qualifies as valid for "Wanted:Alive" quest completion
Event Actor.OnUnconscious(Actor akSender, ObjectReference akAttacker)
    Actor BountyTargetREF = BountyTargetAlias.GetActorRef()
    Actor CompanionRef = Companion.GetActorRef()
    Actor PlayerRef = Game.GetPlayer()
    BountyTargetKilled = False 

    Trace(self, " the NPC is unconscious!")
    If BountyTargetREF.HasKeyword(SFBGS003_Keyword_WantedAlive) && (akAttacker == PlayerRef || akAttacker == CompanionRef)
        ; If the NPC was killed by the Player or their Companion, then it counts as completing the bounty.
        Trace(self, " the NPC is wanted:alive and Player or Companion rendered them unconscious. Progress bounty.")
        SetStage(OnUnconsciousStage)
    Else 
        Trace(self, " the NPC is NOT wanted:alive. Bounty Target must be killed to progress bounty. ")
    EndIf 
EndEvent

; Assess whether the Player completed the Bounty per the requirements
;   If the Player kills the BountyTarget but they are not Wanted:Dead, then they get 0 bounty. 
;   Fragment calls this function on Reward stage.
Function RewardBountyCredits()
    Actor BountyTargetREF = BountyTargetAlias.GetActorRef()
    float PercentBountyRewarded = 0.0
    int FinalBountyReward = 0

    If BountyTargetREF.HasKeyword(SFBGS003_Keyword_WantedDead) && BountyTargetKilled
        ; Player killed BountyTarget and Wanted:Dead was true, 
        Trace(self, "Wanted:Dead was fulfilled. Full bounty awarded.")
        (SFBGS003_TrackersAllianceSupportQuest as SFBGS003TASupportQuestScript).SetBountiesDeadTotal()
        PercentBountyRewarded = 1.0
    ElseIf BountyTargetREF.HasKeyword(SFBGS003_Keyword_WantedAlive) && !BountyTargetKilled
        ; Player didn't kill BountyTarget and Wanted:Alive was true. 
        Trace(self, "Wanted:Alive was fulfilled. Full bounty awarded.")
        (SFBGS003_TrackersAllianceSupportQuest as SFBGS003TASupportQuestScript).SetBountiesAliveTotal()
        PercentBountyRewarded = 1.0       
    Else 
        ; Player killed the BountyTarget and they were Wanted:Alive 
        Trace(self, "Bounty was NOT fulfilled. NO bounty awarded.")
    EndIf

    If PercentBountyRewarded > 0.0
        FinalBountyReward = (BountyTargetREF.GetValue(SFBGS003_SQ_Bounty_AmountAV) * PercentBountyRewarded) as Int
        Game.GetPlayer().AddItem(Credits, FinalBountyReward)
    EndIf 

    BountyTargetREF.SetValue(SFBGS003_BountyWantedAliveAV, 4.0)  ; Value used by Code to display Bounty Completed on UI. Bounty Completed. 
EndFunction 



;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "SQ_BountyScanner",  string SubLogName = "QuestScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "SQ_BountyScanner",  string SubLogName = "QuestScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction
