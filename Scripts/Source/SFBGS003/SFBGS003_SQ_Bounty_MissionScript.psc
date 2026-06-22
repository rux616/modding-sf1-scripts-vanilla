Scriptname SFBGS003:SFBGS003_SQ_Bounty_MissionScript extends Quest
{This script handles bounty requests for MB and any other Quest that utilizes the Bounty system. 
Autofill all properties first.}

Group Settings
    ReferenceAlias property Companion Auto Const
    {Autofill. Optional. This is the Player's current companion filled by SQ_Companions.}
    ReferenceAlias property BountyTargetAlias Auto Const Mandatory
    {Required. Primary Bounty Target Actor. This is the Actor that is going to be arrested or killed.}
    int property SetupCompleteStage = 5 auto const 
    {Autofill. This stage is set by SFBGS003_SQ_BountyTarget_AliasScript when the NPC is finished being set up.}
    int property QuestReadyStage = 90 auto const 
    {Sets a stage when the Bounty Quest has been fully set up and ready for the Player.}    
    int property BountyScannedStage = 150 auto const 
    {Autofill. The OnScanned event on SFBGS003_SQ_BountyTarget_AliasScript sets this stage.}
    int property ConfrontTargetObjective = 100 auto const 
    {This is the "Confront the Bounty Target" Objective, which is set when the NPC has been scanned.}
    int property CapturedAliveStage = 600 Auto Const 
    {When the NPC surrenders, set this stage.}
    int property OnDeathStage = 700 auto const  
    {Stage is set when Target has died.}
    int property CompletedBountyStage = 900 auto const 
    {Stage is set when Bounty is complete.}
    int property FailedBountyStage = 950 auto const
    {Stage that's set when the Player kills a bounty that is not Wanted:Dead }
    int property OnUnconsciousStage = 750 auto const 
    {If set, this NPC has been rendered unconscious via EM weapon attacks. This qualifies as an "Alive Capture".}
    Keyword Property SFBGS003_Keyword_WantedDead auto const mandatory 
    {Autofill. Keyword is applied to the NPC after it is randomly selected.}
    Keyword Property SFBGS003_Keyword_WantedAlive auto const mandatory 
    {Autofill. Keyword is applied to the NPC after it is randomly selected.}    
    ActorValue Property SFBGS003_BountyWantedAliveAV auto const mandatory 
    {Autofill. Used by DO to set the Wanted status on the UI.} 
    LocationAlias Property BountyTargetLocation auto 
    {Autofill. Optional. Used to swap NPC's display name if at a major settlement. OEs can fill this.} 
    ActorValue Property SFBGS003_SQ_Bounty_AmountAV auto mandatory hidden
    {Autofill. This value is set by the Bounty Alias script.}
    MiscObject property Credits auto hidden
    {Autofill. Used to reward bounty.}
    GlobalVariable property SFBGS003_Global_MissionBoardEliteBounty_Reward auto
    {Autofill. Offered value that the player earned from this bounty and display on the Mission Board UI. }
    GlobalVariable property SFBGS003_Global_MissionBoardEliteBounty_RewardActual auto
    {Autofill. Actual value that the player earned from this bounty and display on the Mission Board UI. }
EndGroup 

Quest property SFBGS003_TrackersAllianceSupportQuest auto ; Used to increment SetBountiesDeadTotal/SetBountiesAliveTotal
Actor BountyTargetREF
Actor PlayerRef
Actor CompanionRef
bool BountyTargetKilled

Event OnQuestInit()
    BountyTargetREF = BountyTargetAlias.GetActorRef()
    BountyTargetKilled = False 

    Trace(Self, "BountyTargetREF: " + BountyTargetREF )
    PlayerRef = Game.GetPlayer()
    If Companion
        CompanionRef = Companion.GetActorRef()
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
EndEvent

; Determines a bounty status and sets the AV for UI to use in the Scanner Display. 
;    1.0 = Wanted Dead OR Alive
;    2.0 = Wanted Dead (only)
;    3.0 = Wanted Alive (only) 
Function SetBountyWantedAV()
    int WantedBounty = 0

    WantedBounty = Utility.RandomInt(1,3)
    Trace(Self, " WantedBounty (1=Dead or Alive, 2=Dead, 3=Alive): " + WantedBounty)

    ; Set the AV used by the UI 
    BountyTargetREF = BountyTargetAlias.GetActorRef()
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

; Bounty Target is dying. Ensure they can be killed. 
Event Actor.OnDying(Actor akSender, ObjectReference akKiller)
    Trace(self, "Bounty Target is Dying.")
    BountyTargetREF.SetEssential(False)
    BountyTargetREF.SetProtected(False)
    BountyTargetREF.StopCombat()
EndEvent

Event Actor.OnDeath(Actor akSender, ObjectReference akKiller)
    Trace(self, "Bounty Target is dead.")
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
        FinalBountyReward = (SFBGS003_Global_MissionBoardEliteBounty_Reward.GetValueInt() * PercentBountyRewarded) as Int
        SFBGS003_Global_MissionBoardEliteBounty_RewardActual.SetValueInt(FinalBountyReward)
    EndIf 

    BountyTargetREF.SetValue(SFBGS003_BountyWantedAliveAV, 4.0)  ; Value used by Code to display Bounty Completed on UI. Bounty Completed. 
EndFunction 

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "SQ_BountyScanner",  string SubLogName = "Mission", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "SQ_BountyScanner",  string SubLogName = "Mission", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction

