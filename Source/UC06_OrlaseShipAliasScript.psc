Scriptname UC06_OrlaseShipAliasScript extends ReferenceAlias

GlobalVariable Property UC06_OnHitDebugEnabled Mandatory Const Auto
{If this is "1", this script will continually register for hit events, which is a complete waste of processing power}

int Property PreReqStage = 300 Auto Const
{If this stage is set and Orlase loads in, update his health}

int Property ShutdownStage = 550 Auto Const
{If this stage is set, the Orlase sequence is done, so we don't need to worry about this anymore}

int Property StageToSet = 301 Const Auto
{Player triggered the health increase. Set this stage to ensure it doesn't happen again}

Struct HealthDatum
    int PlayerLevel
    ActorValue TargetValue
    float UpdatedHealthValue
EndStruct

HealthDatum[] Property HealthData Mandatory Const Auto
{The list of health number we should set Orlase's ship to. This is based off the numbers for the LShip_CrimsonFleet_Combat_C}

Event OnAliasInit()
    RegisterForHitEvent(GetRef())
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
    trace(self, akTarget + " was attacked by: " + akAggressor + " with: " + akSource) 

    if UC06_OnHitDebugEnabled.GetValue() >= 1.0
        RegisterForHitEvent(GetRef())
    endif
EndEvent

Event OnLoad()
    Quest OQ = GetOwningQuest()

    if !OQ.GetStageDone(StageToSet) && OQ.GetStageDone(PreReqStage) && !OQ.GetStageDone(ShutdownStage)
        OQ.SetStage(StageToSet)
        HealthDatum TargetDatum = UpdateShipHealth()

        SpaceshipReference myShip = GetShipRef()
        myShip.SetValue(TargetDatum.TargetValue, TargetDatum.UpdatedHealthValue)
    endif  
EndEvent

HealthDatum Function UpdateShipHealth()
    int iPlayerLevel = Game.GetPlayer().GetLevel()

    int i = 0
    int iLength = HealthData.Length
    HealthDatum TargetDatum

    while i < iLength
        int iTargetLevel = HealthData[i].PlayerLevel
        TargetDatum = HealthData[i]

        if iTargetLevel >= iPlayerLevel
            return TargetDatum
        endif

        i += 1
    endwhile
    
    return TargetDatum
EndFunction
;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC06", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction