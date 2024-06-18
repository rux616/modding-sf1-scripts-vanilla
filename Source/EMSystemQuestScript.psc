Scriptname EMSystemQuestScript extends Quest Hidden

Int EncountersTotal
Int EncountersLoaded
Int EncountersActive
Int EncountersInactive
Int ActorsTotal
Int ActorsActive


Function IncrementTotal()
	EncountersTotal += 1
EndFunction

Function DecrementTotal()
	EncountersTotal -= 1
EndFunction



Function IncrementActive()
	EncountersActive += 1
EndFunction

Function DecrementActive()
	EncountersActive -= 1
EndFunction


Function UpdateInactive()
	EncountersInactive = (EncountersTotal - EncountersActive)
EndFunction



Function IncrementLoaded()
	EncountersLoaded += 1
EndFunction

Function DecrementLoaded()
	EncountersLoaded -= 1
EndFunction



Function AddToActorsActive(int AmountToAdd)
	ActorsActive = ActorsActive + AmountToAdd
EndFunction

Function SubtractFromActorsActive(int AmounttoSubtract)
	ActorsActive = ActorsActive - AmounttoSubtract
EndFunction

Function AddToActorsTotal(int AmountToAdd)
	ActorsTotal = ActorsTotal + AmountToAdd
EndFunction

Function SubtractFromActorsTotal(int AmounttoSubtract)
	ActorsTotal = ActorsTotal - AmounttoSubtract
EndFunction

Function UpdateActorsTotal(int AmountToSubtract, int AmountToAdd)
	ActorsTotal = ActorsTotal - AmounttoSubtract
	ActorsTotal = ActorsTotal + AmountToAdd
EndFunction

Function UpdateActorsActive(int AmountToSubtract, int AmountToAdd)
	ActorsActive = ActorsActive - AmounttoSubtract
	ActorsActive = ActorsActive + AmountToAdd
EndFunction