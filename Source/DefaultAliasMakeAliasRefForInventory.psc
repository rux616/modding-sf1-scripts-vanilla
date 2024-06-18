Scriptname DefaultAliasMakeAliasRefForInventory extends ReferenceAlias default

Group RequiredProperties
	Form Property TargetObject Auto Const Mandatory
	{The object we're interested in. Must be an inventory object.}
	
	ReferenceAlias Property AliasToForce Auto Const
	{The alias we want the specified object shoved into. NOTE: This is exclusive with CollectionToAddTo. If this is set, whatever's in CollectionToAddTo will be ignored}

	RefCollectionAlias Property CollectionToAddTo Auto Const
	{The ref collection we want the specifed object shoves into.}
EndGroup

Group OptionalProperties
	Int Property PrereqStage = -1 Auto Const
	{Stage that must be set for this script's functionality to execute}

	Int Property TurnOffStageDone = -1 Auto Const
	{If this stage is specfically done, this script's functionality is ignored}

	Bool Property DoOnce = true Auto Const
	{Only execute this script's functionality once}
EndGroup

Group Debug_Properties
    Bool Property ShowTraces = FALSE Auto Const
    {(Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives.}
EndGroup

Event OnAliasInit()
	DefaultScriptFunctions.Trace(self, "Make Aliased Ref: Alias init:  " + self + " filled with: " + GetRef(), ShowTraces)
	if PrereqStage == -1
		DefaultScriptFunctions.Trace(self, "Make Aliased Ref: Registering for inventory event for object:  " + TargetObject, ShowTraces)
		AddInventoryEventFilter(TargetObject)

		if TurnOffStageDone > -1
			RegisterForRemoteEvent(GetOwningQuest(), "OnStageSet")
		endif
	else
		DefaultScriptFunctions.Trace(self, "Make Aliased Ref: Registering for stage set:  " + PrereqStage, ShowTraces)
		RegisterForRemoteEvent(GetOwningQuest(), "OnStageSet")
	endif
EndEvent

Event Quest.OnStageSet(Quest akSenderRef, int auiStageID, int auiItemID)
	DefaultScriptFunctions.Trace(self, "Make Aliased Ref: Stage set event: Stage:  " + auiStageID + ". Item: " + auiItemID, ShowTraces)
	if auiStageID == PrereqStage
		AddInventoryEventFilter(TargetObject)
	elseif TurnOffStageDone > -1 && auiStageID == TurnOffStageDone
		RemoveInventoryEventFilter(TargetObject)
	endif
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
	DefaultScriptFunctions.Trace(self, "Make Aliased Ref: Inventory event trigged. Base Item: " + akBaseItem + ". aiItemCount: " + aiItemCount + ". akItemReference: " + akItemReference + ". akSourceContainer: " + akSourceContainer, ShowTraces)
	if akBaseItem == TargetObject
		ProcessMakingRef(akBaseItem)
	endif
EndEvent

Function ProcessMakingRef(Form akBaseItem)
	DefaultScriptFunctions.Trace(self, "Make Aliased Ref: Processing making the ref.", ShowTraces)

	if DoOnce
		DefaultScriptFunctions.Trace(self, "Make Aliased Ref: Only trigger event once. Unregistering.", ShowTraces)
		RemoveInventoryEventFilter(TargetObject)
	endif

	if AliasToForce
		GetRef().MakeAliasedRefFromInventory(akBaseItem, AliasToForce)
		DefaultScriptFunctions.Trace(self, "Make Aliased Ref: Object now in alias:  " + AliasToForce + " is " + AliasToForce.GetRef(), ShowTraces)
	endif

	if CollectionToAddTo && AliasToForce == none
		ObjectReference CreatedRef = GetRef().MakeAliasedRefFromInventory(akBaseItem, CollectionToAddTo)
		DefaultScriptFunctions.Trace(self, "Make Aliased Ref: Object now in collection:  " + CollectionToAddTo + " is at index: " + CollectionToAddTo.Find(CreatedRef), ShowTraces)
	endif
EndFunction