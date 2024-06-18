Scriptname Crew_EliteCrewQuestScript extends Crew_RecruitQuestScript

Event OnQuestInit()
	CrewMemberRef = Alias_CrewMember.GetActorReference()
	Trace(self, "OnQuestInit() CrewMemberRef: " + CrewMemberRef)
	if Game.GetPlayer().HasPerk(Trait_Taskmaster)
		SetCostMultAndUpdateCost(CostMult_Taskmaster)
	else
		UpdateCost()
	endif
EndEvent

Function PickupSceneEnded()
	Trace(self, "PickupSceneEnded()")
	SQ_Crew.SetEliteCrewActive(CrewMemberRef)
EndFunction

Function DismissSceneEnded()
	Trace(self, "DismissSceneEnded()")
	SQ_Crew.SetEliteCrewInActive(CrewMemberRef)
EndFunction

Function WaitSceneEnded()
	Trace(self, "WaitSceneEnded()... calling SQ_Followers.CommandWait() CrewMemberRef: " + CrewMemberRef)
	SQ_Followers.CommandWait(CrewMemberRef)
EndFunction

Function FollowSceneEnded()
	Trace(self, "FollowSceneEnded()... calling SQ_Followers.CommandFollow() CrewMemberRef: " + CrewMemberRef)
	SQ_Followers.CommandFollow(CrewMemberRef)
EndFunction

Function GiveItemSceneEnded()
	(CrewMemberRef as COM_CREW_GiveItemActorScript).GiveItems()
EndFunction

Function StartBackstoryTimer()
	float expiry = Utility.ExpiryDay(SQ_Crew.Crew_Elite_BackstoryFollowup_CooldownDays.GetValue())
	CrewMemberRef.SetValue(SQ_Crew.Crew_Elite_BackstoryFollowup_Day, expiry)
EndFunction

