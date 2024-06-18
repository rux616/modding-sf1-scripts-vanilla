Scriptname RQ_PlaceObjectScript extends RQScript
;see parent script: RQScript for traces, etc.

Group PlacedObject_Properties

	ReferenceAlias Property ObjectToPlace Mandatory Const Auto
	{an example of object to place. Quest creates a disabled one in this alias so that we can use it for text replacement, as well as placing more when player activates InteractionActivators}

	PackIn property ObjectToPlaceBase auto const mandatory
	{ base object for placing - should match what's in ObjectToPlace }

	Keyword Property InteractionActivatorLinkKeyword Mandatory Const Auto
	{keyword used in packin that links the Pivot TO the activator volume
	Example:
	For Env_Hazard* this is: Env_Link_InteractionActivator	}

	RefCollectionAlias Property InteractionTargets Mandatory Const Auto
	{ref col having refs to place InteractionActivatorRefs at (ie to give them a "click here" volume)}

	RefCollectionAlias Property InteractionActivators Mandatory Const Auto
	{ref col to force placed HazardInteractionTriggers into}

	int property MinActivators = 3 auto Const	; min number to place for variety
	int property MaxActivators = 8 auto const	 ; max number to place - this needs to match the Max Initial Fill Count on InteractionTargets ref collection alias

	GlobalVariable property RQ_Settlement_PlaceObject_01_MaxCount auto const mandatory
	{ used for text replacement }

    GlobalVariable property CreditsRewardRadiantQuestSmall const mandatory Auto
    { base value for quest reward }

    GlobalVariable property RQ_Settlement_PlaceObject_01_CreditsReward const mandatory Auto
    { actual value for quest reward - modified by number of activators actually placed }

	PackIn property ENV_HazardInteraction_PK_Vent auto const mandatory
	{ autofill }

	Static Property PrefabPackinPivotDummy Mandatory Const Auto
	{Autofill}
EndGroup

int iDebugNextActivator

Event RefCollectionAlias.OnActivate(RefCollectionAlias akSender, ObjectReference akSenderRef, ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		ENV_Hazard_InteractionActivator hazardActivator = akSenderRef as ENV_Hazard_InteractionActivator

		if hazardActivator
			hazardActivator.PlaceObject(ObjectToPlaceBase)
		endif

		;disable activator (to make inactive and to turn off quest target via conditions on being enabled)
		akSenderRef.Disable()
	EndIf
EndEvent

Function PlaceInteractionActivators()
	RegisterForRemoteEvent(InteractionActivators, "OnActivate")
	
	;NOTE: counting text replace globals and setting objectives is handled by the DefaultAliasOnActivate script.

	Trace(self, "PlaceInteractionActivators() ENV_HazardInteraction_PK_Vent: " + ENV_HazardInteraction_PK_Vent)

	ObjectReference[] interactionTargetRefs = InteractionTargets.GetArray()
	Trace(self, "PlaceInteractionActivators() interactionTargetRefs: " + interactionTargetRefs)

	int randomMaxActivators = Utility.RandomInt(MinActivators, MaxActivators)
	Trace(self, "PlaceInteractionActivators() randomMaxActivators: " + randomMaxActivators)

	int i = 0
	While (i < interactionTargetRefs.length && i < randomMaxActivators)
		Trace(self, "PlaceInteractionActivators() interactionTargetRefs[i]: " + interactionTargetRefs[i])

		ObjectReference placedRef = interactionTargetRefs[i].PlaceAtMe(ENV_HazardInteraction_PK_Vent)
		Trace(self, "PlaceInteractionActivators() REAL placedRef: " + placedRef)

		; PlaceAtMe doesn't return anything when placing Packins, so find it this way
		placedRef = interactionTargetRefs[i].FindAllReferencesOfType(PrefabPackinPivotDummy, 1)[0]

		Trace(self, "PlaceInteractionActivators() TEMP placedRef: " + placedRef)

		;get the linked activator volume
		ObjectReference activatorRef = placedRef.GetLinkedRef(InteractionActivatorLinkKeyword)

		Trace(self, "PlaceInteractionActivators() activatorRef: " + activatorRef)
		InteractionActivators.AddRef(activatorRef)

		i += 1
	EndWhile
	; update global to whatever number of activators we created
	RQ_Settlement_PlaceObject_01_MaxCount.SetValueInt(i)
	; update reward to whatever number of activators we created
	RQ_Settlement_PlaceObject_01_CreditsReward.SetValueInt(Math.Floor(CreditsRewardRadiantQuestSmall.GetValue() * i/MaxActivators))

	UpdateCurrentInstanceGlobal(RQ_Settlement_PlaceObject_01_MaxCount)
EndFunction

Function DebugMoveToNextActivator()
	Game.GetPlayer().MoveTo(InteractionActivators.GetAt(iDebugNextActivator))

	iDebugNextActivator = iDebugNextActivator + 1 % InteractionActivators.GetCount()
EndFunction