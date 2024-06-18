Scriptname SignalReceiverScript extends ObjectReference
{Receives signal(s) from one or more ObjectReferences with a SignalSenderScript attached}

Struct Result

	keyword Signal
	{Result fires on this Signal}

	int ResultTypeEnum
{0 = Custom
1 = Rename Object
2 = Set ActorValue
3 = Damage ActorValue [NOT IMPLMENTED]
4 = Restore ActorValue [NOT IMPLMENTED]
5 = Increment/Decrement ActorValue ( positive ADDs to if negative SUBTRACTs from current value and then Sets the value to that) [NOT IMPLMENTED]
6 = Enable
7 = Disable
8 = Toggle Enable/Disable State
9 = PlaceAtMe (places at TargetRef)
10 = PlaceActorAtMe (places at TargetRef)
11 = Show Message
}

	Form FormParam1
{Depending on ResultType this param is expected to be a particular type.
ResultTypeEnum:
0 (custom): See custom script for details
1 (rename): Message that contains the new name
2-5 (change AV): ActorValue to change
6-8 (enable/disable): N/A
9-10 (place at me): The thing to place (Leveled List, BaseObject, BaseActor, etc.)
11 (show message): the message to show
}

	Float ValueParam1
{Depending on ResultType this param is will mean a particular thing.
ResultTypeEnum:
0 (custom): See custom script for details
1 (rename): N/A
2 (set av): The new value for the AV
3 (dmg av): The amount to damage the AV by
4 (restore av): The about to restore the AV by
5 (inc/dec av): The amount to add to the AV (to decrement use a negatve value)
6-8 (enable/disable): N/A
9 (place at me): count of things to place
10 (place actor me): encounter level of actor to place
11 (show message): N/A
}

	GlobalVariable GlobalParam1
{Depending on ResultType this param is will mean a particular thing.
ResultTypeEnum:
0 (custom): See custom script for details
1 (rename): N/A
2 (set av): The new value for the AV [OVERRIDES ValueParm1]
3 (dmg av): The amount to damage the AV by [OVERRIDES ValueParm1]
4 (restore av): The about to restore the AV by [OVERRIDES ValueParm1]
5 (inc/dec av): The amount to add to the AV (to decrement use a negatve value) [OVERRIDES ValueParm1]
6-8 (enable/disable): N/A
9-10 (place at me): N/A
11 (show message): N/A
}

	int TargetRefEnum = 0
{Thing to do the result on:
0 = self
1 = linkedRef
2 = linkedRefChain
3 = linkedRefChildren (things linkedref to self) }

	keyword LinkedRefKeyword
{Optional: the keyword used when getting TargetRefs if TargetRefEnum is a LinkedRef type}

	ConditionForm Conditions
{Optional: Conditions that must be true for Result to fire when receiving the Signal.
RunOn SUBJECT will be THIS reference (the object this script is attached to)
RunOn TARGET will be the TargetRef(s) as described by TargetRefEnum}

EndStruct

;ResultTypeEnum
int Property iResultType_Custom 				= 0 	AutoReadOnly
int Property iResultType_Rename 				= 1 	AutoReadOnly
int Property iResultType_SetAV 					= 2 	AutoReadOnly
int Property iResultType_DamageAV 				= 3 	AutoReadOnly
int Property iResultType_RestoreAV 				= 4 	AutoReadOnly
int Property iResultType_IncrementDecrementAV	= 5 	AutoReadOnly
int Property iResultType_Enable 				= 6 	AutoReadOnly
int Property iResultType_Disable 				= 7 	AutoReadOnly
int Property iResultType_ToggleEnableState 		= 8 	AutoReadOnly
int Property iResultType_PlaceAtMe		 		= 9 	AutoReadOnly
int Property iResultType_PlaceActorAtMe	 		= 10 	AutoReadOnly
int Property iResultType_ShowMessage	 		= 11 	AutoReadOnly


;TargetRefEnum
int Property iTargetRef_Self 				= 0 	AutoReadOnly
int Property iTargetRef_LinkedRef 			= 1 	AutoReadOnly
int Property iTargetRef_LinkedRefChain 		= 2 	AutoReadOnly
int Property iTargetRef_LinkedRefChildren 	= 3 	AutoReadOnly


Group Results
	Result[] Property Results Const Auto
	{All standard results will fire for matching signals
	This may change as the script develops further }

	
EndGroup


;Called by SignalSenderScript
;SignalParameters will contain members whose values represent the various that came in from the Event that triggered the Signal being sent.
;See each SignalSenderScript child script for details.
Function ReceiveSignal(SignalSenderScript:SignalSignature SignalSignature, SignalSenderScript:SignalParameters SignalParameters)
	Trace(self, "ReceiveSignalRef() SignalSignature: " + SignalSignature + ", SignalParameters: " + SignalParameters)

	HandleResults(SignalSignature, SignalParameters)
	ReceiveSignalCustom(SignalSignature, SignalParameters)
EndFunction

;Override in children scripts
;SignalParameters will contain members whose values represent the various that came in from the Event that triggered the Signal being sent.
;See each SignalSenderScript child script for details.
Function ReceiveSignalCustom(SignalSenderScript:SignalSignature SignalSignature, SignalSenderScript:SignalParameters SignalParameters)
	Trace(self, "ReceiveSignalRef() SignalSignature: " + SignalSignature + ", SignalParameters: " + SignalParameters)

EndFunction


;Override in children scripts
;SignalParameters will contain members whose values represent the various that came in from the Event that triggered the Signal being sent.
;See each SignalSenderScript child script for details.
Function HandleCustomResult(Result Result, ObjectReference[] ValidTargetRefs, SignalSenderScript:SignalSignature SignalSignature, SignalSenderScript:SignalParameters SignalParameters)
	Trace(self, "ReceiveSignalRef() SignalSignature: " + SignalSignature + ", SignalParameters: " + SignalParameters)

EndFunction

ObjectReference[] Function GetValidTargetRefs(Result result)

	ObjectReference[] targetRefs

	if result.TargetRefEnum == iTargetRef_Self
		targetRefs = self.GetSingleRefArray()
	elseif result.TargetRefEnum == iTargetRef_LinkedRef
		targetRefs = self.GetLinkedRef(result.LinkedRefKeyword).GetSingleRefArray()
	elseif result.TargetRefEnum == iTargetRef_LinkedRefChain
		targetRefs = self.GetLinkedRefChain(result.LinkedRefKeyword)
	elseif result.TargetRefEnum == iTargetRef_LinkedRefChildren
		targetRefs = self.GetRefsLinkedToMe(result.LinkedRefKeyword)
	else
		Warning(self, "GetValidTargetRefs found unexpected values for result.TargetRefEnum: " + result.TargetRefEnum)
	endif

	int i = targetRefs.length
	While (i >= 0)
		ObjectReference currentRef = targetRefs[i]
		
		if result.Conditions && result.Conditions.IsTrue(self, currentRef) == false
			targetRefs.Remove(i)
		endif

		i -= 1
	EndWhile

	Trace(self, "GetValidTargetRefs() returning targetRefs: " + targetRefs)
	Return targetRefs

EndFunction


bool Function IsChangeAVResultType(int ResultTypeEnum)
	return ResultTypeEnum == iResultType_SetAV || ResultTypeEnum == iResultType_DamageAV || ResultTypeEnum == iResultType_RestoreAV || ResultTypeEnum == iResultType_IncrementDecrementAV
EndFunction

bool Function IsChangeEnableStateResultType(int ResultTypeEnum)
	return ResultTypeEnum == iResultType_Enable || ResultTypeEnum == iResultType_Disable || ResultTypeEnum == iResultType_ToggleEnableState
EndFunction


Function HandleResults(SignalSenderScript:SignalSignature SignalSignature, SignalSenderScript:SignalParameters SignalParameters)
	Trace(self, "HandleResults()")

	Result[] matchingResults = Results.GetAllMatchingStructs("Signal", SignalSignature.Signal)

	int i = 0
	While (i < matchingResults.length)
		Result currentResult = matchingResults[i]
		
		ObjectReference[] validTargetRefs = GetValidTargetRefs(currentResult)

		if currentResult.ResultTypeEnum == iResultType_Custom
			;do custom things that Children scripts want to do
			HandleCustomResult(currentResult, validTargetRefs, SignalSignature, SignalParameters)

		elseif currentResult.ResultTypeEnum == iResultType_Rename
			HandleRenameResult(currentResult, validTargetRefs, SignalSignature, SignalParameters)
		
		elseif IsChangeAVResultType(currentResult.ResultTypeEnum)
			HandleChangeAVResult(currentResult, validTargetRefs, SignalSignature, SignalParameters)

		elseif IsChangeEnableStateResultType(currentResult.ResultTypeEnum)
			HandleEnableOrDisableResult(currentResult, validTargetRefs, SignalSignature, SignalParameters)

		elseif currentResult.ResultTypeEnum == iResultType_PlaceAtMe || currentResult.ResultTypeEnum == iResultType_PlaceActorAtMe
			HandlePlaceAtMeResult(currentResult, validTargetRefs, SignalSignature, SignalParameters)
		
		elseif currentResult.ResultTypeEnum == iResultType_ShowMessage
			HandleShowMessageResult(currentResult, validTargetRefs, SignalSignature, SignalParameters)

		endif

		i += 1
	EndWhile

EndFunction

;for future upkeep ease, all HandleXXXResults should have the same parameters
Function HandleRenameResult(Result result, ObjectReference[] ValidTargetRefs, SignalSenderScript:SignalSignature SignalSignature, SignalSenderScript:SignalParameters SignalParameters)
	Trace(self, "HandleRenameResult() result: " + result + ", SignalSignature: " + SignalSignature + ", SignalParameters: " + SignalParameters)
	
	Message newNameMsg = result.FormParam1 as Message

	int i = 0
	While (i < ValidTargetRefs.length)
		ObjectReference currentTargetRef = ValidTargetRefs[i]
		
		Trace(self, "HandleRenameResult() calling currentTargetRef.SetOverrideName(newNameMsg). currentTargetRef " + currentTargetRef + ", newNameMsg: " + newNameMsg)
		currentTargetRef.SetOverrideName(newNameMsg)

		i += 1
	EndWhile

EndFunction

;for future upkeep ease, all HandleXXXResults should have the same parameters
Function HandleChangeAVResult(Result result, ObjectReference[] ValidTargetRefs, SignalSenderScript:SignalSignature SignalSignature, SignalSenderScript:SignalParameters SignalParameters)
	Trace(self, "HandleChangeAVResult() result: " + result + ", SignalSignature: " + SignalSignature + ", SignalParameters: " + SignalParameters)
	
	ActorValue AV = result.FormParam1 as ActorValue

	float changeValue
	If result.GlobalParam1
		changeValue = result.GlobalParam1.GetValue()
	Else
		changeValue = result.ValueParam1
	EndIf

	int i = 0
	While (i < ValidTargetRefs.length)
		ObjectReference currentTargetRef = ValidTargetRefs[i]

		float oldValue = currentTargetRef.GetValue(AV)
		float newValue = changeValue ;except for iResultType_IncrementDecrementAV

		if result.ResultTypeEnum == iResultType_IncrementDecrementAV
			newValue = oldValue + changeValue
		endif

		if result.ResultTypeEnum ==  iResultType_SetAV || Result.ResultTypeEnum == iResultType_IncrementDecrementAV
			Trace(self, "HandleChangeAVResult() calling currentTargetRef.SetValue(AV, newValue). currentTargetRef " + currentTargetRef + ", AV: " + AV + ", newValue: " + newValue)
			currentTargetRef.SetValue(AV, newValue)
			
		elseif result.ResultTypeEnum == iResultType_DamageAV
			Trace(self, "HandleChangeAVResult() calling currentTargetRef.DamageValue(AV, newValue). currentTargetRef " + currentTargetRef + ", AV: " + AV + ", newValue: " + newValue)
			currentTargetRef.DamageValue(AV, newValue)

		elseif result.ResultTypeEnum == iResultType_RestoreAV
			Trace(self, "HandleChangeAVResult() calling currentTargetRef.RestoreValue(AV, newValue). currentTargetRef " + currentTargetRef + ", AV: " + AV + ", newValue: " + newValue)
			currentTargetRef.RestoreValue(AV, newValue)
		endif

		i += 1
	EndWhile
EndFunction

;for future upkeep ease, all HandleXXXResults should have the same parameters
Function HandleEnableOrDisableResult(Result result, ObjectReference[] ValidTargetRefs, SignalSenderScript:SignalSignature SignalSignature, SignalSenderScript:SignalParameters SignalParameters)
	Trace(self, "HandleEnableResult() result: " + result + ", SignalSignature: " + SignalSignature + ", SignalParameters: " + SignalParameters)
	
	int i = 0
	While (i < ValidTargetRefs.length)
		ObjectReference currentTargetRef = ValidTargetRefs[i]
		
		bool shouldEnable

		if result.ResultTypeEnum == iResultType_Enable
			shouldEnable = true
		elseif result.ResultTypeEnum == iResultType_Disable
			shouldEnable = false
		elseif result.ResultTypeEnum == iResultType_ToggleEnableState
			shouldEnable = !currentTargetRef.IsEnabled()
		endif

		if shouldEnable
			Trace(self, "HandleEnableResult() calling currentTargetRef.Enable(). currentTargetRef " + currentTargetRef)
			currentTargetRef.EnableNoWait()
		else
			Trace(self, "HandleEnableResult() calling currentTargetRef.Disable(). currentTargetRef " + currentTargetRef)
			currentTargetRef.DisableNoWait()
		endif

		i += 1
	EndWhile

EndFunction

;for future upkeep ease, all HandleXXXResults should have the same parameters
Function HandlePlaceAtMeResult(Result result, ObjectReference[] ValidTargetRefs, SignalSenderScript:SignalSignature SignalSignature, SignalSenderScript:SignalParameters SignalParameters)
	Trace(self, "HandlePlaceAtMeResult() result: " + result + ", SignalSignature: " + SignalSignature + ", SignalParameters: " + SignalParameters)
	
	int i = 0
	While (i < ValidTargetRefs.length)
		ObjectReference currentTargetRef = ValidTargetRefs[i]
		
		if result.ResultTypeEnum == iResultType_PlaceAtMe
			Trace(self, "HandlePlaceAtMeResult() calling PlaceAtMe() result.FormParam1: " + result.FormParam1 + ", aiCount result.ValueParam1: " + result.ValueParam1)
			;assume we never want to place less than 1
			int count = math.max(result.ValueParam1, 1) as int
			ObjectReference placedRef = currentTargetRef.PlaceAtMe(result.FormParam1, count)
			Trace(self, "HandlePlaceAtMeResult() last placed object placedRef: " + placedRef)

		elseif result.ResultTypeEnum == iResultType_PlaceActorAtMe
			Trace(self, "HandlePlaceAtMeResult() calling PlaceActorAtMe() result.FormParam1: " + result.FormParam1 + ", aiLevelMod result.ValueParam1: " + result.ValueParam1)
			ObjectReference placedRef = currentTargetRef.PlaceActorAtMe(result.FormParam1 as ActorBase, result.ValueParam1 as int)
			Trace(self, "HandlePlaceAtMeResult() last placed object placedRef: " + placedRef)

		endif

		i += 1
	EndWhile

EndFunction


;for future upkeep ease, all HandleXXXResults should have the same parameters
Function HandleShowMessageResult(Result result, ObjectReference[] ValidTargetRefs, SignalSenderScript:SignalSignature SignalSignature, SignalSenderScript:SignalParameters SignalParameters)
	Trace(self, "HandleShowMessageResult() result: " + result + ", SignalSignature: " + SignalSignature + ", SignalParameters: " + SignalParameters)
	
	int i = 0
	While (i < ValidTargetRefs.length)
		ObjectReference currentTargetRef = ValidTargetRefs[i]
		
		Trace(self, "HandleShowMessageResult() calling ShowMessage() result.FormParam1: " + result.FormParam1)
		(result.FormParam1 as message).Show()

		i += 1
	EndWhile

EndFunction




;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "Signal",  string SubLogName = "Receiver", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "Signal",  string SubLogName = "Receiver", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction