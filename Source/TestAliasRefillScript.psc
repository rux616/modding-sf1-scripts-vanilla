Scriptname TestAliasRefillScript extends Quest

Alias Property ActorFillFromLoadedArea Auto Const
Alias Property RefFillFromLocationAlias Auto Const


Event OnQuestInit()
	;attempt to refill aliases every 5 seconds
	StartTimer(5)
EndEvent

Event OnTimer(int aiTimerID)
	ActorFillFromLoadedArea.RefillAlias()
	RefFillFromLocationAlias.RefillAlias()
	StartTimer(5)
EndEvent