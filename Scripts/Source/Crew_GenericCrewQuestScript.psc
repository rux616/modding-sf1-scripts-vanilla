Scriptname Crew_GenericCrewQuestScript extends Crew_RecruitQuestScript

Group Autofill
	Keyword property LinkGenericCrewSpawnMarker auto const mandatory
	{The keyword to use to find the linked spawn marker that spawned this Generic Crew.}
endGroup

Event OnQuestInit()
	RegisterForRemoteEvent(Alias_CrewMember, "OnAliasChanged")
EndEvent

Event ReferenceAlias.OnAliasChanged(ReferenceAlias akSender, ObjectReference akObject, bool abRemove)
	CrewMemberRef = Alias_CrewMember.GetActorReference()
	Trace(self, "OnAliasChanged() CrewMemberRef: " + CrewMemberRef + "abRemove: " + abRemove)
	if Game.GetPlayer().HasPerk(Trait_Taskmaster)
		SetCostMultAndUpdateCost(CostMult_Taskmaster)
	else
		UpdateCost()
	endif
EndEvent

;Overridden from Crew_RecruitQuestScript
Function Recruited()
	if CrewMemberRef
		; For generic crew, we need to remove the crew from the spawn marker's crew array so that it doesn't attempt
		; to clean up this actor when it respawns, and to prevent persistence. Used the linked ref to find it.
		CrewSpawnerScript crewSpawner = CrewMemberRef.GetLinkedRef(LinkGenericCrewSpawnMarker) as CrewSpawnerScript
		if crewSpawner
			crewSpawner.RemoveFromSpawnedCrewArray(CrewMemberRef)
		endif
	endif

	; Call the parent implementation and continue.
	parent.Recruited()
endFunction