Scriptname DefaultCaptiveWoundedAlias extends ReferenceAlias
{Use this script to gain standard support for wounded captive npcs being healed by player.

WARNING: Dual use of DefaultCaptiveAlias AND DefaultCaptiveWoundedAlias on the same NPC is not currently supported.

Let system design know if this is an important need.}
;not currently supporting both scripts to avoid problems with clearing the CaptiveFaction


Group AutoFillProperties
	SQ_CaptiveScript Property SQ_Captive Mandatory Const Auto
	Faction Property CaptiveFaction Mandatory Auto Const ;CaptiveFaction is a standard faction we put "innocent" NPCs found in hostile dungeons to keep hostiles from aggroing on them.
	Keyword Property SQ_Link_CaptiveFurniture Mandatory Const Auto

	Faction Property WoundedFaction Mandatory Auto Const
	ActorValue Property SQ_WoundedState Mandatory Const Auto
	GlobalVariable Property SQ_WoundedState_0_Unset Mandatory Const Auto
	GlobalVariable Property SQ_WoundedState_1_Wounded Mandatory Const Auto
	GlobalVariable Property SQ_WoundedState_2_Healed Mandatory Const Auto
	Keyword Property SQ_Wounded_DialogueSubtype_HealedActorGratitude Mandatory Auto const
	Keyword Property SQ_Captive_FurnitureType_Wounded Mandatory Const Auto
EndGroup

Group MainProperties
	bool Property StartWounded = true Const Auto
	{if true, captive is wounded}

	bool Property DisableOnUnload = false Auto Const
	{after being freed, this actor will disable when unloaded}

	bool Property AlsoRemoveFromCaptiveFaction = false Auto Const
	{after being freed, this actor will also be removed from the CaptiveFaction
		Use this for actors that will be attacked while fleeing}
EndGroup

Group SetStageProperties
	Quest Property QuestToSet Auto
	{ If this is set, set the stage on this quest if StageToSetWhenHealed is not -1
		If QuestToSet is NOT set, it will try to set the stage on the owning quest}

	int Property StageToSetWhenHealed = -1 auto const
	{ this stage will be set when the victim is healed }

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
	RegisterForCustomEvent(SQ_Captive, "WoundedActorHealed")

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

		if StartWounded
			captiveActor.AddToFaction(WoundedFaction)
		endif
	endif

EndFunction

Function SetState()
	Actor actorRef = GetActorRef()
	debug.trace(self + "SetState" + actorRef)

	if actorRef.IsInFaction(WoundedFaction)
		actorRef.SetValue(SQ_WoundedState, SQ_WoundedState_1_Wounded.GetValue())
		if actorRef.Is3DLoaded()
			; get into furniture
			ObjectReference captiveFurniture = actorRef.GetLinkedRef(SQ_Link_CaptiveFurniture)
			debug.trace(self + " 3D is loaded - furniture=" + captiveFurniture)
			if captiveFurniture
				actorRef.SnapIntoInteraction(captiveFurniture)
			endif
		endif
		actorRef.SetRestrained()
	endIf
EndFunction

Event SQ_CaptiveScript.WoundedActorHealed(SQ_CaptiveScript akSender, var[] akArgs)
	Actor woundedActor = akArgs[0] as Actor
	bool playerIsHealer = akArgs[1] as bool
	bool showInventory = akArgs[2] as bool

	if woundedActor == GetReference()
		HealActor(playerIsHealer)
	endif
EndEvent


Function CleanupIfReady()
	Actor actorRef = GetActorRef()

	if actorRef.IsInFaction(WoundedFaction) == false
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
	
	if AlsoRemoveFromCaptiveFaction && actorRef.IsInFaction(WoundedFaction) == false
		actorRef.RemoveFromFaction(CaptiveFaction)
	endif
EndFunction

Function HealActor(bool playerIsHealer = true)
 	Actor actorRef = GetActorRef()
	 
	debug.trace(self + "HealActor() ActorRef:" + actorRef + ", playerIsHealer:" + playerIsHealer)	
	
	actorRef.SetValue(SQ_WoundedState, SQ_WoundedState_2_Healed.GetValue())

	actorRef.RemoveFromFaction(WoundedFaction)
	RemoveFromCaptiveFactionIfNeeded()

	actorRef.SetRestrained(false)

	actorRef.EvaluatePackage()
	
	actorRef.SayCustom(SQ_Wounded_DialogueSubtype_HealedActorGratitude)
	
	if StageToSetWhenHealed > -1
		if QuestToSet
			QuestToSet.SetStage(StageToSetWhenHealed)
		else
			GetOwningQuest().SetStage(StageToSetWhenHealed)
		endif
	endif
	actorRef.EvaluatePackage()

EndFunction

;call when quest shuts down
Function ClearFactions()
	Actor actorRef = GetActorRef()

	actorRef.RemoveFromFaction(CaptiveFaction) ;CaptiveFaction is a standard faction we put "innocent" NPCs found in hostile dungeons to keep hostiles from aggroing on them.
	actorRef.RemoveFromFaction(WoundedFaction)
EndFunction

Function ResetAVs()
	Actor actorRef = GetActorRef()

	actorRef.SetValue(SQ_WoundedState, SQ_WoundedState_0_Unset.GetValue())
EndFunction







