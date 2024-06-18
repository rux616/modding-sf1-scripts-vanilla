Scriptname DefaultCollAliasSendEventOnActivate extends RefCollectionAlias default
{Collection Alias sends a keyword when one member is activated by the player.}

Group Required_Data
	Keyword Property KeywordToSend Auto Const Mandatory
	{Keyword to send for story event}	
EndGroup

Group Optional_Data
	Keyword Property BlockingKeyword Auto Const
	{Check to ensure player doesn't have this keyword before sending event}

	bool Property ShowTraces Auto Const
	{set to true to see traces. Note, you will need to run with archive builds or locally compailed DefaultScriptFunctions script to see the traces.}
EndGroup

Event OnActivate(ObjectReference akActionRef, ObjectReference akActivatorRef)
	if akActionRef == Game.GetPlayer()
		if BlockingKeyword == none || !akActionRef.HasKeyword(BlockingKeyword)
			KeywordToSend.SendStoryEvent()
			DefaultScriptFunctions.Trace(self, "Sending story event with keyword: " + KeywordToSend, ShowTraces)
		endif
	EndIf
EndEvent
