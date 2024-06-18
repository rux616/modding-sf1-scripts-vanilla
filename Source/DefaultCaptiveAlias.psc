Scriptname DefaultCaptiveAlias extends ReferenceAlias default
{Use this script to gain standard support for bound captive npcs being freed by player.

WARNING: Dual use of DefaultCaptiveAlias AND DefaultCaptiveWoundedAlias on the same NPC is not currently supported.

Let system design know if this is an important need.}
;not currently supporting both scripts to avoid problems with clearing the CaptiveFaction

Group AutoFillProperties
	SQ_CaptiveScript Property SQ_Captive Mandatory Const Auto
	Faction Property CaptiveFaction Mandatory Auto Const ;CaptiveFaction is a standard faction we put "innocent" NPCs found in hostile dungeons to keep hostiles from aggroing on them.
	Keyword Property SQ_Link_CaptiveFurniture Mandatory Const Auto

	Faction Property BoundFaction Mandatory Auto const
	ActorValue Property SQ_CaptiveState Mandatory Const Auto
	GlobalVariable Property SQ_CaptiveState_0_Unset Mandatory Const Auto 
	GlobalVariable Property SQ_CaptiveState_1_Captive Mandatory Const Auto
	GlobalVariable Property SQ_CaptiveState_2_Freed Mandatory Const Auto
	Keyword Property SQ_Captive_DialogueSubtype_FreedPrisonerGratitude Mandatory Auto const	
	Keyword Property SQ_Captive_FurnitureType_Bound Mandatory Const Auto

	SQ_FollowersScript Property SQ_Followers Mandatory Const Auto
EndGroup

Group MainProperties
	bool Property StartBound = true Const Auto
	{if true, captive is bound}

	bool Property DisableOnUnload = false Auto Const
	{after being freed, this actor will disable when unloaded}

	bool Property AlsoRemoveFromCaptiveFaction = false Auto Const
	{after being freed, this actor will also be removed from the CaptiveFaction
		Use this for actors that will be attacked while fleeing}
EndGroup

Group SetStageProperties
	Quest Property QuestToSet Auto
	{ If this is set, set the stage on this quest if StageToSetWhenFreed is not -1
		If QuestToSet is NOT set, it will try to set the stage on the owning quest}

	int Property StageToSetWhenFreed = -1 auto const
	{ this stage will be set when the prisoner is freed }

	int Property StageToSetOnCleanUp = -1 Auto Const
	{ this stage will be set when we try to clean up the actor }

EndGroup

Group CleanUpProperties
	bool Property RemoveFromFactions = true Const Auto
	{if true (default), will remove from factions added by this script when cleaned up}

	bool Property DeleteWhenCleanedUp = false Const Auto
	{if true, will delete when cleaned up}
EndGroup



Event OnAliasInit()
	RegisterForCustomEvent(SQ_Captive, "CaptiveSetFree")

	AddToFactions()
	SetState()
EndEvent

Event OnAliasShutdown()
	ClearFactions()
	ResetAVs()
	CleanupIfReady()
EndEvent

Event OnAliasChanged(ObjectReference akObject, bool abRemove)
	;in case the alias is filled after the quest starts
	if abRemove == false
		AddToFactions()
		SetState()
	endif
EndEvent

Event OnLoad()
	SetState()
EndEvent



Event OnUnload()
	if DisableOnUnload
		GetReference().Disable()
	endif
EndEvent

Function AddToFactions()
	Actor captiveActor = GetActorReference()

	if captiveActor
		captiveActor.AddToFaction(CaptiveFaction) ;CaptiveFaction is a standard faction we put "innocent" NPCs found in hostile dungeons to keep hostiles from aggroing on them.

		if StartBound
			captiveActor.AddToFaction(BoundFaction)
		endif
	endif

EndFunction

Function SetState()
	Actor actorRef = GetActorRef()

	if actorRef && actorRef.IsInFaction(BoundFaction)
		actorRef.SetValue(SQ_CaptiveState, SQ_CaptiveState_1_Captive.GetValue())
		if actorRef.Is3DLoaded()
			; get into furniture
			ObjectReference captiveFurniture = actorRef.GetLinkedRef(SQ_Link_CaptiveFurniture)
			if captiveFurniture
				actorRef.SnapIntoInteraction(captiveFurniture)
			endif
		endif
		actorRef.SetRestrained()
	EndIf

EndFunction

Event SQ_CaptiveScript.CaptiveSetFree(SQ_CaptiveScript akSender, var[] akArgs)
	Actor captive = akArgs[0] as Actor
	bool playerIsLiberator = akArgs[1] as bool
	bool showInventory = akArgs[2] as bool

	if captive == GetReference()
		FreePrisoner(playerIsLiberator = playerIsLiberator, OpenPrisonerInventory = showInventory)
	endif
EndEvent

Function CleanupIfReady()
	Actor actorRef = GetActorRef()

	if actorRef.IsInFaction(BoundFaction) == false
		if RemoveFromFactions
			ClearFactions()
		endif

		if DeleteWhenCleanedUp
			actorRef.Disable()
			actorRef.Delete()
		endif

		if StageToSetOnCleanUp > -1
			if QuestToSet
				QuestToSet.SetStage(StageToSetOnCleanUp)
			else
				GetOwningQuest().SetStage(StageToSetOnCleanUp)
			endif
		endif
	endif
EndFunction

;CaptiveFaction is a standard faction we put "innocent" NPCs found in hostile dungeons to keep hostiles from aggroing on them.
Function RemoveFromCaptiveFactionIfNeeded()
	Actor actorRef = GetActorRef()
	
	if AlsoRemoveFromCaptiveFaction && actorRef.IsInFaction(BoundFaction) == false
		actorRef.RemoveFromFaction(CaptiveFaction)
	endif
EndFunction

Function FreePrisoner(bool playerIsLiberator= true, bool OpenPrisonerInventory = False)
 	Actor actorRef = GetActorRef()
	 
	debug.trace(self + "FreePrisoner() actorRef: " + actorRef + ",  playerIsLiberator:" + playerIsLiberator + ", OpenPrisonerInventory:" + OpenPrisonerInventory)	
	
	actorRef.SetValue(SQ_CaptiveState, SQ_CaptiveState_2_Freed.GetValue())

	actorRef.RemoveFromFaction(BoundFaction)
	RemoveFromCaptiveFactionIfNeeded()

	actorRef.SetRestrained(false)

	actorRef.EvaluatePackage()
	
	if OpenPrisonerInventory
		actorRef.openInventory(True)
	EndIf
	
	actorRef.SayCustom(SQ_Captive_DialogueSubtype_FreedPrisonerGratitude)

	if StageToSetWhenFreed > -1
		if QuestToSet
			QuestToSet.SetStage(StageToSetWhenFreed)
		else
			GetOwningQuest().SetStage(StageToSetWhenFreed)
		endif
	endif
	actorRef.EvaluatePackage()
EndFunction

;call when quest shuts down
Function ClearFactions()
	Actor actorRef = GetActorRef()

	actorRef.RemoveFromFaction(CaptiveFaction) ;CaptiveFaction is a standard faction we put "innocent" NPCs found in hostile dungeons to keep hostiles from aggroing on them.
	actorRef.RemoveFromFaction(BoundFaction)
EndFunction

Function ResetAVs()
	Actor actorRef = GetActorRef()

	actorRef.SetValue(SQ_CaptiveState, SQ_CaptiveState_0_Unset.GetValue())
EndFunction







