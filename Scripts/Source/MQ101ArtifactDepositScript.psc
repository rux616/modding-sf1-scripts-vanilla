Scriptname MQ101ArtifactDepositScript extends ReferenceAlias

Message Property MQ101ArtifactMineralBedMSG Auto Const Mandatory

Event OnActivate(ObjectReference akActionRef)
	Quest MyQuest = GetOwningQuest()

	;show the helper message if the player hasn't drilled out the mineral bed
	If Self.GetRef().GetCurrentDestructionStage() < 3
		MQ101ArtifactMineralBedMSG.Show()
	Else
		MyQuest.SetStage(50)
	EndIf

EndEvent

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
	Quest MyQuest = GetOwningQuest()

	if aiCurrentStage >= 3
		MyQuest.SetStage(51)
	EndIf

EndEvent