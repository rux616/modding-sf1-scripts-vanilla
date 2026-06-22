Scriptname Rad01_MoveRefsQuestScript extends Quest

Struct ForceAliasDatum
	Alias SourceAlias
	Alias TargetAlias
EndStruct

Struct MoveToDatum
	ReferenceAlias AliasToMove
	ReferenceAlias AliasToMoveTo
endstruct

Struct EnableStateDatum
	ReferenceAlias AliasToSetEnableState
	bool ShouldBeEnabled
endstruct


ForceAliasDatum[] Property ForceAliasData Mandatory Const Auto
MoveToDatum[] Property MoveToData Mandatory Const Auto
EnableStateDatum[] Property EnableStateData Mandatory Const Auto

Event OnQuestInit()
	Trace(self, "OnQuestInit() ")

	ForceAliases()
	MoveAliases()
	EnableDisableAliases()



EndEvent

Function ForceAliases()
	Trace(self, "ForceAliases() ")
	int i = 0
	While (i < ForceAliasData.length)
		ForceAliasDatum currentDatum = ForceAliasData[i]
		Trace(self, "ForceAliases() currentDatum: " + currentDatum)

		bool copied = currentDatum.SourceAlias.CopyIntoAlias(currentDatum.TargetAlias)
		if copied == false
			Warning(self, "OnQuestInit() CopyIntoAlias() failed!!! currentDatum: " + currentDatum)
		endif

		i += 1
	EndWhile
EndFunction

Function MoveAliases()
	Trace(self, "MoveAliases() ")
	int i
	i = 0
	While (i < MoveToData.length)
		MoveToDatum currentDatum = MoveToData[i]
		Trace(self, "MoveAliases() currentDatum: " + currentDatum)

		ObjectReference refToMove = currentDatum.AliasToMove.GetReference()
		ObjectReference refToMoveTo = currentDatum.AliasToMoveTo.GetReference()

		if refToMove && refToMoveTo
			refToMove.MoveTo(refToMoveTo)
		else
			Warning(self, "MoveAliases() can't move, missing ref. refToMove: " + refToMove + ", refToMoveTo: " + refToMoveTo)
		endif

		;snap into furniture if we are moving an actor to furniture
		Actor ActorToMove = refToMove as Actor
		if ActorToMove
			if  refToMoveTo.GetBaseObject() is Furniture	
				ActorToMove.SnapIntoInteraction(refToMoveTo)
			endif
		endif

		i += 1
	EndWhile
EndFunction

Function EnableDisableAliases()
	Trace(self, "EnableDisableAliases() ")
	int i = 0
	While (i < EnableStateData.length)
		EnableStateDatum currentDatum = EnableStateData[i]
		Trace(self, "EnableDisableAliases() currentDatum: " + currentDatum)

		if currentDatum.ShouldBeEnabled
			currentDatum.AliasToSetEnableState.TryToEnableNoWait()
		else
			currentDatum.AliasToSetEnableState.TryToDisableNoWait()
		endif
		i += 1
	EndWhile
EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "Rad01",  string SubLogName = "Rad01_MoveRefsQuestScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "Rad01",  string SubLogName = "Rad01_MoveRefsQuestScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction