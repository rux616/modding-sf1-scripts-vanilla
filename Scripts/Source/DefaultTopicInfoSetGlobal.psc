Scriptname DefaultTopicInfoSetGlobal extends TopicInfo Const default
{Sets a global to a specified value (default 1)}


Group Globals
GlobalVariable Property SetGlobalOnBegin const auto
{Which global to set when the info starts}


GlobalVariable Property SetGlobalOnEnd const auto
{Which global to set when the info starts}

EndGroup

Group Values

float Property OnBeginValue = 1.0 const auto
{Default: 1; what value do we set the global to when the info starts}


float Property OnEndValue = 1.0 const auto
{Default: 1; what value do we set the global to when the info ends}

EndGroup


Event OnBegin(ObjectReference akSpeakerRef, bool abHasBeenSaid)
 	if SetGlobalOnBegin
 		debug.trace(self + "OnBegin() setting global to value: " + SetGlobalOnBegin + ": " + OnBeginValue)
  		SetGlobalOnBegin.setValue(OnBeginValue)
  	endif

endEvent

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	if SetGlobalOnEnd
  		debug.trace(self + "OnEnd() setting global to value: " + SetGlobalOnEnd + ": " + OnEndValue)
  		SetGlobalOnEnd.setValue(OnEndValue)
	endif

endEvent