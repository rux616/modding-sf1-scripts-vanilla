Scriptname DefaultFollowerToggleQuestScript extends Quest Default
{Attach to quest where you have a follower you want to control follower state on using conditions various triggering events.

You can also call this function to trigger a check and toggle accordingly:
CheckConditions()}

Group Autofill_Properites
	SQ_FollowersScript Property SQ_Followers Mandatory Const Auto
EndGroup

Group Properties
	ReferenceAlias Property PotentialFollower Mandatory Const Auto
	{An alias holding an actor that should toggle between being a player follower and not being one.}

	ConditionForm Property FollowConditions Mandatory Auto Const
	{ConditionForm that is evaluated for when the actor should become a follower}

	bool Property FollowConditions_RequiredOutput = true Const Auto
	{What do FollowConditions need to evaulate for actor to become a follower?
	
	If true (default), actor becomes a follower when FollowConditions evaluate true
    if false, actor becomes a follower when FollowConditions evaluate false }

	ConditionForm Property StopFollowConditions = None Mandatory Auto Const
	{ConditionForm that is evaluated for when the actor should stop being a follower.
NOTE: normally this will be THE SAME condition form as the FollowConditions (See StopFollowConditions_RequiredOutput below for why)}

    bool Property StopFollowConditions_RequiredOutput = false Const Auto
	{What do StopFollowConditions need to evaulate for actor to stop being a follower?
		
	If false (default), actor stops being a follower when StopFollow_Conditions evaluate false
    if true, actor stops being a follower when StopFollow_Conditions evaluate true
	NOTE: A value of false (default) lets you use the same condition form for both Follow and StopFollow as a mutally exclusive toggle) }

	bool Property Triggering_OnQuestInit = true Const Auto
	{If true (default), will evaluate Conditions when the quest inits)}

	LocationAlias[] Property Triggering_LocationAliases Const Auto
	{player entering or leaving these locations will evaluate Conditions. Example: dungeon location}

	ReferenceAlias[] Property Triggering_ActivationRefAliases Const Auto
	{player activating any of these references will evaluate Conditions. Example: a door.}

	ReferenceAlias[] Property Triggering_EnterLeaveRefAliases Const Auto
	{player entering or leaving any of these references will evaluate Conditions. Example: a trigger box.}

	int[] property Triggering_Stages Const Auto
	{Quest being set to any of these stages will evaluate Conditions.}

	bool Property Trigger_AnyLocation Const Auto
	{Normally you will use Triggering_LocationAliases to specify, but if you have complex conditions, like when you are in any location on a particular planet, etc.
	You can use this to test conditions anytime the player changes location}

	bool Property TeleportToPlayerOnStartFollow Const Auto
	{If true, whenever conditions are checked, if the PotentialFollower is far away and FollowConditions are true, they will be moveto'd the player.}

	float Property TeleportDistance = 100.0 Const Auto
	{if TeleportToPlayerOnStartFollow is true, PotentialFollower will be teleported to player if at or greater than this distance away}

	bool property SetUnavailableWhenStopFollow = false const auto
	{ passed to SQ_Followers.SetRoleInactive as the AlsoSetUnavailable parameter - removes follower from AvailableFollowers collection }
EndGroup

Group Debug_Properties
    Bool Property ShowTraces = true Auto Const
    {(Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives.}
EndGroup


Event OnQuestStarted()
	;register for events
	if Triggering_LocationAliases.Length > 0 || Trigger_AnyLocation == true
		RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
	endif

	int i = 0
	While (i < Triggering_ActivationRefAliases.length)
		ReferenceAlias myCurrentRef = Triggering_ActivationRefAliases[i]
		RegisterForRemoteEvent(myCurrentRef, "OnActivate")
		i += 1
	EndWhile

	i = 0
	While (i < Triggering_EnterLeaveRefAliases.length)
		ReferenceAlias myCurrentTrigger = Triggering_EnterLeaveRefAliases[i]
		RegisterForRemoteEvent(myCurrentTrigger, "OnTriggerEnter")
		RegisterForRemoteEvent(myCurrentTrigger, "OnTriggerLeave")
		i += 1
	EndWhile

	if Triggering_OnQuestInit
		CheckConditions()
	endif
EndEvent

Event OnStageSet(int auiStageID, int auiItemID)
	debug.trace(self + " OnStageSet " + auiStageID)
	if Triggering_Stages.Find(auiStageID) >= 0
		CheckConditions()
	endif
endEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	if akSender == Game.GetPlayer()

		if Trigger_AnyLocation
			CheckConditions()
		else
			int i = 0
			While (i < Triggering_LocationAliases.length)
				Location currentLocation = Triggering_LocationAliases[i].GetLocation()
				
				if currentLocation == akOldLoc || currentLocation == akNewLoc
					CheckConditions()
					i = Triggering_LocationAliases.length
				endif

				i += 1
			EndWhile
		endif
	endif
EndEvent

event ReferenceAlias.OnActivate(ReferenceAlias akSender, ObjectReference akActionRef)
	CheckConditionsIfPlayer(akSender, akActionRef)
EndEvent

Event ReferenceAlias.OnTriggerEnter(ReferenceAlias akSender, ObjectReference akActionRef)
	DefaultScriptFunctions.Trace(self, "OnTriggerEnter() akSender: " + akSender + ",  akActionRef: " +  akActionRef, ShowTraces)
	CheckConditionsIfPlayer(akSender, akActionRef)
EndEvent

Event ReferenceAlias.OnTriggerLeave(ReferenceAlias akSender, ObjectReference akActionRef)
	CheckConditionsIfPlayer(akSender, akActionRef)
EndEvent

function CheckConditionsIfPlayer(ReferenceAlias akSender, ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		CheckConditions(TargetRef = akSender.GetReference())
	endif
endFunction

Function CheckConditions(ObjectReference TargetRef = None)

	DefaultScriptFunctions.Trace(self, "CheckConditions() TargetRef: " + TargetRef, ShowTraces)

	Actor potentialFollowerActor = PotentialFollower.GetActorReference()
	bool followConditions_Output =  FollowConditions.IsTrue(akRefObject = potentialFollowerActor, akTargetObject = TargetRef)
	bool stopfollowConditions_Output =  StopFollowConditions.IsTrue(akRefObject = potentialFollowerActor, akTargetObject = TargetRef)

	bool currentlyIsFollower = SQ_Followers.IsRoleActive(potentialFollowerActor)

	DefaultScriptFunctions.Trace(self, "CheckConditions() potentialFollowerActor: " + potentialFollowerActor, ShowTraces)
	DefaultScriptFunctions.Trace(self, "CheckConditions() currentlyIsFollower: " + currentlyIsFollower, ShowTraces)
	DefaultScriptFunctions.Trace(self, "CheckConditions() followConditions_Output: " +  followConditions_Output + ", FollowConditions_RequiredOutput: " + FollowConditions_RequiredOutput, ShowTraces)
	DefaultScriptFunctions.Trace(self, "CheckConditions() stopfollowConditions_Output: " +  stopfollowConditions_Output + ", StopFollowConditions_RequiredOutput: " + StopFollowConditions_RequiredOutput, ShowTraces)

	if followConditions_Output == FollowConditions_RequiredOutput
		SQ_Followers.SetRoleActive(potentialFollowerActor)
		Actor playerRef = Game.GetPlayer()
		if currentlyIsFollower == false && TeleportToPlayerOnStartFollow && potentialFollowerActor.GetDistance(playerRef) >= TeleportDistance
			DefaultScriptFunctions.Trace(self, "CheckConditions() teleporting potentialFollowerActor to player.", ShowTraces)
			potentialFollowerActor.MoveTo(playerRef)
		endif
	elseif stopfollowConditions_Output == StopFollowConditions_RequiredOutput
		SQ_Followers.SetRoleInactive(potentialFollowerActor, AlsoDisplayUnavailableMessage = false, AlsoSetUnavailable = SetUnavailableWhenStopFollow)
	endif

EndFunction
