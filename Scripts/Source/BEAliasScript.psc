Scriptname BEAliasScript extends ReferenceAlias
{Standard script for aliases on Boarding Encounter quests.}

Group Optional_Actor_Properties
	bool property ShouldStartDead = False Auto Const
	{DEFAULT=False. If True, if this is an actor, they will be killed after initializing.}

	int property KillIfSpaceshipCrewCountAtOrBelow = -1 Auto Const
	{OPTIONAL. Default=-1. If the SpaceshipCrew count starts at or below this value, kill this actor when they spawn.}

	bool property ShouldIncludeInCrew = True Auto Const
	{DEFAULT=True. If True, BEScript will add this actor to the AllCrew RefCollectionAlias and count them toward the ship's SpaceshipCrew.}

	bool property ShouldIncludeAtFrontOfBoardingParty = False Auto Const
	{DEFAULT=False.
	If True, if ShouldBoardPlayersShip, this actor will be included early in the boarding waves if possible. They may or may not be in the first wave due to timing issues. 
	If both BoardingParty bools are false, this actor will not board the player's ship.}

	bool property ShouldIncludeAtBackOfBoardingParty = False Auto Const
	{DEFAULT=False. If True, if ShouldBoardPlayersShip, this actor will be included late in the boarding waves if possible.
	If ShouldIncludeAtFrontOfBoardingParty, this value is ignored. If both BoardingParty bools are false, this actor will not board the player's ship.}
EndGroup

Group AutofillProperties CollapsedOnBase
	REParentScript property RE_Parent Auto Const Mandatory
	ReferenceAlias property EnemyShip Auto Const Mandatory
	ActorValue property SpaceshipCrew Auto Const Mandatory
EndGroup


Event OnAliasInit()
	BEScript parentQuest = GetOwningQuest() as BEScript
	Actor selfActor = GetActorRef()
	if ((parentQuest != None) && (selfActor != None))
		if (ShouldStartDead || ((KillIfSpaceshipCrewCountAtOrBelow >= 0) && (KillIfSpaceshipCrewCountAtOrBelow >= EnemyShip.GetRef().GetValue(SpaceshipCrew))))
			parentQuest.RegisterBEAliasActor(selfActor, True, ShouldIncludeInCrew, ShouldIncludeAtFrontOfBoardingParty, ShouldIncludeAtBackOfBoardingParty)
		Else
			parentQuest.RegisterBEAliasActor(selfActor, False, ShouldIncludeInCrew, ShouldIncludeAtFrontOfBoardingParty, ShouldIncludeAtBackOfBoardingParty)
		EndIf
	EndIf
EndEvent