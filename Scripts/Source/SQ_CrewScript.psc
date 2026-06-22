Scriptname SQ_CrewScript extends SQ_ActorRolesScript

;SEE SQ_FollowersScript and SQ_CompanionsScript for functions, etc. that should live here. They will be very similar.

Group CrewData
    ReferenceAlias Property ActiveEliteCrew Mandatory Const Auto
	{autofill; when actively following the player, Elite Crew will be in this alias}
	
	Keyword Property COM_CREW_DismissedGenericTopic Mandatory Const Auto
	{autofill; when unassigned through the menu while actively following the player, and Elite Crew will say this dialogue topic subtype, also when picking up companions or other elite crew}

	Faction Property AvailableCrewFaction Mandatory Const Auto
	{autofill}

	Faction Property COM_CREW_CrimeFaction_IgnoreNonMembers Mandatory Const Auto
	{autofill; makes them not report crime against non-crew after becoming available}

	Faction Property COM_CREW_CrimeFaction_IgnoreNonMembersNonViolent Mandatory Const Auto
	{autofill; makes them not report non-violent crime against non-crew after becoming available}

	MiscObject Property Credits Auto Const Mandatory
    {Autofill Credits}

    ReferenceAlias property HomeShip auto const mandatory
    { player home ship }

    RefCollectionAlias property CrewGoingHome auto const mandatory
    { actors in this alias are waiting to go home after being unassigned from an outpost }

    RefCollectionAlias property CrewGoingToOutposts auto const mandatory
    { actors in this alias are waiting to go to an outpost }

	Crew_GenericCrewQuestScript Property CREW_GenericCrew Mandatory Const Auto
	{autofill}

	Keyword Property Crew_CrewTypeElite Mandatory Const Auto
	{autofill}

	Keyword Property Crew_CrewTypeGeneric Mandatory Const Auto
	{autofill}

	ActorValue Property Crew_Elite_BackstoryFollowup_Day Mandatory Const Auto
	{autofill}

	GlobalVariable Property Crew_Elite_BackstoryFollowup_CooldownDays Mandatory Const Auto 
	{autofill}

	ActorValue Property Crew_CostTableIndex Mandatory Const Auto
	{Autofill; Holds an index into the below CrewCostTables for a particular crew member.
Reminder: this AV defaults to -1 so we can tell the difference between unset and set index of 0, 
in case someone wants to specify a particular value for specific elite crew member}

	ActorValue Property Crew_CostMult Mandatory Const Auto
	{autofill; holds the multiplier on the base crew cost for a particular crew member. Defaults to 1.0. Set to 0.75 to grant a 25% discount.}
	
	ActorValue Property FOL_ActiveFollower Mandatory Const Auto
	{ track if crew member has been dismissed }

	ActorValue Property COM_PQ_LockedIn Mandatory Const Auto
	{ track if crew member is Locked In }

	int[] Property CrewCostTable_Elite Mandatory Const Auto
	{A tight range of aesthetic values of hire costs for elite crew. (500, 525, 550) etc.}

	int[] Property CrewCostTable_Generic Mandatory Const Auto
	{A tight range of aesthetic values of hire costs for generic crew. (200, 225, 250) etc.}

    ReferenceAlias property OutpostCrewApply auto const mandatory
    { used for stamping data onto crew assigned to an outpost }

	Keyword Property LinkOutpostCrewMarker01 Mandatory Const Auto
	{autofill}

	Keyword property LinkGenericCrewSpawnMarker mandatory const auto
	{autofill}

	ActorBase Property Crew_LvlCrew_Any auto const mandatory
	{ used to debug create crew }

	Keyword Property CREW_AlwaysTeammateWhenAssigned Mandatory Const Auto
	{Autofill; currently for Vasco to prevent aggroing while standing outside the ship if not currently a follower but in a space the player is allowed to be because of factions}

	ActorValue Property SpaceshipCrewSlots auto const mandatory
	{ autofill }
endGroup

Achievements_CompanionsAndEliteCrew Property Achievements_Quest Mandatory Const Auto
{autofill}

; GUARDS:
Guard crewAssignmentLock ProtectsFunctionLogic   ; guards changes to crew assignment

Guard outpostCrewUpdateLock ProtectsFunctionLogic   ; guards changes to outpost crew when deleting crew stations

RefCollectionAlias Property DismissedCrew Mandatory Const Auto ;SQ_PlayerShip alias
RefCollectionAlias Property DisembarkingCrew Mandatory Const Auto ;SQ_PlayerShip alias

Event OnQuestInit()
    Parent.OnQuestInit() ; just in case
	
	ReferenceAlias RefAlias_Available = Alias_Available as ReferenceAlias
	RefCollectionAlias RefColAlias_Available = Alias_Available as RefCollectionAlias
	if RefAlias_Available
		RegisterForRemoteEvent(RefAlias_Available, "OnUnload")
		RegisterForRemoteEvent(RefAlias_Available, "OnDeath")
	Else 
		RegisterForRemoteEvent(RefColAlias_Available, "OnUnload")
		RegisterForRemoteEvent(RefColAlias_Available, "OnDeath")
	endif

   	RegisterForRemoteEvent(CrewGoingHome, "OnUnload")
   	RegisterForRemoteEvent(CrewGoingToOutposts, "OnUnload")


	WarnOnFalseAssumptions()
EndEvent

Event RefCollectionAlias.OnUnload(RefCollectionAlias akSource, ObjectReference akSenderRef)
	Trace(self, "OnUnload() akSource: " + akSource + ", akSenderRef: " + akSenderRef)
	if akSource == CrewGoingHome
		HandleCrewGoingHomeUnloaded(akSource)
	elseif akSource == Alias_Available
		TestAndHandleUnloadedUnassignedGenericCrew(akSenderRef as Actor)
	endif
endEvent

Event ReferenceAlias.OnUnload(ReferenceAlias akSender)
	Trace(self, "OnUnload() akSender: " + akSender)
	TestAndHandleUnloadedUnassignedGenericCrew(akSender.GetActorRef())
EndEvent

Event ReferenceAlias.OnDeath(ReferenceAlias akSender, ObjectReference akKiller)
	Trace(self, "OnDeath() akSender: " + akSender)
	Game.RemoveFromAvailableCrew(akSender.GetActorRef())
EndEvent

Event RefCollectionAlias.OnDeath(RefCollectionAlias akSender, ObjectReference akSenderRef, ObjectReference akKiller)
	Trace(self, "OnDeath() akSender: " + akSender + ", akSenderRef: " + akSenderRef)
	Game.RemoveFromAvailableCrew(akSenderRef as Actor)
EndEvent


Function WarnOnFalseAssumptions()
	; workaround for compiler bug
	Alias AliasActiveVar = Alias_Active
	bool isAlias_Active_a_RefCollectionAlias = AliasActiveVar is RefCollectionAlias

	if isAlias_Active_a_RefCollectionAlias == false
		Warning(self, "WarnOnFalseAssumptions()	Alias_Active is expected to be a RefCollectionAlias but it is a ReferenceAlias!")
	endif

EndFunction


;************************************************************************************
;****************************       ROLE FUNCTIONS      *****************************
;************************************************************************************
;overridden parent function
Function _CustomSetRoleAvaliable(Actor ActorToUpdate)
	Trace(self, "_CustomSetRoleAvaliable() ActorToUpdate: " + ActorToUpdate + ", calling AddToVailableCrew()")
	Game.AddToAvailableCrew(ActorToUpdate)

	Faction replacementCrimeFaction = None

	CompanionCrimeResponseScript CrimeResponseActor = ActorToUpdate as CompanionCrimeResponseScript ;note: some elite crew have EliteCrewCrimeResponseScript which extends this

	;note all actors with CompanionCrimeResponseScript or child script have personal crime factions and scripting that manage their crime and combat reactions
	if CrimeResponseActor == false 
		replacementCrimeFaction = COM_CREW_CrimeFaction_IgnoreNonMembers
	endif

	if replacementCrimeFaction != None ;none is intentional for those with personal crime factions
		Faction currentCrimeFaction = ActorToUpdate.GetCrimeFaction()
		Trace(self, "_CustomSetRoleAvaliable() removing from currentCrimeFaction: " + currentCrimeFaction + ",  replacementCrimeFaction: " + replacementCrimeFaction)
		ActorToUpdate.RemoveFromFaction(currentCrimeFaction)
		ActorToUpdate.SetCrimeFaction(replacementCrimeFaction)
	endif

	if IsEliteCrew(ActorToUpdate)
		Trace(self, "_CustomSetRoleAvaliable() calling RecruitedCompanionOrEliteCrew() on Achievements_CompanionsAndEliteCrew.")
		Achievements_Quest.RecruitedCompanionOrEliteCrew(ActorToUpdate)
	endif
EndFunction
	
;overridden parent function
Function _CustomSetRoleUnavaliable(Actor ActorToUpdate)
	Trace(self, "_CustomSetRoleAvaliable() ActorToUpdate: " + ActorToUpdate + ", calling UnassignCrew()")
	Game.RemoveFromAvailableCrew(ActorToUpdate)
	ObjectReference assignedRef = ActorToUpdate.GetCrewAssignment()
	if assignedRef
		assignedRef.UnassignCrew(ActorToUpdate)
	endif
EndFunction

;overridden parent function
Function _CustomSetRoleActive(Actor ActorToUpdate, Actor PriorActiveActor)
	if ActorToUpdate.HasKeyword(CREW_AlwaysTeammateWhenAssigned)
		Trace(self, "_CustomSetRoleActive() ActorToUpdate: " + ActorToUpdate + ", HasKeyword CREW_AlwaysTeammateWhenAssigned, making Teammate")
		ActorToUpdate.SetPlayerTeammate(abCanDoFavor = false)
	endif
EndFunction
	
;overridden parent function
Function _CustomSetRoleInactive(Actor ActorToUpdate)
Trace(self, "_CustomSetRoleInactive() ActorToUpdate: " + ActorToUpdate)
	if IsEliteCrew(ActorToUpdate)
		Trace(self, "_CustomSetRoleInactive() IsEliteCrew so also calling SetEliteCrewInactive()")
		SetEliteCrewInactive(ActorToUpdate)
	endif

	if ActorToUpdate.HasKeyword(CREW_AlwaysTeammateWhenAssigned)
		Trace(self, "_CustomSetRoleActive() ActorToUpdate: " + ActorToUpdate + ", HasKeyword CREW_AlwaysTeammateWhenAssigned, unsetting Teammate")
		ActorToUpdate.SetPlayerTeammate(abTeammate = false, abCanDoFavor = false)
	endif
EndFunction


;in the future we might want an SQ_EliteCrew quest, but for now, just doing this here.
Function SetEliteCrewActive(Actor EliteCrew)
	Trace(self, "SetEliteCrewActive() EliteCrew: " + EliteCrew)

	;dismiss companions or other elite crew
	Actor companionActorToDismiss = SQ_Companions.GetActiveActor()
	if companionActorToDismiss != None
		companionActorToDismiss.SayCustom(COM_CREW_DismissedGenericTopic)
		SQ_Companions.SetRoleInactive(companionActorToDismiss)
	endif

	Actor eliteCrewToDismiss = ActiveEliteCrew.GetActorReference()
	if eliteCrewToDismiss != None 
		SetEliteCrewInactive(eliteCrewToDismiss, SayUnassignedLine = true)
	endif

	ActiveEliteCrew.ForceRefTo(EliteCrew)
	SQ_Followers.SetRoleActive(EliteCrew)
EndFunction

;in the future we might want an SQ_EliteCrew quest, but for now, just doing this here.
Function SetEliteCrewInactive(Actor EliteCrew, bool SayUnassignedLine = false)
	Trace(self, "SetEliteCrewInactive() EliteCrew: " + EliteCrew + ", SayUnassignedLine: " + SayUnassignedLine)

	Actor activeEliteCrewRef = ActiveEliteCrew.GetActorRef()

	Trace(self, "SetEliteCrewInactive() activeEliteCrewRef: " + activeEliteCrewRef)

	if activeEliteCrewRef && activeEliteCrewRef == EliteCrew
		ActiveEliteCrew.Clear()
	
		if SayUnassignedLine
			Trace(self, "SetEliteCrewInactive() calling SayCustom(COM_CREW_DismissedGenericTopic)")
			EliteCrew.SayCustom(COM_CREW_DismissedGenericTopic)
		endif

		SQ_Followers.SetRoleInactive(EliteCrew)
			
		;in case they are autodismissing because of combat
		EliteCrew.StopCombatAlarm()
		EliteCrew.StopCombat()
	endif
