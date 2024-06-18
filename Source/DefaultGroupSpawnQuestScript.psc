Scriptname DefaultGroupSpawnQuestScript extends Quest default
{Used to spawn groups defined in SQ_GroupsScript attached to SQ_Groups quest

You can register for the custom event "SpawnEvent" defined on this script to know when when something has spawned.
You can cast the event's akArgs[0] as DefaultGroupSpawnQuestScript:SpawnEventArgs to access various data about what was spawned.
}

;************************************************************************************
;****************************    Properties & Vars      *****************************
;************************************************************************************

; 	Group definition and spawning data Structs
	Struct SpawnGroup_DefinitionDatum
		string Name = ""
		{Optional. For organizational/debug purposes. Printed to logs.}

		LocationAlias LocationAliasToSetOwnershipOn
		{Optional: if not none, will set owner data on this alias's location for faction defined in SQ_GroupScript}

        GlobalVariable Role
        {if the actor(s) being spawned are part of a group, this is their role (ie enemy, victim, etc) 
        Filter for: SQ_GroupRole_*}

		ConditionForm Conditions
		{default none; if set, these conditions must be true for ANY of this groups SpawnData to spawn.}

		ReferenceAlias ConditionAlias
		{default none; if set, the reference in this alias is used as the subject for the Conditions above}

		SQ_GroupScript ChosenGroup hidden
		{Set by script system}

		SQ_GroupOccupationScript ChosenOccupation hidden
		{Set by script system}

		Faction crimeFaction hidden
		{set during spawning }

		int SpawnStage = -1
		{ if this is > -1, wait for this stage to spawn anything in this group }

		bool AllowSpawningIntoNonEmptyAliases = true
		{ if this is false, don't spawn into an alias that already has something in it - useful if you have multiple mutually-exclusive spawn groups }

		int Aggression = -1
		{ if this is 0-3, this aggression value will be set on all spawned actors in this group
				0: Unaggressive - Will not initiate combat. Standard aggression for actors with reaction radius.
				1: Aggressive - Will attack Enemies on sight.
				2: Very Aggressive - Will attack Enemies and Neutrals on sight.
				3: Frenzied - Will attack anyone on sight.
		  Any other value means don't change aggression.
		 }
	EndStruct 

	Struct SpawnGroup_SpawnDatum
		Alias SpawnAlias
		{Alias to force ref(s) into after spawning}
		
		Alias SpawnAt
		{Reference(s) to spawn at.

		Note: If this a RefCollectionAlias and if SpawnAlias is also a RefCollection alias, it will iterate over the references in SpawnAt when spawning things.
		If you have multiple things you want to spawn at similar markers, make sure you have collected those makers into seperate RefCollectionAliases.
		Example: if you have two types of corpses to spawn, make sure you have two different corpse marker RefCollectionAliases for them to spawn at.

		*** If SpawnType is a SHIP this should be a landing marker 
			And you should consider using OE_ShipAddonScript instead of this script to spawn and manage the ship.
		***
		}

		GlobalVariable Gender
		{This gender should match that of the voicetype you are forcing for this alias.
		NONE (default) == Any
		Filter for: SQ_Group_Gender_*
		}
			
		GlobalVariable SpawnType
		{This is the type of object to spawn
		NONE (Default) = Actor
		Filter for: SQ_Group_SpawnType

		*** If this is a ship:
			*SpawnAt* should be a landing marker
			And you should consider using OE_ShipAddonScript to spawn and manage its functionality INSTEAD of using this script to spawn the ship. (All this script will do is spawn the ship, OE_ShipAddonScript is more fully featured.)
		***
		}

		bool SetOverrideNameLeader
		{if true, will override the actor's name with the LeaderName message defined in SQ_GroupOccupationScript}

		bool IsVendor
		{if true, will set up this actor to be a vendor as defined in SQ_GroupOccupationScript and SQ_GroupScript.}

		bool SetOverrideNameVendor
		{if true, will override the actor's name with the VendorName message defined in SQ_GroupOccupationScript}


		bool Register_With_REScript = true
		{If true (default), will call RegisterAlias on REScript if it is also attached to this quest.}
		
		int MinToSpawn = 2
		{OPTIONAL: only used if SpawnAlias is a RefCollection}
		int MaxToSpawn = 5
		{OPTIONAL: only used if SpawnAlias is a RefCollection}
		bool SpawnAllAtEach = false
		{OPTIONAL: only used if SpawnAlias is a RefCollection; if true, at each reference in SpawnAlias, it will spawn a number of refs between MinToSpawn and MaxToSpawn}

		Keyword LinkToSpawnAt
		{OPTIONAL: will link the spawned reference to the reference in it's SpawnAt alias}

		bool LinkToSpawnAtWithNoKeyword = false
		{OPTIONAL: if true, will link to SpawnAt without a keyword (ignore if LinkToSpawnAt isn't none)}

		Int StageToSpawn = -1
		{OPTIONAL: -1 (default) spawns at startup.}

		ConditionForm SpawnConditions = None
		{OPTIONAL: Default: none; If set and conditions are not true when the Group's Stage is called, it will not spawn. Subject of conditions is the SpawnAt reference (or first of in case of ref collection)}

		bool InitiallyDisabled = false
		{if true, will spawn initially disabled (quest will have to handle enabling them)
		 NOTE: this does NOT apply to ships - ships are always spawned initially disabled, regardless of this flag }
	EndStruct

	Group Autofill
		SQ_Groups_QuestScript Property SQ_Groups Mandatory Const Auto
	EndGroup


;   NPC Group Properties
    Group SpawnGroupA
		SpawnGroup_DefinitionDatum Property SpawnGroupA_Definition Auto

		FormList[] Property SpawnGroupA_AllowedGroups Const Auto
		{formlist of Activators with SQ_GroupScript attached - you MUST have either AllowedGroups or AllowedOccupations
		Filter for: SQ_Group_Faction_}

		FormList[] Property SpawnGroupA_AllowedOccupations Const Auto
		{formlist of Activators with SQ_GroupOccupationScript attached - you MUST have either AllowedGroups or AllowedOccupations
		Filter for: SQ_Group_Occupation_}

		SpawnGroup_SpawnDatum[] Property SpawnGroupA_SpawnData Auto const mandatory
    EndGroup

     Group SpawnGroupB
		SpawnGroup_DefinitionDatum Property SpawnGroupB_Definition Auto

		FormList[] Property SpawnGroupB_AllowedGroups Const Auto
		{formlist of Activators with SQ_GroupScript attached - you MUST have either AllowedGroups or AllowedOccupations
		Filter for: SQ_Group_Faction_}

		FormList[] Property SpawnGroupB_AllowedOccupations Const Auto
		{formlist of Activators with SQ_GroupOccupationScript attached - you MUST have either AllowedGroups or AllowedOccupations
		Filter for: SQ_Group_Occupation_}

		SpawnGroup_SpawnDatum[] Property SpawnGroupB_SpawnData Auto const
    EndGroup

	Group SpawnGroupC
		SpawnGroup_DefinitionDatum Property SpawnGroupC_Definition Auto

		FormList[] Property SpawnGroupC_AllowedGroups Const Auto
		{formlist of Activators with SQ_GroupScript attached - you MUST have either AllowedGroups or AllowedOccupations
		Filter for: SQ_Group_Faction_}

		FormList[] Property SpawnGroupC_AllowedOccupations Const Auto
		{formlist of Activators with SQ_GroupOccupationScript attached - you MUST have either AllowedGroups or AllowedOccupations
		Filter for: SQ_Group_Occupation_}

		SpawnGroup_SpawnDatum[] Property SpawnGroupC_SpawnData Auto const
    EndGroup

	Group SpawnGroupD
		SpawnGroup_DefinitionDatum Property SpawnGroupD_Definition Auto

		FormList[] Property SpawnGroupD_AllowedGroups Const Auto
		{formlist of Activators with SQ_GroupScript attached - you MUST have either AllowedGroups or AllowedOccupations
		Filter for: SQ_Group_Faction_}

		FormList[] Property SpawnGroupD_AllowedOccupations Const Auto
		{formlist of Activators with SQ_GroupOccupationScript attached - you MUST have either AllowedGroups or AllowedOccupations
		Filter for: SQ_Group_Occupation_}

		SpawnGroup_SpawnDatum[] Property SpawnGroupD_SpawnData Auto const
    EndGroup

	Group SpawnGroupE
		SpawnGroup_DefinitionDatum Property SpawnGroupE_Definition Auto

		FormList[] Property SpawnGroupE_AllowedGroups Const Auto
		{formlist of Activators with SQ_GroupScript attached - you MUST have either AllowedGroups or AllowedOccupations
		Filter for: SQ_Group_Faction_}

		FormList[] Property SpawnGroupE_AllowedOccupations Const Auto
		{formlist of Activators with SQ_GroupOccupationScript attached - you MUST have either AllowedGroups or AllowedOccupations
		Filter for: SQ_Group_Occupation_}

		SpawnGroup_SpawnDatum[] Property SpawnGroupE_SpawnData Auto const
    EndGroup


	Group Debug
		string property LocalScriptName = "DefaultGroupSpawnQuestScript" auto  
		{ Inherits the LocalScriptName from OEScript, if used. Otherwise, the value set here is used. }

		GlobalVariable property SQ_Group_RandomOccupationIndexOverride Const Auto
		{ Global that overrides the random occupation selection behavior. Set at runtime to force spawning NPCs from the Spawn Group's allowed occupations array. }
	EndGroup

; 	Quest Variables
	bool property GroupSetupCompleted = false auto hidden 

	OEScript Self_As_OEScript
	REScript Self_As_REScript

	CustomEvent SpawnEvent

	struct SpawnEventArgs
		int SpawnGroupNumber
		int SpawnDataIndex
		SQ_GroupScript SpawnedGroup
		SQ_GroupOccupationScript SpawnedOccupation
		Alias SpawnAlias
		Alias SpawnAtAlias
	endstruct

	Function SendSpawnEvent(SpawnEventArgs Args)
		var[] akArgs = new var[1]
		akArgs[0] = Args

		SendCustomEvent("SpawnEvent", akArgs)
	EndFunction

	CustomEvent SpawnGroupDoneEvent

	struct SpawnGroupDoneEventArgs
		int SpawnGroupNumber
		SQ_GroupScript SpawnedGroup
		SQ_GroupOccupationScript SpawnedOccupation
	endstruct

	Function SendSpawnGroupDoneEvent(SpawnGroupDoneEventArgs Args)
		Trace(self, "SendSpawnGroupDoneEvent() " + Args)
		var[] akArgs = new var[1]
		akArgs[0] = Args

		SendCustomEvent("SpawnGroupDoneEvent", akArgs)
	EndFunction


;************************************************************************************
;****************************           Events          *****************************
;************************************************************************************
; 	Startup Functions
	Event OnQuestInit()
		Self_As_OEScript = (Self as Quest) as OEScript ;this must happen before DefineCustomLogs() which uses that value
		DefineCustomLogs() ;this must happen before Trace() calls, because the setup in this function is required for trace function to work
		
		Trace(self, "OnQuestInit() ")

		SetUpGroups()

		; If this is being used in an Overlay Encounter, then wait for that to activate this script. Otherwise, engage!
		if Self_As_OEScript
			LocalScriptName = Self_As_OEScript.LocalScriptName
		elseif Self_As_OEScript == None
			Trace(Self, "Not part of the OEScript system")
			InitialGroupSpawn(LocalScriptName)
		EndIf 

	EndEvent

 ;	EVENT: OnStageSet() ensures that each time a stage is set, any NPCs expecting to spawn are selected and considered for spawning.
	; Update anything when a Stage is set
	Event OnStageSet(int iStageID, int iItemID)
		Trace(Self, "OnStageSet()")
		; Initialization Stage is handled in IntializeGroupSpawns()
		
		if WaitForInitialGroupSetup() == false
			Warning(self, "OnStageSet() BAILING!!! Did not return successfully from WaitForInitialGroupSetup()")
			return
		endif

		Trace(self, "OnStageSet()	Stage Set: " + iStageID )
		ProcessGroups(iStageID)
	EndEvent


;************************************************************************************
;****************************         Functions         *****************************
;************************************************************************************
; Startup functions
	; May be used as a Public function called by an External Script, e.g. OEScript.
	Function InitialGroupSpawn(string LocalScriptName) ;Public
		Trace(self,"InitialGroupSpawn() LocalScriptName: " + LocalScriptName)
		
		if WaitForInitialGroupSetup() == false
			Trace(self, "InitialGroupSpawn() BAILING!!! Did not properly initialize groups in WaitForInitialGroupSetup()")
			return none
		endif
		
		ProcessGroups(-1) ; Start Stage
		Trace(self, "InitialGroupSpawn()	" + LocalScriptName + "'s initial spawning of groups is complete.")
	EndFunction 

	Function SetUpGroups() Private
		;set up arrays
		Trace(self, "SetUpGroups()")

		;ensure the definitions have been created (they might not be if the user didn't want to define any data for them and just use the default, which is supported)
		if SpawnGroupA_SpawnData && !SpawnGroupA_Definition
			SpawnGroupA_Definition = new SpawnGroup_DefinitionDatum
		endif
		if SpawnGroupB_SpawnData && !SpawnGroupB_Definition
			SpawnGroupB_Definition = new SpawnGroup_DefinitionDatum
		endif
		if SpawnGroupC_SpawnData && !SpawnGroupC_Definition
			SpawnGroupC_Definition = new SpawnGroup_DefinitionDatum
		endif
		if SpawnGroupD_SpawnData && !SpawnGroupD_Definition
			SpawnGroupD_Definition = new SpawnGroup_DefinitionDatum
		endif
		if SpawnGroupE_SpawnData && !SpawnGroupE_Definition
			SpawnGroupE_Definition = new SpawnGroup_DefinitionDatum
		endif

		SetUpGroup("SpawnGroupA", SpawnGroupA_Definition, SpawnGroupA_AllowedGroups, SpawnGroupA_AllowedOccupations)
		SetUpGroup("SpawnGroupB", SpawnGroupB_Definition, SpawnGroupB_AllowedGroups, SpawnGroupB_AllowedOccupations)
		SetUpGroup("SpawnGroupC", SpawnGroupC_Definition, SpawnGroupC_AllowedGroups, SpawnGroupC_AllowedOccupations)
		SetUpGroup("SpawnGroupD", SpawnGroupD_Definition, SpawnGroupD_AllowedGroups, SpawnGroupD_AllowedOccupations)
		SetUpGroup("SpawnGroupE", SpawnGroupE_Definition, SpawnGroupE_AllowedGroups, SpawnGroupE_AllowedOccupations)

		GroupSetupCompleted = True
	EndFunction

	Function SetUpGroup(String DefaultName, SpawnGroup_DefinitionDatum Definition, FormList[] AllowedGroups, FormList[] AllowedOccupations) Private
		Trace(self, "SetUpGroup() --------------------------------------------  " + DefaultName + " --------------------------------------------  ")
		if Definition == None && AllowedGroups == None && AllowedOccupations == None
			;Is all of the data empty? if so, then assume the user didn't want to do anything, and move along as if there is nothing wrong.
			;Otherwise, if its not completely empty, the user intended to do something, and we should do our best to accommodate that, and warn them about things they need to set but didn't
			Trace(self, "SetUpGroup() 		NO DATA")
			return
		endif
		
		Trace(self, "SetUpGroup() 		DefaultName: " + DefaultName + ", Definition: " + Definition + ", AllowedGroups: " + AllowedGroups + ", AllowedOccupations: " + AllowedOccupations)

		SetDefaultName(Definition, DefaultName)

		;turn the formlists into arrays of the proper object type
		Trace(self, "SetUpGroup() 		calling ConvertAllowedGroupsToArray() AllowedGroups: " + AllowedGroups)
		SQ_GroupScript[] AllowedGroupsArray = ConvertAllowedGroupsToArray(AllowedGroups)

		Trace(self, "SetUpGroup() 		calling ConvertAllowedOccupationsToArray() AllowedOccupations: " + AllowedOccupations)
		SQ_GroupOccupationScript[] AllowedOccupationsArray = ConvertAllowedOccupationsToArray(AllowedOccupations)

		;*** TO DO: add in debug way to force to specific group (should still check to make sure it's allowed)

		;we need at least an AllowedGroups or AllowedOccupations list, if we have neither, then we will bail
		bool haveAllowedGroups = AllowedGroupsArray && AllowedGroupsArray.length >= 0
		bool haveAllowedOccupations = AllowedOccupationsArray && AllowedOccupationsArray.length >= 0
		if haveAllowedGroups == false && haveAllowedOccupations == false
			Warning(self, "SetUpGroup() has no allowedGroups and no AllowedOccupations, cannot setup for spawning. BAILING!")
			Return
		endif

		;we will build a list of valid occupations by making sure the allowed groups have them
		SQ_GroupOccupationScript[] validOccupationsToChooseFrom = new SQ_GroupOccupationScript[0]

		;first if we don't have allowed occupations, set the array to be ALL occupations
		if haveAllowedOccupations == false
			Trace(self, "SetUpGroup()		Nothing in AllowedOccupationsArray, set to ALL occupations.")
			AllowedOccupationsArray = SQ_Groups.GetAllPossibleOccupations()
		endif


		if haveAllowedGroups == false
			;we don't care about groups, so just use all the allowed occupations
			validOccupationsToChooseFrom = AllowedOccupationsArray

		else; haveAllowedGroups
			;we have allowed groups, so we only want to include occupations which are found in at least one of those groups
			
			int i = 0
			While (i < AllowedOccupationsArray.length)
				SQ_GroupOccupationScript currentOccupation = AllowedOccupationsArray[i]

				if SQ_Groups.CheckGroupsForOccupation(AllowedGroupsArray, currentOccupation)
					;it's valid to pick this because we found at least one group with this occipation
					validOccupationsToChooseFrom.Add(currentOccupation)
				else
					Trace(self, "SetUpGroup() 		no allowed group with currentOccupation. Not considering currentOccupation: " + currentOccupation)
				endif

				i += 1
			EndWhile

		endif

		Trace(self, "SetUpGroup() 		 validOccupationsToChooseFrom: " + validOccupationsToChooseFrom)
		
		if validOccupationsToChooseFrom.Length == 0
			Warning(self, "SetUpGroup() did not find any validOccupationsToChoseFrom!!!")

		else
			; Next, check if the random spawn override global is set (for testing). If not, pick a random occupation from amongst the valid ones.
			
			; Is the override global set?
			int randomOccupationIndexOverride = -1
			if SQ_Group_RandomOccupationIndexOverride
				randomOccupationIndexOverride = SQ_Group_RandomOccupationIndexOverride.GetValueInt()
			endif

			; Does the override global have a value? If not, spawn normally.
			if randomOccupationIndexOverride >= 0 && randomOccupationIndexOverride < validOccupationsToChooseFrom.Length
				Definition.ChosenOccupation = validOccupationsToChooseFrom[randomOccupationIndexOverride]

				if !Definition.ChosenOccupation
					Warning(self, "SetUpGroup() has random occupation override global set to " + randomOccupationIndexOverride + ", which did not resolve to an occupation!!")
				endif
			else
				int iRandom = Utility.RandomInt(0, validOccupationsToChooseFrom.Length - 1)
				Definition.ChosenOccupation = validOccupationsToChooseFrom[iRandom]
			endif

			;Next find a group with that occupation
		
			if haveAllowedGroups
				;we have specific groups we want to pick from
				Trace(self, "SetUpGroup() 		limiting search for groups with Definition.ChosenOccupation: " + Definition.ChosenOccupation + ", to AllowedGroupsArray: " + AllowedGroupsArray)
				Definition.ChosenGroup = SQ_Groups.GetRandomGroupWithOccupation(Definition.ChosenOccupation, LimitSearchToTheseGroups = AllowedGroupsArray)

			else 
				;get a random group with that occupation
				Definition.ChosenGroup = SQ_Groups.GetRandomGroupWithOccupation(Definition.ChosenOccupation)
			endif
		endif

		Trace(self, "SetUpGroup() 		Definition.ChosenGroup: " + Definition.ChosenGroup)
		Trace(self, "SetUpGroup() 		Definition.ChosenOccupation: " + Definition.ChosenOccupation)

		;if we have made it this far and don't have both a ChosenGroup and ChosenOccupation something has gone wrong
		if Definition.ChosenGroup == None || Definition.ChosenOccupation == None
			Warning(self, "SetUpGroup() could not set a ChosenGroup or ChosenOccupation!")
		EndIf
		Trace(self, "SetUpGroup() ----------------------------------------------------------------------------------------------------  ")
	EndFunction

 ;	Set default names
	Function SetDefaultName(SpawnGroup_DefinitionDatum GroupDefinitionToSetName, string DefaultName) Private
		if GroupDefinitionToSetName.Name == ""
			GroupDefinitionToSetName.Name = DefaultName
		endif
	EndFunction

	SQ_GroupScript[] Function ConvertAllowedGroupsToArray(Formlist[] ArrayOfFormlistsToBuildFrom) Private
		Trace(self, "ConvertAllowedGroupsToArray() ArrayOfFormlistsToBuildFrom: " + ArrayOfFormlistsToBuildFrom)
		
		SQ_GroupScript[] arrayToReturn = new SQ_GroupScript[0]
		
		if ArrayOfFormlistsToBuildFrom == None || ArrayOfFormlistsToBuildFrom.Length == 0
			return arrayToReturn
		endif

		int i = 0
		While (i < ArrayOfFormlistsToBuildFrom.length)
			Form[] formArray = ArrayOfFormlistsToBuildFrom[i].GetArray()

			int j = 0
			While (j < formArray.length)
				SQ_GroupScript currentGroup = formArray[j] as SQ_GroupScript

				if currentGroup
					arrayToReturn.Add(currentGroup)
				else
					Warning(self, "ConvertAllowedGroupsToArray() found non-SQ_GroupScript " +  formArray[j] + " in " + ArrayOfFormlistsToBuildFrom[i])
				endif	
				j += 1
			EndWhile

			i += 1
		EndWhile

		Trace(self, "ConvertAllowedGroupsToArray()     returning arrayToReturn: " + arrayToReturn)
		return arrayToReturn
	EndFunction

	SQ_GroupOccupationScript[] Function ConvertAllowedOccupationsToArray(Formlist[] ArrayOfFormlistsToBuildFrom) Private
		Trace(self, "ConvertAllowedGroupsToArray() ConvertAllowedOccupationsToArray: " + ArrayOfFormlistsToBuildFrom)
		SQ_GroupOccupationScript[] arrayToReturn = new SQ_GroupOccupationScript[0]
		
		if ArrayOfFormlistsToBuildFrom == None || ArrayOfFormlistsToBuildFrom.Length == 0
			return arrayToReturn
		endif

		int i = 0
		While (i < ArrayOfFormlistsToBuildFrom.length)
			Form[] formArray = ArrayOfFormlistsToBuildFrom[i].GetArray()

			int j = 0
			While (j < formArray.length)		
				SQ_GroupOccupationScript currentGroupOccupation = formArray[j] as SQ_GroupOccupationScript	
				if currentGroupOccupation
					arrayToReturn.Add(currentGroupOccupation)
				else
					Warning(self, "ConvertAllowedOccupationsToArray() found non-SQ_GroupOccupationScript " +  formArray[j] + " in " + ArrayOfFormlistsToBuildFrom[i])
				endif	
				j += 1
			EndWhile

			i += 1
		EndWhile

		Trace(self, "ConvertAllowedOccupationsToArray() returning arrayToReturn: " + arrayToReturn)
		return arrayToReturn
	EndFunction

; Spawning functions
	Guard ProcessGroupsGuard ProtectsFunctionLogic
	
	Function ProcessGroups(int iStageID) Private
		Trace(self, "ProcessGroups() iStageID: " + iStageID)
		LockGuard ProcessGroupsGuard
			Trace(self, "ProcessGroups() iStageID: " + iStageID + " lock obtained - processing groups")
			ProcessGroupData(SpawnGroupA_Definition, SpawnGroupA_SpawnData, iStageID)
			ProcessGroupData(SpawnGroupB_Definition, SpawnGroupB_SpawnData, iStageID)
			ProcessGroupData(SpawnGroupC_Definition, SpawnGroupC_SpawnData, iStageID)
			ProcessGroupData(SpawnGroupD_Definition, SpawnGroupD_SpawnData, iStageID)
			ProcessGroupData(SpawnGroupE_Definition, SpawnGroupE_SpawnData, iStageID)
		EndLockGuard
		Trace(self, "ProcessGroups() iStageID: " + iStageID + " lock released - DONE processing groups")
	EndFunction 

	Function ProcessGroupData(SpawnGroup_DefinitionDatum Definition, SpawnGroup_SpawnDatum[] SpawnData, int StageToCheck) Private
		Trace(self, "ProcessGroupData()	Definition: " + Definition + ", SpawnData: " + SpawnData + ", StageToCheck: " + StageToCheck)

		if Definition == None || Definition.ChosenGroup == None || Definition.ChosenOccupation == None || SpawnData == None || SpawnData.length == 0 ;expected for completely empty group properties, will have previously warned about unexpected things
			Trace(self, "ProcessGroupData()			Data Empty. Bailing.")
			return
		endif

		if Definition.SpawnStage > -1 && Definition.SpawnStage != StageToCheck
			Trace(self, "ProcessGroupData()			SpawnStage has a value but this isn't that stage. Definition.SpawnStage: " + Definition.SpawnStage)
			return
		endif

		if Definition.Conditions && Definition.Conditions.IsTrue(akRefObject = Definition.ConditionAlias.GetReference()) == false
			Trace(self, "ProcessGroupData()			Conditions aren't true. Bailing. Definition.Conditions: " + Definition.Conditions + ",  Definition.ConditionAlias.GetReference(): " +  Definition.ConditionAlias.GetReference())
			return
		endif

		int spawnGroupID = 0
		if Definition == SpawnGroupA_Definition
			spawnGroupID = 1
		elseif Definition == SpawnGroupB_Definition
			spawnGroupID = 2
		elseif Definition == SpawnGroupC_Definition
			spawnGroupID = 3
		elseif Definition == SpawnGroupD_Definition
			spawnGroupID = 4
		elseif Definition == SpawnGroupE_Definition
			spawnGroupID = 5
		endif

		Trace(self, "ProcessGroupData()		****Checking spawn group " + spawnGroupID + " for eligible spawns.****")
		if Definition.SpawnStage > -1 && Definition.SpawnStage == StageToCheck
			; since this is the initial spawn stage for this spawn group, pass in -1 to GetValidSpawnData
			StageToCheck = -1
		EndIf

		SpawnGroup_SpawnDatum[] validSpawnData = GetValidSpawnData(SpawnData, StageToCheck)
		Trace(self, "ProcessGroupData()		validSpawnData: " + validSpawnData)
		Trace(self, "ProcessGroupData()		validSpawnData.length: " + validSpawnData.length)
		if validSpawnData.length > 0
			bool spawnedSomething = false
			int i = 0
			While (i < validSpawnData.length)
				SpawnGroup_SpawnDatum SpawnDatum = validSpawnData[i]
				if Spawn(Definition, SpawnData, SpawnDatum)
					Trace(self, "ProcessGroupData()		    i=" + i + ": spawned " + SpawnDatum)
					spawnedSomething = true
				else
					Trace(self, "ProcessGroupData()		    i=" + i + ": DID NOT SPAWN " + SpawnDatum)
				endif
				i += 1
			EndWhile

			if spawnedSomething
				Trace(self, "ProcessGroupData()		spawned something for this group - set up spawn event")
				;send the spawn group done event
				SpawnGroupDoneEventArgs spawnArgs = new SpawnGroupDoneEventArgs
				spawnArgs.SpawnGroupNumber = spawnGroupID
				spawnArgs.SpawnedGroup = Definition.ChosenGroup
				spawnArgs.SpawnedOccupation = Definition.ChosenOccupation

				;set location owner
				if Definition.LocationAliasToSetOwnershipOn
					location locToSetOwnerOn = Definition.LocationAliasToSetOwnershipOn.GetLocation()
					if locToSetOwnerOn
						Faction owningFaction = Definition.ChosenGroup.GetFactionForLocationOwnership()
						Trace(self, "ProcessGroupData()		locToSetOwnerOn: " + locToSetOwnerOn + ",  owningFaction: " + owningFaction)

						locToSetOwnerOn.SetFactionOwner(owningFaction)

						Trace(self, "ProcessGroupData()		Self_As_OEScript: " + Self_As_OEScript)

						; pass along to OEScript if not set already (for other quests to use)
						if Self_As_OEScript && Self_As_OEScript.OwningFaction == None
							Trace(self, "ProcessGroupData()		setting owning faction on OE_Script: " + owningFaction)
							Self_As_OEScript.OwningFaction = owningFaction
						endif
					endif
				endif

				SendSpawnGroupDoneEvent(spawnArgs)
			endif
		endif
	EndFunction

	; Searches through a set of SpawnData to find a NPC group that is eligible for this stage and passes condition checks necessary to spawn. 
	SpawnGroup_SpawnDatum[] Function GetValidSpawnData(SpawnGroup_SpawnDatum[] SpawnData, int iStageID) Private
		Trace(self, "GetValidSpawnData() SpawnData: " + SpawnData + ", iStageID: " + iStageID)
		SpawnGroup_SpawnDatum[] validData = new SpawnGroup_SpawnDatum[0]
		
		SpawnGroup_SpawnDatum[] spawnDataWithMatchingStage = SpawnData.GetAllMatchingStructs("StageToSpawn", iStageID)
		Trace(self, "GetValidSpawnData()	 spawnDataWithMatchingStage: " + spawnDataWithMatchingStage)

		int index = 0
		While index < spawnDataWithMatchingStage.length
			SpawnGroup_SpawnDatum currentSpawnData = spawnDataWithMatchingStage[index]

			Trace(Self, "GetValidSpawnData()	currentSpawnData: " + currentSpawnData)

			; Verify any Conditions on the Spawn are currently Valid.
			; get a ref to pass into the conditions
			ObjectReference spawnAtRef = NONE
			if currentSpawnData.SpawnAt is ReferenceAlias
				spawnAtRef = (currentSpawnData.SpawnAt as ReferenceAlias).GetRef()
			elseif currentSpawnData.SpawnAt is RefCollectionAlias
				spawnAtRef = (currentSpawnData.SpawnAt as RefCollectionAlias).GetAt(0)
			endif

			if spawnAtRef == None
				Warning(self, "GetValidSpawnData() spawnAtRef == None. IGNORING! (Note: in some cases this may be expected and intentional.")
			else
				ConditionForm spawnConditionsToCheck = currentSpawnData.SpawnConditions

				If spawnConditionsToCheck == None || spawnConditionsToCheck.IsTrue(akRefObject = spawnAtRef)
					Trace(Self, "GetValidSpawnData()		Found NPC available for spawning. Adding to potential spawn group.")
					validData.add(currentSpawnData)
				Else 
					Trace(Self, "GetValidSpawnData()		Disqualified due to conditions: " + spawnConditionsToCheck)
				EndIf 
			endif
		 
			index += 1
		EndWhile 

		Trace(Self, "GetValidSpawnData()		returning validData: " + validData)
		Return validData
	EndFunction 

; 	Spawn
	; Spawns a specific group using the Allowed Groups and associates it with a specific Role. Spawns at the Marker specified in the GroupSpawnData.
	; Assumes the group sent is valid and pre-approved as a selection for spawning.
	; returns true if it actually spawns something (might not if AllowSpawningIntoNonEmptyAliases == false )
	bool Function Spawn(SpawnGroup_DefinitionDatum Definition, SpawnGroup_SpawnDatum[] SpawnData, SpawnGroup_SpawnDatum SpawnDatum) Private
		Trace(self, "Spawn() --------------------------------------------  : " + Definition.Name + ", -------------------------------------------- ")
		Trace(self, "Spawn() Definition: " + Definition + ", Definition: " + Definition)
		
		Trace(self, "Spawn()		Name			: " + Definition.Name)
		Trace(Self, "Spawn() 		Role			: " + Definition.Role)
		Trace(self, "Spawn() 		SpawnAlias		: " + SpawnDatum.SpawnAlias)
		Trace(self, "Spawn() 		ChosenGroup		: " + Definition.ChosenGroup)
		Trace(self, "Spawn() 		ChosenOccupation: " + Definition.ChosenOccupation)
		Trace(self, "Spawn() 		SpawnAt		: " + SpawnDatum.SpawnAt)
		Trace(self, "Spawn() 		SetOverrideNameLeader: " + SpawnDatum.SetOverrideNameLeader)
		Trace(self, "Spawn() 		SetOverrideNameVendor: " + SpawnDatum.SetOverrideNameVendor)

		;Check for errors
		If Definition == None || SpawnDatum == None
			Warning(self, "Spawn() Definition == None || SpawnDatum == None. BAILING!")
			Return false
		EndIf 

		If Definition.ChosenGroup == None || Definition.ChosenOccupation == None
			Warning(self, "Spawn() ChosenGroup == None || ChosenOccupation == None. BAILING! ")
			Return false
		EndIf 

		;ensure there is reference to spawn at
		ObjectReference spawnAtRef
		
		ReferenceAlias spawnAtRefAlias = SpawnDatum.SpawnAt as ReferenceAlias
		RefCollectionAlias spawnAtRefCol
		if spawnAtRefAlias
			spawnAtRef = spawnAtRefAlias.GetReference()
		else
			spawnAtRefCol = SpawnDatum.SpawnAt as RefCollectionAlias
			
			if spawnAtRefCol == none ;LocationAlias?
				Warning(self, "Spawn() BAILING!!! found unexpected type of spawnAtRef: " + spawnAtRef)
				return false
			endif
			
			spawnAtRef = spawnAtRefCol.GetAt(0) ;we'll iterate through it if we are spawning multiple things below
		endif

		if spawnAtRef == None
			Warning(self, "Spawn() spawnAtRef == None. Unable to spawn any actors. BAILING! (Note: in some cases this may be expected and intentional.")
			return false
		endif

		;crime faction if there is one
		Faction crimeFaction = Definition.crimeFaction
		if crimeFaction == NONE
			; get one from the chosen group
			Definition.crimeFaction = Definition.ChosenGroup.GetFactionForLocationOwnership()
			crimeFaction = Definition.crimeFaction
		endif
		
		Trace(self, "Spawn() 		crime faction to add to spawned actors: " + crimeFaction)

		;handle things if the alias we are forcing into a RefCollectionAlias
		RefCollectionAlias currentRefCol = SpawnDatum.SpawnAlias as RefCollectionAlias
		if currentRefCol
			if Definition.AllowSpawningIntoNonEmptyAliases == true || currentRefCol.GetCount() == 0
				bool spawningCorpses = (SpawnDatum.SpawnType == SQ_Groups.SQ_Group_SpawnType_Corpse)
				Trace(self, "Spawn() 		spawningCorpses= " + spawningCorpses)

				if SpawnDatum.SpawnAllAtEach && spawningCorpses == false
				; spawn full sets of actors at each ref in the collection (but never do this for corpses)
					Trace(self, "Spawn() 		SpawnAllAtEach=true - spawn full set of actors at each ref in spawnAtRefCol: " + spawnAtRefCol)
					int i = 0
					While (i < spawnAtRefCol.GetCount())
						spawnAtRef = spawnAtRefCol.GetAt(i)

						int numToSpawn = Utility.RandomInt(SpawnDatum.MinToSpawn, SpawnDatum.MaxToSpawn)
						Trace(self, "Spawn() 		will spawn numToSpawn: " + numToSpawn + " and force into currentRefCol: " + currentRefCol)

						int countSpawned = 0
						While (countSpawned < numToSpawn)
							ObjectReference refToAdd = Definition.ChosenGroup.SpawnGroupReference(spawnAtRef, Definition.ChosenOccupation, SpawnDatum.LinkToSpawnAt, SpawnDatum.LinkToSpawnAtWithNoKeyword, SpawnDatum.SpawnType, SpawnDatum.Gender, SpawnDatum.IsVendor, crimeFaction, SpawnDatum.InitiallyDisabled, Definition.Aggression)
							Trace(self, "Spawn() 		spawning refToAdd: " + refToAdd + " at spawnAtRef: " + spawnAtRef)
							currentRefCol.AddRef(refToAdd)
							countSpawned += 1
						EndWhile

						i += 1
					EndWhile

				else ;SpawnAllAtEach == false, so spawn each spread across all the refs in refcollection by iterating over the refs in the collection
					Trace(self, "Spawn() 		SpawnAllAtEach=false spawnAtRefCol=" + spawnAtRefCol)
					int numToSpawn = Utility.RandomInt(SpawnDatum.MinToSpawn, SpawnDatum.MaxToSpawn)

					int CountOfSpawnAtRefCol = 1
					if spawnAtRefCol
						CountOfSpawnAtRefCol = spawnAtRefCol.GetCount()
					EndIf

					if spawningCorpses ; can't spawn more corpses than we have markers to place them at
						Trace(self, "Spawn() 		spawning corpses - limit numToSpawn to " + CountOfSpawnAtRefCol)
						numToSpawn = Math.Min(CountOfSpawnAtRefCol, numToSpawn) as int
					endif

					Trace(self, "Spawn() 		will spawn numToSpawn: " + numToSpawn + " and force into currentRefCol: " + currentRefCol)
					int countSpawned = 0
					While countSpawned < numToSpawn
						
						;if we have an RefCollectionAlias for SpawnAt, iterate through those refs:
						if spawnAtRefCol
							spawnAtRef = spawnAtRefCol.GetAt(countSpawned % CountOfSpawnAtRefCol)
						endif

						ObjectReference refToAdd = Definition.ChosenGroup.SpawnGroupReference(spawnAtRef, Definition.ChosenOccupation, SpawnDatum.LinkToSpawnAt, SpawnDatum.LinkToSpawnAtWithNoKeyword, SpawnDatum.SpawnType, SpawnDatum.Gender, SpawnDatum.IsVendor, crimeFaction, SpawnDatum.InitiallyDisabled, Definition.Aggression)
						Trace(self, "Spawn() 		spawning refToAdd: " + refToAdd + " at spawnAtRef: " + spawnAtRef)
						currentRefCol.AddRef(refToAdd)
						
						countSpawned += 1
					EndWhile
				endif

				if SpawnDatum.SetOverrideNameLeader || SpawnDatum.SetOverrideNameVendor
					int i = 0
					While (i < currentRefCol.GetCount())
						ObjectReference refToName = currentRefCol.GetAt(i)

						if SpawnDatum.SetOverrideNameLeader
							Trace(self, "Spawn() 		calling Definition.ChosenOccupation.SetOverrideNameLeader() refToName: " + refToName)
							Definition.ChosenOccupation.SetOverrideNameLeader(refToName as Actor)
						endif	

						if SpawnDatum.SetOverrideNameVendor
							Trace(self, "Spawn() 		calling Definition.ChosenOccupation.SetOverrideNameVendor() refToName: " + refToName)
							Definition.ChosenOccupation.SetOverrideNameVendor(refToName as Actor)
						endif

						i += 1
					EndWhile
				endif



				; Register RefCollectionAlias with REScript
				if SpawnDatum.Register_With_REScript && Self_As_REScript
					Self_As_REScript.RegisterCollectionAlias(currentRefCol)
				EndIf
			else
				Trace(self, "Spawn() 		not spawning into non-empty currentRefCol: " + currentRefCol)
				return false
			endif
		;otherwise handle if the alias we are forcing into is a ReferenceAlias
		else
			ReferenceAlias currentRefAlias = SpawnDatum.SpawnAlias as ReferenceAlias
			if currentRefAlias
				if Definition.AllowSpawningIntoNonEmptyAliases == true || currentRefAlias.GetRef() == NONE

					ObjectReference spawnedRef = Definition.ChosenGroup.SpawnGroupReference(spawnAtRef, Definition.ChosenOccupation, SpawnDatum.LinkToSpawnAt, SpawnDatum.LinkToSpawnAtWithNoKeyword, SpawnDatum.SpawnType, SpawnDatum.Gender, SpawnDatum.IsVendor, crimeFaction, SpawnDatum.InitiallyDisabled, Definition.Aggression)
					currentRefAlias.ForceRefTo(spawnedRef)

					Trace(self, "Spawn() 		spawnedRef: " + spawnedRef + " and forced into currentRefAlias: " + currentRefAlias + ", spawnAtRef: " + spawnAtRef)

					if SpawnDatum.SetOverrideNameLeader
						Trace(self, "Spawn() 		calling Definition.ChosenOccupation.SetOverrideNameLeader()")
						Definition.ChosenOccupation.SetOverrideNameLeader(spawnedRef as Actor)
					endif

					if SpawnDatum.SetOverrideNameVendor
						Trace(self, "Spawn() 		calling Definition.ChosenOccupation.SetOverrideNameVendor()")
						Definition.ChosenOccupation.SetOverrideNameVendor(spawnedRef as Actor)
					endif
				else
					Trace(self, "Spawn() 		not spawning into non-empty currentRefAlias: " + currentRefAlias)
					return false
				endif
			else ;otherwise we are unsupported (LocationAlias?)
				Warning(self, "Spawn() found unsupported alias type for SpawnDatum.SpawnAlias: " + SpawnDatum.SpawnAlias)
				return false
			endif

			; Register RefAlias with REScript
			if SpawnDatum.Register_With_REScript && Self_As_REScript
				Self_As_REScript.RegisterAlias(currentRefAlias)
			endif
		endif

		;send the spawn event
		SpawnEventArgs spawnArgs = new SpawnEventArgs
		if Definition == SpawnGroupA_Definition
			spawnArgs.SpawnGroupNumber = 1
		elseif Definition == SpawnGroupB_Definition
			spawnArgs.SpawnGroupNumber = 2
		elseif Definition == SpawnGroupC_Definition
			spawnArgs.SpawnGroupNumber = 3
		elseif Definition == SpawnGroupD_Definition
			spawnArgs.SpawnGroupNumber = 4
		elseif Definition == SpawnGroupE_Definition
			spawnArgs.SpawnGroupNumber = 5
		endif

		spawnArgs.SpawnDataIndex = SpawnData.Find(SpawnDatum)
		spawnArgs.SpawnAlias = SpawnDatum.SpawnAlias
		spawnArgs.SpawnAtAlias = SpawnDatum.SpawnAt
		spawnArgs.SpawnedGroup = Definition.ChosenGroup
		spawnArgs.SpawnedOccupation = Definition.ChosenOccupation

		SendSpawnEvent(spawnArgs)

		Trace(self, "Spawn() ------------------------------------------------------------------------------------------------------ ")
		return true
	EndFunction

bool Function WaitForInitialGroupSetup() Private
	;make sure we have finished setting up
	float maxWait = 30.0
	float waitTime = 0.2
	float waitingFor
	while GroupSetupCompleted == false && waitingFor < maxWait
		Utility.Wait(waitTime)
		waitingFor += waitTime
		Trace(self, "WaitForInitialGroupSetup()		waiting for GroupSetupCompleted. waitingFor: " + waitingFor)
	EndWhile

	if waitingFor >= maxWait
		Warning(self, "WaitForInitialGroupSetup() Returning false. Waited to long for GroupSetupCompleted. Had been waitingFor: " + waitingFor)
		Return false
	endif

	return true
EndFunction

;returns a SpaceshipBase based on the group specified.
;NOTE: this function waits until DefaultGroupSpawnQuestScript is done setting up. It will bail out if it's taking too long.
;int GroupToGetShipFor: 0 means group A, 1 means group B, etc.
;ObjectReference landingMarkerRef: landing marker this ship will be spawned at; used to determine max ship size to spawn
;GlobalVariable SpawnType: which ship to spawn. Global will be prefixed with: SQ_Group_SpawnType_Ship
;Defaults will be: Group A and SQ_Group_SpawnType_Ship_0_Any
SpaceshipBase Function GetShipToSpawnForGroup(int GroupToGetShipFor, ObjectReference landingMarkerRef, GlobalVariable SpawnType = None) ;Public
	
	if WaitForInitialGroupSetup() == false
		Trace(self, "GetShipToSpawnForGroup() BAILING!!! Did not properly initialize groups in WaitForInitialGroupSetup()")
		return none
	endif

	SpawnGroup_DefinitionDatum definitionToSpawnWith = GetSpawnGroupDefinitionDatum(GroupToGetShipFor)

	if definitionToSpawnWith == NONE
		Warning(self, "GetShipToSpawnForGroup() BAILING!!! Found unexpected GroupToGetShipFor: " + GroupToGetShipFor)
		return None
	endif

	SpaceshipBase spaceshipBaseToReturn = definitionToSpawnWith.ChosenGroup.GetSpaceshipBaseToSpawn(landingMarkerRef, SpawnType, definitionToSpawnWith.ChosenOccupation)

	Trace(self, "GetShipToSpawnForGroup()		spaceshipBaseToReturn: " + spaceshipBaseToReturn)
	return spaceshipBaseToReturn

EndFunction

Faction Function GetGroupOwnershipFaction(int groupID = 0) ; Public
	if WaitForInitialGroupSetup() == false
		Trace(self, "GetGroupOwnershipFaction() BAILING!!! Did not properly initialize groups in WaitForInitialGroupSetup()")
		return none
	endif

	SpawnGroup_DefinitionDatum groupDefinition = GetSpawnGroupDefinitionDatum(groupID)
		Trace(self, "GetGroupOwnershipFaction()    groupID=" + groupID + " groupDefinition=" + groupDefinition)
	Faction owningFaction = groupDefinition.ChosenGroup.GetFactionForLocationOwnership()

	return owningFaction	
endFunction

SpawnGroup_DefinitionDatum Function GetSpawnGroupDefinitionDatum(int GroupID = 0)
	SpawnGroup_DefinitionDatum definitionToSpawnWith = NONE

	if GroupID == 0
		definitionToSpawnWith = SpawnGroupA_Definition
	elseif GroupID == 1
		definitionToSpawnWith = SpawnGroupB_Definition
	elseif GroupID == 2
		definitionToSpawnWith = SpawnGroupC_Definition
	elseif GroupID == 3
		definitionToSpawnWith = SpawnGroupD_Definition
	elseif GroupID == 4
		definitionToSpawnWith = SpawnGroupE_Definition
	else
		Warning(self, "GetSpawnGroupDefinitionDatum() BAILING!!! Found unexpected GetSpawnGroupDefinitionDatum: " + GroupID)
	endif
	return definitionToSpawnWith
EndFunction

;************************************************************************************
;****************************        Custom Logs        *****************************
;************************************************************************************
;	define custom logs
	CustomLogs:LogDatum[] logs
	Function DefineCustomLogs() Private
		logs = new CustomLogs:LogDatum[0]

		;SQ_Groups - Always
		customLogs.AddCustomLog(logs, \
								MainLogName = "SQ_Groups", \
								SubLogName = "DefaultGroupSpawnQuestScript", \
								PrefixTracesWithLogNames = true, \
								PrefixTracesWithCallingObject = true, \
								Prefix = "", \
								ShowNormalTraces = true)


		;OE Logs - If OEScript is attached
		if Self_As_OEScript
			customLogs.AddCustomLog(logs, \
									MainLogName = Self_As_OEScript.MainLogName, \
									SubLogName = "", \
									PrefixTracesWithLogNames = !Self_As_OEScript.TerseLog, \
									PrefixTracesWithCallingObject = true, \
									Prefix = LocalScriptName, \
									ShowNormalTraces = Self_As_OEScript.DebugMode)
		EndIf

	EndFunction

;	Trace and warning functions
    Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0) DebugOnly
		CustomLogs.Trace(logs, CallingObject, asTextToPrint, aiSeverity)
    EndFunction

	Function Warning(ScriptObject CallingObject, string asTextToPrint, bool DebugTrace=False, int aiSeverity=2, bool bShowNormalTrace=false, bool bShowWarning=True, bool bPrefixTraceWithLogNames=True) BetaOnly
		CustomLogs.Warning(logs, CallingObject, asTextToPrint)
	EndFunction