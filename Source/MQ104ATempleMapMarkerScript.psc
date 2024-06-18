Scriptname MQ104ATempleMapMarkerScript extends ReferenceAlias

Int Property StageToSet=405 Const Auto

Event OnMapMarkerDiscovered()
    GetOwningQuest().SetStage(StageToSet)
EndEvent