EndFunction

bool Function IsEliteCrew(Actor ActorToCheck)
	Return ActorToCheck.HasKeyword(Crew_CrewTypeElite)
EndFunction

bool Function IsActiveEliteCrew(Actor ActorToCheck)
	return ActiveEliteCrew.GetActorRef() == ActorToCheck
EndFunction


;************************************************************************************
;****************************    CREW COST FUNCTIONS    *****************************
;************************************************************************************

Function SetRecruitCost(Actor CrewMember)
	Trace(self, "SetRecruitCost() CrewMember: " + CrewMember)
	
	int[] costTable = GetRecruitCostTable(CrewMember)

	;if not already set, randomly set an index into the table
	if CrewMember.GetValue(Crew_CostTableIndex) < 0
		int iRandom = Utility.RandomInt(0, costTable.Length - 1)

		Trace(self, "SetRecruitCost() setting Crew_CostTableIndex to iRandom: " + iRandom)
		CrewMember.SetValue(Crew_CostTableIndex, iRandom)
	endif
EndFunction

;For a 25% discount off the normal cost, pass Mult = 0.75
Function SetRecruitCostMult(Actor CrewMember, float Mult = 1.0)
	Trace(self, "SetRecruitCostMult() CrewMember: " + CrewMember + ", Mult: " + Mult)
	CrewMember.SetValue(Crew_CostMult, Mult)
EndFunction

;returns the current cost after applying any discount
int Function GetRecruitCost(Actor CrewMember)
	Trace(self, "GetRecruitCost() CrewMember: " + CrewMember)

	if CrewMember.GetValue(Crew_CostTableIndex) < 0
		Trace(self, "GetRecruitCost() has no value for Crew_CostTableIndex. Will call SetRecruitCost() first")
		SetRecruitCost(CrewMember)
	endif

	int[] costTable = GetRecruitCostTable(CrewMember)

	int cost = costTable[CrewMember.GetValue(Crew_CostTableIndex) as int]
	float mult = CrewMember.GetValue(Crew_CostMult)
	int returnVal = (cost * mult) as int

	Trace(self, "GetRecruitCost() cost: " + cost + ", mult: " + mult + ", returnVal: " + returnVal)

	return returnVal
EndFunction

int[] Function GetRecruitCostTable(Actor CrewMember)
	Trace(self, "GetRecruitCostTable() CrewMember: " + CrewMember)
	int[] costTable
	if CrewMember.HasKeyword(Crew_CrewTypeElite)
		costTable = CrewCostTable_Elite
	elseif CrewMember.HasKeyword(Crew_CrewTypeGeneric)
		costTable = CrewCostTable_Generic
	else
		Warning(self, "GetRecruitCostTable() CrewMember: " + CrewMember + ", does NOT have a know CrewType Keyword!!! Assuming Crew_CrewTypeGeneric!")
		costTable = CrewCostTable_Generic
	endif

	Trace(self, "GetRecruitCostTable() returning: costTable: " + costTable)
	return costTable
EndFunction


;************************************************************************************
;****************************      OTHER FUNCTIONS      *****************************
;************************************************************************************

; call this function to assign crew to a ship without using the assign menu 
Function AssignCrew(Actor assignedCrew, SpaceshipReference assignedShip)
	Trace(self, " AssignCrew() assignedCrew=" + assignedCrew + ", assignedShip=" + assignedShip, bShowNormalTrace=true)
    assignedShip.AssignCrew(assignedCrew) ; NOTE: HandleCrewAssigned will be called when the OnCrewAssigned event is received by SQ_PlayerShip script (if the player doesn't cancel out of the menu)
EndFunction


; called by SQ_PlayerShip when the OnCrewAssigned event is received
Function HandleOnCrewAssigned(Actor assignedCrew, ObjectReference assignedRef)
	Trace(self, "HandleOnCrewAssigned() assignedCrew: " + assignedCrew + ", assignedRef: " + assignedRef, bShowNormalTrace=true)
	LockGuard crewAssignmentLock
		SetRoleActive(assignedCrew, false, true)
		SpaceshipReference assignedShip = assignedRef as SpaceshipReference
		if assignedShip
			CrewGoingToOutposts.RemoveRef(assignedCrew) ;in case they were previously assigned to outpost
			assignedCrew.SetLinkedRef(None, LinkOutpostCrewMarker01) ;clear linked ref to outpost marker in case they were previously assigned to outpost
			Trace(self, "HandleOnCrewAssigned: assignedShip=" + assignedShip + ", Current crew list=" + assignedShip.GetAllCrewMembers(), bShowNormalTrace=true)
		else
			DismissedCrew.RemoveRef(assignedCrew) ;in case they were previously dismissed
			DisembarkingCrew.RemoveRef(assignedCrew) ;in case they were previously disembarking
			; stamp with outpost data - (this seems unnecessary - all crew is in a ref collection)
			;OutpostCrewApply.ApplyToRef(assignedCrew)
			assignedCrew.SetLinkedRef(assignedRef, LinkOutpostCrewMarker01)

			; move to outpost if unloaded, otherwise put in alias
			if assignedCrew.Is3DLoaded() || assignedRef.Is3DLoaded()
				Trace(self, "HandleOnCrewAssigned: crew or outpost is loaded, put in CrewGoingToOutpost collection", bShowNormalTrace=true)
				CrewGoingToOutposts.AddRef(assignedCrew)
			Elseif assignedCrew.GetValue(COM_PQ_LockedIn) == 1 && assignedCrew.GetValue(FOL_ActiveFollower) == 0
				; For companions that are 1) assigned to an outpost 2) locked in and 3) dismissed. Prevent teleport which can result in companion being in the wrong place and movement blocked
			Else
				Trace(self, "HandleOnCrewAssigned: crew moved to outpost", bShowNormalTrace=true)
				; for now, very simple - move to outpost ref
				assignedCrew.MoveTo(assignedRef)
			endif
		endif
		
		;in case we've dismissed them and assigned before they disappeared:
		CrewGoingHome.RemoveRef(assignedCrew)
		
		Trace(self, "HandleOnCrewAssigned() DONE", bShowNormalTrace=true)
	EndLockGuard
EndFunction

; return TRUE if crew is actually dismissed
; return FALSE if crew isn't dismissed (because reassigned)
bool function HandleOnCrewDismissed(Actor unassignedCrew, ObjectReference previousAssignmentRef)
    Trace(self, "HandleOnCrewDismissed() unassignedCrew: " + unassignedCrew + ", previousAssignmentRef: " + previousAssignmentRef, bShowNormalTrace=true)
	LockGuard crewAssignmentLock
		; current assignment, if any
		ObjectReference newAssignment = unassignedCrew.GetCrewAssignment()
		Trace(self, "HandleOnCrewDismissed() - new assignment: " + newAssignment, bShowNormalTrace=true)
		bool dismissMe = (newAssignment == NONE)
		if dismissMe
			Trace(self, "HandleOnCrewDismissed() - no new assignment, so dismiss them", bShowNormalTrace=true)

			;GEN-500043: Moving this block inside the "dismiss me" check, as Elite Crew were getting dismissed
			;when the player rebuilt their ship in ship builder
			;if player has an Elite Crew following him around as an ActiveEliteCrew (akin to ActiveFollower) then dismiss them if unassigned
			if unassignedCrew.HasKeyword(Crew_CrewTypeElite)
				Actor activeEliteCrewRef = ActiveEliteCrew.GetActorRef()
				if activeEliteCrewRef && activeEliteCrewRef == unassignedCrew
					SetEliteCrewInactive(unassignedCrew, SayUnassignedLine = true)
				endif
			endif

			SetRoleInactive(unassignedCrew, false)
			; if previous assignment was an outpost, and currently unassigned, move home when unloaded
			if (previousAssignmentRef as OutpostBeaconScript)
				Trace(self, "HandleOnCrewDismissed()  - previous assignment was outpost, is new assignment outpost? " + newAssignment, bShowNormalTrace=true)
				if (newAssignment is OutpostBeaconScript) == false
					; clear stamped data if not assigned to an outpost
					;OutpostCrewApply.RemoveFromRef(unassignedCrew)
					unassignedCrew.SetLinkedRef(NONE, LinkOutpostCrewMarker01)
				EndIf

				if unassignedCrew.Is3DLoaded()
					CrewGoingHome.AddRef(unassignedCrew)
				else
					MoveCrewHome(unassignedCrew)
				endif
			Elseif previousAssignmentRef.IsDisabled()
				; if previous assignment is disabled (most likely a ship the player sold), move home
				MoveCrewHome(unassignedCrew)
			endif
		Else
			Trace(self, "HandleOnCrewDismissed() - currently assigned, do nothing", bShowNormalTrace=true)
		endif
	
		Trace(self, "HandleOnCrewDismissed() DONE", bShowNormalTrace=true)
		return dismissMe
	endlockguard
