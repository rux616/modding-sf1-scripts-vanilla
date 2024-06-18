Scriptname UC01QuestScript extends Quest Conditional

Struct ReleaseDatum
    ReferenceAlias TargetAlias
    int ActivationStage
EndStruct

Group Globals
    GlobalVariable Property UC01_SectorReleaseCountActivated Auto Const Mandatory
    {Global tracking how many releases the player has activated}

    GlobalVariable Property UC01_SectorReleaseCountTotal Auto Const Mandatory
    {Global tracking how many total releases the player needs to activate}
EndGroup

Group QuestStagesAndObjs
    int Property StartExamStage = 300 Const Auto
    {Direct the player to proceed to the examination hall}

    int Property AdaptabilityObj = 310 Const Auto
    {Objective index for the adaptability exam}

    int Property UnlockPilotingStage = 400 Const Auto
    {Player's completed the Adaptability exam. Unlock the piloting exam.}
EndGroup

Group ReferenceAliases
    ReferenceAlias[] Property OrientationTargets Mandatory Const Auto
    {Array of alias for the orientation targets}

    ReferenceAlias Property CurrentOrientationTarget Mandatory Const Auto
    {Alias for the currently active orientation target}
EndGroup

;LOCAL VARS
int iTimerID = 1 const
bool bInCooldown

Function UpdateOrientationTarget()
    int i = 0
    int iLength = OrientationTargets.Length

    while i < iLength
        ReferenceAlias currAlias = OrientationTargets[i]
        ObjectReference currRef = currAlias.GetRef()
        ObjectReference ActiveTarget = CurrentOrientationTarget.GetRef()

        if currRef && currRef != ActiveTarget
            CurrentOrientationTarget.ForceRefTo(currRef)
            return
        endif

        i += 1
    EndWhile
EndFunction

bool bProcessing
Function DisplaySceneComplete(ObjectReference akTargetRef)
    while bProcessing
        Utility.Wait(1.0)
    endwhile
    bProcessing = true
    Trace(self, "Display scene complete message received. Target object: " + akTargetRef)

    int i = 0
    int iLength = OrientationTargets.Length
    bool bFoundTarget

    while i < iLength && !bFoundTarget
        ReferenceAlias currAlias = OrientationTargets[i]
        ObjectReference currRef = currAlias.GetRef()
        Trace(self, "Looping through Orientation Targets. Current alias: " + currAlias + ". CurrRef: " + currRef)

        if currRef == akTargetRef
            Trace(self, "Clearing out object: " + currAlias.GetRef())
            currAlias.Clear()
            UpdateOrientationTarget()
            bFoundTarget = true
        endif

        i += 1
    endwhile

    int j = iLength - 1
    bool bScenesRemaining
    Trace(self, "Checking bScenesRemaining at init:  " + bScenesRemaining)

    while j >= 0 && !bScenesRemaining
        ReferenceAlias currAlias = OrientationTargets[j]
        ObjectReference AvailableRef = currAlias.GetRef()
        Trace(self, "Checking scenes remaining. Checking alias: " + currAlias + ". Still a ref in there: " + AvailableRef)

        if currAlias.GetRef() != none
           Trace(self, "CurrAlias:  " + currAlias + " has something in it: " + currAlias.GetRef())
            bScenesRemaining = true
            Trace(self, "Setting bScenesRemaining to:  " + bScenesRemaining)
        endif

        j -= 1
    EndWhile

    Trace(self, "bScenesRemaining after loop:  " + bScenesRemaining)


    if !bScenesRemaining
        SetStage(StartExamStage)
    endif

    bProcessing = false
EndFunction

Function DEBUGSkipCurrentDisplay()
    DisplaySceneComplete(CurrentOrientationTarget.GetRef())
EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC01", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction