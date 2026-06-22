Scriptname TestNPCMoveSpeed extends ObjectReference

ObjectReference Property SpawnController auto const Mandatory

Keyword[] Property DestinationLocationKeywords auto const Mandatory

int i = 0

Event OnActivate(ObjectReference akActionRef)
	;Keyword previousKeyword = DestinationLocationKeywords[DestinationKeywordsIndex]
	if(i < DestinationLocationKeywords.length -1)
		i += 1
	Else
		i = 0
	endif
	(SpawnController as TestNPCArenaScript).SetPatrolSpeed(DestinationLocationKeywords[i])
EndEvent