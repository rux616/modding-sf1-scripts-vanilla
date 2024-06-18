Scriptname SQ_Groups_QuestScript extends Quest
{used to access group definitions and functions}


Group Autofill
	
	GlobalVariable Property SQ_Group_Gender_Any Mandatory Const Auto
	GlobalVariable Property SQ_Group_Gender_Female Mandatory Const Auto
	GlobalVariable Property SQ_Group_Gender_Male Mandatory Const Auto
	GlobalVariable Property SQ_Group_SpawnType_Corpse Mandatory Const Auto
EndGroup

Group GroupRoles
	GlobalVariable Property SQ_GroupRole_Enemy Mandatory Const Auto
	{autofill}
	GlobalVariable Property SQ_GroupRole_Victim Mandatory Const Auto
	{autofill}
	GlobalVariable Property SQ_GroupRole_Neutral Mandatory Const Auto 
	{autofill}
	GlobalVariable Property SQ_GroupRole_BiomePredator Mandatory Const Auto 
	{autofill}
	GlobalVariable Property SQ_GroupRole_BiomePrey Mandatory Const Auto 
	{autofill}
	GlobalVariable Property SQ_GroupRole_BiomeCritter Mandatory Const Auto 
	{autofill}

	GlobalVariable Property SQ_Debug_GroupRole_Enemy Mandatory Const Auto
	{autofill}
	GlobalVariable Property SQ_Debug_GroupRole_Victim Mandatory Const Auto
	{autofill}
	GlobalVariable Property SQ_Debug_GroupRole_Neutral Mandatory Const Auto
	{autofill}
	GlobalVariable Property SQ_Debug_GroupRole_BiomePredator Mandatory Const Auto
	{autofill}
	GlobalVariable Property SQ_Debug_GroupRole_BiomePrey Mandatory Const Auto
	{autofill}
	GlobalVariable Property SQ_Debug_GroupRole_BiomeCritter Mandatory Const Auto
	{autofill}		
EndGroup

SQ_GroupScript[] Property Groups Mandatory Const Auto
{holds all the defined groups with SQ_GroupScript }

;returns true if OccupationToFind is in at least one of the GroupsToCheck
bool Function CheckGroupsForOccupation(SQ_GroupScript[] GroupsToCheck, SQ_GroupOccupationScript OccupationToFind)
	int i = 0
	While (i < GroupsToCheck.length)
		SQ_GroupScript currentGroup = GroupsToCheck[i]
		
		if currentGroup.HasOccupation(OccupationToFind)
			return true
		endif

		i += 1
	EndWhile

	return false
EndFunction

SQ_GroupScript[] Function GetAllGroupsWithOccupation(SQ_GroupOccupationScript OccupationToFind, SQ_GroupScript[] LimitSearchToTheseGroups = None)
	Trace(self, "GetAllGroupsWithOccupation() OccupationToFind: " + OccupationToFind + ", LimitSearchToTheseGroups: " + LimitSearchToTheseGroups)
	SQ_GroupScript[] matchingGroups = new SQ_GroupScript[0]

	SQ_GroupScript[] arrayToSearch = LimitSearchToTheseGroups

	if arrayToSearch == None
		arrayToSearch = Groups
	endif

	Trace(self, "GetAllGroupsWithOccupation() arrayToSearch: " + arrayToSearch)

	int i = 0
	While (i < arrayToSearch.length)
		SQ_GroupScript currentGroup = arrayToSearch[i]
		
		if currentGroup.OccupationData.FindStruct("Occupation", OccupationToFind) >= 0
			;Trace(self, "GetAllGroupsWithOccupation() found: " + currentGroup)
			matchingGroups.Add(currentGroup)
		EndIf

		i += 1
	EndWhile

	Trace(self, "GetAllGroupsWithOccupation() returning matchingGroups: " + matchingGroups)
	Return matchingGroups
EndFunction

SQ_GroupScript Function GetRandomGroupWithOccupation(SQ_GroupOccupationScript OccupationToFind, SQ_GroupScript[] LimitSearchToTheseGroups = None)
	Trace(self, "GetRandomGroupWithOccupation() OccupationToFind: " + OccupationToFind + ", LimitSearchToTheseGroups: " + LimitSearchToTheseGroups)

	SQ_GroupScript[] groupsWithOccupation = GetAllGroupsWithOccupation(OccupationToFind, LimitSearchToTheseGroups)
	int iRandom = Utility.RandomInt(0, groupsWithOccupation.Length - 1)
	SQ_GroupScript randomGroup = groupsWithOccupation[iRandom]

	Trace(self, "GetRandomGroupWithOccupation() returning randomGroup: " + randomGroup)

	return randomGroup
EndFunction


;GEN-363590
;SQ_Groups_QuestScript Use OnPLayerLoadGame to cache a list of all possible locations
SQ_GroupOccupationScript[] Function GetAllPossibleOccupations()
	Trace(self, "GetAllPossibleOccupations()")
	SQ_GroupOccupationScript[] occupations = new SQ_GroupOccupationScript[0]

	int i = 0
	While (i < Groups.length)
		SQ_GroupScript currentGroup = Groups[i]
		SQ_GroupOccupationScript[] currentGroupOccupations = currentGroup.GetAllOccupations()

		int iOccupation = 0
		While (iOccupation < currentGroupOccupations.length)
			SQ_GroupOccupationScript currentOccupation = currentGroupOccupations[iOccupation]
			
			if occupations.find(currentOccupation) < 0
				;Trace(self, "GetAllPossibleOccupations() currentOccupation: " + currentOccupation)
				occupations.Add(currentOccupation)
			endif

			iOccupation += 1
		EndWhile

		i += 1
	EndWhile

	Trace(self, "GetAllPossibleOccupations() returning occupations: " + occupations + ", ")

	return occupations
EndFunction

SQ_GroupOccupationScript Function GetRandomOccupationFromAllPossibleOccupations()
	Trace(self, "GetRandomOccupationFromAllPossibleOccupations()")
	SQ_GroupOccupationScript[] allPossibleOccupations = GetAllPossibleOccupations()
	int iRandom = Utility.RandomInt(0, allPossibleOccupations.Length - 1)
	SQ_GroupOccupationScript randomOccupation = allPossibleOccupations[iRandom]

	Trace(self, "GetRandomOccupationFromAllPossibleOccupations() returning randomOccupation")
	return randomOccupation
EndFunction

;gets the group associated with the passed in actor by checking if the passed in actor is a member of the group's faction.
;if ValidateActor is true, it will warn and return None if actor does meet all the assumptions of the group (faction, voicetype, etc.)
SQ_GroupScript Function GetGroupByActor(Actor ActorToGetGroupFor, bool ValidateActor = true)
	SQ_GroupScript returnVal
	int i = 0
	While (returnVal == None && i < Groups.length)
		SQ_GroupScript currentGroup = Groups[i]
		
		if  currentGroup.CheckActorFactions(ActorToGetGroupFor)

			if ValidateActor == false || currentGroup.ValidateActor(ActorToGetGroupFor)
				returnVal = currentGroup
			else
				Warning(self, "GetGroupByActor() ActorToGetGroupFor: " + ActorToGetGroupFor + ", is not valid NPC for found currentGroup: " + currentGroup)
				return None
			endif
		endif

		i += 1
	EndWhile

	Trace(self, "GetGroupByActor() ActorToGetGroupFor: " + ActorToGetGroupFor + ", returnVal: " + returnVal)
	return returnVal
EndFunction

;gets the group associate with the passed in GroupID global
SQ_GroupScript Function GetGroupByFactionID(GlobalVariable FactionID)
	SQ_GroupScript returnVal
	int i = 0

	While (returnVal == None && i < Groups.length)
		SQ_GroupScript currentGroup = Groups[i]
		
		if currentGroup.FactionID == FactionID
			returnVal = currentGroup
		endif

		i += 1
	EndWhile

	Trace(self, "GetGroupByFactionID() FactionID: " + FactionID + ", returnVal: " + returnVal)
	return returnVal
EndFunction

;gets the group associate with the passed value by matching it against group's GroupID global
SQ_GroupScript Function GetGroupByFactionIDValue(int FactionIDValue)
	SQ_GroupScript returnVal
	int i = 0
	While (returnVal == None && i < Groups.length)
		SQ_GroupScript currentGroup = Groups[i]
		
		if currentGroup.FactionID.GetValue() == FactionIDValue
			return currentGroup
		endif

		i += 1
	EndWhile

	Trace(self, "GetGroupByFactionIDValue() FactionIDValue: " + FactionIDValue + ", returnVal: " + returnVal)
	return returnVal
EndFunction

int Function GetGroupFactionIDValueByActor(Actor ActorToGetGroupFor, bool ValidateActor = true)
	Trace(self, "GetGroupFactionIDValueByActor() ActorToGetGroupFor: " + ActorToGetGroupFor + ", ValidateActor: " + ValidateActor)
	return GetGroupByActor(ActorToGetGroupFor, ValidateActor = ValidateActor).FactionID.GetValue() as int
EndFunction


;In normal cases you will have a pointer to the GroupToSpawnFrom, and you will call SpawnGroupMember on that object
Function DebugSpawnGroupReference(ObjectReference SpawnAtRef, SQ_GroupScript GroupToSpawnFrom, SQ_GroupOccupationScript OccupationToSpawn, GlobalVariable SpawnType = None, GlobalVariable Gender = None)
	Trace(self, "DebugSpawnGroupReference() GroupToSpawnFrom: " + GroupToSpawnFrom + ", OccupationToSpawn: " + OccupationToSpawn + ", SpawnType: " + SpawnType + ", Gender: " + Gender)
	GroupToSpawnFrom.SpawnGroupReference(SpawnAtRef, OccupationToSpawn, none, none, SpawnType, Gender)
EndFunction

Function SetDebugGroupRoleEnemy(GlobalVariable SQ_GroupID)
	Trace(self, "SetDebugGroupRoleEnemy() SQ_GroupID: " + SQ_GroupID)
	SQ_Debug_GroupRole_Enemy.SetValue(SQ_GroupID.GetValueInt())
EndFunction

Function SetDebugGroupRoleVictim(GlobalVariable SQ_GroupID)
	Trace(self, "SetDebugGroupRoleVictim() SQ_GroupID: " + SQ_GroupID)
	SQ_Debug_GroupRole_Victim.SetValue(SQ_GroupID.GetValueInt())
EndFunction

Function SetDebugGroupRoleNeutral(GlobalVariable SQ_GroupID)
	Trace(self, "SetDebugGroupRoleNeutral() SQ_GroupID: " + SQ_GroupID)
	SQ_Debug_GroupRole_Neutral.SetValue(SQ_GroupID.GetValueInt())
EndFunction

Function SetDebugGroupRoleBiomePredator(GlobalVariable SQ_GroupID)
	Trace(self, "SetDebugGroupRolePredator() SQ_GroupID: " + SQ_GroupID)
	SQ_Debug_GroupRole_BiomePredator.SetValue(SQ_GroupID.GetValueInt())
EndFunction

Function SetDebugGroupRoleBiomePrey(GlobalVariable SQ_GroupID)
	Trace(self, "SetDebugGroupRolePrey() SQ_GroupID: " + SQ_GroupID)
	SQ_Debug_GroupRole_BiomePrey.SetValue(SQ_GroupID.GetValueInt())
EndFunction

Function SetDebugGroupRoleBiomeCritter(GlobalVariable SQ_GroupID)
	Trace(self, "SetDebugGroupRoleCritter() SQ_GroupID: " + SQ_GroupID)
	SQ_Debug_GroupRole_BiomeCritter.SetValue(SQ_GroupID.GetValueInt())
EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "SQ_Groups",  string SubLogName = "SQ_GroupsScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "SQ_Groups",  string SubLogName = "SQ_GroupsScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction
