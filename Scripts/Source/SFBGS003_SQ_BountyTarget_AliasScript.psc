Scriptname SFBGS003_SQ_BountyTarget_AliasScript extends ReferenceAlias
{Sets up an Alias filled with an Actor to have HandScanner settings that work with the Bounty Scanner system.}

Struct LocationNameDatum
    Location CityLocation
    {Optional. Location that will be compared with BountyTargetLocationAlias and paired with a generic Message that gets set to the Actor's display name}
    Message GenericName
    {Optional. Name that will replace the Citizen's display name, e.g. "Patron" if they appear in this city}
EndStruct 

Group QuestSetup
    float property TemperamentValue = 0.0 auto  
    {Supported Values: 0.0: Randomize, 1.0: Irritable, 2.0: Neutral, 3.0: Anxious.}
    int property BountySetupComplete = 5 auto const 
    {Sets a stage when the NPC has been fully set up for bounty script usage.}  
    int property BountyScannedStage = 100 auto const 
    {Sets this stage when this Bounty Target has been scanned.}    
    float property OverrideSurrenderRefusalChance = -1.0 Auto
    {How likely is the NPC to surrender if offered by the Player in dialogue? 
        Default: -1.0. This will use the NPC temperament to determine the chance.
        Override Value: 0.0=Always surrenders, 0.50=even chance to surrender, 1.0=Never surrender.}
    int property OverrideBribeChance = -1 auto  
EndGroup

Group NamingSettings
    LocationAlias Property BountyTargetLocation auto const 
    {Autofill. Optional. Used to swap NPC's display name if at a major settlement. If not available, NPC is a "citizen"} 
    bool property RenameOnScan = True auto const 
    {If Set, Alias is renamed when Actor is scanned.}
    int property StageRequired = -1 auto const 
    {Prereq Stage for Renaming.}
    int property SetStageOnScan = -1 auto const 
    {If Set, sets a Stage on the owning quest when the NPC is scanned.}
    LocationNameDatum[] property LocationNameData auto 
    {Struct that matches a Location with a generic Message that replaces "Citizen" for the NPC's display name. 
    e.g. Paradiso bounty targets are named "Patron" not "Citizen".}
    Formlist property SFBGS003_Formlist_RandomNames_Masc auto const mandatory
    {Optional. Formlist of Messages with First/Last Names for Masc VoiceType on Actor.}
    Formlist property SFBGS003_Formlist_RandomNames_Femme auto const mandatory
    {Optional. Formlist of Messages with First/Last Names for Femme VoiceType on Actor.}
    Formlist property SFBGS003_Formlist_RandomNames_NonBinary auto const mandatory
    {Optional. Formlist of Messages with First/Last Names for Non-Binary VoiceType on Actor.}
EndGroup 

Group AutoFill_Properties
    ReferenceAlias property CrowdSpawnMarker Auto Const Mandatory 
    {Autofill - Alias for the Bounty Marker}
    Keyword Property SFBGS003_Keyword_PrefersFight auto const mandatory 
    {Autofill. Keyword is added based on their temperament if Fight or Flight keywords don't already exist on them.}
    Keyword Property SFBGS003_Keyword_PrefersFlight auto const mandatory 
    {Autofill. Keyword is added based on their temperament if Fight or Flight keywords don't already exist on them.}  
    Keyword Property SFBGS003_Keyword_SurrenderAllowed auto const mandatory
    {Autofill. Keyword is added based on their temperament or OverrideSurrenderRefusalChance} 
    Message Property SFBGS003_ScannerBounty_Tutorial_Message auto const mandatory
    {Autofill. Tutorial pop-up when first Bounty is scanned.}
    FormList property SFBGS003_BountyCrimes_Rare auto 
    {Autofill - List of Messages. Populated in Editor.}
    FormList property SFBGS003_BountyCrimes_Uncommon auto 
    {Autofill - List of Messages. Populated in Editor.}
    Formlist property SFBGS003_BountyCrimes_Common auto
    {Autofill - List of Messages. Populated in Editor.}   
    ActorValue property SFBGS003_SQ_Bounty_TemperamentAV auto const 
    {Autofill. This value is used by UI.}  
    Keyword property HandScannerActorTemperament_Aggressive Auto Const Mandatory hidden
    {Autofill. Temperament data.}
    Keyword property HandScannerActorTemperament_Peaceful Auto Const Mandatory hidden
    {Autofill. Temperament data.}
    Keyword property HandScannerActorTemperament_Skittish Auto Const Mandatory hidden       
    {Autofill. Temperament data.}
    ActorValue property SFBGS003_SQ_Bounty_isScannedAV auto 
    {Autofill. Used by the UI. Set when the Actor has been scanned.}
EndGroup 


; Bounty  
ActorValue property SFBGS003_SQ_Bounty_AmountAV auto mandatory
GlobalVariable property SFBGS003_Bounty auto  
GlobalVariable property SFBGS003_Global_RareCrimeValue auto  
GlobalVariable property SFBGS003_Global_UncommonCrimeValue auto  
GlobalVariable property SFBGS003_Global_CommonCrimeValue auto  
GlobalVariable property SFBGS003_Global_BountyBonus auto 
GlobalVariable property SFBGS003_Global_BountyBonusLimit auto 
Keyword property SFBGS003_Keyword_BribesAllowed auto 
GlobalVariable property SFBGS003_Bounties_Total auto 


; This NPC Actor, set onLoad
float TemperamentChance = 0.0           ; Set once, when the NPC initializes.
bool RenameComplete 

; When the Alias loads, set up all Bounty information and inform the Bounty QuestScript that the NPC is ready. 
Event OnLoad()
    Actor BountyTargetActor = GetActorRef()
    RenameComplete = False 

    ; Set NPC to "Unscanned"
    BountyTargetActor.SetValue(SFBGS003_SQ_Bounty_isScannedAV, 0)
        
    ; If nothing is set, rename OnLoad, otherwise give them a generic name based on Location 
    If StageRequired == -1 && !RenameOnScan
        RenameBountyTarget()
    Else 
        RegisterForRemoteEvent(BountyTargetActor, "OnScanned")
        SetBountyTargetGenericName()
    EndIf 

    SetTemperamentKeywords()
    SetBountyCrimes()
    AllowSurrender()    
    SetFightOrFlight()
    SetBribery()    

    RegisterForRemoteEvent(BountyTargetActor, "OnScanned")
    RegisterForRemoteEvent(BountyTargetActor, "OnUnconscious")
    
    Trace(self, " BountyTarget setup is done.")
    
    ; This stage triggers the QuestScript to enable the NPC and finish other quest setup.
    GetOwningQuest().SetStage(BountySetupComplete)
EndEvent

; Sets the stage on the quest which is picked up by the QuestScript
Event OnScanned()
    Actor BountyTargetActor = GetActorRef()

    ; AV used by HandScannerBountyTargetScannedDO for UI code.
    BountyTargetActor.SetValue(SFBGS003_SQ_Bounty_isScannedAV, 1.0)
    Trace(self, " BountyTargetActor " + BountyTargetActor + " SFBGS003_SQ_Bounty_isScannedAV set to " + BountyTargetActor.GetValue(SFBGS003_SQ_Bounty_isScannedAV))

    If RenameOnScan && ( StageRequired < 0 || GetOwningQuest().GetStageDone(StageRequired) )
        RenameBountyTarget()
        UnregisterForRemoteEvent(GetActorRef(), "OnScanned")
        Trace(self, " OnScanned(): " + Self)
    Else 
        Trace(self, " RenameOnScan: " + RenameOnScan + ", StageRequired: " + StageRequired + "GetStageDone(" + StageRequired + "): " + GetOwningQuest().GetStageDone(StageRequired) )
    EndIf 

    If SFBGS003_Bounties_Total.GetValue() == 0
        SFBGS003_ScannerBounty_Tutorial_Message.Show()
    EndIf 

    ; QuestScript updates when this stage is set.
    GetOwningQuest().SetStage(BountyScannedStage)

    UnregisterForRemoteEvent(GetActorRef(), "OnScanned")
    Trace(self, " OnScanned() SetStage: " + BountyScannedStage)
EndEvent

Event Quest.OnStageSet(Quest akSender, int auiStageID, int auiItemID)
    If auiStageID == StageRequired && StageRequired > -1 
        RenameBountyTarget()
        GetOwningQuest().SetStage(SetStageOnScan)
        Trace(self, " OnStageSet(): " + Self)
    EndIf
EndEvent

; Determine the distribution of uncommon and rare crimes.
Function SetBountyCrimes()
    int numCrimes = Utility.RandomInt(1,3)
    Actor BountyTargetActor = Self.GetActorRef()
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
    BonusReward = SFBGS003_Bounties_Total.GetValue() as Int * SFBGS003_Global_BountyBonus.GetValue() as Int 
    BonusReward = Math.Clamp(BonusReward as Float, 0.0, SFBGS003_Global_BountyBonusLimit.GetValue() as Float ) as Int 
    BountyRewardTotal += BonusReward 
    BountyTargetActor.SetValue(SFBGS003_SQ_Bounty_AmountAV, (BountyRewardTotal as Float))
    Trace(Self, "BonusReward: " + BonusReward + " for total bounties: " + SFBGS003_Bounties_Total)
    Trace(Self, " SFBGS003_SQ_Bounty_AmountAV set (BountyRewardTotal): " + BountyRewardTotal) 
EndFunction 

; These keywords are used in conditions for scene dialogue. Supports NPCs that might be preset with a Temperament. 
Function SetTemperamentKeywords()
    Actor BountyTargetActor = Self.GetActorRef()
    TemperamentValue = Math.Clamp(TemperamentValue, 0.0, 3.0)

    ; 0: Randomize, 1: Irritable, 2: Neutral, 3: Anxious
    If TemperamentValue == 0
       TemperamentValue = Utility.RandomInt(1,3) as Float 
    EndIf 
    BountyTargetActor.SetValue(SFBGS003_SQ_Bounty_TemperamentAV, TemperamentValue) 
    
    ; Irritable
    If TemperamentValue == 1.0
        BountyTargetActor.AddKeyword(HandScannerActorTemperament_Aggressive)
        Trace(self, " BountyTarget " + BountyTargetActor + " Temperament set to: Aggressive")
    ; Neutral 
    ElseIf TemperamentValue == 2.0
        BountyTargetActor.AddKeyword(HandScannerActorTemperament_Peaceful)
        Trace(self, " BountyTarget " + BountyTargetActor + " Temperament set to: Peaceful")
    ; Anxious
    Else
        BountyTargetActor.AddKeyword(HandScannerActorTemperament_Skittish)
        Trace(self, " BountyTarget " + BountyTargetActor + " Temperament set to: Skittish")
    EndIf

    SetTemperamentChance()

    Trace(self, " TemperamentValue: " + BountyTargetActor.GetValue(SFBGS003_SQ_Bounty_TemperamentAV) )
EndFunction

; Sets TemperamentChance for use in Bribery, Surrender, and Fight/Flight chances. 
Function SetTemperamentChance()
    Actor BountyTargetActor = Self.GetActorRef()

    ; Higher TemperamentChance means more likely to Fight vs Flee
    If BountyTargetActor.HasKeyword(HandScannerActorTemperament_Aggressive)
        TemperamentChance = 0.75
    ElseIf BountyTargetActor.HasKeyword(HandScannerActorTemperament_Skittish)
        TemperamentChance = 0.25 
    Else ; Neutral
        TemperamentChance = 0.50 
    EndIf 
EndFunction 

; This is used to calculate the likelihood that a character will surrender (if the option is offered by the Player).
Function AllowSurrender()
    Actor BountyTargetActor = Self.GetActorRef()
    float Chance = TemperamentChance

    ; If the specific quest has an Override, use it. 
    OverrideSurrenderRefusalChance = Math.Clamp(OverrideSurrenderRefusalChance, -1.0, 1.0)
    If OverrideSurrenderRefusalChance > -1.0
        Chance = OverrideSurrenderRefusalChance
    EndIf    
    Trace(self, "Surrender Chance: " + Chance)

    ; 0.0=Always surrender, 1.0=Never surrender
    If Utility.RandomFloat(0.0,0.99) >= Chance 
        BountyTargetActor.AddKeyword(SFBGS003_Keyword_SurrenderAllowed)
    EndIf 
EndFunction  

; Set the Fight or Flight behavior on the Bounty Target Actor. 
;   When the NPC is confronted, this is their fallback behavior. Scenes check for the Keyword.
Function SetFightOrFlight()
    Actor BountyTargetActor = Self.GetActorRef()

    ; Higher TemperamentChance means more likely to Fight vs Flee
    If Utility.RandomFloat(0.0,1.0) < TemperamentChance
        ; Combat is preferred by disagreeable temperaments
        BountyTargetActor.AddKeyword(SFBGS003_Keyword_PrefersFight)
        Trace(self, " BountyTargetActor " + BountyTargetActor + " will Fight.")
    Else 
        ; Flee is preferred by agreeable temperaments.
        BountyTargetActor.AddKeyword(SFBGS003_Keyword_PrefersFlight)
        Trace(self, " BountyTargetActor " + BountyTargetActor + " will Flee.")
    EndIf 
EndFunction 

Function SetBribery()
    Actor BountyTargetActor = Self.GetActorRef()

    ; Lower TemperamentChance is more likely to accept a bribe
    If Utility.RandomFloat(0.0,1.0) > TemperamentChance
        BountyTargetActor.AddKeyword(SFBGS003_Keyword_BribesAllowed)
        Trace(self, " BountyTargetActor " + BountyTargetActor + " can be bribed.")
    EndIf
EndFunction  

; Rename NPCs to appropriate names for Location, e.g. Paradiso "citizen" becomes a "patron" instead
Function SetBountyTargetGenericName()
    Actor BountyTargetActor = Self.GetActorRef()
    LocationNameDatum LocDatum
    int counter = 0

    While counter < LocationNameData.Length
        LocDatum = LocationNameData[counter]
        If BountyTargetLocation.GetLocation() == LocDatum.CityLocation 
            BountyTargetActor.SetOverrideName(LocDatum.GenericName)
            Trace(self, " BountyTargetActor " + BountyTargetActor + "  renamed to Generic Location Name" + LocDatum.GenericName) 
        EndIf 
        counter += 1
    EndWhile 
EndFunction 

; OnScannedEvent, rename the BountyTarget
Function RenameBountyTarget()
    Actor BountyTargetActor = Self.GetActorRef()
    ActorBase myActorBase = BountyTargetActor.GetLeveledActorBase()
    int BountyTargetGender = -1
    int RandomNameListLength = 0
    int RandomNameIndex = -1    
    FormList RandomNameList 
    
    ; Don't rename twice
    If RenameComplete
        Return 
    EndIf 

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

    If BountyTargetGender == 1
        RandomNameList = SFBGS003_Formlist_RandomNames_Masc
        Trace(self, " Bounty Target will select from masc name list") 
    ElseIf BountyTargetGender == 2
        RandomNameList = SFBGS003_Formlist_RandomNames_Femme
        Trace(self, " Bounty Target will select from femme name list") 
    Else
        RandomNameList = SFBGS003_Formlist_RandomNames_NonBinary
        Trace(self, " Bounty Target will select from non-binary name list") 
    EndIf 
    RandomNameListLength = RandomNameList.GetSize()
    
    ; If a random name list exists, use it first
    If RandomNameListLength > 0
        ; Select name from the list at random
        RandomNameIndex = Utility.RandomInt(0,RandomNameListLength-1)
        GetActorRef().SetOverrideName(RandomNameList.GetAt(RandomNameIndex) as Message)
        Trace(self, " List size: " + RandomNameListLength + " Name Selected: " + RandomNameList.GetAt(RandomNameIndex) as Message) 
    Else 
        Trace(Self, " Name List size was 0")
    EndIf 

    RenameComplete = True
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