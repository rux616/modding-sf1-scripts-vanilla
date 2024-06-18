Scriptname UC01_RockAliasScript extends ReferenceAlias

int Property ExitStageToSet = 1000 Const Auto
{Stage to set if the player has chosen to bail}

Message Property UC01_ShipSim_LeaveSequence Mandatory Const Auto
{Message to display to allow the player to leave the sequence if they haven't passed the exam}

Message Property UC01_ShipSim_LeaveSequence_Success Mandatory Const Auto
{Message to display to allow the player to leave the sequence if they HAVE passed}

Message Property UC01_ShipSim_LeaveSequence_Complete Mandatory Const Auto
{Message to display if the player has completed all enemy tiers}

GlobalVariable Property  UC01_ShipSim_MinKillsRequired Mandatory Const Auto
{Min number of kills required to pass this exam}

GlobalVariable Property  UC01_ShipSim_PlayerKillCount Mandatory Const Auto
{How many kills the player got on this playerthrough}

GlobalVariable Property UC01_ShipSim_TotalEnemyCount Auto Const Mandatory
{Variable used to keep track of the total number of possible enemy ships}

bool bSimStarted

Event OnActivate(ObjectReference akActionRef)
    trace(self, " activated.")
    Message MessageToShow
    float fKillCount = UC01_ShipSim_PlayerKillCount.GetValue()
    float fTotalEnemies = UC01_ShipSim_TotalEnemyCount.GetValue()

    if fKillCount >= fTotalEnemies
        MessageToShow = UC01_ShipSim_LeaveSequence_Complete
    elseif fKillCount >= UC01_ShipSim_MinKillsRequired.GetValue()
        MessageToShow = UC01_ShipSim_LeaveSequence_Success
    else
        MessageToShow = UC01_ShipSim_LeaveSequence
    endIF

    if bSimStarted
        int iButtonResponse = MessageToShow.Show(fKillCount, fTotalEnemies)
        if iButtonResponse == 1
            TriggerSimShutdown()
        endif
    else
        TriggerSimShutdown()
    endif
EndEvent

Function StartSequence()
    bSimStarted = true
EndFunction

Function TriggerSimShutdown()
        bSimStarted = false
        UC01_ShipSimulationQuestScript myInst = GetOwningQuest() as UC01_ShipSimulationQuestScript
        myInst.ShutdownSimulation()
        myInst.SetStage(ExitStageToSet)
EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC01", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction