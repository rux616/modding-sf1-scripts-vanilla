Scriptname SFBGS003:SFBGS003_AddBountyScannerCrimes extends ReferenceAlias
{Adds crimes to the NPC as well as bounty scanner functionality. Does not include bounty behavior for interacting or arresting, only displaying crimes on the scanner when scanned.}

Group RequiredProperties
    ReferenceAlias property BountyTarget auto const 
    {The Actor who will have the crimes and be scanned.}
    Message property CrimeMessage auto const 
    {Requires either CrimeMessage OR CrimeList to be filled. This adds one Crime to add to the Scanner.}
    FormList property CrimeList auto 
    {Requires either CrimeMessage OR CrimeList to be filled.  List of Message Forms that are displayed on the Scanner. 
    If a FormList is provided, the CrimeMessage is ignored.}
    int property SetStageOnScanned auto 
    {Sets the stage when the Actor is scanned.}
    int property BountyValue auto 
    {Amount of Credits this NPC should have assigned to them for their crimes.}
EndGroup 

Group AutoFill_Properties
    ActorValue Property SFBGS003_SQ_Bounty_AmountAV auto mandatory 
    {Autofill. This value is set by the Bounty Alias script and is used by UI.}
    ActorValue property SFBGS003_SQ_Bounty_isScannedAV auto mandatory 
    {AutoFill. Used by UI to display the Scanned data.}
EndGroup 

Actor BountyTargetREF

Event OnLoad()
    BountyTargetREF = BountyTarget.GetActorRef() 
    ; Set NPC to "Unscanned"
    BountyTargetREF.SetValue(SFBGS003_SQ_Bounty_isScannedAV, 0)
    RegisterForRemoteEvent(GetActorRef(), "OnScanned")
    SetBountyCrimes()
    Trace(Self, "Registered OnScanned event" )
EndEvent 

; Sets the stage on the quest which is picked up by the QuestScript
Event OnScanned()
    BountyTargetREF = BountyTarget.GetActorRef() 

    ; AV used by HandScannerBountyTargetScannedDO for UI code.
    BountyTargetREF.SetValue(SFBGS003_SQ_Bounty_isScannedAV, 1.0)
    Trace(self, " SFBGS003_SQ_Bounty_isScannedAV set to " + BountyTargetREF.GetValue(SFBGS003_SQ_Bounty_isScannedAV))

    ; QuestScript updates when this stage is set.
    GetOwningQuest().SetStage(SetStageOnScanned)
    UnregisterForRemoteEvent(GetActorRef(), "OnScanned")
    Trace(self, " OnScanned() SetStage: " + SetStageOnScanned)
EndEvent

; Determine the distribution of uncommon and rare crimes.
Function SetBountyCrimes()
    int counter = 0

    BountyTargetREF = BountyTarget.GetActorRef() 

    If CrimeMessage != None         
        BountyTargetREF.AddBountyCrime(CrimeMessage)
        Trace(self, " Added crime to " + BountyTargetREF )
    Else 
        While counter < CrimeList.GetSize()
            BountyTargetREF.AddBountyCrime(CrimeList.GetAt(counter))
            counter += 1
        EndWhile 
        Trace(self, " Added crimes from " + CrimeList )
    EndIf 

    ; Calculate bonus for experienced bounty hunters. The more bounties they do, the better their payout. 
    ; Default value for BountyBonus is 15 Credits
    BountyTargetREF.SetValue(SFBGS003_SQ_Bounty_AmountAV, (BountyValue as Float))
    Trace(Self, " SFBGS003_SQ_Bounty_AmountAV set: " + BountyValue) 
EndFunction 

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "SQ_BountyScanner",  string SubLogName = "AliasScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "SQ_BountyScanner",  string SubLogName = "AliasScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction