Scriptname CityLife_LVC_AliasScript extends ReferenceAlias

int Property SceneCompleteStage = 200 Const Auto
{When this stage is set, update this NPC}

ActorValue Property UC_NA_CL_SceneComplete Mandatory Const Auto
{Actor value used to tag these NPCs with their post scene packages}

float Property MinEVPWait = 0.1 Const Auto
{Minimum amount of wait time before eval'ing}

float Property MaxEVPWait = 0.5 Const Auto
{Max amount of wait time before eval'ing}

bool Property DisablePostScene = true  Const Auto
{If TRUE, when SceneCompleteStage is set, this NPC will disable as soon as they unload the first time}

Event OnAliasInit()
    RegisterForRemoteEvent(GetOwningQuest(), "OnStageSet")
EndEvent

Event Quest.OnStageSet(Quest akSender, int auiStageID, int auiItemID)
    if auiStageID == SceneCompleteStage && akSender == GetOwningQuest()
        UnregisterForRemoteEvent(GetOwningQuest(), "OnStageSet")
        UpdateCLNPC()
    endif
EndEvent

Function UpdateCLNPC()
    trace(self, "CityLife: Updating NPC.")
    Actor currAct = GetActorRef()

    if currACT != none
        currAct.SetValue(UC_NA_CL_SceneComplete, 1.0)
        float fRand = Utility.RandomFloat(MinEVPWait, MaxEVPWait)
        trace(self, "CityLife: Wait before eval: " + fRand)
        Utility.Wait(fRand)
        currAct.EvaluatePackage()
    endif
EndFunction

Event OnUnload()
    if DisablePostScene && GetOwningQuest().GetStageDone(SceneCompleteStage)
        GetRef().Disable()
    endif
EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "CityLife", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction