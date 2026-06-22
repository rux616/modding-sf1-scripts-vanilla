Scriptname DefaultTopicInfoModGlobal extends TopicInfo Const default
{Modify a Global by specified amount (default 1). Useful for incrementing or decrementing a Global}

Group Globals
GlobalVariable Property SetGlobalOnBegin const auto
{Which global to modify when the info starts}


GlobalVariable Property SetGlobalOnEnd const auto
{Which global to modify when the info starts}

EndGroup

Group Values

float Property OnBeginMod = 1.0 const auto
{Default: 1; what value do we modify the global by when the info starts}


float Property OnEndMod = 1.0 const auto
{Default: 1; what value do we modify the global by when the info ends}

EndGroup


Event OnBegin(ObjectReference akSpeakerRef, bool abHasBeenSaid)
 	if SetGlobalOnBegin
 		debug.trace(self + "OnBegin() modifying global by value: " + SetGlobalOnBegin + ": " + OnBeginMod)
  		SetGlobalOnBegin.mod(OnBeginMod)
  	endif

endEvent

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	if SetGlobalOnEnd
  		debug.trace(self + "OnEnd() modifying global by value: " + SetGlobalOnEnd + ": " + OnEndMod)
  		SetGlobalOnEnd.mod(OnEndMod)
	endif

endEvent