Scriptname UC04_PlayerAliasScript extends ReferenceAlias

Location Property CityNewAtlantisLocation Mandatory Const Auto
{New Atlantis location}

int Property PrereqStage = 425 Auto Const
{Once this stage is set, turn on the combat music}

int Property ShutdownStage = 850 Auto Const
{Once this stage is set, we can stop checking this}

int Property FailsafeStage = 910 Auto Const
{In case the music didn't get turned off earlier, try it again at this stage}

MusicType Property MUSGenesisCombat_UC04 Mandatory Const Auto
{Music type object for the UC attakc music}

ConditionForm Property UC04_WeaponIsTypeEM Mandatory Const Auto
{Condition for to check to see if the player's equipped an EM weapon}

int Property EMSectionStageToSet = 581 Const Auto
{Player equipped an EM weapon during the NAT sequence. Update their objectives if they're still valid}

int Property EMSectionPrereqStage = 600 Const Auto
{Only start checking the player's equip events if this stage has been set}

int Property EMSectionShutdownStage = 590 Const Auto
{Once this stage is set, stop checking for the player equipping the EM weapon during the NAT sequence}


bool bMusicActive
Event OnAliasInit()
    trace(self, "Registering for stage set events.")
    RegisterForRemoteEvent(GetOwningQuest(), "OnStageSet")
EndEvent

Event Quest.OnStageSet(Quest akSender, int auiStageID, int auiItemID)
    trace(self, "Stage Set: " + auiStageID)
    if auiStageID == PrereqStage
        trace(self, "Turning on combat music.")
        ToggleCombatMusic()
    elseif auiStageID == ShutdownStage
        ToggleCombatMusic(false)
        trace(self, "Turning off combat music.")
    elseif auiStageID == FailsafeStage
        ToggleCombatMusic(false)
        trace(self, "Turning off combat music.")
    endif
EndEvent

Function ToggleCombatMusic(bool bMusicOn = true)
    trace(self, "Combat music active: " + bMusicActive)
    if bMusicOn
        if !bMusicActive
            bMusicActive = true
            MUSGenesisCombat_UC04.Add()
            trace(self, "Combat music active.")
        endif
    elseif !bMusicOn
        if bMusicActive
            bMusicActive = false
            MUSGenesisCombat_UC04.Remove()
            trace(self, "Combat music disabled.")
        endif
    endif
EndFunction

Event OnItemEquipped(Form akBaseObject, ObjectReference akReference)
    Quest OQ = GetOwningQuest()
    Trace(self, "Item equipped: " + akBaseObject + ". akReference: " + akReference + ". Is UC04_WeaponTypeIsEM form true?: " + UC04_WeaponIsTypeEM.IsTrue())

    if UC04_WeaponIsTypeEM.IsTrue() && OQ.GetStageDone(EMSectionPrereqStage) && !OQ.GetStageDone(EMSectionShutdownStage) && !OQ.GetStageDone(EMSectionStageToSet)
        OQ.SetStage(EMSectionStageToSet)
    endif
EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC04", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction