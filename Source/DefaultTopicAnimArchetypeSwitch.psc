Scriptname DefaultTopicAnimArchetypeSwitch extends TopicInfo Const Default
{Default script for setting a different quest's stage from a topic info.}

Group KeywordArchetypes
	Keyword Property OnBeginArchetype Auto Const
	{Switch to this Archetype OnBegin}
	Keyword Property OnEndArchetype Auto Const
	{Switch to this Archetype OnEnd}
EndGroup

Event OnBegin(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	(akSpeakerRef as Actor).ChangeAnimArchetype(OnBeginArchetype)
EndEvent

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	(akSpeakerRef as Actor).ChangeAnimArchetype(OnEndArchetype)
EndEvent