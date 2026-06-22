Scriptname OE_AliasOnDistanceLessThan extends ReferenceAlias default
{Sets a stage when the distance between this an a target alias is less than a target distance.}

Group Required_Data
	ReferenceAlias Property TargetAlias Auto Const Mandatory
	{The Alias to check versus the Owning Alias}

    bool Property CheckPlayer Auto Const Mandatory 
    {This checks the Player to see if they are }

	float Property TargetDistance Auto Const Mandatory
	{The needed distance between this and the target}

	int Property StageToSet = -1 Auto Const Mandatory
	{Stage to Set}
EndGroup

Group Optional_Data
	Int Property PrereqStage = -1 Auto Const
	{Stage that must be set for this script's functionality to execute}
EndGroup

Group Debug_Properties
    Bool Property ShowTraces = FALSE Auto Const
    {(Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives.}
EndGroup

Actor Player

Event OnAliasInit()
	DefaultScriptFunctions.Trace(self, "DefaultAliasOnDistanceLessThan: OnAliasInit()", ShowTraces)
    Player = Game.GetPlayer()

	;If we're waiting for a stage to set this value, register for that event now
	Quest myQuest = GetOwningQuest()
	If PrereqStage > -1 && myQuest.GetStageDone(PrereqStage) == false
		RegisterForRemoteEvent(myQuest, "OnStageSet")
	;Otherwise, register for the distance event now
	Else
        If CheckPlayer
            RegisterForDistanceLessThanEvent(Self, TargetAlias, TargetDistance)
        EndIf 

        If TargetAlias
		    RegisterForDistanceLessThanEvent(Self, TargetAlias, TargetDistance)
        EndIf 
	endif
EndEvent

Event Quest.OnStageSet(Quest akSender, int auiStageID, int auiItemID)
	DefaultScriptFunctions.Trace(self, "DefaultAliasOnDistanceLessThan: OnStageSet() akSender: " + akSender + ", auiStageID: " + auiStageID + ", auiItemID: " + auiItemID, ShowTraces)

	;When the proper stage is set, register for the distance less than event
    if auiStageID == PrereqStage
		RegisterForDistanceLessThanEvent(Self, TargetAlias, TargetDistance)
    	UnregisterForRemoteEvent(GetOwningQuest(), "OnStageSet")
    endif
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
	DefaultScriptFunctions.Trace(self, "DefaultAliasOnDistanceLessThan: OnDistanceLessThan() akObj1: " + akObj1 + ", akObj2: " + akObj2 + ", afDistance: " + afDistance + ", aiEventID: " + aiEventID, ShowTraces)
	if StageToSet > -1
		GetOwningQuest().SetStage(StageToSet)
	endif
EndEvent


