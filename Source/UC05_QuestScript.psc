Scriptname UC05_QuestScript extends Quest Conditional

Struct IntercomDatum
    ReferenceAlias TargetIntercom
    {The currently active intercom}

    ReferenceAlias MatchingPowerSwitch
    {What power box this intercom is leading the player to. If it's already been thrown, we'll progress 
    to the next batch}

    bool WaitForRestart
    {If true, don't update to the next intercom until the relevant power swtich is thrown}

    int StageToSetOnActive = -1
    {When this intercom is the active one, and is activated, set this stage}
EndStruct

Group Objects
    ReferenceAlias Property ActiveIntercom Mandatory Const Auto
    {Alias to hold the currently active intercom}

    ReferenceAlias Property ActiveIntercomTrigger Mandatory Const Auto
    {Alias to hold the currently active intercom trigger. When the player enters this, we update to the next intercom}

    ReferenceAlias Property IntercomAudioSource Mandatory Const Auto
    {The object making the intercom audio sounds}

    ReferenceAlias Property IntercomSoundMarker Mandatory Const Auto
    {Ref alias for the sound marker that we move around to create the persistent hissing}

    Scene Property UC05_Codin_LoopingIntercom Mandatory Const Auto
    {Looping audio scene to draw the player towards the next marker}

    RefCollectionAlias Property Alias_VenomTreeHaze_Group01 Mandatory Const Auto
    {Venom Tree Haze on the first floor tied to power switch in the meeting room}

    RefCollectionAlias Property Alias_VenomTreeHaze_Group02 Mandatory Const Auto
    {Venom Tree Haze on the third floor tied to power switch in the room near the cubicles}

    RefCollectionAlias Property Shutters Mandatory Const Auto
    {Ref collection for the shutters in the Cabinet chambers}
EndGroup

Group IntercomData
    IntercomDatum[] Property IntercomData Mandatory Auto
    {An array of ref alias pairings that manage the order on the intercoms through which the player has to run in the 
    Va'ruun embassy}

    IntercomDatum[] Property IntercomDataStorage Mandatory Auto
    {An array of ref aliases allowing me to store old data without throwing it all out. Not used for anything else.}

    int Property IntercomState Auto Conditional RequiresGuard(IntercomStateGuard)
    {A var that gets updated each time we've throw one of the power switches to allow the Ambassador's audio to get clearer}
EndGroup

Group Stages
    int[] Property PowerSwitchStages Mandatory Const Auto
    {Array of stages to check when a power switch is throw. If they're all set, set stage 600}

    int Property AllPowerOnStage = 600 Const Auto
    {Stage to set once all the power's back on}

    int Property ShutdownStage = 650 Const Auto
    {Once this stage has been set, no additonal activations should do anything}
EndGroup

bool SkipUpdates
bool SkipRemoval
Guard IntercomStateGuard

Function UpdateActiveIntercom(ScriptObject akSourceCall, bool bRestartChain = false, ReferenceAlias PowerSwitchAlias = none, int PrereqStage = -1)
    if !GetStageDone(ShutdownStage)

        trace(self, "Starting intercom update. Current stage: " + GetStage() + ". Source script: " + akSourceCall)
        IntercomDatum currDatum = IntercomData[0]
        ObjectReference currIntercom = currDatum.TargetIntercom.GetRef()
        ObjectReference currActiveIntercom = ActiveIntercom.GetRef()
        trace(self, "currDatum Intercom: " + currIntercom + ". currPowerSwitch: " + currDatum.MatchingPowerSwitch.GetRef() + ". currActiveIntercom: " + currActiveIntercom + ". Powerswitch alias: " + PowerSwitchAlias + ". Prereq Stage: " + PrereqStage)

        if PowerSwitchAlias != none
            ObjectReference ActivatedPowerbox = PowerSwitchAlias.GetRef()
            ObjectReference currDatumPowerSwitch = currDatum.MatchingPowerSwitch.GetRef()
            trace(self, "Processing a power switch! Activated switch: " + ActivatedPowerbox + ". Current Datum's Switch: " + currDatumPowerSwitch)

            ;Check to see if we should clean up intercoms related to this powerbox
            CleanUpIntercomList(PowerSwitchAlias)

            ;Check to see if all the power switches are thrown
            CheckForAllSwitchesSet()

            ;And if this isn't the power switch that controls the current intercom, stop processing
            if ActivatedPowerbox != currDatumPowerSwitch || (PrereqStage > 0 && !GetStageDone(PrereqStage))
                trace(self, ActivatedPowerbox + " is a later power switch. Canceling processing.")
                return
            endif
        endif

        trace(self, "Proceeding with processing the intercom triggering.")

        if currActiveIntercom != none
            UC05_Codin_LoopingIntercom.Stop()
        endif

        ;Clear the current active intercom and turn off the sound marker
        ActiveIntercom.Clear()
        ObjectReference SoundREF = IntercomSoundMarker.GetRef()
        SoundRef.Disable()

        if bRestartChain
            trace(self, "Resuming chain processing. Regrabbing the first datum in the list (in case that's changed).")
            currDatum = IntercomData[0]
            currIntercom = currDatum.TargetIntercom.GetRef()
            SkipUpdates = false
        endif

        if !SkipUpdates

        ;Check to see if there's a stage to set
            int currStage = currDatum.StageToSetOnActive

            if currStage >= 0
                (ActiveIntercom as UC05_ActiveIntercomAliasScript).UpdateStageToSet(currStage)
            EndIf

            ActiveIntercom.ForceRefTo(currIntercom)
            trace(self, "Active intercom is now: " + ActiveIntercom.GetRef())

            ;Move the marker for the scene            
            ObjectReference SceneREF = IntercomAudioSource.GetRef()
            SceneREF.MoveTo(currIntercom)

            ;Move the sound marker
            trace(self, "Sound marker is currently at: X: " + SoundREF.X + ". Y: " + SoundREF.Y + ". Z: " + SoundREF.Z)
            SoundREF.MoveTo(currIntercom)
            trace(self, "And now it should be moved to: X: " + SoundREF.X + ". Y: " + SoundREF.Y + ". Z: " + SoundREF.Z)
            SoundREF.Enable()

            ;Reenable the looping scene
            UC05_Codin_LoopingIntercom.Start()

            ;Move to the next item in the list
            if !SkipRemoval
                IntercomData.Remove(0)
                trace(self, "Intercom data removed. Remaining entries: " + IntercomData.Length)
            else
                trace(self, "Resmuing skip removal.")
                SkipRemoval = false
            endif
        endif

        if currDatum.WaitForRestart
            trace(self, "No more updates until we get a call to restart the chain.")
            SkipUpdates = true
            SkipRemoval = true
        endif
    endif
EndFunction

Function CleanUpIntercomList(ReferenceAlias akActivatedPowerSwitch)
    trace(self, "Cleaning up intercom list with switch alias: " + akActivatedPowerSwitch)
    int i = IntercomData.Length - 1
    trace(self, "Entries remaining: " + IntercomData.Length)

    while i >= 0
        IntercomDatum currDatum = IntercomData[i]

        ReferenceAlias currPowerSwitchAlias = currDatum.MatchingPowerSwitch
        ObjectReference IntercomREF = currDatum.TargetIntercom.GetRef()
        trace(self, "Comparing datum at index: " + i + " and has power switch alias: " + currPowerSwitchAlias)

        if currPowerSwitchAlias == akActivatedPowerSwitch
            trace(self, "We've got a match! Removing!")
            IntercomData.Remove(i)
        endif

        i -= 1
    endwhile
EndFunction

Function DEBUGPrintIntercomArray()
    int i = 0
    int iLength = IntercomData.Length

    While (i < iLength)
        trace(self, "Intercom alias remaining: " + IntercomData[i].TargetIntercom)

        i += 1
    EndWhile

EndFunction

Function CheckForAllSwitchesSet()
    int i = 0
    int iLength = PowerSwitchStages.Length
    bool bPowerSwitchesRemain

    while i < iLength && !bPowerSwitchesRemain
        int currStage = PowerSwitchStages[i]

        if !GetStageDone(currStage)
            bPowerSwitchesRemain = true
        endif

        i += 1
    endwhile

    if !bPowerSwitchesRemain
        SetStage(AllPowerOnStage)
    endif
EndFunction

Function IncrementIntercomState(int aiIncrementAmount = 1)
    LockGuard IntercomStateGuard
        IntercomState += aiIncrementAmount
    EndLockGuard
EndFunction

Function RemoveHaze(int abSwitch)
    int i = 0
    if abSwitch == 1
        ObjectReference[] VenomHazeGroupRef = Alias_VenomTreeHaze_Group01.GetArray()
        While i < VenomHazeGroupRef.Length
            VenomHazeGroupRef[i].PlayAnimation("stage2")
            i += 1
        endWhile
    elseif abSwitch == 2
        ObjectReference[] VenomHazeGroupRef = Alias_VenomTreeHaze_Group02.GetArray()
        While i < VenomHazeGroupRef.Length
            VenomHazeGroupRef[i].PlayAnimation("stage2")
            i += 1
        endWhile
    endif
endFunction

Function OpenShutters()
    int i = 0
    int iCount = Shutters.GetCount()

    while i < iCount
       ObjectReference currRef = Shutters.GetAt(i)

        currRef.PlayAnimation("Open")
        i += 1

    endwhile
EndFunction


;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC05", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction