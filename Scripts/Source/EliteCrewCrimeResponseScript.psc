Scriptname EliteCrewCrimeResponseScript extends CompanionCrimeResponseScript
{***REMINDER
all actors with this script MUST have their own "personal crime faction" faction that has a shared crime faction list of factions they consider "civilians"
}

Group Autofill
SQ_CrewScript Property SQ_Crew Mandatory Const Auto
message Property EliteCrew_Angry_Message Mandatory Const Auto
EndGroup

ActorValue Property CREW_Elite_IsAngry Mandatory Const Auto

float TimerDur_CrewAngerTime = 6.0 const
int GameTimerID_CrewAnger = 200 const ;REMINDER don't clash with timer ids in parent

;cool down timer on anger
Event OnTimerGameTime(int aiTimerID)
    Trace(self, "OnTimerGameTime() aiTimerID: " + aiTimerID + ",  first calling parents event")
    Parent.OnTimerGameTime(aiTimerID)

    if aiTimerID == GameTimerID_CrewAnger
        SetValue(CREW_Elite_IsAngry, 0)
    endif
EndEvent

Event OnActivate(ObjectReference akActionRef)
    Parent.OnActivate(akActionRef) ;in case we add it in the future
    
    if akActionRef == Game.GetPlayer() && GetValue(CREW_Elite_IsAngry)
        Trace(self, "OnActivate() Is Angry, showing " + EliteCrew_Angry_Message)
        SQ_Crew.ShowTextReplacedMessage(self, EliteCrew_Angry_Message)
    endif
EndEvent


bool Function AmIAngry()
    bool returnVal = GetValue(CREW_Elite_IsAngry) == 1
    
    Trace(self, "AmIAngry() returnVal: " + returnVal)

    return returnVal
endFunction

;overridden function from parent script:
Function CivilianKilled(Actor CivilianActor) Protected
	Trace(self, "CivilianKilled()")
	AffinityEventOnKill.Send(CivilianActor)
	AutoDismiss()
EndFunction

;overridden function from parent script:
Function AutoDismiss() Protected
	Trace(self, "AutoDimiss()")
    if SQ_Crew.IsActiveEliteCrew(self)
        MakeAngry()
        SQ_Crew.SetEliteCrewInactive(self) ;combat is also ultimately stopped here
    endif
EndFunction

Function MakeAngry()
    Trace(self, "MakeAngry() ")
    SetValue(CREW_Elite_IsAngry, 1)
    StartTimerGameTime(TimerDur_CrewAngerTime, GameTimerID_CrewAnger)
EndFunction