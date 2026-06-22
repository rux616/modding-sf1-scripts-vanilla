Scriptname UC09_HeatleechRefScript extends Actor

GlobalVariable Property UC09_Result Mandatory Const Auto
{Global used to manage the player's gameplay results after the UC questline}

GlobalVariable Property UC09_LeechNestCleanUpChance Mandatory Const Auto
{Percent chance a Heatleech nest will clean itself up when its loaded post-UC questline}

GlobalVariable Property UC09_LeechNestCleanUpCooldownLength Mandatory Const Auto
{If this nest isn't turned off, this global is used to manage how long we wait before checking again}

bool Property DisableOnLoadAfterQuestline = true Const Auto
{If you don't want this Heatleech nest disabling automatically on load, set this to "FALSE". 
NOTE: This should only be used for quest-related or scene objects. Ambiently placed ones should be always be marked "TRUE"}

Keyword Property DMP_AmbushMarker Mandatory Const Auto
{Keyword to connect the Leech to its ambush marker}

Keyword Property LinkAmbushTrigger Mandatory Const Auto
{Keyword to connect the Leech to its ambush trigger}

float Timestamp = 0.0 ;Used to time stamp this object so it's not constantly reevaluating every time a player approaches the object

Event OnCellLoad()
    if DisableOnLoadAfterQuestline
        trace(self, "Checking on load for ref:" + self + ". Current time: " + Utility.GetCurrentGameTime() + ". Timestamp: " + Timestamp + ". IsDisabled(): " + IsDisabled() + ". IsDestroyed(): " + IsDestroyed())

        if UC09_Result.GetValue() > 0 && !IsDisabled() && !IsDestroyed() && Timestamp < Utility.GetCurrentGameTime()

            int iRand = Utility.RandomInt(0, 100)
            trace(self, "Random roll: " + iRand)

            ;Turn off this nest permanently
            if iRand <= UC09_LeechNestCleanUpChance.GetValueInt()
                trace(self, "Shutting off this critter.")
                Disable()
                SetDestroyed()
                trace(self, "Is " + self + " disabled? " + IsDisabled())

                ;Check to see if the leech has an ambush trigger and furniture attached to it. 
                ;If so, turn those off as well
                ObjectReference AmbushTriggerRef = GetLinkedRef(LinkAmbushTrigger)
                if AmbushTriggerRef != none
                    AmbushTriggerRef.Disable()
                    AmbushTriggerRef.SetDestroyed()
                    trace(self, "Is " + AmbushTriggerRef + " disabled? " + AmbushTriggerRef.IsDisabled())
                endif

                ObjectReference AmbushMarkerRef = GetLinkedRef(DMP_AmbushMarker)
                if AmbushMarkerRef != none
                    AmbushMarkerRef.Disable()
                    AmbushMarkerRef.SetDestroyed()
                    trace(self, "Is " + AmbushMarkerRef + " disabled? " + AmbushMarkerRef.IsDisabled())
                endif

            ;Leave this nest on for now and timestamp it
            else
                Timestamp = Utility.GetCurrentGameTime() + UC09_LeechNestCleanUpCooldownLength.GetValue()
            endif
        endif
    endif
EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC09", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction