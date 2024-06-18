Scriptname DefaultQuestDistanceCheckScript extends Quest Const Default
{Checks alias's distance to player, then sets stage}

struct DistanceCheckStage
	ReferenceAlias TargetAlias
	{The alias we're interested in}

	Int StageToSet = -1
	{Stage to Set}

	float TargetDistance
	{The needed distance between this and the target}

	bool DistanceLessThan = true
	{OPTIONAL - If true (default) checks if distance is less than. If false, checks if distance is greater than.}

	Int PrereqStage = -1
	{OPTIONAL - Stage that must be set for this script's functionality to execute}

	Int TurnOffStage = -1
	{OPTIONAL - If stage >= TurnOffStage, this script's functionality is ignored}
endStruct


DistanceCheckStage[] property DistanceCheckStages auto Const
{ array of stage/distance check data }


Event OnQuestInit()
	; register for distance check
	Actor player = Game.GetPlayer()

	int i = 0
	while i < DistanceCheckStages.Length
		DistanceCheckStage theDistanceCheck = DistanceCheckStages[i]
		RegisterForDistanceCheck(theDistanceCheck, player)
		i += 1
	endWhile
endEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
	; akObj1 is always the player
	Debug.Trace(self + " " + akObj2 + " OnDistanceLessThan " + afdistance + " Event ID = " + aiEventID)
	CheckDistanceStages(true, akObj2)
endEvent

Event OnDistanceGreaterThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
	; akObj1 is always the player
	Debug.Trace(self + " " + akObj2 + " OnDistanceGreaterThan " + afdistance + " Event ID = " + aiEventID)
	CheckDistanceStages(false, akObj2)
endEvent

; watch for prereq stages to be set, to register for the right event
Event OnStageSet(int auiStageID, int auiItemID)
	int index = 0
	; need to loop in case multiple entries in DistanceCheckStages use the same PrereqStage
	while index > -1 && index < DistanceCheckStages.Length
		index = DistanceCheckStages.FindStruct("PrereqStage", auiStageID, index)
		if index > -1
			DistanceCheckStage theDistanceCheck = DistanceCheckStages[index]
			Debug.Trace(self + " OnStageSet " + auiStageID + " matches prereq stage on " + theDistanceCheck)
			; if my stage isn't set and I'm not past TurnOff stage, register me
			if GetStageDone(theDistanceCheck.StageToSet) == false && ( theDistanceCheck.TurnOffStage == -1 || GetStage() < theDistanceCheck.TurnOffStage )
				Debug.Trace(self + " 	stage " + theDistanceCheck.StageToSet + " not set yet: register for distance check event")
				RegisterForDistanceCheck(theDistanceCheck, Game.GetPlayer())
			endif
			index += 1 ; search again starting after the one we just found
		endif
	endWhile
EndEvent

function CheckDistanceStages(bool bDistanceLessThan, ObjectReference theRef)
	int i = 0
	while i < DistanceCheckStages.Length
		DistanceCheckStage theDistanceCheck = DistanceCheckStages[i]
		if theDistanceCheck.TargetAlias.GetRef() == theRef && theDistanceCheck.DistanceLessThan == bDistanceLessThan
			; this is the ref from the event we just got
			if ( theDistanceCheck.TurnOffStage == -1 || GetStage() < theDistanceCheck.TurnOffStage )
				debug.trace(self + " setting stage " + theDistanceCheck.StageToSet)
				SetStage(theDistanceCheck.StageToSet)
			endif
		endif
		i += 1
	endWhile
endFunction

function RegisterForDistanceCheck(DistanceCheckStage theDistanceCheck, ObjectReference targetRef)
	; only register if no prereq stage or prereqStage has been set
	debug.trace(self + " RegisterForDistanceCheck prereqStage=" + theDistanceCheck.PrereqStage)
	if theDistanceCheck.PrereqStage == -1 || GetStageDone(theDistanceCheck.PrereqStage)
		debug.trace(self + " 	either no prereqStage or prereqStage is set - register for event")
		if theDistanceCheck.DistanceLessThan
			debug.trace(self + " 	registering for " + theDistanceCheck.TargetAlias + " to be less than " + theDistanceCheck.TargetDistance + " from the player")
			RegisterForDistanceLessThanEvent(targetRef, theDistanceCheck.TargetAlias, theDistanceCheck.TargetDistance)
		else
			debug.trace(self + " 	registering for " + theDistanceCheck.TargetAlias + " to be greater than " + theDistanceCheck.TargetDistance + " from the player")
			RegisterForDistanceGreaterThanEvent(targetRef, theDistanceCheck.TargetAlias, theDistanceCheck.TargetDistance)
		endif
	endif
endFunction