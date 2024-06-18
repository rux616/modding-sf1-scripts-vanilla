Scriptname SFBGS003:SFBGS003_SQ_BountyMission_AliasScript extends ReferenceAlias
{Similar to SFBGS003_SQ_BountyTarget_AliasScript, but specific functionality for Mission Boards.}

Struct FactionNameDatum
    Keyword LocationKeyword
    {Used to find appropriate names for different Factions. }
    Formlist FactionNameListMasc
    {List of enemy names appropriate for each Faction that will be used by the Bounty Targets.}
    Formlist FactionNameListFemme
    {List of enemy names appropriate for each Faction that will be used by the Bounty Targets.}    
    Formlist FactionNameListNonBinary
    {List of enemy names appropriate for each Faction that will be used by the Bounty Targets.}    
EndStruct 

Group BountyMissionSettings
    FactionNameDatum[] property FactionNameData auto 
    {Struct that matches a Location with a generic Message that replaces "Citizen" for the NPC's display name. 
    e.g. Paradiso bounty targets are named "Patron" not "Citizen".}
    LocationAlias Property EventLocation auto const 
    {Autofill. Optional. Used to swap NPC's display name if at a major settlement. If not available, NPC is a "citizen"} 
    int property BountySetupComplete = 5 auto const 
    {Sets a stage when the NPC has been fully set up for bounty script usage.}  
    int property BountyScannedStage = 150 auto const 
    {Sets this stage when this specific Bounty Target has been scanned.}   
    ReferenceAlias property CrowdSpawnMarker Auto Const Mandatory 
    {Autofill. Alias for the Bounty Marker}
    ActorValue property SFBGS003_SQ_Bounty_isScannedAV auto hidden
    {Autofill. Used by the UI. Set when the Actor has been scanned.}    
    FormList property SFBGS003_BountyCrimes_Rare auto 
    {Autofill. List of Messages. Populated in Editor.}
    FormList property SFBGS003_BountyCrimes_Uncommon auto 
    {Autofill. List of Messages. Populated in Editor.}
    Formlist property SFBGS003_BountyCrimes_Common auto
    {Autofill. List of Messages. Populated in Editor.}
    GlobalVariable property SFBGS003_Global_RareCrimeValue auto  
    {Autofill. Value of a Mission Board Rare Bounty}
    GlobalVariable property SFBGS003_Global_UncommonCrimeValue auto  
    {Autofill. Value of a Mission Board Uncommon Bounty}
    GlobalVariable property SFBGS003_Global_CommonCrimeValue auto  
    {Autofill. Value of a Mission Board Common Bounty}
    GlobalVariable property SFBGS003_Global_MissionBountyBonus auto 
    {Autofill. Bonus added to bounties. }
    GlobalVariable property SFBGS003_Global_MissionBountyLimit auto
    {Autofill. Max bounty value. }
    GlobalVariable property SFBGS003_Bounties_Total auto 
    {Autofill. Number of Bounties completed.}
    ActorValue property SFBGS003_SQ_Bounty_AmountAV auto mandatory
    {Autofill. Bounty Value shown on UI and also awarded.}
    Formlist property SFBGS003_Formlist_RandomNames_Faction_Any auto mandatory 
    {Autofill. Backup list for Boss names. All types. Not Faction specific.}
    GlobalVariable property SFBGS003_Global_MissionBoardEliteBounty_Reward auto
    {Autofill. Offered value that the player earned from this bounty and display on the Mission Board UI. }
EndGroup

; This NPC Actor, set onLoad
Actor BountyTargetActor

Event OnLoad()
    BountyTargetActor = GetActorRef()
    BountyTargetActor.SetValue(SFBGS003_SQ_Bounty_isScannedAV, 0)
    SetBountyCrimes()
    GetOwningQuest().SetStage(BountySetupComplete)
    RegisterForRemoteEvent(BountyTargetActor, "OnScanned")
    RegisterForRemoteEvent(BountyTargetActor, "OnUnconscious")
EndEvent

Event OnAliasInit()
    RenameBountyTarget()
EndEvent

Event OnScanned()
    Trace(self, " Bounty Target:" + GetActorRef() + " was scanned" )
    GetActorRef().SetValue(SFBGS003_SQ_Bounty_isScannedAV, 1)
EndEvent

; Determine the distribution of uncommon and rare crimes.
Function SetBountyCrimes()
    int numCrimes = Utility.RandomInt(1,3)
    BountyTargetActor = Self.GetActorRef()
    int BountyRewardTotal = 0
    int BonusReward = 0
    int randomChance = 0

    ; Distribute rare/uncommon/common crimes
    While numCrimes > 0
        randomChance = Utility.RandomInt(1,numCrimes*3)
        If randomChance == numCrimes 
            BountyTargetActor.AddBountyCrime(SFBGS003_BountyCrimes_Rare)
            Trace(self, " Added Rare crime to " + BountyTargetActor )
            BountyRewardTotal += SFBGS003_Global_RareCrimeValue.GetValue() as Int 
        ElseIf randomChance <= numCrimes 
            BountyTargetActor.AddBountyCrime(SFBGS003_BountyCrimes_Uncommon)
            Trace(self, " Added Uncommon crime to " + BountyTargetActor )
            BountyRewardTotal += SFBGS003_Global_UncommonCrimeValue.GetValue() as Int 
        Else
            BountyTargetActor.AddBountyCrime(SFBGS003_BountyCrimes_Common)
            Trace(self, " Added Common crime to " + BountyTargetActor )
            BountyRewardTotal += SFBGS003_Global_CommonCrimeValue.GetValue() as Int 
        EndIf 
        Trace(Self, " New BountyRewardTotal: " + BountyRewardTotal)
        numCrimes -= 1
    EndWhile

    ; Calculate bonus for experienced bounty hunters. The more bounties they do, the better their payout. 
    ; Default value for BountyBonus is 15 Credits
    BonusReward = SFBGS003_Bounties_Total.GetValue() as Int * SFBGS003_Global_MissionBountyBonus.GetValue() as Int 
    BonusReward = Math.Clamp(BonusReward as Float, 0.0, SFBGS003_Global_MissionBountyLimit.GetValue() as Float ) as Int 
    BountyRewardTotal += BonusReward 
    BountyTargetActor.SetValue(SFBGS003_SQ_Bounty_AmountAV, (BountyRewardTotal as Float)) ; Displays on UI
    SFBGS003_Global_MissionBoardEliteBounty_Reward.SetValueInt(BountyRewardTotal) ; Used by MissionBoard
    
    Trace(Self, "BonusReward: " + BonusReward + " for total bounties: " + SFBGS003_Bounties_Total)
    Trace(Self, " SFBGS003_SQ_Bounty_AmountAV set (BountyRewardTotal): " + BountyRewardTotal) 
EndFunction 

; OnScannedEvent, rename the BountyTarget
Function RenameBountyTarget()
    BountyTargetActor = Self.GetActorRef()
    ActorBase myActorBase = BountyTargetActor.GetLeveledActorBase()
    int BountyTargetGender = -1
    int RandomNameListLength = 0
    int RandomNameIndex = -1    
    FormList RandomNameList 
    int FactionIndex = 0
    bool break = false 
    
    ; Determine NPC gender, 3=Non-Binary, 2=Female, 1=Male, 0=unselected
    BountyTargetGender = myActorBase.GetPronoun()
    Trace(self, " BountyTargetGender: " + BountyTargetGender) 

    ; Currently GetPronoun returns 0 always, please remove when SF-38327 is fixed
    If BountyTargetGender == 0
        If Utility.RandomInt(0,100) > 5
            ; GetSex() and GetPronoun() do not return matching values
            If myActorBase.GetSex() == 0 ; Male
                BountyTargetGender = 1
            ElseIf myActorBase.GetSex() == 1 ; Female
                BountyTargetGender = 2
            Else 
                BountyTargetGender = 3
            EndIf 
            Trace(self, " No Pronoun data available, using ActorBase.GetSex(): " + myActorBase.GetSex() ) 
        Else 
            BountyTargetGender = 3
            Trace(self, " No Pronoun data available, setting to Non-Binary. " ) 
        EndIf 
    EndIf 

    If FactionNameData.Length > 1
        ; Indentify the Faction 
        While FactionIndex < FactionNameData.Length && !break
            ; Found a match
            If EventLocation.GetLocation().HasKeyword(FactionNameData[FactionIndex].LocationKeyword)
                Trace(self, " Faction identified: " + FactionNameData[FactionIndex].LocationKeyword) 
                break = true
            Else 
                FactionIndex += 1
            EndIf 
        EndWhile 
    
        ; No matches found, get a random one
        If FactionIndex == FactionNameData.Length
            FactionIndex = Utility.RandomInt(0,FactionNameData.Length-1)
        EndIf 

        If BountyTargetGender == 1
            RandomNameList = FactionNameData[FactionIndex].FactionNameListMasc
            Trace(self, " MissionBoard BountyTarget will select from masc name list") 
        ElseIf BountyTargetGender == 2
            RandomNameList = FactionNameData[FactionIndex].FactionNameListFemme
            Trace(self, " MissionBoard BountyTarget will select from femme name list") 
        Else 
            RandomNameList = FactionNameData[FactionIndex].FactionNameListNonBinary
            Trace(self, " MissionBoard BountyTarget will select from non-binary name list") 
        EndIf 
    Else 
        ; We don't have any data, use the backup lists 
        RandomNameList = SFBGS003_Formlist_RandomNames_Faction_Any
        Trace(self, " No data, use backup list: " + RandomNameList)
    EndIf 

    RandomNameListLength = RandomNameList.GetSize()
    Trace(self, " RandomNameListLength: " + RandomNameListLength)
    
    ; If a random name list exists, use it first
    If RandomNameListLength > 0
        ; Select name from the list at random
        RandomNameIndex = Utility.RandomInt(0,RandomNameListLength)
        BountyTargetActor.SetOverrideName(RandomNameList.GetAt(RandomNameIndex) as Message)
        Trace(self, " RandomNameIndex: " + RandomNameIndex)
    EndIf 
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
