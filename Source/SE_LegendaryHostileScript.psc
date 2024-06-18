Scriptname SE_LegendaryHostileScript extends ReferenceAlias
{Script to induce ships to attack based on distance}

Group Required_Data
	ReferenceAlias Property TargetAlias Auto Const Mandatory
	{The alias we're interested in}

	int Property HailingDistance = 5000 Auto Const
	{The needed distance to start the hail}

	int Property AttackDistance = 1500 Auto Const 
	{The needed distance for the group to attack}

	int Property ObjectiveToDisplay = 10 Auto Const 
	{The objective for the player to attack}

	Scene Property HailingScene Auto Const

	Faction Property PlayerFriendFaction Auto Const Mandatory

	Faction Property PlayerEnemyFaction Auto Const Mandatory

	ReferenceAlias Property Alias_MapMarker Auto Const

	RefCollectionAlias Property LegendaryShips Auto Const Mandatory

	ActorValue Property Aggression Auto Const Mandatory

	bool Property IsFlagship = false Auto Const
EndGroup

Event OnLoad()
	; Register each time we load reference and add to refcollection
	if IsFlagship == true
		RegisterForDistanceLessThanEvent(Self, TargetAlias, HailingDistance)
	else
		RegisterForDistanceLessThanEvent(Self, TargetAlias, AttackDistance)
	endif
	RegisterForHitEvent(Self, Game.GetPlayer(), abMatch = true)
	LegendaryShips.AddRef(Self.GetRef())
EndEvent

Event OnUnload()
	; Unregister each time we unload reference and remove ref
	if IsFlagship == true
		UnregisterForDistanceEvents(Self, TargetAlias, HailingDistance)
	else
		UnregisterForDistanceEvents(Self, TargetAlias, AttackDistance)
	endif
	UnregisterForHitEvent(Self, Game.GetPlayer(), abMatch = true)

	;Fire off timer once player has left the area
	(GetOwningQuest() as SE_LegendaryScript).StartMoveTimer()
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
	if IsFlagship == true
	; if the player gets within range of the flagship, have it hail once
		HailingScene.Start()
		UnregisterForDistanceEvents(Self, TargetAlias, HailingDistance)
	else
	; if the player gets within range of the guard ship, have the group attack
		BeginAttack()
	endif
	; regardless, display objective
	GetOwningQuest().SetObjectiveDisplayed(ObjectiveToDisplay)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	BeginAttack()
endEvent

Function BeginAttack()
	LegendaryShips.RemoveFromFaction(PlayerFriendFaction)
	LegendaryShips.AddtoFaction(PlayerEnemyFaction)
	LegendaryShips.SetValue(Aggression, 1)
	LegendaryShips.StartCombatAll(Game.GetPlayer())
	if IsFlagship == false
		UnregisterForDistanceEvents(Self, TargetAlias, AttackDistance)
	endif
	UnregisterForHitEvent(Self, Game.GetPlayer(), abMatch = true)
endFunction


