Scriptname SQ_ParentScript extends Quest
{holds overall system data/functionality}

struct SurveySite
	ObjectReference siteMarker
	{ map marker (?) that holds survey site information }
EndStruct

struct SurveySiteType
	Activator siteTypeMarker
	GlobalVariable siteTypeCount
EndStruct

group SurveySiteGroup
	SurveySite[] property SurveySites auto
	{ array holds survey sites that the player has discovered but not used }

	Message property SQ_SurveySiteDiscoveredMessage auto const Mandatory

	SurveySiteType[] property surveySiteTypes const auto ; array of survey site type data
EndGroup

struct PlanetTraitData
	Keyword PlanetTrait					; planet trait keyword
	ActorValue PlanetTraitAV 			; used to track discover count per planet (on planet location)
	ObjectReference TraitNameMarker		; used for text replacement (trait name)
	ObjectReference TraitCategoryMarker	; used for text replacement (trait category)
	Perk AssociatedSkill				; if player has this skill, get XP bonus for trait discovery
	Perk AssociatedSkill02				; if player has this skill, get XP bonus for trait discovery
	int discoverCountRequired = 1
endStruct

struct PlanetAbundanceData
	Keyword planetKeyword 
	float surveyDifficulty = 1.0
endStruct

struct PlanetSurveySlateData
	Book planetSurveySlate ; book to give player when planet survey is complete
	int minTraitValue = 0  ; min total "trait value" to get this book - array will be ordered from highest to lowest
	float minSurveyPercent = 0.25 ; when survey % gets at least this much, reward this book
	GlobalVariable RewardXP ; how much XP to award for this slate at 100%
endStruct

struct SystemSurveyData
	int minTraitValue = 0  ; min total "trait value" to get this reward - array will be ordered from highest to lowest
	GlobalVariable RewardXP ; how much XP to award
endStruct

struct ActorValueDatum
	ActorValue ActorValueToDamage
	{An actor value to damage.}
	float DamagePercent = 1.0
	{The percent to damage the value by, 0-1, with 1 being 100% damage.}
EndStruct

struct RandomShipDamageDatum
	ActorValue ActorValueToDamage
	{The ship system actor value to damage.}
	float ChanceDestroyed = 0.5
	{Chance that this ship system is fully destroyed.}
	float MinDamagePercent = 0.0
	{If this system is not destroyed, the minimum amount to damage it by.}
	float MaxDamagePercent = 1.0
	{If this system is not destroyed, the maximum amount to damage it by.}
endStruct

group PlanetTraitGroup
	RefCollectionAlias property SurveySlates auto const mandatory
	{ holds planet survey slates until player sells them }

	PlanetTraitData[] property PlanetTraits const auto ; array of planet trait data

	PlanetAbundanceData[] property PlanetAbundanceKeywords const auto ; array of planet flora/fauna abundance data

	Message property SQ_ParentPlanetTraitScanMessage auto const mandatory
	Message property SQ_ParentPlanetTraitUpdateMessage auto const mandatory
	Message property SQ_ParentPlanetTraitDiscoverMessage auto const mandatory
	Message property SQ_ParentPlanetTraitExploreMessage auto const mandatory

	int property KeywordType_PlanetTrait = 44 auto const hidden
	{ used to get PlanetTrait keyword types using GetKeywordTypeList native function }

	int property KeywordType_PlanetFloraAbundance = 47 auto const hidden
	{ used to get Flora Abundance keyword types using GetKeywordTypeList native function }

	int property KeywordType_PlanetFaunaAbundance = 48 auto const hidden
	{ used to get Flora Abundance keyword types using GetKeywordTypeList native function }

	ReferenceAlias property PlanetTraitCategory auto const mandatory
	{ used for message text replacement}
	ReferenceAlias property PlanetTraitName auto const mandatory
	{ used for message text replacement}

	LocationRefType property PlanetTraitScanTargetLocRef auto const mandatory
	{ used to count planet trait scan targets in a location }

	ReferenceAlias property ScanTarget auto const mandatory
	{ used for stamping scan target with "real name" after scanning }
	
	ReferenceAlias property ScanTargetName auto const mandatory
	{ used for stamping scan target with "real name" after scanning }

	ActorValue property PlanetTraitLocationScanCount auto const mandatory
	{ actor value used to count how many scan targets have been scanned on a location }

	ActorValue property PlanetTraitLocationScanCountRequired auto const mandatory
	{ actor value used to set total number of scan targets in location (default AV used by UI)}

	ActorValue property SQ_PlanetLastSurveyReward auto const mandatory
	{ actor value used to stamp the last survey reward slate % on a planet }

	ActorValue property SurveyingTraitBonus auto const mandatory
	{ used to reduce number of POIs needed to discover a trait }

	ReferenceAlias property SurveySlate auto const mandatory
	{ used for stamping survey slate with the planet name }

	PlanetSurveySlateData[] property PlanetSurveySlates const auto
	{ array of planet survey slate data
	  NOTE: needs to be ordered with highest value slate in 0 position and going down in value from there
	}

	float[] property SurveyRewardThresholds const Auto
	{ if new survey % goes above one of these, time to reward a survey slate }

	SystemSurveyData[] property SystemSurveyRewards const Auto
	{ array of rewards for completing system surveys }

	GlobalVariable property PlanetTraitXPReward auto const mandatory
	GlobalVariable property PlanetTraitXPRewardSkillBonus auto const mandatory
	GlobalVariable property PlanetTraitXPRewardAstrophysicsMult auto const mandatory

	GlobalVariable property Skill_Astrophysics_DiscoverTraitChance auto const mandatory
	{ chance to discover a trait when scanning a planet }

	Keyword property SQ_PlanetTraitOverrideLink auto const mandatory
	{ keyword used to link scan targets to map marker for cases where the location can work for multiple planet traits }

	ConditionForm property SQ_PlanetIsHabitable auto const mandatory
	{ used to determine if a planet is habitable }

	Keyword property SQ_PlanetIsHabitableKeyword auto const mandatory
	{ stamp survey slates with this keyword for habitable planets }

	MissionParentScript Property MB_Parent Auto Const Mandatory
	{ mission parent quest }

	Location[] property SystemsFullySurveyed Auto
	{ array that will be updated to hold system locations that have been completely surveyed - all planets at 100% }

	Keyword property SQ_SurveySlateEvent auto const mandatory
	{ keyword used to start SQ_SurveySlate quests to stamp survey slates with the correct name }
EndGroup

Group TextReplacement
	ReferenceAlias property PlanetReference auto const Mandatory

	Keyword property LocTypeMajorOrbital auto const Mandatory
	Keyword property LocTypeStarSystem auto const Mandatory

	LocationAlias property PlanetReferencePlanetLocation auto const Mandatory
	{ current planet matching PlanetReference }

	LocationAlias property PlanetReferenceSystemLocation auto const Mandatory
	{ current system location matching PlanetReference }

    ReferenceAlias property PlayerShip auto const mandatory
    { player current ship }

	LocationAlias[] property SystemPlanets auto Const
	{ array of location aliases for all planets in current system - many will be empty }
endGroup

Group Skills
	ActorValue property ZoologyNonLethalHarvestCount auto const mandatory
	{ used to track how many times the player has harvested from a creature }

	GlobalVariable property ZoologyNonLethalHarvestCountMax auto const mandatory
	{ current max harvest count }
endGroup

Group Companions
	CompanionAffinityEventsScript Property SQ_Companions Mandatory Const Auto
	{autofill}
EndGroup

Group Quests
	Rad01_LIST_QuestScript Property Rad01_LIST Mandatory Const Auto
	{autofill}
EndGroup

Group DerelictShips
	RandomShipDamageDatum[] property RandomShipDamageData Auto Const Mandatory
	ReferenceAlias property DerelictShipNameAlias Auto Const Mandatory
	Keyword property BEDerelict Auto Const Mandatory
	Message property DerelictShipNameOverrideMessage Auto Const Mandatory
	ActorValue property SpaceshipCrew Auto Const Mandatory
	ActorValue property SpaceshipExternalLightsDisabledValue Auto Const Mandatory
EndGroup

struct OutpostAttackSpecialCase
    ConditionForm specialCaseCondition  ; if this condition passes, add specialCaseAttackChance to attack chance
    float specialCaseAttackChance
	Keyword storyEventKeyword ; optional - if not included will use normal keyword
endStruct

group outpostAttacks
    ActorValue property OutpostLastAttackTimestamp auto const mandatory
    { used to timestamp last outpost attack }

    ActorValue property OutpostLastAttackRollTimestamp auto const mandatory
    { used to timestamp last outpost attack roll }

    ActorValue property OutpostCargoLinkAV auto const mandatory
    { used to weight attacks based on cargo links at the outpost }

    Keyword property SQ_OutpostEventAttack auto const mandatory
    { used to trigger outpost attacks by NPCs }

    Keyword property SQ_OutpostEventAttackCreatures auto const mandatory
    { used to trigger outpost attacks by creatures }

	OutpostAttackSpecialCase[] property OutpostAttackSpecialCases auto Const
	{ used to increase attack chance for special cases }
endGroup

struct mapMarkerName
	Keyword groupTypeKeyword
	Form nameMarker
EndStruct

group OE_CivilianData
	mapMarkerName[] property MapMarkerNames auto const
	{ array to use to rename map marker based on keyword on location }

	Keyword property MapMarkerLinkedRefNameOverride auto const mandatory
	{ use to link to override name }

	FormList Property OE_CiviliansVisibleFromStarmapKeywords Mandatory Const Auto
	{ locations with one of these keywords are visible on starmap }
endGroup

struct TutorialMessage
	int tutorialID 			; used to trigger this message
	Message tutorialMessage		; the message to display
endStruct


group Tutorials 
	TutorialMessage[] property TutorialMessages auto
	{ array of tutorial messages. Array entries are removed after the message has been triggered. }
endGroup

group Achievements
	int property ComputersAchievementID = 35 auto const

	ActorValue property ComputersAchievementAV auto const mandatory
	{ AV on player to track number of terminals accessed }

	GlobalVariable property ComputersAchievementCount auto const mandatory
	{ how many computers accessed required for achievement? }

	bool property ComputersAchievementAwarded = false auto hidden
	{ set to true when player gets this achievement }
endGroup

DefaultTutorialQuestScript tutorialQuest

Event OnQuestInit()
	SurveySites = new SurveySite[0]
	tutorialQuest = ((self as Quest) as DefaultTutorialQuestScript)
	Actor playerRef = Game.GetPlayer()
	RegisterForRemoteEvent(playerRef, "OnPlayerPlanetSurveyComplete")
	RegisterForRemoteEvent(playerRef, "OnPlayerScannedObject")
	SystemsFullySurveyed = new Location[0]
EndEvent

Event Actor.OnPlayerPlanetSurveyComplete(Actor akSource, Planet akPlanet)
	debug.trace(self + "OnPlayerPlanetSurveyComplete " + akPlanet)
	CheckCompletePlanetSurvey(akPlanet)
EndEvent

Event Actor.OnPlayerScannedObject(Actor akSource, ObjectReference akScannedRef)
	debug.trace(self + "OnPlayerScannedObject " + akScannedRef)
	CheckCompletePlanetSurvey(akScannedRef.GetCurrentPlanet())
EndEvent

Event ObjectReference.OnSell(ObjectReference akSource, Actor akSeller)
	; if this ref is in SurveySlates, remove it
	int index = SurveySlates.Find(akSource)
	if index > -1
		UnregisterForRemoteEvent(akSource, "OnSell")
		SurveySlates.RemoveRef(akSource)
	endif
EndEvent

;******************* CUSTOM EVENTS ***************************
CustomEvent SQ_SurveySiteDiscovered

CustomEvent SQ_PlanetTraitDiscovered ; sent when the player discovers a planet trait

CustomEvent SQ_PlanetTraitUpdated	; sent when the player fully explores a planet trait overlay (updating planet trait discovery progress)

CustomEvent SQ_BEStarted

CustomEvent SQ_BEForceStop ; DEBUG: Force-stop all active BE Quests.

CustomEvent SQ_NativeTerminalActor_Unconscious

CustomEvent SQ_NativeTerminalActor_Ally

CustomEvent SQ_NativeTerminalActor_Frenzy

CustomEvent SQ_AlarmTriggeredOn

CustomEvent SQ_AlarmTriggeredOff

CustomEvent SQ_PiracyEvent		; sent when the player attempts to commit piracy

CustomEvent SQ_ContrabandConfiscated		; sent when the player pays fine or goes to jail and contraband is confiscated

function SendPlanetTraitDiscoveredEvent(Planet traitPlanet, Keyword planetTrait, int discoverCountCurrent, int discoverCountRequired)
	; Send the planet trait event
	Var[] kargs = new Var[4]
	kargs[0] = traitPlanet
	kargs[1] = planetTrait
	kargs[2] = discoverCountCurrent
	kargs[3] = discoverCountRequired
	SendCustomEvent("SQ_PlanetTraitDiscovered", kargs)
endFunction

function SendPlanetTraitUpdatedEvent(Planet traitPlanet, Keyword planetTrait, int discoverCountCurrent, int discoverCountRequired)
	; Send the planet trait updated event - this is NOT sent when the planet trait is discovered
	Var[] kargs = new Var[4]
	kargs[0] = traitPlanet
	kargs[1] = planetTrait
	kargs[2] = discoverCountCurrent
	kargs[3] = discoverCountRequired
	SendCustomEvent("SQ_PlanetTraitUpdated", kargs)
endFunction

function SendBEStartedEvent(ObjectReference enemyShip, BEScript BEQuest)
	Var[] kargs = new Var[2]
	kargs[0] = enemyShip
	kargs[1] = BEQuest
	debug.trace(self + " SendBEStartedEvent kargs=" + kargs)
	SendCustomEvent("SQ_BEStarted", kargs)
EndFunction

function SendBEForceStopEvent()
	SendCustomEvent("SQ_BEForceStop")
EndFunction

function SendNativeTerminalActorUnconsciousEvent(ObjectReference terminalRef, Actor actorRef, bool bSetUnconscious)
	; Send the native terminal actor unconscious event
	Var[] kargs = new Var[3]
	kargs[0] = terminalRef
	kargs[1] = actorRef
	kargs[2] = bSetUnconscious
	SendCustomEvent("SQ_NativeTerminalActor_Unconscious", kargs)
endFunction

function SendNativeTerminalActorAllyEvent(ObjectReference terminalRef, Actor actorRef)
	; Send the native terminal actor Ally event
	Var[] kargs = new Var[2]
	kargs[0] = terminalRef
	kargs[1] = actorRef
	SendCustomEvent("SQ_NativeTerminalActor_Ally", kargs)
endFunction

function SendNativeTerminalActorFrenzyEvent(ObjectReference terminalRef, Actor actorRef)
	; Send the native terminal actor Frenzy event
	Var[] kargs = new Var[2]
	kargs[0] = terminalRef
	kargs[1] = actorRef
	SendCustomEvent("SQ_NativeTerminalActor_Frenzy", kargs)
endFunction


function SendAlarmTriggeredOnEvent(ObjectReference alarmRef, Actor alarmActor, SQ_AlarmScript SQ_AlarmQuest)
	debug.trace(self + "SendAlarmTriggeredOnEvent alarmRef=" + alarmRef + " alarmActor=" + alarmActor + " SQ_AlarmQuest=" + SQ_AlarmQuest)
	if alarmRef && SQ_AlarmQuest
		Var[] kargs = new Var[4]
		kargs[0] = alarmRef.GetCurrentLocation()
		kargs[1] = SQ_AlarmQuest
		kargs[2] = alarmRef
		kargs[3] = alarmActor
		SendCustomEvent("SQ_AlarmTriggeredOn", kargs)
	Else
		debug.trace(self + " SendAlarmTriggeredOnEvent NOT SENT: bad parameters: alarmRef=" + alarmRef + " SQ_AlarmQuest=" + SQ_AlarmQuest)
	EndIf
EndFunction

function SendAlarmTriggeredOffEvent(ObjectReference alarmRef, SQ_AlarmScript SQ_AlarmQuest)
	debug.trace(self + "SendAlarmTriggeredOnEvent alarmRef=" + alarmRef + " SQ_AlarmQuest=" + SQ_AlarmQuest)
	if alarmRef && SQ_AlarmQuest
		Var[] kargs = new Var[3]
		kargs[0] = alarmRef.GetCurrentLocation()
		kargs[1] = SQ_AlarmQuest
		kargs[2] = alarmRef
		SendCustomEvent("SQ_AlarmTriggeredOff", kargs)
	Else
		debug.trace(self + " SendAlarmTriggeredOffEvent NOT SENT: bad parameters: alarmRef=" + alarmRef + " SQ_AlarmQuest=" + SQ_AlarmQuest)
	EndIf
EndFunction

function SendPiracyEvent(ObjectReference piratedShip, bool piracySuccess)
	Var[] kargs = new Var[2]
	kargs[0] = piratedShip
	kargs[1] = piracySuccess
	debug.trace(self + " SendPiracyEvent kargs=" + kargs)
	SendCustomEvent("SQ_PiracyEvent", kargs)
EndFunction

function SendContrabandConfiscatedEvent(Faction crimeFaction)
	debug.trace(self + " SQ_ContrabandConfiscated")
	SendCustomEvent("SQ_ContrabandConfiscated")
EndFunction

; **************** CUSTOM EVENTS END ************************************
; update text replacement aliases from a Planet
; will NOT update PlanetReference
function UpdateTextReplacementAliasesPlanet(Planet planetToUse)
	Location planetLocation = planetToUse.GetLocation()
	Location systemLocation = planetLocation.GetParentLocations(LocTypeStarSystem)[0]

   	PlanetReferencePlanetLocation.ForceLocationTo(planetLocation)
   	PlanetReferenceSystemLocation.ForceLocationTo(systemLocation)
   	Debug.trace(self + " UpdateTextReplacementAliasesPlanet: planetLocation=" + planetLocation + " systemLocation=" + systemLocation)
EndFunction

function UpdateTextReplacementAliases(ObjectReference siteMarkerRef)
   	PlanetReference.ForceRefTo(siteMarkerRef)
	Location siteMarkerLocation = siteMarkerRef.GetCurrentLocation()
	Location sitePlanetLocation = siteMarkerLocation.GetParentLocations(LocTypeMajorOrbital)[0]
	Location siteSystemLocation = siteMarkerLocation.GetParentLocations(LocTypeStarSystem)[0]

   	PlanetReferencePlanetLocation.ForceLocationTo(sitePlanetLocation)
   	PlanetReferenceSystemLocation.ForceLocationTo(siteSystemLocation)
   	Debug.trace(self + " UpdateTextReplacementAliases: siteMarkerRef=" + siteMarkerRef + ", planetLocation=" + sitePlanetLocation + " systemLocation=" + siteSystemLocation)
endFunction

PlanetTraitData function GetPlanetTraitData(ObjectReference refToCheck)
	debug.trace(self + " GetPlanetTraitData refToCheck=" + refToCheck)

	; rename ref with "real name"
	PlanetTraitScanTargetScript scanTargetRef = refToCheck as PlanetTraitScanTargetScript

	; get planet trait data
	PlanetTraitData theData
	Planet planetToCheck = refToCheck.GetCurrentPlanet()
	Location locationToCheck = refToCheck.GetCurrentLocation()

	; do we get the keyword from the location or somewhere else?
	MapMarkerPlanetTraitScript mapMarkerRef
	; if I'm a scan target, I might be linked to a map marker with an override trait keyword
	if scanTargetRef && scanTargetRef.GetLinkedRef(SQ_PlanetTraitOverrideLink) is MapMarkerPlanetTraitScript
		mapMarkerRef = scanTargetRef.GetLinkedRef(SQ_PlanetTraitOverrideLink) as MapMarkerPlanetTraitScript
	Else
		mapMarkerRef = refToCheck as MapMarkerPlanetTraitScript
	EndIf

	if mapMarkerRef && mapMarkerRef.LocationTraitOverride
		; use the trait override
		theData = FindMatchingPlanetTraitForKeyword(mapMarkerRef.LocationTraitOverride, planetToCheck)
	else 
		; use the location
		theData = FindMatchingPlanetTrait(locationToCheck, planetToCheck)
	EndIf
	return theData
EndFunction

; get planet trait keywords from locationToCheck that match planetToCheck
Guard discoverMatchingTraitsBusy ProtectsFunctionLogic
function DiscoverMatchingPlanetTraits(ObjectReference refToCheck, bool incrementScanCount = true)
	debug.trace(self + " DiscoverMatchingPlanetTraits refToCheck=" + refToCheck)
	LockGuard discoverMatchingTraitsBusy

	; get planet trait data
	PlanetTraitData theData = GetPlanetTraitData(refToCheck)

	; rename ref with "real name"
	PlanetTraitScanTargetScript scanTargetRef = refToCheck as PlanetTraitScanTargetScript
	if scanTargetRef
		ScanTargetName.ForceRefTo(scanTargetRef.PlanetTraitScanTargetRef)
		ScanTarget.ForceRefTo(scanTargetRef)
	endif

	Location locationToCheck = refToCheck.GetCurrentLocation()

	if theData
		debug.trace(self + " found matching trait " + theData)

		; increment scan count on trait location
		int scanCountNeeded = locationToCheck.GetRefTypeAliveCount(PlanetTraitScanTargetLocRef)
		int scanCount = (locationToCheck.GetValue(PlanetTraitLocationScanCount) as int)
		if incrementScanCount
			scanCount += 1
		endif
		debug.trace(self + "   scanCountNeeded=" + scanCountNeeded + ", scanCount=" + scanCount)
		locationToCheck.SetValue(PlanetTraitLocationScanCount, scanCount)

		; if scan count >= needed count, this location is "done"
		if scanCount >= scanCountNeeded
			if locationToCheck.IsExplored() == false
				; count this location as explored
				locationToCheck.SetExplored()

				UpdatePlanetTraitDiscoveryPrivate(refToCheck, theData, 1)
			EndIf
		Else
			UpdateTextReplacementAliases(refTocheck)
			PlanetTraitCategory.ForceRefTo(theData.TraitCategoryMarker)
			PlanetTraitName.ForceRefTo(theData.TraitNameMarker)

			if incrementScanCount
				; show scan message
				;SQ_ParentPlanetTraitScanMessage.Show(scanCount, scanCountNeeded)
			Elseif locationToCheck.IsExplored() == false
				; show explore message
				SQ_ParentPlanetTraitExploreMessage.Show(scanCount, scanCountNeeded)
			endif
		endif
	endif
	EndLockGuard
endFunction

; discover the specified trait on refToCheck's planet
Function UpdatePlanetTraitDiscovery(ObjectReference refToCheck, PlanetTraitData theData, int incrementAmount)
	debug.trace(self + " UpdatePlanetTraitDiscovery refToCheck=" + refToCheck)
	LockGuard discoverMatchingTraitsBusy
		UpdatePlanetTraitDiscoveryPrivate(refToCheck, theData, incrementAmount)
	endLockGuard
EndFunction

Function UpdatePlanetTraitDiscoveryPrivate(ObjectReference refToCheck, PlanetTraitData theData, int incrementAmount) RequiresGuard(discoverMatchingTraitsBusy)
	if theData && refToCheck
		debug.trace(self + " trait data=" + theData)
		Planet planetToCheck = refToCheck.GetCurrentPlanet()		
		; get planet location
		UpdateTextReplacementAliases(refTocheck)
		Location planetLocation = PlanetReferencePlanetLocation.GetLocation()

		PlanetTraitCategory.ForceRefTo(theData.TraitCategoryMarker)
		PlanetTraitName.ForceRefTo(theData.TraitNameMarker)

		; if trait is already discovered, just give message
		if planetToCheck.IsTraitKnown(theData.PlanetTrait)
			; show discover message
			;SQ_ParentPlanetTraitDiscoverMessage.Show(planetToCheck.GetSurveyPercent()*100)
		else
			; increment actor value on planet location
			int traitValue = (planetLocation.GetValue(theData.PlanetTraitAV) as int) + incrementAmount
			debug.trace(self + "   found matching traitAV " + traitValue)

			planetLocation.SetValue(theData.PlanetTraitAV, traitValue)

			; surveying bonus
			int surveyingBonus = Game.GetPlayer().GetValueInt(SurveyingTraitBonus)
			; reduce required count by bonus, but never below 1
;			int discoverCountRequiredActual = Math.Max(1, theData.discoverCountRequired - surveyingBonus) as int

			int discoverCountRequiredActual = 1 ; all traits now require only 1 discovered location

			debug.trace(self + "   discoverCountRequired=" + theData.discoverCountRequired + " surveyingBonus=" + surveyingBonus + "; traitValue=" + traitValue)

			if traitValue >= discoverCountRequiredActual
				debug.trace(self + "   discovered trait " + theData.PlanetTrait)
				DiscoverPlanetTrait(planetToCheck, theData, traitValue)
			Else
				debug.trace(self + "   incremented trait " + theData.PlanetTrait)
				; show update message
				SQ_ParentPlanetTraitUpdateMessage.Show(traitValue, discoverCountRequiredActual)
				; send custom event
				SendPlanetTraitUpdatedEvent(planetToCheck, theData.PlanetTrait, traitValue, theData.discoverCountRequired)
			endif
		endif
		debug.trace(self + "    planet trait known: " + planetToCheck.IsTraitKnown(theData.PlanetTrait))
	endif
EndFunction

Function DiscoverPlanetTrait(Planet planetToCheck, PlanetTraitData theData, int traitValue = 99, float xpMult = 1.0) RequiresGuard(discoverMatchingTraitsBusy)
	debug.trace(self + " DiscoverPlanetTrait planetToCheck=" + planetToCheck + " trait=" + theData.PlanetTrait)
	; make sure these are filled in for message
	PlanetTraitCategory.ForceRefTo(theData.TraitCategoryMarker)
	PlanetTraitName.ForceRefTo(theData.TraitNameMarker)

	; planet trait is discovered
	planetToCheck.SetTraitKnown(theData.PlanetTrait)
	; show discover message
	;SQ_ParentPlanetTraitDiscoverMessage.Show(planetToCheck.GetSurveyPercent()*100)
	; reward XP
	int xpReward = (PlanetTraitXPReward.GetValueInt() * xpMult ) as int
	; does player get XP bonus?
	Actor playerRef = Game.GetPlayer()
	if (theData.AssociatedSkill && playerRef.HasPerk(theData.AssociatedSkill) ) || (theData.AssociatedSkill02 && playerRef.HasPerk(theData.AssociatedSkill) )
		xpReward += PlanetTraitXPRewardSkillBonus.GetValueInt()
	endif
	;Game.RewardPlayerXP(xpReward * theData.discoverCountRequired)  ; all traits now require only 1 discovery location
	Game.RewardPlayerXP(xpReward)

	; send custom event
	SendPlanetTraitDiscoveredEvent(planetToCheck, theData.PlanetTrait, traitValue, theData.discoverCountRequired)
EndFunction

Function CheckForScanTargetUpdate(ObjectReference refToCheck)
	Location locationToCheck = refToCheck.GetCurrentLocation()
	Planet planetToCheck = refToCheck.GetCurrentPlanet()
	PlanetTraitData theData = FindMatchingPlanetTrait(locationToCheck, planetToCheck)
	if theData
		; is this trait already known?
		if planetToCheck.IsTraitKnown(theData.PlanetTrait)
			; update name and mark the scan target as already scanned
			UpdateScanTarget(refToCheck)
			; mark location as explored so its name gets updated
			locationToCheck.SetExplored()
		endif
	endif
EndFunction

function UpdateScanTarget(ObjectReference refToCheck)
	; rename ref with "real name"
	PlanetTraitScanTargetScript scanTargetRef = refToCheck as PlanetTraitScanTargetScript
	if scanTargetRef
		ScanTargetName.ForceRefTo(scanTargetRef.PlanetTraitScanTargetRef)
		ScanTarget.ForceRefTo(scanTargetRef)
		scanTargetRef.SetScanned()
	endif
EndFunction

PlanetTraitData Function FindMatchingPlanetTrait(Location locationToCheck, Planet planetToCheck)
	Keyword[] matchingKeywords = planetToCheck.GetKeywordTypeList(KeywordType_PlanetTrait)
	debug.trace(self + " FindMatchingPlanetTrait: " + locationToCheck + " " + planetToCheck + " " + matchingKeywords)

	PlanetTraitData theData = NONE
	; run through planet traits and check one that matches this location
	int i = 0
	while i < matchingKeywords.Length && theData == NONE
		Keyword planetTraitKeyword = matchingKeywords[i]
		debug.trace(self + "   checking keyword " + planetTraitKeyword)
		if locationToCheck.HasKeyword(planetTraitKeyword)
			debug.trace(self + "   location has this keyword - find in planet trait array")
			; find this keyword in planet trait array
			int planetTraitIndex = PlanetTraits.FindStruct("PlanetTrait", planetTraitKeyword)
			if planetTraitIndex > -1
				theData = PlanetTraits[planetTraitIndex]
			Else
				debug.trace(self + " WARNING: planet trait " + planetTraitKeyword + " NOT FOUND")
			endif
		endif
		i += 1
	endWhile

	return theData
EndFunction

PlanetTraitData Function FindMatchingPlanetTraitForKeyword(Keyword keywordToCheck, Planet planetToCheck)
	Keyword[] matchingKeywords = planetToCheck.GetKeywordTypeList(KeywordType_PlanetTrait)
	debug.trace(self + " FindMatchingPlanetTraitForKeyword: " + keywordToCheck + " " + planetToCheck + " " + matchingKeywords)

	PlanetTraitData theData = NONE
	; run through planet traits and check one that matches this keyword
	int i = 0
	while i < matchingKeywords.Length && theData == NONE
		Keyword planetTraitKeyword = matchingKeywords[i]
		debug.trace(self + "   checking keyword " + planetTraitKeyword)
		if keywordToCheck == planetTraitKeyword
			debug.trace(self + "   planet has this keyword - find in planet trait array")
			; find this keyword in planet trait array
			int planetTraitIndex = PlanetTraits.FindStruct("PlanetTrait", planetTraitKeyword)
			if planetTraitIndex > -1
				theData = PlanetTraits[planetTraitIndex]
			Else
				debug.trace(self + " WARNING: planet trait " + planetTraitKeyword + " NOT FOUND")
			endif
		endif
		i += 1
	endWhile
	debug.trace(self + " FindMatchingPlanetTraitForKeyword: theData=" + theData)
	return theData
EndFunction

Function OnPlayerScanPlanet(Planet planetToCheck)
	; if player has Astrophysics, may uncover traits when scanning a planet
	int discoverTraitChance = Skill_Astrophysics_DiscoverTraitChance.GetValueInt()
	debug.trace(self + " OnPlayerScanPlanet: " + " " + planetToCheck + " discoverTraitChance=" + discoverTraitChance)

	if discoverTraitChance > 0
		Keyword[] matchingKeywords = planetToCheck.GetKeywordTypeList(KeywordType_PlanetTrait)
		debug.trace(self + "   matchingKeywords=" + matchingKeywords)
		if matchingKeywords.Length > 0
			; roll for discovery
			int discoveryRoll = Utility.RandomInt()
			debug.trace(self + " Planet trait discover: chance=" + discoverTraitChance + ", roll=" + discoveryRoll)
			if discoveryRoll <= discoverTraitChance
				; find a trait that isn't known, if possible
				int i = matchingKeywords.Length - 1
				while i > -1 
					if planetToCheck.IsTraitKnown(matchingKeywords[i])
						matchingKeywords.Remove(i)
					endif
					i += -1
				EndWhile
				if matchingKeywords.Length > 0
					int randomKeyword = Utility.RandomInt(0, matchingKeywords.Length-1)
					Keyword traitToDiscover = matchingKeywords[randomKeyword]
					debug.trace(self + " discover trait " + traitToDiscover)
		            PlanetTraitData theData = FindMatchingPlanetTraitForKeyword(traitToDiscover, planetToCheck)
					LockGuard discoverMatchingTraitsBusy
						DiscoverPlanetTrait(planetToCheck, theData, xpMult = PlanetTraitXPRewardAstrophysicsMult.GetValue())
					endLockGuard
				Else
					debug.trace(self + " no traits on this planet")
				endif
			endif
		endif
	endif

	; now check for completing planet survey
	CheckCompletePlanetSurvey(planetToCheck)
endFunction

; reward slate when planet survey reaches a completion threshold
Guard planetSurveyLock ProtectsFunctionLogic

Function CheckCompletePlanetSurvey(Planet planetToCheck, bool bForceCompletion = false)
	debug.trace(self + " CheckCompletePlanetSurvey: " + planetToCheck + " bForceCompletion=" + bForceCompletion)

	LockGuard planetSurveyLock
	debug.trace(self + "   planetSurveyLock locked")

	; first, is this even a planet?
	if planetToCheck.HasKeyword(LocTypeMajorOrbital)
		Location planetLocation = planetToCheck.GetLocation()
		
		; what was last survey reward slate given to the player?
		float lastSurveyReward = planetLocation.GetValue(SQ_PlanetLastSurveyReward)
		float currentSurvey = planetToCheck.GetSurveyPercent()
		debug.trace(self + " currentSurvey=" + currentSurvey + " lastSurveyReward=" + lastSurveyReward)

		if currentSurvey > lastSurveyReward
			; survey % has increased, has it hit one of the thresholds?
			float actualRewardThreshold = 0.0  ; actual reward threshold
			float currentRewardThreshold = 0.0 ; what we'll use to determine which slate to give (may be less than actual threshold if player has sold a previous slate)

			int i = 0
			; SurveyRewardThresholds is ordered from highest to lowest, so as soon as we find one, we're done
			while i < SurveyRewardThresholds.Length && actualRewardThreshold == 0
				if currentSurvey >= SurveyRewardThresholds[i]
					actualRewardThreshold = SurveyRewardThresholds[i]
				endif
				i += 1
			endWhile
			currentRewardThreshold = actualRewardThreshold
			if bForceCompletion
				currentRewardThreshold = 1.0
			EndIf
			debug.trace(self + " currentRewardThreshold=" + currentRewardThreshold)

			if currentRewardThreshold > lastSurveyReward
				debug.trace(self + " currentRewardThreshold is greater than " + lastSurveyReward + " - reward new slate")
				; we've crossed a new threshold
				; stamp the planet
				planetLocation.SetValue(SQ_PlanetLastSurveyReward, currentRewardThreshold)

				; reward a survey slate - either replace existing one with higher value, or new low value one if player has sold the previous one
				SQ_PlanetSurveySlateScript slateToReplace = NONE

				if lastSurveyReward > 0.0
					; try to find existing slate in ref collection
					SQ_PlanetSurveySlateScript[] surveySlateArray = SurveySlates.GetArray() as SQ_PlanetSurveySlateScript[]
					i = 0
					while i < surveySlateArray.Length && slateToReplace == NONE
						SQ_PlanetSurveySlateScript theSlate = surveySlateArray[i]
						if theSlate.myPlanet == planetToCheck
							slateToReplace = theSlate
							UnregisterForRemoteEvent(slateToReplace, "OnSell")
						endif
						i += 1
					endWhile

					if slateToReplace == NONE
						; means player sold the slate - give reward based on the difference between slate % rather than full survey %
						debug.trace(self + " found no existing slate - reducing reward % by " + lastSurveyReward)
						currentRewardThreshold = currentRewardThreshold - lastSurveyReward
					endif
				EndIf

				debug.trace(self + " currentRewardThreshold=" + currentRewardThreshold)

				; now find new slate to give to player, based on currentRewardThreshold
				int totalTraitValue = GetPlanetTraitValue(planetToCheck) + ( GetPlanetAbundanceValue(planetToCheck) as int)

				; award data slate
				debug.trace(self + "   Awarding survey slate for survey%=" + currentRewardThreshold + ", totalTraitValue=" + totalTraitValue)
				Actor player = Game.GetPlayer()
				SpaceshipReference playerShipRef = PlayerShip.GetShipRef()
				if playerShipRef == NONE
					; this will only happen during testing
					debug.trace(self + "    No player ship - don't award slate.")
				elseif MB_Parent.IsPlanetSurveyTarget(playerShipRef)
					; don't award slate if it is target of survey mission - that gives its own reward
					debug.trace(self + "    This planet is a current survey mission target - don't award slate.")
				else
					; find first matching slate (array is ordered from highest value to lowest)
					Book planetSurveySlate = NONE
					GlobalVariable rewardXP = NONE ; XP to reward if 100% survey
					PlanetSurveySlateData theData = GetSurveySlateData(totalTraitValue, currentRewardThreshold)
					if theData
						planetSurveySlate = theData.planetSurveySlate
						rewardXP = theData.RewardXP
					endif
					debug.trace(self + "   Awarding survey slate " + planetSurveySlate)
					; try putting player ship in PlanetReference alias - should always be "at" the planet (on or in orbit)
					UpdateTextReplacementAliasesPlanet(planetToCheck)
					Keyword[] keywords = new Keyword[0]
					if SQ_PlanetIsHabitable.IsTrue(playerShipRef)
						debug.trace(self + "   adding keyword " + SQ_PlanetIsHabitableKeyword + " to slate")
						keywords.Add(SQ_PlanetIsHabitableKeyword)

						;tell Rad01_LIST quest survey of habitable planet is complete
						Rad01_LIST.SurveyCompleted()
					endif
					; if existing slate, remove it
					ObjectReference currentSlateContainer = player
					if slateToReplace
						currentSlateContainer = slateToReplace.GetContainer()
					endif
					
					SQ_PlanetSurveySlateScript newSlate
					bool addNewItem = false

					if currentSlateContainer
						; placing new slate into a container
						addNewItem = true
						if slateToReplace
							SurveySlates.RemoveRef(slateToReplace)
							currentSlateContainer.RemoveItem(slateToReplace, abSilent = true)
							addNewItem = false
						endif
						newSlate = currentSlateContainer.AddAliasedItemWithKeywordsSingle(planetSurveySlate, SurveySlate, true, keywords) as SQ_PlanetSurveySlateScript
					else
						; placing new slate at existing slate
						newSlate = slateToReplace.PlaceAtMe(planetSurveySlate, abInitiallyDisabled=true, akAliasToFill=SurveySlate) as SQ_PlanetSurveySlateScript
						; add keywords
						if keywords != NONE && keywords.Length > 0
							i = 0
							while i < keywords.Length
								newSlate.AddKeyword(keywords[i])
								i += 1
							endWhile
						endif
						SurveySlates.RemoveRef(slateToReplace)
						; disable old slate
						slateToReplace.DisableNoWait()
						newSlate.EnableNoWait()
					EndIf
					SurveySlates.AddRef(newSlate)
					; stamp planet name on this slate
					int rewardThresholdPercent = (actualRewardThreshold*100) as int
					int addNewItemInt = 0
					if addNewItem
						addNewItemInt = 1
					endif
					Quest[] surveySlateQuests = SQ_SurveySlateEvent.SendStoryEventAndWait(aiValue1=addNewItemInt, aiValue2=rewardThresholdPercent)
					if surveySlateQuests == NONE
						debug.trace(self + " WARNING: no survey slate quest able to start - slate won't be stamped with planet name", aiSeverity = 1)
					endif
					; stamp new slate with this planet
					newSlate.myPlanet = planetToCheck
					RegisterForRemoteEvent(newSlate, "OnSell")
					; if planet survey is 100%, reward XP
					if currentSurvey >= 1.0
						if rewardXP
							Game.RewardPlayerXP(rewardXP.GetValueInt())
						endif
						; is entire system surveyed?
						CheckCompleteSystemSurvey(planetToCheck)
					endif
				endif
			endif
		endif
	else
		debug.trace(self + " " + planetToCheck + " isn't a planet, ignoring")
	endif

	EndLockGuard
	debug.trace(self + " CheckCompletePlanetSurvey DONE - lock released")
endFunction

PlanetSurveySlateData function GetSurveySlateData(int planetRewardValue, float currentRewardThreshold = 1.0)
	PlanetSurveySlateData rewardSlateData

	; find first matching slate (array is ordered from highest value to lowest)
	int s = 0
	while s < PlanetSurveySlates.Length && rewardSlateData == NONE
		PlanetSurveySlateData theData = PlanetSurveySlates[s]
		if theData.minTraitValue <= planetRewardValue && currentRewardThreshold >= theData.minSurveyPercent
			rewardSlateData = theData
		endif
		s += 1
	endWhile
	debug.trace(self + " GetSurveySlateData " + rewardSlateData)
	return rewardSlateData
EndFunction

function CheckCompleteSystemSurvey(Planet planetToCheck) RequiresGuard(planetSurveyLock)
	Location currentSystem = PlanetReferenceSystemLocation.GetLocation()
	debug.trace(self + " CheckCompleteSystemSurvey currentSystem=" + currentSystem)
	if currentSystem
		int i = 0
		bool foundMatch = false
		while i < SystemsFullySurveyed.Length && foundMatch == false
			Location theSystem = SystemsFullySurveyed[i]
			foundMatch = (theSystem == currentSystem)
			i += 1
		endWhile
		if foundMatch == false
			; not fully surveyed system - fill in planet aliases
			; run through planets until we get one that isn't 100% surveyed
			i = 0
			float surveyPercentage = 1.0
			int systemTraitValue = 0
			while i < SystemPlanets.Length && surveyPercentage >= 1.0
				LocationAlias planetAlias = SystemPlanets[i]
				planetAlias.RefillAlias()
				Location planetLocation = planetAlias.GetLocation()
				if planetLocation
					Planet thePlanet = planetLocation.GetCurrentPlanet()
					surveyPercentage = thePlanet.GetSurveyPercent()
					debug.trace(self + "   checking planet " + i + ": planetLocation=" + planetLocation + " has survey%=" + surveyPercentage)
					if surveyPercentage >= 1.0
						; add planet trait value to total
						systemTraitValue += GetPlanetTraitValue(thePlanet)
					endif
				endif
				i += 1
			endWhile
			debug.trace(self + " systemTraitValue=" + systemTraitValue)

			; all planets at 100%
			if surveyPercentage >= 1.0
				debug.trace(" All planets at 100% - find reward XP")
				; award XP based on systemTraitValue
				i = 0
				GlobalVariable rewardXP = NONE
				while i < SystemSurveyRewards.Length && rewardXP == NONE
					SystemSurveyData theRewardData = SystemSurveyRewards[i]
					if systemTraitValue >= theRewardData.minTraitValue
						rewardXP = theRewardData.RewardXP
					endif
					i += 1
				endWhile
				debug.trace(self + " rewardXP=" + rewardXP)
				if rewardXP
					Game.RewardPlayerXP(rewardXP.GetValueInt())
				endif
				SystemsFullySurveyed.Add(currentSystem)
			endif
		endif
	endif
EndFunction

int function GetPlanetTraitValue(Planet planetToCheck)
	Keyword[] matchingKeywords = planetToCheck.GetKeywordTypeList(KeywordType_PlanetTrait)
	int i = 0
	int totalTraitValue = 0 ; count trait value for this planet
	while i < matchingKeywords.Length
		Keyword planetTraitKeyword = matchingKeywords[i]
		bool allTraitsKnown = planetToCheck.IsTraitKnown(planetTraitKeyword)
		; find this keyword in planet trait array
		int planetTraitIndex = PlanetTraits.FindStruct("PlanetTrait", planetTraitKeyword)
		if planetTraitIndex > -1
			PlanetTraitData theData = PlanetTraits[planetTraitIndex]
			;totalTraitValue += theData.discoverCountRequired
			totalTraitValue += 1
		endif
		debug.trace(self + "   keyword " + planetTraitKeyword + " known? " + allTraitsKnown)
		i += 1
	endWhile

	return totalTraitValue
endFunction

float function GetPlanetAbundanceValue(Planet planetToCheck)
	Keyword[] matchingKeywords = planetToCheck.GetKeywordTypeList(KeywordType_PlanetFloraAbundance)
	int i = 0
	float totalSurveyValue = 0.0 ; count survey value for this planet from flora/fauna
	while i < matchingKeywords.Length
		Keyword planetKeyword = matchingKeywords[i]
		; find this keyword in planet trait array
		int planetTraitIndex = PlanetAbundanceKeywords.FindStruct("PlanetKeyword", planetKeyword)
		if planetTraitIndex > -1
			PlanetAbundanceData theData = PlanetAbundanceKeywords[planetTraitIndex]
			totalSurveyValue += theData.surveyDifficulty
			debug.trace(self + "   keyword " + planetKeyword + " surveyDifficulty= " + theData.surveyDifficulty)
		endif
		i += 1
	endWhile

	matchingKeywords = planetToCheck.GetKeywordTypeList(KeywordType_PlanetFaunaAbundance)
	i = 0
	while i < matchingKeywords.Length
		Keyword planetKeyword = matchingKeywords[i]
		; find this keyword in planet trait array
		int planetTraitIndex = PlanetAbundanceKeywords.FindStruct("PlanetKeyword", planetKeyword)
		if planetTraitIndex > -1
			PlanetAbundanceData theData = PlanetAbundanceKeywords[planetTraitIndex]
			totalSurveyValue += theData.surveyDifficulty
			debug.trace(self + "   keyword " + planetKeyword + " surveyDifficulty= " + theData.surveyDifficulty)
		endif
		i += 1
	endWhile

	debug.trace(self + " GetPlanetAbundanceValue for " + planetToCheck + ": " + totalSurveyValue)
	return totalSurveyValue
endFunction

;************** OE_Civilian map marker renaming ****************

function CheckForRenameMapMarker(ObjectReference mapMarkerRef)
    Location myLocation = mapMarkerRef.GetCurrentLocation()
    if myLocation && VisibleOnStarmap(myLocation)
        ; placed by Scan request - rename
        int i = 0
        bool found = false
        while found == false && i < MapMarkerNames.Length
            mapMarkerName theMarkerNameData = MapMarkerNames[i]
            found = myLocation.HasKeyword(theMarkerNameData.groupTypeKeyword)
            if found
                debug.trace(self + " renaming " + myLocation + " to " + theMarkerNameData.nameMarker)
                ObjectReference myRenameMarker = mapMarkerRef.PlaceAtMe(theMarkerNameData.nameMarker)
                mapMarkerRef.SetLinkedRef(myRenameMarker, MapMarkerLinkedRefNameOverride)
            endif
            i += 1
        EndWhile
    endif
endFunction

bool function VisibleOnStarmap(Location locationToCheck)
    int i = 0
    bool isVisible = false
    while i < OE_CiviliansVisibleFromStarmapKeywords.GetSize() && isVisible == false
        Keyword theKeyword = OE_CiviliansVisibleFromStarmapKeywords.GetAt(i) as Keyword
        isVisible = ( theKeyword && locationToCheck.HasKeyword(theKeyword) )
        i += 1
    endWhile
    debug.trace(self + " VisibleOnStarmap: locationToCheck=" + locationToCheck + ": " + isVisible)
    return isVisible
endFunction


;************** SKILLS *****************************************
Guard harvestLock ProtectsFunctionLogic

function HarvestActor(Actor harvestActor)
	debug.trace(self + " HarvestActor " + harvestActor)
	LockGuard harvestLock

	Actor player = Game.Getplayer()
	if harvestActor
		if harvestActor.GetValue(ZoologyNonLethalHarvestCount) < ZoologyNonLethalHarvestCountMax.GetValue()
			; increment harvest count on actor
			HarvestActor.ModValue(ZoologyNonLethalHarvestCount, 1)
			Resource[] resources = HarvestActor.GetValueResources()
			int i = 0
			while i < resources.Length
				MiscObject harvestItem = resources[i].GetCreatedObject() as MiscObject
				if harvestItem
					player.AddItem(harvestItem)

					;send affinity event
					SQ_Companions.Trace(self, "HarvestActor() harvestActor: " + harvestActor)
					SQ_Companions.SendAffinityEvent(SQ_Companions.COM_Event_Action_Harvest_Animal)

				endif
				i += 1
			EndWhile
			Game.RequestHUDRolloverRefresh()
		endif
	endif
	EndLockGuard
endFunction

;************** RANDOM SHIP DAMAGE *****************************

;Called by: DefaultRefDamageSpaceshipOnLoad, DefaultAliasDamageSpaceshipOnInit, others.
;Sets up a standard derelict ship.
Function SetupDamagedShip(SpaceshipReference damagedShip, bool shouldBeDestroyed=False, bool shouldBeDerelict=True, bool shouldApplyDerelictName=True, bool shouldDamageRandomSystems=True, bool shouldDisableExteriorLights=True, bool shouldBlockRepairOfDestroyedParts=True, ActorValueDatum[] additionalActorValuesToDamage=None)
	;debug.TraceFunction(self + " SetupDamagedShip")
	if (damagedShip == None)
		Game.Error("ERROR: SQ_ParentScript: SetupDerelictShip was called with a NONE ship.")
	Else
		if (shouldBeDestroyed)
			debug.trace(self + "  killing silently")
			damagedShip.KillSilent()
		Else
			if (shouldBeDerelict)
				damagedShip.AddKeyword(BEDerelict)
				damagedShip.DamageValue(SpaceshipCrew, damagedShip.GetValue(SpaceshipCrew))
			EndIf
			if (shouldApplyDerelictName)
				DerelictShipNameAlias.ApplyToRef(damagedShip)
			EndIf
			if (shouldDamageRandomSystems)
				int i = 0
				While (i < RandomShipDamageData.Length)
					float damagePercent
					if (Utility.RandomFloat(0, 1) < RandomShipDamageData[i].ChanceDestroyed)
						damagePercent = 1.0
					Else
						damagePercent = 1 - Utility.RandomFloat(RandomShipDamageData[i].MinDamagePercent, RandomShipDamageData[i].MaxDamagePercent)
					EndIf
					damagedShip.DamageValue(RandomShipDamageData[i].ActorValueToDamage, damagedShip.GetValue(RandomShipDamageData[i].ActorValueToDamage) * damagePercent)
					i = i + 1
				EndWhile
			EndIf
			if (shouldDisableExteriorLights)
				damagedShip.SetValue(SpaceshipExternalLightsDisabledValue, 1)
			EndIf
			if (shouldBlockRepairOfDestroyedParts)
				damagedShip.EnablePartRepair(None, False)
			EndIf
			if (additionalActorValuesToDamage != None)
				int i = 0
				While (i < additionalActorValuesToDamage.Length)
					damagedShip.DamageValue(additionalActorValuesToDamage[i].ActorValueToDamage, damagedShip.GetValue(additionalActorValuesToDamage[i].ActorValueToDamage) * additionalActorValuesToDamage[i].DamagePercent)
					i = i + 1
				EndWhile
			EndIf
		EndIf
	EndIf
endFunction


;************** SMUGGLING **************************************

; Smuggling mingame properties
group SmugglingMinigame
	Message property SQ_GuardShipSmugglingMinigameSuccess auto const mandatory
	{ temp message box for smuggling minigame }

	Message property SQ_GuardShipSmugglingMinigameFailure auto const mandatory
	{ temp message box for smuggling minigame }

	float property fSmugglingBaseChance = 60.0 auto ;Const  - TEMP - so can change it for testing
	float property fSmugglingTargetSkillMult = -5.00 auto Const
	float property fSmugglingCapacityMult = 1.0 auto Const
	float property fSmugglingWeightPower = 0.5 auto Const
	float property fSmugglingWeightMult = -1.0 auto Const
	float property fSmugglingWeightMax = 2000.0 auto Const
	float property fSmugglingMaxChance = 90.0 auto Const
	float property fSmugglingMinChance = 10.0 auto Const

	float[] property ScanJammerMults auto const mandatory
	{ this will hold the values to use in the formula for each level of SpaceshipScanJammer, which will be ints }

	float[] property PlayerSkillMults auto const mandatory
	{ this will hold the values to use in the formula for each level of player skill, which will be ints }

	ActorValue property CarryWeightShielded auto const mandatory
	ActorValue property Perception auto const mandatory
	ActorValue property PayloadLevel auto const mandatory
	{ player's Payloads skill }
	ActorValue property SpaceshipScanJammer auto const mandatory
	{ ship's scan jammer level }

	int property SmugglingAchievementID = 45 auto const
endGroup

; returns chance for the player to evade the contraband check
float function GetSmugglingChance(SpaceshipReference playerShipRef, SpaceshipReference scanningShipRef)
	int contrabandStatus = playerShipRef.CheckContrabandStatus(true)
	float realChance

	if contrabandStatus < 0
		; no contraband
		debug.trace(self + " no contraband")
		realChance = 100.0
	elseif contrabandStatus > 0
		debug.trace(self + " contraband over limit - no chance of evasion")
		realChance = 0.0
	Else
		debug.trace(self + " shielded contraband - calculate chance")





		float contrabandWeight = playerShipRef.GetContrabandWeight(abCheckWholeShip=false)
		float contrabandWeightShip = playerShipRef.GetContrabandWeight(abCheckWholeShip=true)
		float contrabandCapacity = playerShipRef.GetValue(CarryWeightShielded)
		
		int playerSmugglingSkillValue = Math.Clamp(Game.GetPlayer().GetValueInt(PayloadLevel), 0, PlayerSkillMults.Length-1) as int
		float playerSmugglingSkillBonus = PlayerSkillMults[playerSmugglingSkillValue]

		int playerScanJammerValue = Math.Clamp(playerShipRef.GetValueInt(SpaceshipScanJammer), 0, ScanJammerMults.Length-1) as int
		float playerScanJammerBonus = ScanJammerMults[playerScanJammerValue]
		
		float scanningShipPerception = scanningShipRef.GetValue(Perception)
		debug.trace(self + " SmugglingMinigame")
		debug.trace(self + "     contrabandWeight=" + contrabandWeight)
		debug.trace(self + "     contrabandWeightShip=" + contrabandWeightShip)
		debug.trace(self + "     contrabandCapacity=" + contrabandCapacity)
		debug.trace(self + "     playerSmugglingSkillBonus=" + playerSmugglingSkillBonus)
		debug.trace(self + "     playerScanJammerBonus=" + playerScanJammerBonus)
		debug.trace(self + "     scanningShipPerception=" + scanningShipPerception)

		float targetSkillFactor = fSmugglingTargetSkillMult*scanningShipPerception
		float contrabandWeightFactor = fSmugglingWeightMult*(Math.pow(contrabandWeight, fSmugglingWeightPower)) * contrabandWeight/contrabandCapacity

		debug.trace(self + "   Smuggling chance calculation:")
		debug.trace(self + "     fSmugglingBaseChance=" + fSmugglingBaseChance)
		debug.trace(self + "     targetSkillFactor=" + targetSkillFactor)
		debug.trace(self + "     contrabandWeightFactor=" + contrabandWeightFactor)

		float baseChance = fSmugglingBaseChance + targetSkillFactor + contrabandWeightFactor
		debug.trace(self + "     baseChance=" + baseChance)

		realChance = baseChance * (1 + playerScanJammerBonus) * (1 + playerSmugglingSkillBonus)

		realChance = Math.Max(realChance, fSmugglingMinChance)
		realChance = Math.Min(realChance, fSmugglingMaxChance)
	endif

	debug.trace(self + "     realChance=" + realChance)
	return realChance
EndFunction

bool Function SmugglingMinigame(SpaceshipReference playerShipRef, SpaceshipReference scanningShipRef)
	float realChance = GetSmugglingChance(playerShipRef, scanningShipRef)

	float dieRoll = Utility.RandomFloat(1.0, 100.0)
	debug.trace(self + "     dieRoll=" + dieRoll)
	bool bSuccess = (dieRoll <= realChance)
	debug.trace(self + "   Success? " + bSuccess)

;/
Your ship is being scanned for contraband:

Contraband weight: %.0f 
Shielded cargo capacity: %.0f
Scan jammer level: %.0f
Payloads skill bonus: %.0f

Chance to evade scan: %.0f

Result: FAILURE - contraband detected

		;SQ_GuardShipSmugglingMinigameSuccess.Show(contrabandWeight, contrabandCapacity, playerScanJammerBonus, playerSmugglingSkillBonus, realChance)
		;SQ_GuardShipSmugglingMinigameFailure.Show(contrabandWeight, contrabandCapacity, playerScanJammerBonus, playerSmugglingSkillBonus, realChance)
/;
	if bSuccess
		; achievement
		Game.AddAchievement(SmugglingAchievementID)
	endif

	return bSuccess
EndFunction

;************** OUTPOST ATTACKS ********************************

; attack chance formula
float attackChanceBase = 0.1 const					; base chance for any attack
float attackChanceCreature = 0.08 const 			; base chance for a creature attack (anything above this that succeeds will be a human attack)
float attackChanceResourceMult = 0.01 const
float attackChanceCargoLinkMult = 0.05 const
float minDaysSinceLastAttack = 7.0 const 			;	minimum days before another attack can happen
float minDaysSinceLastAttackRoll = 0.04 const 		;	minimum days before another attack can be rolled for (0.04 = 1 game hour)

function CheckForAttack(OutpostBeaconScript outpostRef, bool bForceAttack = false, int iForceAttackType = 0, float fDieRoll=0.0)
	; bForceAttack = true - always roll for an attack
	; iForceAttackType:
	;		0 = roll normally
	; 		1 = force human attack
	; 		2 = force creature attack
	; fDieRoll > 0 - use this die roll instead of rolling (only meaningful if bForceAttack = true and iForceAttackType = 0)

	debug.trace(self + "------------------------------------------------------------------------------ ")
	debug.trace(self + "	Check for attack: " + outpostRef + " (bForceAttack=" + bForceAttack + ") + iForceAttackType=" + iForceAttackType)
	debug.trace(self + "------------------------------------------------------------------------------ ")

	; attacks allowed at all?
	if outpostRef.AllowAttacks == false
		debug.trace(self + "		attacks not allowed - no attack roll for " + outpostRef)
		return
	EndIf

	; is player still on this planet?
	if Game.GetPlayer().GetCurrentPlanet() != outpostRef.GetCurrentPlanet()
		debug.trace(self + "		no attack - player no longer on same planet as " + outpostRef)
		return
	endif

	Location outpostLocation = outpostRef.GetCurrentLocation()
    Location[] parentLocations = outpostLocation.GetParentLocations(LocTypeMajorOrbital)
    if !parentLocations
		debug.trace(self + "		attacks not allowed - no planet location for " + outpostRef)
		return
    endif
    Location myPlanet = parentLocations[0]

	; is another attack roll allowed?
	float lastAttackRoll = myPlanet.GetValue(OutpostLastAttackRollTimestamp)
	float daysSinceLastRoll = Utility.GetCurrentGameTime() - lastAttackRoll
	if lastAttackRoll > 0 && minDaysSinceLastAttackRoll > daysSinceLastRoll && bForceAttack == false
		; attack roll happened recently - don't roll again yet
		debug.trace(self + " " + outpostRef + ":		" + daysSinceLastRoll + " days since last attack roll on " + myPlanet + " - no attack roll")
		return
	endif

	; how many days since last attack on this planet
    float lastAttack = myPlanet.GetValue(OutpostLastAttackTimestamp)
	; if lastAttack = 0, means this is first outpost on the planet, so allow attacks immediately
	float daysSinceLastAttack
	if lastAttack <= 0
		daysSinceLastAttack = minDaysSinceLastAttack + 1
	else
    	daysSinceLastAttack = Utility.GetCurrentGameTime() - lastAttack
	endif

	; NEW ATTACK:
	if minDaysSinceLastAttack > daysSinceLastAttack && bForceAttack == false
		; attack happened recently - no new attack
		debug.trace(self + " " + outpostRef + ":		" + daysSinceLastAttack + " days since last attack on " + myPlanet + " - no attack roll")
		return
	endif

    ; special cases:
	int i = 0
	float specialCaseRating = 0.0
	while i < OutpostAttackSpecialCases.length
		OutpostAttackSpecialCase theSpecialCase = OutpostAttackSpecialCases[i]
		if theSpecialCase.specialCaseCondition.IsTrue(outpostRef)
			if theSpecialCase.storyEventKeyword
				debug.trace(self + " " + outpostRef + ":		rolling for special case attack: " + theSpecialCase.specialCaseAttackChance + " chance")
				if Game.GetDieRollSuccess((theSpecialCase.specialCaseAttackChance*100) as int) || ( fDieRoll>0 && fDieRoll <= theSpecialCase.specialCaseAttackChance )
					Quest[] specialCaseAttacks = theSpecialCase.storyEventKeyword.SendStoryEventAndWait(akRef1=outpostRef)
					if specialCaseAttacks
						debug.trace(self + "  special case attack started: " + specialCaseAttacks[0] + " - no additional attack rolls")
						return
					endif
				endif
			else
				debug.trace(self + " " + outpostRef + ":		adding " + theSpecialCase.specialCaseAttackChance + " special case chance to normal attack roll")
				specialCaseRating += theSpecialCase.specialCaseAttackChance
			endif
		endif
		i += 1
	EndWhile

    ; get resource production

	; create local pointer to WorkshopRatings array to speed things up
	MissionParentScript:MissionSupplyType[] resourceAVs = MB_Parent.resourceAVs

    float resourceRating = 0.0
    i = 0
    while i < resourceAVs.Length
        float resourceValue = outpostRef.GetValue(resourceAVs[i].supplyAV)
        if resourceValue > 0.0
            debug.trace(self + " " + outpostRef + ": adding " + resourceValue + " for " + resourceAVs[i].supplyAV)
            resourceRating += resourceValue
        endif
        i += 1
    EndWhile

	; cargo links
	float cargoLinkRating = outpostRef.GetValue(OutpostCargoLinkAV)

	; chance of attack:
	; 	base chance + resource production
	debug.trace(self + " " + outpostRef + ":	Attack chance:")
	debug.trace(self + " " + outpostRef + ":		base chance=" + attackChanceBase)
	debug.trace(self + " " + outpostRef + ":		special cases=+" + specialCaseRating)
	debug.trace(self + " " + outpostRef + ":		resources=+" + attackChanceResourceMult * resourceRating)
	debug.trace(self + " " + outpostRef + ":		cargo links=+" + attackChanceCargoLinkMult * cargoLinkRating)

	float attackChance = attackChanceBase + attackChanceResourceMult * resourceRating + attackChanceCargoLinkMult * cargoLinkRating + specialCaseRating
	debug.trace(self + " " + outpostRef + ":		TOTAL=" + attackChance)

	float attackRoll = Utility.RandomFloat()
	if fDieRoll > 0
		attackRoll = fDieRoll
	endif
	debug.trace(self + " " + outpostRef + ":	Attack roll = " + attackRoll)
	; which kind of attack (if any)?
	if (attackRoll <= attackChanceCreature && iForceAttackType==0) || iForceAttackType > 1
		; creature attack
        SQ_OutpostEventAttackCreatures.SendStoryEvent(akRef1=outpostRef)
	elseif attackRoll <= attackChance || iForceAttackType == 1
		; human attack
        SQ_OutpostEventAttack.SendStoryEvent(akRef1=outpostRef)
	endif
	; timestamp this roll
	myPlanet.SetValue(OutpostLastAttackRollTimestamp, Utility.GetCurrentGameTime())
endFunction

;************** Tutorial Messages ****************************************

Guard tutorialMessageGuard ProtectsFunctionLogic

function ShowTutorialMessage(int tutorialID)
	LockGuard tutorialMessageGuard
		int messageIndex = TutorialMessages.FindStruct("tutorialID", tutorialID)
		if messageIndex > -1
			TutorialMessage theMessage = TutorialMessages[messageIndex]
			theMessage.tutorialMessage.Show()
			; remove this from the array since it is done
			TutorialMessages.Remove(messageIndex)
		EndIf
	EndLockGuard
endFunction

;************** Achievements ****************************************
Guard computersAchievementGuard ProtectsFunctionLogic

function IncrementComputersAchievement(ObjectReference terminalRef)
	LockGuard computersAchievementGuard
		if ComputersAchievementAwarded == false
			if terminalRef.GetValue(ComputersAchievementAV) == 0
				debug.trace(self + " first time accessing terminalRef " + terminalRef + ": increment count for achievement " + ComputersAchievementID)
				; don't count the same terminal more than once
				terminalRef.SetValue(ComputersAchievementAV, 1)

				Actor playerRef = Game.GetPlayer()
				playerRef.ModValue(ComputersAchievementAV, 1)
				int computerCount = playerRef.GetValueInt(ComputersAchievementAV)
				debug.trace(self + " new achievement count=" + computerCount)
				if computerCount >= ComputersAchievementCount.GetValueInt()
					; achievement
					Game.AddAchievement(ComputersAchievementID)
					ComputersAchievementAwarded = true
				endif
			endif
		endif
	endLockGuard
endFunction

;************** Ship Critical Hits ******************************

Group ShipCriticalHits
	ActorValue property ShipSystemReactorHealth auto const mandatory
	{ reactor system health } 

	ActorValue property Health auto const mandatory
	{ ship health } 

	ActorValue property ShipSystemEngineHealth auto const mandatory
	{ engine system health - needed if crew goes to 0 } 

	ActorValue property SpaceshipCriticalHitCrew auto const mandatory
	{ set to 1 when crew is wiped out by a critical }

	int property maxCrewDamage = 6 auto Const
	{ max number of crew that can be killed in a single critical hit }

	float property minReactorHealthDamage = 0.1 auto Const
	{ min % of reactor health to damage }

	float property maxReactorHealthDamage = 0.25 auto Const
	{ max % of reactor health to damage }

	float property minHullHealthDamage = 0.1 auto Const
	{ min % of Hull health to damage }

	float property maxHullHealthDamage = 0.25 auto Const
	{ max % of reactor health to damage }

	float property minSystemHealthDamage = 1.0 auto Const
	{ min % of system health to damage }

	float property maxSystemHealthDamage = 1.25 auto Const
	{ max % of system health to damage }

	ActorValue[] property SystemHealthAVs auto Const
	{ system health actor values }

	ActorValue[] property SystemEMHealthAVs auto Const
	{ system EM health actor values }

	Message[] property CriticalHitMessages auto Const
	{ array of critical hit messages - index matches the hit type }

	WwiseEvent Property UICriticalHitShip Auto Const Mandatory
	{ critical hit sound }
endGroup

int criticalHitType0_Reactor = 0 Const
int criticalHitType1_Crew = 1 Const
int criticalHitType2_Hull = 2 Const
int criticalHitType3_System = 3 Const
int criticalHitType4_EM = 4 Const
int criticalHitType5_Engine = 5 Const
int criticalHitType6_Shield = 6 Const

Guard ShipCriticalHitGuard ProtectsFunctionLogic

Function HandleCriticalHit(SpaceshipReference targetShip, ShipCriticalHitEffectScript:CriticalHitEffect[] CriticalHitEffects)
	; we skip this if the guard is already locked - no need for simultaneous critical hits
	TryLockGuard ShipCriticalHitGuard
		; get total critical hit effect weight (for random rolls)
		int totalCriticalHitEffectWeight = 0
		int i = 0
		while i < CriticalHitEffects.Length
			ShipCriticalHitEffectScript:CriticalHitEffect theCriticalHit = CriticalHitEffects[i] 
			debug.trace(self + "  " + i + ": " + theCriticalHit)   
			totalCriticalHitEffectWeight += theCriticalHit.weight
			i += 1
		EndWhile

        int criticalEffectRoll = Utility.RandomInt(1, totalCriticalHitEffectWeight)
        debug.trace(self + " HandleCriticalHit: critical effect roll=" + criticalEffectRoll)
        ; run through array to find which critical hit we rolled
        i = 0
        int currentWeight
        int criticalHitEffectIndex = -1
        while i < CriticalHitEffects.Length && criticalHitEffectIndex < 0
            ShipCriticalHitEffectScript:CriticalHitEffect theCriticalHit = CriticalHitEffects[i]
            currentWeight += theCriticalHit.weight
            if criticalEffectRoll <= currentWeight
                criticalHitEffectIndex = i
            endif
            i += 1
        EndWhile

        if criticalHitEffectIndex > -1
            ShipCriticalHitEffectScript:CriticalHitEffect theCriticalHit = CriticalHitEffects[criticalHitEffectIndex]
            debug.trace(self + " HandleCriticalHit: rolled critical effect " + criticalHitEffectIndex + ": " + theCriticalHit)
            ; do whatever the effect says to do
            if theCriticalHit.criticalHitType == criticalHitType0_Reactor
                ; reactor damage
                float baseReactorHealth = targetShip.GetBaseValue(ShipSystemReactorHealth)
                float minHealthDamage = baseReactorHealth*minReactorHealthDamage
                float maxHealthDamage = baseReactorHealth*maxReactorHealthDamage

                float damageHealth = utility.RandomFloat(minHealthDamage, maxHealthDamage)
                debug.trace(self + " HandleCriticalHit: reactor damage! inflicting " + damageHealth + " damage")
                targetShip.DamageValue(ShipSystemReactorHealth, damageHealth)
            elseif theCriticalHit.criticalHitType == criticalHitType1_Crew
                ; crew damage - from 1-current crew
                if targetShip.GetValue(SpaceshipCrew) > 0
                    int currentCrew = targetShip.GetValueInt(SpaceshipCrew)
                    int crewDamage = utility.RandomInt(1, currentCrew)
                    crewDamage = Math.Min(maxCrewDamage, crewDamage) as int
                    debug.trace(self + " HandleCriticalHit: crew damage! inflicting " + crewDamage + " damage")
                    targetShip.DamageValue(SpaceshipCrew, crewDamage)
                    if targetShip.GetValueInt(SpaceshipCrew) == 0
                        ; also damage engines fully so ship is visibly "out of action"
                        float currentEngineHealth = targetShip.GetValue(ShipSystemEngineHealth)
                        targetShip.DamageValue(ShipSystemEngineHealth, currentEngineHealth)
						; flag ship as crew wiped out
						targetShip.SetValue(SpaceshipCriticalHitCrew, 1)
                    endif
                endif
            elseif theCriticalHit.criticalHitType == criticalHitType2_Hull
                ; hull damage
                float baseHullHealth = targetShip.GetBaseValue(Health)
                float minHealthDamage = baseHullHealth*minHullHealthDamage
                float maxHealthDamage = baseHullHealth*maxHullHealthDamage

                float damageHealth = utility.RandomFloat(minHealthDamage, maxHealthDamage)
                debug.trace(self + " HandleCriticalHit: Hull damage! inflicting " + damageHealth + " damage")
                targetShip.DamageValue(Health, damageHealth)
            elseif theCriticalHit.criticalHitType == criticalHitType3_System || theCriticalHit.criticalHitType == criticalHitType5_Engine || theCriticalHit.criticalHitType == criticalHitType6_Shield
                ; system damage
                debug.trace(self + " HandleCriticalHit: system damage")
                
                ActorValue systemAV = theCriticalHit.systemAV
                if systemAV == NONE
                    ; damage random system
                    ActorValue[] validSystemAVs = GetValidSystemAVs(SystemHealthAVs, targetShip)
                    int systemIndex = Utility.RandomInt(0, validSystemAVs.Length - 1)
                    systemAV = validSystemAVs[systemIndex]
                EndIf
                
                ; damage this system
                float baseSystemHealth = targetShip.GetBaseValue(systemAV)
                float minHealthDamage = baseSystemHealth*minSystemHealthDamage
                float maxHealthDamage = baseSystemHealth*maxSystemHealthDamage

                float damageHealth = utility.RandomFloat(minHealthDamage, maxHealthDamage)

                debug.trace(self + " HandleCriticalHit: " + systemAV + " damage! inflicting " + damageHealth + " damage")
                targetShip.DamageValue(systemAV, damageHealth)
            elseif theCriticalHit.criticalHitType == criticalHitType4_EM
                ; EM damage
                debug.trace(self + " HandleCriticalHit: EM damage")
                ActorValue systemAV = theCriticalHit.systemAV
                if systemAV == NONE
                    ; damage random system
                    ActorValue[] validSystemAVs = GetValidSystemAVs(SystemEMHealthAVs, targetShip)
                    int systemIndex = Utility.RandomInt(0, validSystemAVs.Length - 1)
                    systemAV = validSystemAVs[systemIndex]
                EndIf
                ; fully damage this system
                float baseSystemHealth = targetShip.GetBaseValue(systemAV)
                debug.trace(self + " HandleCriticalHit: " + systemAV + " damage! inflicting " + baseSystemHealth + " damage")
                targetShip.DamageValue(systemAV, baseSystemHealth)
            endif
            Message criticalHitMessage = CriticalHitMessages[theCriticalHit.criticalHitType]
            if criticalHitMessage
                debug.trace(self + " HandleCriticalHit: show message " + criticalHitMessage)
                criticalHitMessage.Show()
		        UICriticalHitShip.Play(Game.GetPlayer())
            endif
        endif
	endTryLockGuard
EndFunction

; utility function to return an array of actor values that are > 0 on the targetShip
ActorValue[] function GetValidSystemAVs(ActorValue[] systemAVs, SpaceshipReference targetShip)
    ActorValue[] validSystemAVs = new ActorValue[0]
    int i = 0
    while i < systemAVs.Length
        if targetShip.GetValue(systemAVs[i]) > 0
            validSystemAVs.Add(systemAVs[i])
        endif
        i += 1
    EndWhile
    debug.trace(self + " GetValidSystemAVs: " + validSystemAVs)
    return validSystemAVs
endFunction


;************** TESTING ****************************************

function TestGetMatchingActorBase(Actor theActor)
	debug.trace(self + " GetMatchingPlanetActorBase for " + theActor + "=" + theActor.GetMatchingPlanetActorBase())
EndFunction

function TestIsInSameLocation(ObjectReference refToTest, Location locationToTest, Keyword locationKeyword)
	debug.trace(self + " TestIsInSameLocation: " + refToTest + " IsSameLocation? " + refToTest.GetCurrentLocation().IsSameLocation(locationToTest, locationKeyword))
endFunction

function TestSetTraitKnown(Keyword planetTraitKeyword)
	Planet planetToCheck = Game.GetPlayer().GetCurrentPlanet()
	planetToCheck.SetTraitKnown(planetTraitKeyword)
	UpdateTextReplacementAliases(Game.Getplayer())
	PlanetTraitData theData = FindMatchingPlanetTraitForKeyword(planetTraitKeyword, planetToCheck)
	if theData
    	UpdatePlanetTraitDiscovery(Game.GetPlayer(), theData, 99)
	else
		debug.trace(self + " trait " + planettraitkeyword + " not found on planet " + planettocheck)
	endif
endFunction

function testSetGroupFaction(Actor testActor, Faction testFaction)
	testActor.SetGroupFaction(testFaction)
	debug.trace(self + " group faction now=" + testActor.GetGroupFaction())
endFunction

function testEnableSpaceTravel(Location testLocation, bool bEnable)
	testLocation.EnableSpaceTravel(self, bEnable)
endFunction

function testSetSmugglingBaseChance(float basechance)
	fSmugglingBaseChance = baseChance
endFunction

function testConditionForm(ObjectReference testRef, ConditionForm testCondition)
	debug.trace(self + " TestConditionForm: " + testRef + ".IsTrue=" + testCondition.IsTrue(testRef))
endFunction

function testSetScanned(ObjectReference scannableRef)
	debug.trace(self + " testSetScanned: calling SetScanned() on " + scannableRef)
	scannableRef.SetScanned(true)
endFunction

function testGetHoursUntil(float afTargetHourLocal)
	Utility.GetHoursUntilLocalHour(afTargetHourLocal)
endFunction

function testGetRefsLinkedToMe(ObjectReference refToCheck, Keyword keywordToCheck)
	debug.trace(self + " GetRefsLinkedToMe=" + refToCheck.GetRefsLinkedToMe(keywordToCheck))
	;debug.trace(self + " GetLinkedRefChildren=" + refToCheck.GetLinkedRefChildren(keywordToCheck))
endFunction


function TestGetArray(FormList formlistToCheck)
	Form[] formArray = formlistToCheck.GetArray()
	debug.trace(self + " formArray=" + formArray)
endFunction

function TestGetBaseActor(Actor testActor)
	debug.trace(self + " GetBaseObject=" + testActor.GetBaseObject())
	debug.trace(self + " GetLeveledActorBase=" + testActor.GetLeveledActorBase())
endFunction

function TestGetEditorLocation(ObjectReference testRef)
	debug.trace(self + " GetEditorLocation=" + testRef.GetEditorLocation())
endfunction

function TestMoveToEditorLocation(ObjectReference testRef)
	testRef.MoveToMyEditorLocation()
endFunction

function TestCompleteResearchProject(ResearchProject testProject)
	testProject.Complete()
	debug.trace(self + " complete project " + testProject)
endFunction

function TestFindRefsWithKeyword(keyword testKeyword)
	ObjectReference[] refArray = Game.GetPlayer().FindAllReferencesWithKeyword(testKeyword, 5000.0)
	debug.trace(self + " TestFindRefsWithKeyword " + testKeyword + ": " + refArray)
	testTraceRefArray(refArray)
endfunction

function TestFindRefsByID(Form baseForm)
	ObjectReference[] refArray = Game.GetPlayer().FindAllReferencesOfType(baseForm, 5000.0)
	debug.trace(self + " TestFindRefsByID " + baseForm + ": " + refArray)
	testTraceRefArray(refArray)
endFunction

function testTraceRefArray(ObjectReference[] refArray)
	ObjectReference playerRef = Game.GetPlayer()
	int i = 0
	while i < refArray.Length
		debug.trace(self + " " + i + ": " + refArray[i] + ": distance=" + refArray[i].GetDistance(playerRef))
		i += 1
	endWhile
endFunction

function testRandomInt(int min, int max)
	debug.trace(self + " Random int between " + min + " and " + max + ": " + Utility.RandomInt(min,max))
endfunction

;********** SURVEY SITES ********************************
; returns TRUE if this was a new site; FALSE if the site was already in the array
bool Function AddSurveySite(SurveySiteDiscoverMarkerScript newSite)
	Debug.trace(self + " AddSurveySite " + newSite)
	int siteIndex = SurveySites.FindStruct("siteMarker", newSite)
	if siteIndex > -1
		return false
	else
		SurveySite theSite = new SurveySite
		theSite.siteMarker = newSite
		SurveySites.Add(theSite)
		PlanetReference.ForceRefTo(newSite)
		SQ_SurveySiteDiscoveredMessage.Show()
		SendSurveySiteDiscoveredEvent(newSite)
		return true
	endif
endFunction

bool Function RemoveSurveySite(SurveySiteDiscoverMarkerScript siteToRemove, bool countAsBuilt = true)
	Debug.trace(self + " RemoveSurveySite " + siteToRemove)
	int siteIndex = SurveySites.FindStruct("siteMarker", siteToRemove)
	if siteIndex > -1
		SurveySites.Remove(siteIndex)
		if countAsBuilt
			; toggle state of discovery marker
			siteToRemove.BuildSite()
		endif
		return true
	else
		return false
	endif
endFunction

function SendSurveySiteDiscoveredEvent(ObjectReference newSite)
	; Send the survey site event
	Var[] kargs = new Var[1]
	kargs[0] = newSite
	SendCustomEvent("SQ_SurveySiteDiscovered", kargs)
endFunction

function TestAddSurveySite(ObjectReference newSite)
	AddSurveySite(newSite as SurveySiteDiscoverMarkerScript)
endFunction

