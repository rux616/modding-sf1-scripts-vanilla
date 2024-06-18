Scriptname SQ_GroupScript extends Activator

Struct OccupationDatum
	SQ_GroupOccupationScript Occupation
	{the occupation}

	ActorBase ActorBaseToSpawn_Female
	{which actorbase to spawn for the group's use of this occupation - with female specific voicetypes}

	ActorBase ActorBaseToSpawn_Male
	{which actorbase to spawn for the group's use of this occupation - with male specific voicetypes}

	ActorBase CorpseToSpawn_Female
	{which actorbase to spawn a corpse associated the this group's use of this occupation}

	ActorBase CorpseToSpawn_Male
	{which actorbase to spawn a corpse associated the this group's use of this occupation}

	Faction VendorFaction
	{OPTIONAL: Vendor Faction for vendors spawned for this occupation; defaults to data set on SQ_GroupOccupationScript for this occupation}

	LeveledItem VendorList
	{OPTIONAL: Leveled list for populating vendor container for this occupation; defaults to data set on SQ_GroupOccupationScript for this occupation}

	ActorBase ActorBaseToSpawn_Child_Female
	{OPTIONAL: which child actorbase to spawn for the group's use of this occupation - with female child specific voicetypes; defaults to data set on SQ_GroupOccupationScript for this occupation}

	ActorBase ActorBaseToSpawn_Child_Male
	{OPTIONAL: which child actorbase to spawn for the group's use of this occupation - with male child specific voicetypes; defaults to data set on SQ_GroupOccupationScript for this occupation}

	ActorBase ActorBaseToSpawn_Older_Female
	{OPTIONAL: which Older actorbase to spawn for the group's use of this occupation - with female old specific voicetypes; defaults to data set on SQ_GroupOccupationScript for this occupation}

	ActorBase ActorBaseToSpawn_Older_Male
	{OPTIONAL: which Older actorbase to spawn for the group's use of this occupation - with male old specific voicetypes; defaults to data set on SQ_GroupOccupationScript for this occupation}

	ActorBase ActorBaseToSpawn_Robot
	{OPTIONAL: which child actorbase to spawn for the group's use of this occupation - with female child specific voicetypes; defaults to data set on SQ_GroupOccupationScript for this occupation}

	SpaceshipBase ShipToSpawn_Fighter
	{OPTIONAL: When spawning a fighter for this group, use this. (otherwise use the main faction ships)}

	SpaceshipBase ShipToSpawn_Destroyer
	{OPTIONAL: When spawning a destroyer for this group, use this.}

	SpaceshipBase ShipToSpawn_Cruiser
	{OPTIONAL: When spawning a cruiser for this group, use this.}

EndStruct

Group Autofill
	
	GlobalVariable Property SQ_Group_Gender_Any Mandatory Const Auto
	GlobalVariable Property SQ_Group_Gender_Female Mandatory Const Auto
	GlobalVariable Property SQ_Group_Gender_Male Mandatory Const Auto

	GlobalVariable Property SQ_Group_SpawnType_Actor Mandatory Const Auto
	GlobalVariable Property SQ_Group_SpawnType_Corpse Mandatory Const Auto
	GlobalVariable Property SQ_Group_SpawnType_Child Mandatory Const Auto
	GlobalVariable Property SQ_Group_SpawnType_Robot Mandatory Const Auto
	GlobalVariable Property SQ_Group_SpawnType_Older Mandatory Const Auto

	GlobalVariable Property SQ_Group_SpawnType_Ship_0_Any Mandatory Const Auto
	GlobalVariable Property SQ_Group_SpawnType_Ship_1_Fighter Mandatory Const Auto
	GlobalVariable Property SQ_Group_SpawnType_Ship_2_Destroyer Mandatory Const Auto
	GlobalVariable Property SQ_Group_SpawnType_Ship_3_Cruiser Mandatory Const Auto

	Keyword Property SpaceshipLandingMarker Mandatory Const Auto

	Faction Property SQ_Group_VendorFaction_Default Mandatory Const Auto
	Container Property SQ_VendorContainerEmptyBase Mandatory Const Auto
	Keyword Property VendorContainerKeyword01 Mandatory Const Auto 

	Keyword Property SpaceshipLandingPadMedium Mandatory Const Auto
	Keyword Property SpaceshipLandingPadLarge Mandatory Const Auto
EndGroup

Group GroupData
	GlobalVariable Property FactionID Mandatory Const Auto
	{A global that holds an enum used to identify this group. Can be stored in AVs and variables for conditions on dialogue, etc.
	Filter for: SQ_Group_FactionID_}

	Faction[] Property  GroupFactions Mandatory Const Auto 
	{The main faction(s) members of this group are in. This is an identifying faction that should be closely tied with the factions identity. An actor in ANY of these factions is considered a member of this group.}

	Keyword[] Property LocEncKeywords Const Auto
	{NOT YET IMPLEMENTED -- optional: A keyword on locations where this group resides. This will be used to help determine what group is in an area}

	Faction Property FactionForLocationOwnership Const Auto
	{When a group is spawned from this faction, it will assign this faction to be the owner of the location they spawn into.}

	FormList Property FactionListForLocationOwnership Const Auto
	{When a group is spawned from this faction, it will randomly assign one of these factions to be the owner of the location they spawn into.
	(IGNORED IF FactionForLocationOwnership is not none.)}

	SpaceshipBase Property ShipToSpawn_Fighter Mandatory Const Auto
	{When spawning a fighter for this group, use this.}

	SpaceshipBase Property ShipToSpawn_Destroyer Mandatory Const Auto
	{When spawning a destroyer for this group, use this.}

	SpaceshipBase Property ShipToSpawn_Cruiser Mandatory Const Auto
	{When spawning a cruiser for this group, use this.}

	float Property ActorLevelModChanceEasy = 0.4 auto const
	{Chance the actor's aiLevelMod will be 0, Easy.}

	float Property ActorLevelModChanceMedium = 0.8 auto const
	{Chance the actor's aiLevelMod will be 1, Medium. If not Easy or Medium, the actor will be 2, Hard.}
EndGroup

Group Occupations
	OccupationDatum[] Property OccupationData Mandatory Const Auto
EndGroup


int Function GetFactionIDValue()
	return FactionID.GetValue() as int
EndFunction

bool Function ValidateActor(Actor ActorToValidate, SQ_GroupOccupationScript OccupationToValidate = None)
	Trace(self, "ValidateActor() ActorToValidate: " + ActorToValidate + "OccupationToValidate: " + OccupationToValidate)

	bool validated = OccupationToValidate == None || OccupationToValidate.ValidateActor(ActorToValidate)
	Trace(self, "ValidateActor() occupation validated: " + validated)

	if validated
		validated = CheckActorFactions(ActorToValidate) ;checks if actor is in ANY of the GroupFactions
		Trace(self, "ValidateActor() faction validated: " + validated)
	endif

	return validated
EndFunction

;checks if actor is in ANY of the GroupFactions
bool Function CheckActorFactions(Actor ActorToTest)
	bool factionCheck = CommonArrayFunctions.CheckActorAgainstFactionArray(ActorToTest, GroupFactions)
	Trace(self, "CheckActorFactions() factionCheck: " + factionCheck)
	return factionCheck
EndFunction

SQ_GroupOccupationScript[] Function GetAllOccupations()
	SQ_GroupOccupationScript[] occupations = new SQ_GroupOccupationScript[OccupationData.length]

	int i = 0
	While (i < OccupationData.length)
		occupations[i] = OccupationData[i].Occupation
		i += 1
	EndWhile

	Trace(self, "GetAllOccupations() returning occupations: " + occupations)

	return occupations
EndFunction

SQ_GroupOccupationScript Function GetRandomOccupation()
	Trace(self, "GetRandomOccupation()")
	
	SQ_GroupOccupationScript[] allOccupations = GetAllOccupations()
	Trace(self, "GetRandomOccupation() allOccupations: " + allOccupations)

	int iRandom = Utility.RandomInt(0, allOccupations.Length - 1)
	SQ_GroupOccupationScript randomOccupation = allOccupations[iRandom]

	Trace(self, "GetRandomOccupation() returning randomOccupation: " + randomOccupation)
	return randomOccupation
EndFunction

bool Function HasOccupation(SQ_GroupOccupationScript OccupationToFind)
	return OccupationData.FindStruct("Occupation", OccupationToFind) > -1
EndFunction


;returns a random item from an array of Occupations that are found both in OccupationData and OccupationsToCheck
SQ_GroupOccupationScript Function GetRandomMatchingOccupation(SQ_GroupOccupationScript[] OccupationsToCheck)
	Trace(self, "GetRandomMatchingOccupation() OccupationsToCheck: " + OccupationsToCheck)
	
	SQ_GroupOccupationScript[] matchingOccupations = GetMatchingOccupations(OccupationsToCheck)
	
	int iRandom = Utility.RandomInt(0, matchingOccupations.Length - 1)
	SQ_GroupOccupationScript randomOccupation = matchingOccupations[iRandom]

	Trace(self, "GetRandomMatchingOccupation() returning randomOccupation: " + randomOccupation)
	return randomOccupation
EndFunction

;returns an array of Occupations that are found both in OccupationData and OccupationsToCheck
SQ_GroupOccupationScript[] Function GetMatchingOccupations(SQ_GroupOccupationScript[] OccupationsToCheck)
	Trace(self, "GetMatchingOccupations() OccupationsToCheck: " + OccupationsToCheck)
	
	SQ_GroupOccupationScript[] matchingOccupations = new SQ_GroupOccupationScript[0]
	
	int i = 0
	While (i < OccupationData.length)
		OccupationDatum currentOccupationDatum = OccupationData[i]
		
		;Trace(self, "GetMatchingOccupations() currentOccupationDatum: " + currentOccupationDatum)

		if OccupationsToCheck.Find(currentOccupationDatum.Occupation) >= 0
			;Trace(self, "currentOccupationDatum() found currentOccupationDatum.Occupation: " + currentOccupationDatum.Occupation)
			matchingOccupations.add(currentOccupationDatum.Occupation)
		endif

		i += 1
	EndWhile

	Trace(self, "GetMatchingOccupations() returning: matchingOccupations: " + matchingOccupations)
	return matchingOccupations
EndFunction

Faction Function GetFactionForLocationOwnership()
	Faction owningFaction = FactionForLocationOwnership
	
	if owningFaction == None && FactionListForLocationOwnership
		Trace(self, "GetFactionForLocationOwnership() picking random faction from FactionListForLocationOwnership: " + FactionListForLocationOwnership)
		int iRandom = Utility.RandomInt(0, FactionListForLocationOwnership.GetSize() - 1)
		Faction randomFaction = FactionListForLocationOwnership.GetAt(iRandom) as Faction
		owningFaction = randomFaction
	endif

	Trace(self, "GetFactionForLocationOwnership() returning owningFaction: " + owningFaction)

	return owningFaction
EndFunction

ObjectReference Function SpawnGroupReference(ObjectReference SpawnAtRef, SQ_GroupOccupationScript OccupationToSpawn, Keyword LinkToSpawnAt = None, bool LinkToSpawnAtWithNoKeyword = false, GlobalVariable SpawnType = None, GlobalVariable GenderToSpawn = None, bool IsVendor = False, Faction crimeFaction = NONE, bool InitiallyDisabled = False, int Aggression = -1)
	Trace(self, "SpawnGroupReference() SpawnAtRef: " + SpawnAtRef + ", OccupationToSpawn: " + OccupationToSpawn)
	
	if SpawnAtRef == None
		Warning(self, "SpawnGroupReference() SpawnAtRef is NONE! BAILING!!!")
		Return None
	endif
	if OccupationToSpawn == None
		Warning(self, "SpawnGroupReference() OccupationToSpawn is NONE! BAILING!!!")
		Return None
	endif

	if SpawnType == None ;default is actor
		SpawnType = SQ_Group_SpawnType_Actor 
	endif

	Form formToSpawn
	bool isShipSpawning = false
	Faction vendorFaction
	LeveledItem vendorList

	int iFound = OccupationData.FindStruct("Occupation", OccupationToSpawn)
	OccupationDatum foundOccupationDatum
	if iFound > -1
		foundOccupationDatum = OccupationData[iFound]

		bool SpawnMale = false ;default is female
	
		if GenderToSpawn == None || GenderToSpawn == SQ_Group_Gender_Any
			SpawnMale = Utility.RandomInt(1, 100) <= 50
		elseif GenderToSpawn == SQ_Group_Gender_Male
			SpawnMale = true
		elseif GenderToSpawn != SQ_Group_Gender_Female
			Warning(self, "SpawnGroupReference() found unexpected value for GenderToSpawn: " + GenderToSpawn)
		endif
		
		;ACTOR
		if SpawnType == SQ_Group_SpawnType_Actor
			if SpawnMale
				formToSpawn = foundOccupationDatum.ActorBaseToSpawn_Male
			else
				formToSpawn = foundOccupationDatum.ActorBaseToSpawn_Female
			endif

		;CHILD
		elseif SpawnType == SQ_Group_SpawnType_Child
			if SpawnMale
				formToSpawn = foundOccupationDatum.ActorBaseToSpawn_Child_Male
				if formToSpawn == None
					formToSpawn = OccupationToSpawn.DefaultChild_Male
				endif

			else
				formToSpawn = foundOccupationDatum.ActorBaseToSpawn_Child_Female
				if formToSpawn == None
					formToSpawn = OccupationToSpawn.DefaultChild_Female
				endif
			endif

		;OLDER
		elseif SpawnType == SQ_Group_SpawnType_Older
			if SpawnMale
				formToSpawn = foundOccupationDatum.ActorBaseToSpawn_Older_Male
				if formToSpawn == None
					formToSpawn = OccupationToSpawn.DefaultOlder_Male
				endif

			else
				formToSpawn = foundOccupationDatum.ActorBaseToSpawn_Older_Female
				if formToSpawn == None
					formToSpawn = OccupationToSpawn.DefaultOlder_Female
				endif
			endif

		
		;ROBOT
		elseif SpawnType == SQ_Group_SpawnType_Robot
			formToSpawn = foundOccupationDatum.ActorBaseToSpawn_Robot
				if formToSpawn == None
					formToSpawn = OccupationToSpawn.DefaultRobot
				endif

		;CORPSE
		elseif SpawnType == SQ_Group_SpawnType_Corpse
			if SpawnMale
				formToSpawn = foundOccupationDatum.CorpseToSpawn_Male
			else
				formToSpawn = foundOccupationDatum.CorpseToSpawn_Female
			endif

		;SHIP
		elseif IsSpawnTypeShip(SpawnType)
			isShipSpawning = true

			;ensure we have a landing marker:
			if SpawnAtRef.HasKeyword(SpaceshipLandingMarker)
				formToSpawn = GetSpaceshipBaseToSpawn(SpawnAtRef, SpawnType, foundOccupationDatum.Occupation)
			else
				Warning(self, "SpawnGroupReference() want to spawn a ship, but missing SpaceshipLandingMarker keyword on SpawnAtRef: " + SpawnAtRef)
			endif

		else
			Warning(self, "SpawnGroupReference() found unexpected value for SpawnType: " + SpawnType)
		endif

		if IsVendor
			vendorList = foundOccupationDatum.VendorList

			if vendorList == None
				vendorList =  foundOccupationDatum.Occupation.DefaultVendorList
			endif
			
			vendorFaction = foundOccupationDatum.VendorFaction

			if vendorFaction == None ;use default for occupation
				vendorFaction = foundOccupationDatum.Occupation.DefaultOccupationVendorFaction
			endif

			if vendorFaction == None ;use the default for the entire system
				vendorFaction = SQ_Group_VendorFaction_Default
			endif
			Trace(self, "SpawnGroupReference(): spawning a vendor, using vendorList=" + vendorList + " vendorFaction=" + vendorFaction)
		endif

	else ;we didn't find the occupation in this group's list of occupations. This is unexpected
		Warning(self, "SpawnGroupReference() did not find OccupationToSpawn: " + OccupationToSpawn + ", in OccupationData: " + OccupationData + " BAILING!!!")
		Return None
	endIf
	
	Trace(self, "SpawnGroupReference() OccupationToSpawn: " + OccupationToSpawn)

	if formToSpawn == None
		Warning(self, "SpawnGroupReference() formToSpawn == None! BAILING")
		Return None
	endif

	Trace(self, "SpawnGroupReference() formToSpawn: " + formToSpawn)


	ObjectReference spawnedRef

	if isShipSpawning
	
		spawnedRef = SpawnAtRef.PlaceShipAtMe(formToSpawn as SpaceshipBase, abInitiallyDisabled = true)

		;for now we will spawn "already landed ships" - more complex behavior should potentially use the OE_ShipsAddonScript functionality
		spawnedRef.SetLinkedRef(SpawnAtRef, abPromoteParentRefr = false) ;default link will make it start landed
		Trace(self, "SpawnGroupReference()		 spawnedRef.GetLinkedRef()" + spawnedRef.GetLinkedRef())
	
		spawnedRef.Enable()
		Trace(self, "SpawnGroupReference()		after enable spawnedRef.GetLinkedRef()" + spawnedRef.GetLinkedRef())

	else
		ActorBase actorBaseToSpawn = formToSpawn as ActorBase
		if actorBaseToSpawn
			int actorLevelMod
			float actorLevelModChance = Utility.RandomFloat(0, 1)
			if (actorLevelModChance < ActorLevelModChanceEasy)
				actorLevelMod = 0 ;Easy
			ElseIf (actorLevelModChance < ActorLevelModChanceMedium)
				actorLevelMod = 1 ;Medium
			Else
				actorLevelMod = 2 ;Hard
			EndIf
			Trace(self, "SpawnGroupReference()		spawning actor with actorLevelMod=" + actorLevelMod)

			spawnedRef = SpawnAtRef.PlaceActorAtMe(actorBaseToSpawn, actorLevelMod, SpawnAtRef.GetCurrentLocation(), abInitiallyDisabled=InitiallyDisabled)
		else
			spawnedRef = SpawnAtRef.PlaceAtMe(formToSpawn, abInitiallyDisabled=InitiallyDisabled)
		endif
	endif

	Actor spawnedActor = spawnedRef as Actor
	SpaceshipReference spawnedShip = spawnedRef as SpaceshipReference

	if crimeFaction
		if spawnedActor
			spawnedActor.SetCrimeFaction(crimeFaction)
		elseif spawnedShip
			spawnedShip.SetCrimeFaction(crimeFaction)
		endif
	EndIf

	if Aggression > -1 && Aggression < 4
		if spawnedActor
			spawnedActor.SetValue(Game.GetAggressionAV(), Aggression)
		elseif spawnedShip
			spawnedShip.SetValue(Game.GetAggressionAV(), Aggression)
		endif
	endif

	Trace(self, "SpawnGroupReference() spawnedRef: " + spawnedRef + ", SpawnAtRef: " + SpawnAtRef)

	if LinkToSpawnAt || LinkToSpawnAtWithNoKeyword
		Trace(self, "SpawnGroupReference() linking spawnedRef: " + spawnedRef + ", to SpawnAtRef: " + SpawnAtRef + ", with keyword LinkToSpawnAt: " + LinkToSpawnAt)
		spawnedRef.SetLinkedRef(SpawnAtRef, LinkToSpawnAt, abPromoteParentRefr = false) ;LinkToSpawnAt might be none, but we only want to do this in the case of LinkToSpawnAtWithNoKeyword - rationale: default linked refs are used to indicate patrols in default master package, so we only want to make default linked refs when user specifies that
	endif

	if IsVendor
		Trace(self, "SpawnGroupReference() is adding spawnedRef to vendorFaction: " + vendorFaction )

		spawnedActor.AddToFaction(vendorFaction)

		;spawn the vendor container
		ObjectReference vendorContainerRef = spawnedActor.PlaceAtMe(SQ_VendorContainerEmptyBase, abInitiallyDisabled = true)
		vendorContainerRef.AddItem(vendorList)
		Trace(self, "SpawnGroupReference() added vendorList: " + vendorList + ", to vendorContainerRef: " + vendorContainerRef)

		;link with vendor keyword
		spawnedRef.SetLinkedRef(vendorContainerRef, VendorContainerKeyword01, abPromoteParentRefr = false)
	endif

	return spawnedRef
EndFunction


bool Function IsSpawnTypeShip(GlobalVariable SpawnTypeGlobal)
	return SpawnTypeGlobal == SQ_Group_SpawnType_Ship_0_Any || SpawnTypeGlobal == SQ_Group_SpawnType_Ship_1_Fighter || SpawnTypeGlobal == SQ_Group_SpawnType_Ship_2_Destroyer || SpawnTypeGlobal == SQ_Group_SpawnType_Ship_3_Cruiser
EndFunction

SpaceshipBase Function GetSpaceshipBaseToSpawn(ObjectReference landingMarkerRef, GlobalVariable RequestedShip_SpawnType = None, SQ_GroupOccupationScript Occupation = None)
	Trace(self, "GetSpaceshipBaseToSpawn() RequestedShip_SpawnType: " + RequestedShip_SpawnType)

	SpaceshipBase shipbaseToReturn = none

	;pick one if needed
	int sizeMax = 1
	if RequestedShip_SpawnType == None || RequestedShip_SpawnType == SQ_Group_SpawnType_Ship_0_Any
		if landingMarkerRef.HasKeyword(SpaceshipLandingPadMedium)
			sizeMax = 2
		elseif landingMarkerRef.HasKeyword(SpaceshipLandingPadLarge)
			sizeMax = 3
		endif
		;randomly pick one
		int randomInt = Utility.RandomInt(1, sizeMax)

		if randomInt == 1
			RequestedShip_SpawnType = SQ_Group_SpawnType_Ship_1_Fighter
		elseif randomInt == 2 
			RequestedShip_SpawnType = SQ_Group_SpawnType_Ship_2_Destroyer
		elseif randomInt == 3
			RequestedShip_SpawnType = SQ_Group_SpawnType_Ship_3_Cruiser
		endif

		Trace(self, "GetSpaceshipBaseToSpawn() 		setting RequestedShip_SpawnType: " + RequestedShip_SpawnType)
	endif

	;if we have an Occupation, find matching occupationDatum
	OccupationDatum shipOccupation = None
	if Occupation
		int occupationIndex = OccupationData.FindStruct("Occupation", Occupation)
		if occupationIndex > -1
			shipOccupation = OccupationData[occupationIndex]
		endif
	endif

	;return the ship for this group (that will fit on landing marker)
	if RequestedShip_SpawnType == SQ_Group_SpawnType_Ship_3_Cruiser && sizeMax == 3
		if shipOccupation && shipOccupation.ShipToSpawn_Cruiser
			shipbaseToReturn = shipOccupation.ShipToSpawn_Cruiser
		else
			shipbaseToReturn = ShipToSpawn_Cruiser
		endif
	elseif RequestedShip_SpawnType == SQ_Group_SpawnType_Ship_2_Destroyer && sizeMax >= 2
		if shipOccupation && shipOccupation.ShipToSpawn_Destroyer
			shipbaseToReturn = shipOccupation.ShipToSpawn_Destroyer
		else
			shipbaseToReturn = ShipToSpawn_Destroyer
		endif
	else
		if shipOccupation && shipOccupation.ShipToSpawn_Fighter
			shipbaseToReturn = shipOccupation.ShipToSpawn_Fighter
		else
			shipbaseToReturn = ShipToSpawn_Fighter
		endif
	endif

	Trace(self, "GetSpaceshipBaseToSpawn()		shipbaseToReturn: " + shipbaseToReturn)

	return shipbaseToReturn
EndFunction


;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "SQ_Groups",  string SubLogName = "SQ_GroupScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "SQ_Groups",  string SubLogName = "SQ_GroupScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction