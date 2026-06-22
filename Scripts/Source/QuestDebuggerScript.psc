Scriptname QuestDebuggerScript extends Quest
{You can call the following on this Quest:
Function SetDebugStage(int DebugStage, bool FastFowarding = false)
Function SetActorValueOnPlayer(ActorValue ActorValueToSet, float ValueToSetTo)
Function MoveToDebugStageMarker(int DebugStage)
Function MoveToLatestDebugStageMarker()
Function MoveToNextDebugStageMarker()

In server console like:
CQF <QuestEditorID> FunctionName Param1 Param2 etc.
}

Struct DebugStageDatum
	int Stage
	
	bool TriggerOnStandardStageSet = false
	{IDefault: False. If true, setting the actual quest stage will also cause this DebugStage to trigger.
	Use this for stages that are only ever "Debug stages" and not "real" stages}
	
	ObjectReference RefToMoveTo
	{reference to move player to}
	ReferenceAlias RefAliasToMoveTo
	{if RefToMoveTo is none, it will try to move the player to this RefAlias}
	ReferenceAlias RefAliasToKill
	{kill this ReferenceAlias}
	RefCollectionAlias RefColToKill
	{kills everything in this refcol to the player}
	form FormToAdd
	{add this for to player}
	ReferenceAlias AliasRefToAdd1
	{add this reference to the player}
	ReferenceAlias AliasRefToAdd2
	{add this reference to the player}
	RefCollectionAlias RefColToAdd
	{adds everything in this refcol to the player}
	ActorValue ActorValueToSet
	{set this actorvalue on player}
	float ValueToSetTo
	{set actor value to this value}

	Scene SceneToStopWhenFastForwarding
	{stop scene instances of this scene when fast forwarding THROUGH this stage}

	bool SetStageOnFastForward = true
	{if true (default), if fastforwarding past this stage, do this along the way}
	bool RefToMoveToOnFastForward = false
	{if true, if fastforwarding past this stage, do this along the way}
	bool RefToKillOnFastForward = false
	{if true, if fastforwarding past this stage, do this along the way}
	bool AddToPlayerOnFastForward = true
	{if true (default), if fastforwarding past this stage, do this along the way}
	bool SetActorValueOnFastForward = true
	{if true (default), if fastforwarding past this stage, do this along the way}
EndStruct

DebugStageDatum[] Property DebugStageData Auto Const Mandatory
{THESE MUST BE DEFINED IN SEQUENTIAL ORDER}

Actor PlayerRef

Event OnQuestInit()
	PlayerRef = Game.GetPlayer()
EndEvent

Event OnStageSet(int auiStageID, int auiItemID)
	DebugStageDatum[] matchingDebugStages = DebugStageData.GetAllMatchingStructs("Stage", auiStageID)

	int i = 0
	While (i < matchingDebugStages.length)
		DebugStageDatum currentDebugStageDatum = matchingDebugStages[i]
		
		if currentDebugStageDatum.TriggerOnStandardStageSet
			_SetDebugStageDatum(currentDebugStageDatum, FastFowardedThru = false)
		endif

		i += 1
	EndWhile

EndEvent

Function SetDebugStage(int DebugStage, bool FastFowarding = false)
	Trace(self, "SetDebugStage() DebugStage: " + DebugStage + ", FastFowarding: " + FastFowarding)

	bool SetSpecifiedStage

	if FastFowarding == false
		DebugStageDatum foundDatum = _GetDebugStageDatum(DebugStage)
		if foundDatum
			_SetDebugStageDatum(foundDatum, FastFowardedThru = false)
			SetSpecifiedStage = true
		endif

	else ;FastFowarding, loop through previous
		int i = 0
		While (i < DebugStageData.length && DebugStageData[i].Stage <= DebugStage)
			if DebugStageData[i].stage == DebugStage
				_SetDebugStageDatum(DebugStageData[i], FastFowardedThru = false)
				SetSpecifiedStage = true
			else ;we are fast forwarding through this stage
				_SetDebugStageDatum(DebugStageData[i], FastFowardedThru = true)
			endif
			i += 1
		EndWhile
	endif

	if SetSpecifiedStage == false
		Trace(self, "SetDebugStage() didn't find StageDatum, but will attempt to set stage on quest anyway.", 1)
		SetStage(DebugStage)
	endif

EndFunction

Function _SetDebugStageDatum(DebugStageDatum DebugStageDatumToSet, bool FastFowardedThru = false)
	Trace(self, "_SetDebugStageDatum(): " + DebugStageDatumToSet)

	if FastFowardedThru == false || DebugStageDatumToSet.SetStageOnFastForward
		Trace(self, "_SetDebugStageDatum() setting stage: " + DebugStageDatumToSet.Stage)
		SetStage(DebugStageDatumToSet.Stage)
	endif

	if FastFowardedThru == false || DebugStageDatumToSet.RefToMoveToOnFastForward
		if DebugStageDatumToSet.RefToMoveTo
			PlayerRef.MoveTo(DebugStageDatumToSet.RefToMoveTo)
		elseif DebugStageDatumToSet.RefAliasToMoveTo
			PlayerRef.MoveTo(DebugStageDatumToSet.RefAliasToMoveTo.GetReference())
		endif
	endif

	if FastFowardedThru == false || DebugStageDatumToSet.RefToKillOnFastForward
		if DebugStageDatumToSet.RefAliasToKill
			DebugStageDatumToSet.RefAliasToKill.TryToKill()
		endif
		if DebugStageDatumToSet.RefColToKill.GetCount() > 0
			DebugStageDatumToSet.RefColToKill.KillAll()
		endif

	endif

	if FastFowardedThru == false || DebugStageDatumToSet.AddToPlayerOnFastForward
		if DebugStageDatumToSet.FormToAdd
			PlayerRef.AddItem(DebugStageDatumToSet.FormToAdd)
		endif

		if DebugStageDatumToSet.AliasRefToAdd1
			AddRefAliasToPlayer(DebugStageDatumToSet.AliasRefToAdd1)
		endif

		if DebugStageDatumToSet.AliasRefToAdd2
			AddRefAliasToPlayer(DebugStageDatumToSet.AliasRefToAdd2)
		endif

		if DebugStageDatumToSet.RefColToAdd
			ObjectReference[] itemsToAdd = DebugStageDatumToSet.RefColToAdd.GetArray()
			int i = 0
			While (i < itemsToAdd.length)
				playerRef.AddItem(itemsToAdd[i])
				i += 1
			EndWhile
		endif

	endif

	if FastFowardedThru == false || DebugStageDatumToSet.SetActorValueOnFastForward
		if DebugStageDatumToSet.ActorValueToSet
			PlayerRef.SetValue(DebugStageDatumToSet.ActorValueToSet, DebugStageDatumToSet.ValueToSetTo)
		endif
	endif

	if FastFowardedThru && DebugStageDatumToSet.SceneToStopWhenFastForwarding
		DebugStageDatumToSet.SceneToStopWhenFastForwarding.Stop()
	endif

EndFunction

int Function GetNextDebugStage()
	DebugStageDatum nextDatum = _GetNextDebugStageDatum()

	if nextDatum
		Trace(self, "GetNextDebugStage() returning " + nextDatum.Stage)
		return nextDatum.Stage
	else
		Trace(self, "SetNextDebugStage() could not find a next DebugStageDatum, returning -1")
		return -1
	endif

EndFunction

DebugStageDatum Function _GetDebugStageDatum(int StageToFind)
	int iFound = DebugStageData.FindStruct("Stage", StageToFind)
	if iFound > -1
		return DebugStageData[iFound]
	endif

	return None
EndFunction

DebugStageDatum Function _GetLatestDebugStageDatum()
	DebugStageDatum latestDatum = None

	int i = _GetLatestDebugStageDatumIndex()

	if i > -1
		latestDatum = DebugStageData[i]
	endif

	Trace(self, "_GetLatestDebugStageDatum() latestDatum:" + latestDatum)

	return latestDatum
EndFunction

int Function _GetLatestDebugStageDatumIndex()
	int index = -1

	int i = 0
	While (i < DebugStageData.length)
		if GetStageDone(DebugStageData[i].Stage)
			index = i
			i = DebugStageData.length
		endif
		i += 1
	EndWhile

	Trace(self, "_GetLatestDebugStageDatum() index:" + index + ", DebugStageData[i]: " + DebugStageData[i])

	return index
EndFunction

DebugStageDatum Function _GetNextDebugStageDatum()
	int iLatest = _GetLatestDebugStageDatumIndex()
	int iNext
	if iLatest > -1
		iNext = iLatest + 1
	else
		;assume none have been set yet, so the first is next
		iNext = 0
	endif

	Trace(self, "_GetNextDebugStageDatum() iLatest: " + iLatest)
	Trace(self, "_GetNextDebugStageDatum() iNext: " + iNext)
	Trace(self, "_GetNextDebugStageDatum() DebugStageData.length: " + DebugStageData.length)

	if iNext <= DebugStageData.length
		Trace(self, "_GetNextDebugStageDatum() returning: " + DebugStageData[iNext])
		RETURN DebugStageData[iNext]
	endif

	Trace(self, "_GetNextDebugStageDatum() couldn't find a next DebugStageDatum!!!", 1)
	RETURN none

EndFunction



Function MoveToDebugStageMarker(int DebugStage)
	Trace(self, "MoveToDebugStageMarker() DebugStage: " + DebugStage)

	DebugStageDatum datumToUse = _GetDebugStageDatum(DebugStage)
	Trace(self, "MoveToDebugStageMarker() datumToUse: " + datumToUse)

	_MoveToDatumRefToMoveTo(datumToUse)

EndFunction

Function MoveToLatestDebugStageMarker()
	Trace(self, "MoveToLatestDebugStageMarker()")

	DebugStageDatum datumToUse = _GetLatestDebugStageDatum()
	Trace(self, "MoveToLatestDebugStageMarker() datumToUse: " + datumToUse)

	_MoveToDatumRefToMoveTo(datumToUse)
EndFunction

Function MoveToNextDebugStageMarker()
	Trace(self, "MoveToNextDebugStageMarker()")

	DebugStageDatum datumToUse = _GetNextDebugStageDatum()
	Trace(self, "MoveToNextDebugStageMarker() datumToUse: " + datumToUse)

	_MoveToDatumRefToMoveTo(datumToUse)
EndFunction

Function _MoveToDatumRefToMoveTo(DebugStageDatum DatumToUse)
	ObjectReference refToMoveTo

	if datumToUse
		if datumToUse.RefToMoveTo
			refToMoveTo = datumToUse.RefToMoveTo
		elseif datumToUse.RefAliasToMoveTo
			refToMoveTo = datumToUse.RefAliasToMoveTo.GetReference()
		endif

		if refToMoveTo
			Trace(self, "_MoveToDatumRefToMoveTo() refToMoveTo" + refToMoveTo)
			PlayerRef.MoveTo(refToMoveTo)
		elseif refToMoveTo
			PlayerRef.MoveTo(refToMoveTo)
		else
			Trace(self, "_MoveToDatumRefToMoveTo() could not find a refToMoveTo")
		endif
	else
		Trace(self, "_MoveToDatumRefToMoveTo() could not find a datumToUse")
	endif
EndFunction

Function AddRefAliasToPlayer(ReferenceAlias AliasRefToAdd)
	ObjectReference refToAdd = AliasRefToAdd.GetReference()
	Trace(self, "AddRefAliasToPlayer() adding " + refToAdd)
	PlayerRef.AddItem(refToAdd)

EndFunction


;************************************************************************************
;**************************	 CUSTOM TRACE LOG & WARNING ****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string DejaSubChannel = "Debug", bool bShowNormalTrace = false) debugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, "Default", DejaSubChannel, aiSeverity, bShowNormalTrace)
endFunction

Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string DejaSubChannel = "Debug", bool bShowNormalTrace = false) BetaOnly
	Game.Warning(CallingObject + asTextToPrint)
	Trace(CallingObject, "WARNING!!!: "  + asTextToPrint, aiSeverity, DejaSubChannel, bShowNormalTrace)
EndFunction