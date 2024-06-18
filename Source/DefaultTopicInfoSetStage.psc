Scriptname DefaultTopicInfoSetStage extends DefaultTopicInfo Const Default
{Default script for setting a different quest's stage from a topic info.}

Group Optional_Properties
	Bool Property SetStageOnEnd = true Auto Const
	{If true (default), set stage on end. If false, set stage on begin.}
EndGroup

Event OnBegin(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	if !SetStageOnEnd
		DefaultScriptFunctions.Trace(self, "OnBegin() Called on DefaultTopicInfoSetStage script.", ShowTraces)
		TryToSetStage()
	endif
EndEvent

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	if SetStageOnEnd
		DefaultScriptFunctions.Trace(self, "OnEnd() Called on DefaultTopicInfoSetStage script.", ShowTraces)
		TryToSetStage()
	endif
EndEvent