endFunction


Function HandleCrewGoingHomeUnloaded(RefCollectionAlias RefCollectionOfCrewGoingHome)
    Trace(self, "HandleCrewGoingHomeUnloaded() CrewGoingToOutposts: " + CrewGoingToOutposts, bShowNormalTrace=true)
	int i = RefCollectionOfCrewGoingHome.GetCount()-1
	while i > -1
		ObjectReference theCrew = RefCollectionOfCrewGoingHome.GetAt(i)
		Trace(self, "HandleCrewGoingHomeUnloaded() theCrew: " + theCrew + ".Is3DLoaded(): " + theCrew.Is3DLoaded())
		if (theCrew is Actor) == false
			; something not an actor in this alias - get rid of it
			RefCollectionOfCrewGoingHome.RemoveRef(theCrew)
		;elseif theCrew.Is3DLoaded() == false
		else ;"Is3DLoaded() == false" here is causing bugs when fast traveling to ship. See: GEN-514099 removing this for now
			if TestAndHandleUnloadedUnassignedGenericCrew(theCrew as Actor)
				;handled in function above, otherwise keep going
			elseif RefCollectionOfCrewGoingHome == CrewGoingHome
				MoveCrewHome(theCrew)
			elseif RefCollectionOfCrewGoingHome == CrewGoingToOutposts
				MoveCrewToAssignedOutpost(theCrew as Actor)
			else
				Warning(self, "HandleCrewGoingHomeUnloaded() found unexpected RefCollectionAlias in RefCollectionOfCrewGoingHome: " + RefCollectionOfCrewGoingHome)
			endif
		endif
		i -= 1
	endWhile
EndFunction

bool Function TestAndHandleUnloadedUnassignedGenericCrew(Actor crewToTest)
	; This function disposes of Generic Crew that have been left unassigned and have unloaded by first removing them
	; from aliases and properties that keep them persisting.
	; We can't do this when they are initially dismissed, in case they are in the loaded area and the player wants to 
	; rehire them while they are sandboxing around.
	LockGuard crewAssignmentLock
		Trace(self, "TestAndHandleUnloadedUnassignedGenericCrew() crewToTest: " + crewToTest, bShowNormalTrace=true)

		bool isGeneric = crewToTest.HasKeyword(Crew_CrewTypeGeneric)
		bool isUnassigned = (crewToTest.GetCrewAssignment() == None)

		Trace(self, "TestAndHandleUnloadedUnassignedGenericCrew() isGeneric: " + isGeneric + ", isUnassigned: " + isUnassigned, bShowNormalTrace=true)

		bool returnVal = false
		if isGeneric && isUnassigned
			Trace(self, "TestAndHandleUnloadedUnassignedGenericCrew() calling SetRoleUnavailable()", bShowNormalTrace=true)
			SetRoleUnavailable(crewToTest)

			; Remove them from the list of available crew members in the UI.
			Game.RemoveFromAvailableCrew(crewToTest)

			; Remove them from the property we might have forced them into when hiring them.
			if CREW_GenericCrew.CrewMemberRef == crewToTest
				CREW_GenericCrew.CrewMemberRef = none
			endif

			; Also remove them from SQ_PreventRecalc.
			SQ_PreventRecalc.RemoveRef(crewToTest)

			; Make sure that their entry in the marker's crew array, and the link to their spawn marker has been removed.
			CrewSpawnerScript spawnMarker = crewToTest.GetLinkedRef(LinkGenericCrewSpawnMarker) as CrewSpawnerScript
			if spawnMarker
				spawnMarker.RemoveFromSpawnedCrewArray(crewToTest)
			endif

			; Finally, remove them from the world.
			crewToTest.DisableNoWait()
			crewToTest.Delete()

			returnVal = true
		EndIf
		return returnVal
	EndLockGuard
EndFunction


function MoveCrewHome(ObjectReference unassignedCrew)
	Trace(self, "MoveCrewHome() unassignedCrew: " + unassignedCrew)
    RefCollectionAlias activeCrew = Alias_Active as RefCollectionAlias
    ; if not in active crew collection, move home
    if activeCrew.Find(unassignedCrew) < 0
		Trace(self, "MoveCrewHome() calling SQ_PlayerShip.MoveCrewToHome() ")
		;this function has additional handling we want for elite crew:
		SQ_PlayerShip.MoveCrewToHome(unassignedCrew as Actor)
    endif
    ; no matter what, remove from CrewGoingHome collection
    CrewGoingHome.RemoveRef(unassignedCrew)
EndFunction

function MoveCrewToAssignedOutpost(Actor assignedCrew)
	ObjectReference myAssignment = assignedCrew.GetCrewAssignment()
	Trace(self, "MoveCrewToAssignedOutpost() moving " + assignedCrew + " to " + myAssignment )
	if myAssignment
		if assignedCrew.GetValue(COM_PQ_LockedIn) == 1 && assignedCrew.GetValue(FOL_ActiveFollower) == 0
				; For companions that are 1) assigned to an outpost 2) locked in and 3) dismissed. Prevent teleport which can result in companion being in the wrong place and movement blocked
		else
				assignedCrew.MoveTo(myAssignment)
		endif
	endif
	; no matter what, remove from assignedCrew collection
	CrewGoingToOutposts.RemoveRef(assignedCrew)
endFunction

Actor[] function GetCrewAssignedToOutpost(ObjectReference outpostRef)
    RefCollectionAlias activeCrew = Alias_Active as RefCollectionAlias
	Actor[] assignedCrew = new Actor[0]
	int i = 0
	int crewCount = activeCrew.GetCount()
	while i < crewCount
		Actor testCrew = activeCrew.GetActorAt(i)
		if testCrew
			ObjectReference assignedOutpost = testCrew.GetLinkedRef(LinkOutpostCrewMarker01)
			if assignedOutpost && assignedOutpost == outpostRef
				assignedCrew.Add(testCrew)
			endif
		endif
		i += 1
	EndWhile
	Trace(self, "GetCrewAssignedToOutpost() outpostRef: " + outpostRef + " assignedCrew=" + assignedCrew, bShowNormalTrace=true)

	return assignedCrew
endFunction

; called when a crew station is deleted - may need to unassign crew
function CheckCrewCountAtOutpost(ObjectReference outpostRef)
	if outpostRef
		LockGuard outpostCrewUpdateLock	
			; how many crew slots at this outpost?
			int crewSlots = outpostRef.GetValueInt(SpaceshipCrewSlots)
			; how many crew currently assigned?
			Actor[] assignedCrew = GetCrewAssignedToOutpost(outpostRef)
			Trace(self, "CheckCrewCountAtOutpost() outpostRef: " + outpostRef + ": crewSlots=" + crewSlots + ", assignedCrew=" + assignedCrew, bShowNormalTrace=true)
			if assignedCrew && assignedCrew.Length > crewSlots
				; need to unassign some crew
				; start with simple - just assign until we get back to crewSlots count
				; start at top of array since we'll be deleting as we go
				int i = assignedCrew.Length - 1
				while i > -1 && assignedCrew.Length > crewSlots
					Actor theCrew = assignedCrew[i]
					outpostRef.UnassignCrew(theCrew)
					assignedCrew.RemoveLast()
					Trace(self, "    unassigning " + theCrew + " from " + outpostRef, bShowNormalTrace=true)
					ShowTextReplacedMessage(theCrew, NotActiveMessage)
					i -= 1
				EndWhile
			endif
		EndLockGuard
	endif
EndFunction

;************************************************************************************
;****************************	   DEBUG FUNCTIONS	    *****************************
;************************************************************************************
Actor function DebugCreateCrew(ActorBase CrewBaseActor = None, SpaceshipReference ShipRef = None)
	if CrewBaseActor == None
		CrewBaseActor = Crew_LvlCrew_Any
	endif

	Trace(self, "DebugCreateCrew() CrewBaseActor: " + CrewBaseActor + ", ShipRef: " + ShipRef)

	if ShipRef == None ;assume player ship
		ShipRef = SQ_PlayerShip.DebugGetHomeShip()
		if shipRef == None
			return none ;warning in DebugGetHomeShip()
		endif
	endif

	Actor newCrew = Game.GetPlayer().PlaceAtMe(CrewBaseActor) as Actor

	Trace(self, " DebugCreateCrew() ShipRef: " + ShipRef + " newCrew: " + newCrew + " - assigning crew")
	AssignCrew(newCrew, ShipRef)

	return newCrew
endFunction

function DebugCreateCrewOnShip(SpaceshipReference ShipRef, ActorBase CrewBaseActor = None)
	Trace(self, " DebugCreateCrewOnShip() ShipRef: " + ShipRef + " CrewBaseActor: " + CrewBaseActor)

	if shipRef == None ;assume player ship
		ShipRef = SQ_PlayerShip.DebugGetHomeShip()
		if shipRef == None
			return ;warning in DebugGetHomeShip()
		endif
	endif

	Actor newCrew = debugCreateCrew(CrewBaseActor, ShipRef)
	Trace(self, " DebugCreateCrewOnShip() ShipRef: " + ShipRef + " newCrew: " + newCrew)

	newCrew.MoveTo(ShipRef)
endFunction

Function DebugCreateCrewFromFormlist(Formlist FormlistWithCrew, bool AddToShip = false, SpaceshipReference ShipRef = None)
	Trace(self, "DebugCreateCrewFromFormlist() FormlistWithCrew: " + FormlistWithCrew + "AddToShip: " + AddToShip + ", ShipRef: " + ShipRef)

	if ShipRef == None ;assume player ship
		ShipRef =SQ_PlayerShip.DebugGetHomeShip()
		if shipRef == None
			return ;warning in DebugGetHomeShip()
		endif

	endif

	int i = 0
	int iMax = FormlistWithCrew.GetSize()
	While (i < iMax)
		Form currentForm = FormlistWithCrew.GetAt(i) as Form
		Trace(self, "DebugCreateCrewFromFormlist() currentForm: " + currentForm)

		ActorBase currentActorBase = currentForm as ActorBase

		if currentActorBase

			Actor crewActor = currentActorBase.GetUniqueActor()

			if crewActor
				AssignCrew(crewActor, ShipRef)
			else
				crewActor = DebugCreateCrew(currentActorBase, ShipRef) ;assigning happens inside this function call
			endif

			Trace(self, "DebugCreateCrewFromFormlist() crewActor: " + crewActor + ", ShipRef: " + ShipRef)	

			if AddToShip && crewActor
				crewActor.MoveTo(ShipRef)
			endif

		else
			Warning(self, "DebugCreateCrewFromFormlist() found unexpected form type in FormlistWithCrew: " + FormlistWithCrew + ", currentForm: " + currentForm)
		endif

		i += 1
	EndWhile

EndFunction

Function DebugNewShipWithCrewLanded(Formlist FormlistWithCrew, ObjectReference ReferenceToPutShipAt = None)
	SpaceshipReference homeshipRef = SQ_PlayerShip.DebugCreateHomeShipLanded(ReferenceToPutShipAt)
	DebugCreateCrewFromFormlist(FormlistWithCrew, true, homeshipRef)
EndFunction

Function DebugNewShipWithCrewInSpace(Formlist FormlistWithCrew, ObjectReference ReferenceToPutShipAt = None)
	SpaceshipReference homeshipRef = SQ_PlayerShip.DebugCreateHomeShipInSpace(ReferenceToPutShipAt)
	DebugCreateCrewFromFormlist(FormlistWithCrew, true, homeshipRef)
EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
;*** lives on parent SQ_ActorRolesScript ****