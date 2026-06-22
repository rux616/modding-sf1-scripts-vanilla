Scriptname RIR02_ContainerAliasScript extends ReferenceAlias

MiscObject Property RIR02_ConfidentialFiles Auto Const Mandatory
Int Property iPlantFilesStage = 200 Auto Const 
Int Property iReturnToImogeneStage = 300 Auto Const 
Int Property iCompletionStage = 10000 Auto Const 

Event OnAliasInit()
	Debug.Trace(Self + "OnAliasInit fired. Set Inventory Event Filter")
	AddInventoryEventFilter(RIR02_ConfidentialFiles)
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
	Debug.Trace(Self + "OnItemAdded fired")
	Quest MyQuest = GetOwningQuest()
	Debug.Trace(Self + "OnItemAdded: GetOwningQuest() = " + MyQuest)
	
	If !MyQuest.GetStageDone(iReturnToImogeneStage)
	Debug.Trace(Self + "OnItemAdded: Stage 300 is NOT completed yet.")
		MyQuest.SetStage(iReturnToImogeneStage)
	Else
	Debug.Trace(Self + "OnItemAdded: Stage 300 is complete. Updated Objective only.")
		MyQuest.SetObjectiveCompleted(iPlantFilesStage)
		MyQuest.SetObjectiveDisplayed(iReturnToImogeneStage)
	EndIf
	
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, int aiTransferReason)
Debug.Trace(Self + "OnItemRemoved event fired.")
	Quest MyQuest = GetOwningQuest()

	If !MyQuest.GetStageDone(iCompletionStage)
	Debug.Trace(Self + "OnItemRemoved: Quest is not complete, so update Objective to replace item.")
		MyQuest.SetObjectiveDisplayed(iReturnToImogeneStage, abDisplayed = False, abForce = False)
		MyQuest.SetObjectiveCompleted(iPlantFilesStage, False)
		MyQuest.SetObjectiveDisplayed(iPlantFilesStage, True, True)
	EndIf

EndEvent