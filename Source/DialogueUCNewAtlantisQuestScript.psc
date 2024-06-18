Scriptname DialogueUCNewAtlantisQuestScript extends Quest Conditional

GlobalVariable Property pPlayerVisited_NewAtlantis Auto Const Mandatory

Group HyperloopSceneVars
	Int Property HyperloopDepart Auto Conditional
	{Int automatically set based on departing station}

	Int Property HyperloopArrive Auto Conditional
	{Int set by player choice in scene}
EndGroup



Group ViewportDialogueVars
Int Property ViewPortVisitUpdate Auto Conditional
{int compared against PlayerVisited_NewAtlantis Global}
Int Property ViewportDialogueVersion Auto Conditional
{int incremented when player has finished dialogue with related actor AND left/returned to city}
Int Property ViewportReadyForUpdate Auto Conditional
{int set to 1 when player has finished dialogue with related actor}
EndGroup