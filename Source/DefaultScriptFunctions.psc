Scriptname DefaultScriptFunctions Const Hidden
import CommonArrayFunctions

Struct ParentScriptFunctionParams
	ObjectReference RefToCheck
	Location LocationToCheck
	Location LocationToCheckOther
EndStruct

ParentScriptFunctionParams Function BuildParentScriptFunctionParams(ObjectReference RefToCheck, Location LocationToCheck, Location LocationToCheckOther = NONE) Global
	ParentScriptFunctionParams newParams = new ParentScriptFunctionParams

	newParams.RefToCheck = RefToCheck
	newParams.LocationToCheck = LocationToCheck
	newParams.LocationToCheckOther = LocationToCheckOther

	return newParams
EndFunction

;Called by Default scripts to try to set a stage, passingin various things to test.
;if PlayerOnly == true, then RefToCheck will be forced to be the Player or the Player's ship if the player is flying a ship
; RETURN:
; 	true = set the stage (or stage already set)
; 	false = didn't pass conditions to set stage
bool Function TryToSetStage(	ScriptObject CallingObject, \
								bool ShowNormalTrace, \
								\
								Quest QuestToSet, \
								Int StageToSet, \
								Int PrereqStage, \
								Int TurnOffStage, \
								int TurnOffStageDone, \
								\
								ObjectReference RefToCheck, \
								Bool PlayerOnly, \
								ObjectReference[] ReferencesToCheckAgainst, \
								ReferenceAlias[] AliasesToCheckAgainst, \
								Faction[] FactionsToCheckAgainst, \
								\
								Location LocationToCheck, \
								Location LocationToCheckOther, \
								Location[] LocationsToCheckAgainst, \
								LocationAlias[] LocationAliasesToCheckAgainst, \
								bool LocationMatchIfChild, \
								\
								ObjectReference CheckAliveActorOrShip, \
								bool FailOnDeadActor, \
								\
								ConditionForm ConditionFormToTest )  Global	

	Trace(CallingObject, "DefaultScriptFunctions.TryToSetStage() QuestToSet=" + QuestToSet + ", RefToCheck=" + RefToCheck, ShowNormalTrace)
	bool returnVal = IsValidToSetStage(	CallingObject = CallingObject, \
										ShowNormalTrace = ShowNormalTrace, \
										\
										QuestToSet = QuestToSet, \
										StageToSet = StageToSet, \
										PrereqStage = PrereqStage, \
										TurnOffStage = TurnOffStage, \
										TurnOffStageDone = TurnOffStageDone, \
										\
										RefToCheck = RefToCheck, \
										PlayerOnly = PlayerOnly, \
										ReferencesToCheckAgainst = ReferencesToCheckAgainst, \
										AliasesToCheckAgainst = AliasesToCheckAgainst, \
										FactionsToCheckAgainst = FactionsToCheckAgainst, \
										\
										LocationToCheck = LocationToCheck, \
										LocationToCheckOther = LocationToCheckOther, \
										LocationsToCheckAgainst = LocationsToCheckAgainst, \
										LocationAliasesToCheckAgainst = LocationAliasesToCheckAgainst, \
										LocationMatchIfChild = LocationMatchIfChild, \
										\
										CheckAliveActorOrShip = CheckAliveActorOrShip, \
										FailOnDeadActor = FailOnDeadActor, \
										\
										ConditionFormToTest = ConditionFormToTest )

	if returnVal
		Trace(CallingObject, "DefaultScriptFunctions.TryToSetStage() returnVal:" + returnVal + ", calling SafeSetStage() ", ShowNormalTrace)
		SafeSetStage(CallingObject = CallingObject, ShowNormalTrace = ShowNormalTrace, QuestToSet = QuestToSet, StageToSet = StageToSet)
	endif
	
	return returnVal
EndFunction

;casts to actor or spaceshipreference as required
bool Function IsDead(ObjectReference ActorOrSpaceshipToTest) Global
	Actor actorRef = ActorOrSpaceshipToTest as Actor
	if actorRef
		return actorRef.IsDead()
	else
		SpaceshipReference shipRef = ActorOrSpaceshipToTest as SpaceshipReference
		if shipRef
			return shipRef.IsDead()
		endif
	endif
	return false
EndFunction


;Used by Default scripts to test if we would set a stage when calling TryToSetStage()
;if PlayerOnly == true, then RefToCheck will be forced to be the Player or the Player's ship if the player is flying a ship
; Returns whether this stage can be validly set, given the specified conditions.
; RETURN:
;   true = Passed conditions to set stage (or stage already set)
;   false = Didn't pass conditions to set stage
bool Function IsValidToSetStage(	ScriptObject CallingObject, \
									bool ShowNormalTrace, \
									\
									Quest QuestToSet, \
									Int StageToSet, \
									Int PrereqStage, \
									Int TurnOffStage, \
									int TurnOffStageDone, \
									\
									ObjectReference RefToCheck, \
									Bool PlayerOnly, \
									ObjectReference[] ReferencesToCheckAgainst, \
									ReferenceAlias[] AliasesToCheckAgainst, \
									Faction[] FactionsToCheckAgainst, \
									\
									Location LocationToCheck, \
									Location LocationToCheckOther, \
									Location[] LocationsToCheckAgainst, \
									LocationAlias[] LocationAliasesToCheckAgainst, \
									bool LocationMatchIfChild, \
									\
									ObjectReference CheckAliveActorOrShip, \
									bool FailOnDeadActor, \
									\
									ConditionForm ConditionFormToTest )  Global
	
	Trace(CallingObject, "DefaultScriptFunctions.IsValidToSetStage()... RefToCheck=" + RefToCheck + " PlayerOnly=" + PlayerOnly, ShowNormalTrace)

	bool returnVal = false	

	returnVal = CheckForStages(CallingObject = CallingObject, ShowNormalTrace = ShowNormalTrace, QuestToSet = QuestToset, PrereqStage = PrereqStage, TurnOffStage = TurnOffStage, TurnOffStageDone = TurnOffStageDone)

	if returnVal
		returnVal = CheckForConditionForm(CallingObject = CallingObject, ShowNormalTrace = ShowNormalTrace, ConditionFormToTest = ConditionFormToTest)
	EndIf

	if returnVal
		returnVal = CheckForAliveActor(CallingObject = CallingObject, ShowNormalTrace = ShowNormalTrace, CheckAliveActorOrShip = CheckAliveActorOrShip, FailOnDeadActor = FailOnDeadActor)
	EndIf

	if returnVal		
		returnVal = CheckForReferenceMatches(	CallingObject = CallingObject, \
										ShowNormalTrace = ShowNormalTrace, \
										\
										RefToCheck = RefToCheck, \
										PlayerOnly = PlayerOnly, \
										ReferencesToCheckAgainst = ReferencesToCheckAgainst, \
										AliasesToCheckAgainst = AliasesToCheckAgainst, \
										FactionsToCheckAgainst = FactionsToCheckAgainst )
	endif
	
	if returnVal		
		returnVal = CheckForLocationMatches(	CallingObject = CallingObject, \
												ShowNormalTrace = ShowNormalTrace, \
												\
												LocationToCheck = LocationToCheck, \
												LocationToCheckOther = LocationToCheckOther, \
												LocationsToCheckAgainst = LocationsToCheckAgainst, \
												LocationAliasesToCheckAgainst = LocationAliasesToCheckAgainst, \
												LocationMatchIfChild = LocationMatchIfChild )
	endif

	Trace(CallingObject, "DefaultScriptFunctions.IsValidToSetStage() returnVal: " + returnVal, ShowNormalTrace)
	
	return returnVal
EndFunction

;sets stage or doesn't if we don't have stage to set to
function SafeSetStage(ScriptObject CallingObject, bool ShowNormalTrace, Quest QuestToSet, int StageToSet) global
	Trace(CallingObject, "SafeSetStage() " + QuestToSet + " stage " + StageToSet, ShowNormalTrace)
	if QuestToSet && StageToSet > -1
		QuestToSet.setStage(StageToSet)
	endif
endFunction

;returns true if the various stage checks are true, or if we don't care.
bool Function CheckForStages(	ScriptObject CallingObject, \
								bool ShowNormalTrace, \
								Quest QuestToSet, \
								int PrereqStage, \
								int TurnOffStage, \
								int TurnOffStageDone ) global
	Trace(CallingObject, "CheckForStages()...", ShowNormalTrace)

	bool returnVal = true

	if QuestToSet != None
		if (PrereqStage > -1 && QuestToSet.GetStagedone(PrereqStage) == FALSE)
			Trace(CallingObject, "DefaultScriptFunctions.CheckForStages(): Prereq stage not set.", ShowNormalTrace)
			returnVal = false
		elseif (TurnOffStage > -1 && QuestToSet.GetStage() >= TurnOffStage)
			Trace(CallingObject, "DefaultScriptFunctions.CheckForStages(): Current stage >= TurnOffStage.", ShowNormalTrace)
			returnVal = false
		elseif (TurnOffStageDone > -1 && QuestToSet.GetStageDone(TurnOffStageDone) == TRUE)
			Trace(CallingObject, "DefaultScriptFunctions.CheckForStages(): GetStageDone(TurnOffStageDone) = true.", ShowNormalTrace)
			returnVal = false
		endif
	endif

	Trace(CallingObject, "CheckForStages() returnVal: " + returnVal, ShowNormalTrace)
	return returnVal
EndFunction

;returns true if the condition form is true or if we don't care
bool Function CheckForConditionForm(	ScriptObject CallingObject, \
										bool ShowNormalTrace, \
										ConditionForm ConditionFormToTest) Global
	bool returnVal = ConditionFormToTest == false || ConditionFormToTest.IsTrue()
	
	Trace(CallingObject, "CheckForConditionForm() returnVal: " + returnVal, ShowNormalTrace)
	return returnVal
EndFunction

;returns true of the actor is alive or if we don't care
bool Function CheckForAliveActor( 	ScriptObject CallingObject, \
									bool ShowNormalTrace, \
									ObjectReference CheckAliveActorOrShip = None, \
									bool FailOnDeadActor = false) global

	
	bool returnVal = FailOnDeadActor == false || CheckAliveActorOrShip == none || IsDead(CheckAliveActorOrShip) == false

	Trace(CallingObject, "CheckForAliveActor() returnVal: " + returnVal, ShowNormalTrace)
	return returnVal
EndFunction

; Used by any script that wants to check if any of the triggering/activating references are in these arrays
; If PlayerOnly == true, then RefToCheck must be the Player, or the Player's ship (if the player is flying a ship)
bool Function CheckForReferenceMatches(	ScriptObject CallingObject, \
										bool ShowNormalTrace, \
										ObjectReference RefToCheck, \
										Bool PlayerOnly, \
										ObjectReference[] ReferencesToCheckAgainst, \
										ReferenceAlias[] AliasesToCheckAgainst, \
										Faction[] FactionsToCheckAgainst )  Global

	Trace(CallingObject, "DefaultScriptFunctions.CheckForReferenceMatches(): RefToCheck=" + RefToCheck + " PlayerOnly=" + PlayerOnly, ShowNormalTrace)

	bool returnVal = false

	if PlayerOnly
		if RefToCheck == Game.GetPlayer() || RefToCheck == Game.GetPlayer().GetSpaceShip()
			Trace(CallingObject, "DefaultScriptFunctions.CheckForReferenceMatches() PlayerOnly == true, and the RefToCheck is the Player or their Ship. Skipping further checks. RefToCheck: " + RefToCheck, ShowNormalTrace)
			returnVal = true
		else
			Trace(CallingObject, "DefaultScriptFunctions.CheckForReferenceMatches() PlayerOnly == true, but ReftoCheck is NOT the Player or their Ship. Skipping further checks.", ShowNormalTrace)
		endif
	else
		Trace(CallingObject, "DefaultScriptFunctions.CheckForReferenceMatches() PlayerOnly == false, checking arrays.", ShowNormalTrace)
		
		; Do the arrays contain anything?
		if ReferencesToCheckAgainst.Length > 0 || AliasesToCheckAgainst.Length > 0 || FactionsToCheckAgainst.Length > 0
			Trace(CallingObject, "DefaultScriptFunctions.CheckForReferenceMatches() There is something in one of the arrays, checking to see if any of them are a match.", ShowNormalTrace)

			if CheckObjectReferenceAgainstArray(RefToCheck, ReferencesToCheckAgainst) || CheckObjectReferenceAgainstReferenceAliasArray(RefToCheck, AliasesToCheckAgainst) || CheckActorAgainstFactionArray(RefToCheck as Actor, FactionsToCheckAgainst)
				Trace(CallingObject, "DefaultScriptFunctions.CheckForReferenceMatches() There was a match in one of the arrays.", ShowNormalTrace)
				returnVal = true
			else
				Trace(CallingObject, "DefaultScriptFunctions.CheckForReferenceMatches() no matches in any arrays!", ShowNormalTrace)
			endif

		else
			Trace(CallingObject, "DefaultScriptFunctions.CheckForReferenceMatches() There are no arrays to search through.", ShowNormalTrace)
			returnVal = true
		endif
	endif

	Trace(CallingObject, "DefaultScriptFunctions.CheckForReferenceMatches() returnVal: " + returnVal, ShowNormalTrace)
	return returnVal
