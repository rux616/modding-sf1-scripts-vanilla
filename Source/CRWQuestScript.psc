Scriptname CRWQuestScript extends Quest

ReferenceAlias Property CrewPosition Auto Const Mandatory
ReferenceAlias Property CrewName Auto Const Mandatory
Faction Property AvailableCrewFaction Auto Const Mandatory
Faction Property CurrentCrewFaction Auto Const Mandatory
Faction Property PotentialCrewFaction Auto Const Mandatory
Message Property HiredMessage Auto Const Mandatory
Message Property FiredMessage Auto Const Mandatory


;This function is called in the individual CRW Quests
Function CrewHired()

	CrewPosition.ForceRefTo(CrewName.GetActorRef())
	CrewName.GetActorRef().SetFactionRank(CurrentCrewFaction,0)
	CrewName.GetActorRef().SetFactionRank(PotentialCrewFaction,-1)
	CrewName.GetActorRef().SetFactionRank(AvailableCrewFaction,-1)
	HiredMessage.Show()

EndFunction

;This function is called in the individual CRW Quests
Function CrewFired()

	CrewPosition.Clear()
	CrewName.GetActorRef().SetFactionRank(CurrentCrewFaction,-1)
	CrewName.GetActorRef().SetFactionRank(AvailableCrewFaction,0)
	FiredMessage.Show()

EndFunction