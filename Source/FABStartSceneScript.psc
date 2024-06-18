Scriptname FABStartSceneScript extends ReferenceAlias

	ReferenceAlias Property TargetAlias Auto Const Mandatory
	{The alias we're interested in}

	float Property TargetDistance Auto Const Mandatory
	{The needed distance between this and the target}

	int Property StageToSet = -1 Auto Const Mandatory
	{Stage to Set}

	int Property ShutdownStage = -1 Const Auto
	{If this stage is set, skip this scene}

    Scene Property SceneToStart Auto Const
    {Scene to fire}

Event OnAliasInit()
	RegisterForDistanceLessThanEvent(Self, TargetAlias, TargetDistance)
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
	if ShutdownStage <= -1 || !GetOwningQuest().GetStageDone(ShutdownStage) 
		if StageToSet > -1
			GetOwningQuest().SetStage(StageToSet)
			SceneToStart.Start()
		endif
	endif
EndEvent