EndFunction


;Used by any script that want's to check if any of the triggering/activating references are in these arrays
;if PlayerOnly == true, then RefToCheck will be forced to be the Player or the Player's ship if the player is flying a ship
bool Function CheckForLocationMatches(	ScriptObject CallingObject, \
										bool ShowNormalTrace, \
										\
										Location LocationToCheck, \
										Location LocationToCheckOther, \
										Location[] LocationsToCheckAgainst, \
										LocationAlias[] LocationAliasesToCheckAgainst, \
										bool LocationMatchIfChild)  Global

	Trace(CallingObject, "DefaultScriptFunctions.CheckForLocationMatches()...", ShowNormalTrace)

	bool returnVal = false

	; Do the arrays contain anything?
	if LocationsToCheckAgainst.Length > 0 || LocationAliasesToCheckAgainst.Length > 0
		; See if the RefToCheck is in a faction, an alias, or any of the references in these specfic arrays
		Trace(CallingObject, "DefaultScriptFunctions.CheckForLocationMatches() There is something in one of the arrays, checking to see if any of them are a match.", ShowNormalTrace)
		if CheckLocationAgainstArray(LocationToCheck, LocationsToCheckAgainst, LocationToCheckOther, matchIfChildLocation = LocationMatchIfChild) || CheckLocationAgainstLocationAliasArray(LocationToCheck, LocationAliasesToCheckAgainst, LocationToCheckOther, matchIfChildLocation = LocationMatchIfChild)
			Trace(CallingObject, "DefaultScriptFunctions.CheckForLocationMatches() There was a match in one of the arrays, returnVal: true.", ShowNormalTrace)
			returnVal = true
		else
			; Stage wasn't set because RefToCheck isn't in a faction, an alias, or any of the references in the speific arrays.
			Trace(CallingObject, "DefaultScriptFunctions.CheckForLocationMatches() no matches! returnVal: false", ShowNormalTrace)
		endif

	else
		; There's no ref to check, just set the stage
		Trace(CallingObject, "DefaultScriptFunctions.CheckForLocationMatches() There are no arrays to search through. returnVal: true", ShowNormalTrace)
		returnVal = true
	endif

	return returnVal
EndFunction

Function Trace(scriptobject CallingObject, string TextToPrint, bool ShowNormalTrace, string CustomLog = "") Global DebugOnly
	debug.TraceLog(CallingObject, TextToPrint, "DefaultScripts")

	if CustomLog != ""
		Debug.TraceLog(CallingObject, TextToPrint, CustomLog)
	endif

	if ShowNormalTrace
		debug.Trace(" " + CallingObject + ": " + TextToPrint)
	endif
EndFunction

Function Warning(scriptobject CallingObject, string TextToPrint, string CustomLog = "") Global DebugOnly
	debug.TraceLog(CallingObject, TextToPrint, "DefaultScripts", bShowWarning = true)

	if CustomLog != ""
		debug.TraceLog(CallingObject, TextToPrint, CustomLog, bShowWarning = true)
	endif

EndFunction