Scriptname SFBGS00D:CruiseModeTestSupportScript extends Quest
{Script used to support QA needs for testing where Cruise mode setup may need changed.}

Group Autofill
    Quest Property MQ101 Auto Const
    {Mainline quest to track}

    Quest Property SFBGS00D_CruiseMode_Tutorial Mandatory Const Auto
    {Cruise Mode Tutorial quest}

    GlobalVariable Property MQ101Debug Mandatory Const Auto
    {QA testing global variable to check for us of}
EndGroup

Group QuestProperties
    Int Property SFBGS00D_CruiseMode_TutorialEnableStage=10 Mandatory Const Auto
    {Stage in Cruise Tutorial quest that enables Cruise mode}

    Int Property MQ101StageToCheck=1310 Mandatory Const Auto
    {MQ101 stage to check that show MQ101DebugGlobal has been used (1310)}
EndGroup

Event OnQuestStarted()
    RegisterForRemoteEvent(MQ101, "OnStageSet")
EndEvent

Event Quest.OnStageSet(Quest aksender, int auiStageID, int auiItemID)
    If ((akSender == MQ101) && (auiStageID == MQ101StageToCheck))
        If MQ101Debug.GetValue() == 8 
            ;Has MQ101 been set to use the QA debug stage? Then set the stage on Cruise tutorial that enables Cruise Mode...
            SFBGS00D_CruiseMode_Tutorial.SetStage(SFBGS00D_CruiseMode_TutorialEnableStage)

            ;Shutdown this script's holding quest and cleanup
            UnregisterForRemoteEvent(MQ101, "OnStageSet")
            SetStage(1000)
        Else 
            ;MQ101 has progressed naturally not using QA cheat, cleanup and shut down quest
            ;Shutdown this script's holding quest and cleanup
            UnregisterForRemoteEvent(MQ101, "OnStageSet")
            SetStage(1000)
        EndIf
    EndIf
EndEvent
