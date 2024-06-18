Scriptname UC08_AB_HostileThrallCollScript extends RefCollectionAlias

RefCollectionAlias Property SubsequentCollection Const Auto
{Once this collection is emptied, which one spawns next?}

RefCollectionAlias Property ActiveHostiles Const Auto Mandatory
{Ref collection that contains only the active enemy NPCs}

int Property StageToSetOnEmpty = -1 Auto Const
{Stage to set once this collection has been emptied}

GlobalVariable Property UC08_AB_SwitchCount Mandatory Const Auto
{Count of the number of switches to be thrown. If greater than 2, the Queen has lost her ability to call in reinforcements}

GlobalVariable Property UC08_AB_NextWaveTimer Mandatory Const Auto
{Global used to managed the amount ot time between the Queen's spawns}

GlobalVariable Property UC08_AB_WaveCount Mandatory Const Auto
{Count of how many enemy waves have fired off. Used to change up the dialogue lines from Percival.}

bool Property TriggerNextWaveOnEmpty = true Auto Const
{If set to true, when this wave is empty, start a timer to spawn the next one}

bool Property PlayIncomingEnemiesScene = true Auto Const
{If set to true, use one of the generic "enemies incoming" scenes}

float Property MinTimerMultiper = 0.75 Const Auto
{Multiplier for the min amount of time a next wave should take to trigger}

float Property MaxTimerMultiper = 1.25 Const Auto
{Multiplier for the max amount of time a next wave should take to trigger}

Scene Property UC08_QueenBattle_Percival_EnemiesInbound Mandatory Const Auto
{Scene to play when non-Morph enemies are inbound}

Scene Property UC08_QueenBattle_Percival_MorphsInbound Mandatory Const Auto
{Scene to play when Morphs are inbound}

;Local vars
bool WaveTriggered
bool EnemiesEnabled

Function TriggerWave()
    WaveTriggered = true
    trace(self, "Wave triggered. Wave Count: " + UC08_AB_WaveCount.GetValueInt() + ". WaveTriggered?: " + WaveTriggered + ". Count: " + GetCount() + ". Switches thrown: " + UC08_AB_SwitchCount.GetValueInt())
    CheckForEmpty()
EndFunction

Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
    RemoveRef(akSenderRef)
    CheckForEmpty()
EndEvent

Function CheckForEmpty()
    if WaveTriggered 
        if GetCount() <= 0 && UC08_AB_SwitchCount.GetValueInt() < 3

            ;Set up the timer for the next wave if that's desired behavior
            if TriggerNextWaveOnEmpty
                trace(self, "All enemies killed. Shut it down and prep for the next one.")    
                int WaveTimerBase = UC08_AB_NextWaveTimer.GetValueInt()
                int iMinTime = (WaveTimerBase * MinTimerMultiper) as int
                int iMaxTime = (WaveTimerBase * MaxTimerMultiper) as int
                int iTimerLength = Utility.RandomInt(iMinTime, iMaxTime)
                trace(self, "Timer starting with length: " + iTimerLength)    
                StartTimer(iTimerLength)
            endif

            ;Set the next stage if that's available
            if StageToSetOnEmpty >= 0
               GetOwningQuest().SetStage(StageToSetOnEmpty)
            endif
        elseif !EnemiesEnabled
            EnemiesEnabled = true
            ;Everything hasn't yet been cleaned out. Get those enemies ready to scrap
            UC08_AB_WaveCount.Mod(1)
            trace(self, "Wave count updated to: " + UC08_AB_WaveCount.GetValueInt())    
            EnableAll()
            ActiveHostiles.AddRefCollection(self)
            trace(self, "Active Hostiles count: " + ActiveHostiles.GetCount())    
        endif
    endif
EndFunction

Event OnTimer(int aiTimerID)
    trace(self, "Timer complete.")
    if UC08_AB_SwitchCount.GetValueInt() < 3
        UC08_AB_HostileThrallCollScript NextColl = SubsequentCollection as UC08_AB_HostileThrallCollScript

        if NextColl != none
            NextColl.TriggerWave()
            
            if PlayIncomingEnemiesScene
                int icurrWave = UC08_AB_WaveCount.GetValueInt()
                trace(self, "Kicking off the wave for the next collection. Wave Count: " + icurrWave)
                if icurrWave == 4
                    UC08_QueenBattle_Percival_MorphsInbound.Start()
                elseif icurrWave > 1
                    UC08_QueenBattle_Percival_EnemiesInbound.Start()
                endif
            endif
        endif    
    endif
EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC08", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction