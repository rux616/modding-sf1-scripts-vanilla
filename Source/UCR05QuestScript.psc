Scriptname UCR05QuestScript extends Quest Conditional

Struct TargetDatum
    ActorBase Target
    {Lvl used to spawn an appropriate NPC}

    int TargetIndex = -1
    {Index used to manage any custom dialogue or behaviors in the quest}
EndStruct

TargetDatum[] Property PossibleTargets Mandatory Const Auto
{Array of targets for the quest}

ReferenceAlias Property ChosenTarget Mandatory Const Auto
{Alias that holds the chosen target and any specific behaviors}

ReferenceAlias Property Bodyguard Mandatory Const Auto
{Alias for the player's bodyguard}

int Property TargetIndex = -1 Auto Conditional
{Property used to keep track of any custom dialogue/behaviors for this NPC}

RefCollectionAlias Property PossibleSpawnPoints Mandatory Const Auto
{Collection of possible spawn points for our target}

;Local vars
int iSpawnIndex

Event OnQuestInit()
    int iRand = Utility.RandomInt(0, PossibleTargets.Length - 1)

    if iRand < 0 || iRand >= PossibleTargets.Length
        iRand = 0
    endif

    iSpawnIndex = iRand
    trace(self, "Possible target is actor at index: " + iSpawnIndex + ". Form: " + PossibleTargets[iSpawnIndex])
    SpawnTarget(iRand)
EndEvent

Function SpawnTarget(int iTargetIndex = 0, bool bSpawnAtPlayer = false, bool bAttemptRespawn = false)
    if iTargetIndex < 0 || iTargetIndex >= PossibleTargets.Length
        Game.Warning("UCR05: Attempting to spawn target with index outside range!")
    else
        if bAttemptRespawn
            iTargetIndex = iSpawnIndex
        endif

        ;Choose out target type
        TargetDatum currDatum = PossibleTargets[iTargetIndex]
        ActorBase TargetType = currDatum.Target

        ;Pick the spawn point
        int iRand = Utility.RandomInt(0, PossibleSpawnPoints.GetCount() - 1)
        ObjectReference SpawnRef = PossibleSpawnPoints.GetAt(iRand)

        ;Get spawning!
        ObjectReference TargetRef = SpawnRef.PlaceAtMe(TargetType, abInitiallyDisabled = true, akAliasToFill = ChosenTarget)
        TargetRef.MoveToNearestNavmeshLocation()
        TargetRef.Enable()
        (TargetRef as Actor).EvaluatePackage()

        ;Spawn in the bodyguard
        Actor BodyACT = Bodyguard.GetActorRef()
        BodyACT.MoveTo(TargetRef)
        BodyACT.MoveToNearestNavmeshLocation()
        BodyAct.Enable()
    endif
EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UCR04", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction