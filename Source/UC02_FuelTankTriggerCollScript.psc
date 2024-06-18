Scriptname UC02_FuelTankTriggerCollScript extends RefCollectionAlias

ReferenceAlias Property Terrormorph Mandatory Const Auto
{Ref alias for the Terrormorph}

GlobalVariable Property UC02_PlayerTankDetonationDistance Mandatory Const Auto
{How close the player needs to be to count as "triggering" the tank}

Scene Property UC02_602_DetonatingFuelTank Mandatory Const Auto
{Scene to play when detonating a fuel tank}

float Property SceneCooldownTimerLength = 3.0 Const Auto
{How long to wait between scene triggerings}

int Property ShutdownStage = 700 Const Auto
{If this stage is set, Terrormorph is dead, so we don't need to }

int Property BlewAtLeastOneTankStage = 660 Const Auto
{Stage to set if the player detonated at least one tank}

bool bInCooldown
int iCooldownTimerID = 1 const

Event OnTriggerEnter(ObjectReference akSenderRef, ObjectReference akActionRef)
    Actor TerrorACT = Terrormorph.GetActorRef()
    Quest myQuest = GetOwningQuest()
    trace(self, "Trigger entered: " + akSenderRef + ". Entered by: " + akActionRef + ". Terrormorph: " + TerrorACT)
    if akActionRef == TerrorAct && !TerrorAct.IsDead() && !myQuest.GetStageDone(ShutdownStage)
        trace(self, "Morph's alive. Proceed.")

        if Game.GetPlayer().GetDistance(akSenderRef) <= UC02_PlayerTankDetonationDistance.GetValue()
            ObjectReference LinkedTank = akSenderRef.GetLinkedRef()
            trace(self, "Player's within range of the trigger. Get its linked tank: " + LinkedTank)

            if LinkedTank
                trace(self, "Blow the tank!")
                RemoveRef(akSenderRef)
                myQuest.SetStage(BlewAtLeastOneTankStage)

                if !bInCooldown
                    trace(self, "Put Hadrian's scene in cooldown.")
                    bInCooldown = true
                    UC02_602_DetonatingFuelTank.Start()
                    StartTimer(SceneCooldownTimerLength, iCooldownTimerID)
                EndIf
            endif

        endif
    endif
EndEvent

Event OnTimer(int aiTimerID)
    if aiTimerID == iCooldownTimerID
        bInCooldown = false
    endif
EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC02", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction