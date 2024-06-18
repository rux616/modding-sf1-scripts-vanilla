Scriptname FFRedMileR01QuestScript extends Quest

Quest Property RedMile_HandlerQuest Mandatory Const Auto

InputEnableLayer FastTravelInputLayer



Function RMDisableFastTravel()
    FastTravelInputLayer = InputEnableLayer.Create()
    FastTravelInputLayer.EnableFastTravel(False)
    FastTravelInputLayer.EnableTakeoff(False)
EndFunction

Function RMEnableFastTravel()
    If (FastTravelInputLayer != None)
		FastTravelInputLayer.EnableFastTravel(True)
	    FastTravelInputLayer.EnableTakeoff(True)
		FastTravelInputLayer.Delete()
		FastTravelInputLayer = None
    EndIf
EndFunction

;Runs the RespawnCreatures() function on the handler quest so we can refresh the course.
Function SpawnCreatures(Int aiPhase)
    (RedMile_HandlerQuest as RedMileHandlerQuestScript).RespawnCreatures(aiPhase)
EndFunction