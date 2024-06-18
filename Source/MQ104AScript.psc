Scriptname MQ104AScript extends Quest

ReferenceAlias Property TemplePuzzleTrigger Mandatory Const Auto
Int Property StageToSet = 500 Const Auto

Function TempleArrived()
    RegisterForCustomEvent((TemplePuzzleTrigger.GetRef() as SBRingPuzzleNEWScript), "PuzzleSolvedEvent")
EndFunction

Event SBRingPuzzleNEWScript.PuzzleSolvedEvent(SBRingPuzzleNEWScript akSender, Var[] akArgs)
    SetStage(StageToSet)
    UnRegisterForCustomEvent((TemplePuzzleTrigger.GetRef() as SBRingPuzzleNEWScript), "PuzzleSolvedEvent")
EndEvent