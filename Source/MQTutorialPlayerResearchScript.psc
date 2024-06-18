Scriptname MQTutorialPlayerResearchScript extends ReferenceAlias

Int Property StageToSet=100 Const Auto

Event OnPlayerCompleteResearch(ObjectReference akBench, Location akLocation, ResearchProject akCompletedProject)
    GetOwningQuest().SetStage(StageToSet)
endEvent