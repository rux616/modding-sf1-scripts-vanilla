Scriptname CompanionAffinityEventsScript extends Quest

struct ImportantSceneDatum
	Scene ImportantScene
	{the scene to check if it's running to determine if we are near an "important" scene}

	ReferenceAlias AliasToCheck
	{almost always the primary alias, what are we checking for to mean "is near" this scene if it's running}
endstruct


Group Alias
ReferenceAlias Property ActiveCompanion Mandatory Const Auto
{autofill}

ReferenceAlias Property ActiveEliteCrew Mandatory Const Auto
{autofill}

ReferenceAlias Property PlayerShip Mandatory Const Auto
{autofill}

EndGroup

Group AffinityEvents
AffinityEvent Property COM_Event_Action_Arrival Auto Const Mandatory
AffinityEvent Property COM_Event_Action_BecomeOverEncumbered Auto Const Mandatory
AffinityEvent Property COM_Event_Action_ChemAddiction Auto Const Mandatory
AffinityEvent Property COM_Event_Action_Consume_Alcohol Auto Const Mandatory
AffinityEvent Property COM_Event_Action_Consume_Drugs Auto Const Mandatory
AffinityEvent Property COM_Event_Action_Crafting_CreateItem Auto Const Mandatory
AffinityEvent Property COM_Event_Action_Crafting_CreateOutpostModule Auto Const Mandatory
AffinityEvent Property COM_Event_Action_Crafting_CreateShipModule Auto Const Mandatory
AffinityEvent Property COM_Event_Action_Crafting_Mod_Armor Auto Const Mandatory
AffinityEvent Property COM_Event_Action_Crafting_Mod_Weapon Auto Const Mandatory
AffinityEvent Property COM_Event_Action_DischargeWeapon Auto Const Mandatory
AffinityEvent Property COM_Event_Action_DropUsefulItem Auto Const Mandatory
AffinityEvent Property COM_Event_Action_Enhance_PlayerChangeAppearance Auto Const Mandatory
AffinityEvent Property COM_Event_Action_EnvironmentalDamage_Airborne Auto Const Mandatory
AffinityEvent Property COM_Event_Action_EnvironmentalDamage_Corrosive Auto Const Mandatory
AffinityEvent Property COM_Event_Action_EnvironmentalDamage_Radiation Auto Const Mandatory
AffinityEvent Property COM_Event_Action_EnvironmentalDamage_Thermal Auto Const Mandatory
AffinityEvent Property COM_Event_Action_EnvironmentalHazardWarning Auto Const Mandatory
AffinityEvent Property COM_Event_Action_ShipBoardingOther Auto Const Mandatory

AffinityEvent Property COM_Event_Action_Harvest_Animal Auto Const Mandatory
AffinityEvent Property COM_Event_Action_Harvest_Mineral Auto Const Mandatory
AffinityEvent Property COM_Event_Action_Harvest_Plant Auto Const Mandatory
AffinityEvent Property COM_Event_Action_HealCompanion Auto Const Mandatory
AffinityEvent Property COM_Event_Action_JailComplete Auto Const Mandatory
AffinityEvent Property COM_Event_Action_JumpFromHeight Auto Const Mandatory
AffinityEvent Property COM_Event_Action_LootCorpse Auto Const Mandatory

AffinityEvent Property COM_Event_Action_PickLock Auto Const Mandatory
AffinityEvent Property COM_Event_Action_Hack Auto Const Mandatory


AffinityEvent Property COM_Event_Action_ShipEmbark Auto Const Mandatory
AffinityEvent Property COM_Event_Action_Steal Auto Const Mandatory
AffinityEvent Property COM_Event_Action_StealPickpocket Auto Const Mandatory
AffinityEvent Property COM_Event_Action_Swim Auto Const Mandatory

AffinityEvent Property COM_Event_Action_UseHandScanner Auto Const Mandatory
AffinityEvent Property COM_Event_Action_UseStarbornPower Auto Const Mandatory
AffinityEvent Property COM_Event_Action_UseWorkbench Auto Const Mandatory
AffinityEvent Property COM_Event_Action_WalkAroundNaked Auto Const Mandatory

AffinityEvent Property COM_Event_Action_GravityHigh Const Auto Mandatory
AffinityEvent Property COM_Event_Action_GravityLow Const Auto Mandatory
AffinityEvent Property COM_Event_Action_ZeroG Auto Const Mandatory

FormList Property COM_LocationKeywords_VeryCold Mandatory Const Auto
FormList Property COM_LocationKeywords_VeryHot Mandatory Const Auto
AffinityEvent Property COM_Event_Action_TempHigh Mandatory Const Auto
AffinityEvent Property COM_Event_Action_TempLow Mandatory Const Auto
ConditionForm Property COM_CREW_CND_Comment_TemperatureCommentsAllowed Mandatory Const Auto


GlobalVariable Property COM_ActionEventScriptFilter_CoolDownMinutes Mandatory Const Auto

FormList Property COM_IgnoreAffinityEventCooldownOnChangeLocation_Locations Mandatory Const Auto

GlobalVariable Property SQ_Companions_RecentlyDisembarked Mandatory Const Auto

float Property COM_Event_Action_GravityHigh_Threshold = 1.5 Const Auto
float Property COM_Event_Action_GravityLow_Threshold = 0.5 Const Auto

EndGroup

Group ImportantSceneData
	ImportantSceneDatum[] Property ImportantSceneData Mandatory Const Auto

	Float Property SceneNearDistance = 20.0 Const Auto
EndGroup


ReferenceAlias Property Alias_CurrentCompanion Auto Const
{autofill}

MagicEffect Property COM_AddictionEffect const auto

Keyword Property COM_ObjType_ChemBad Auto Const Mandatory
Keyword Property COM_ObjType_Drink Auto Const Mandatory

FormList Property COM_DropUsefulItemList Auto Const Mandatory
FormList Property COM_DropUsefulItemList_Ignored Auto Const Mandatory

keyword[] Property DischargeWeapon_WeaponKeywordExceptions Mandatory Const Auto
{weapons with these keywords will not trigger this event (example melee weapons)}
keyword[] Property DischargeWeapon_LocationKeywordRequirements Mandatory Const Auto
{only locations with these keywords will be considered for triggering this event (example settlements).}

float Property DischargeWeapon_RadiusToLookForHostileActors = 40.0 Const Auto 

keyword Property ActorTypeNPC Mandatory Const Auto

Keyword Property ENV_EnvDamageType_Airborne Mandatory Const Auto
{autofill}
Keyword Property ENV_EnvDamageType_Corrosive Mandatory Const Auto
{autofill}
Keyword Property ENV_EnvDamageType_Radiation Mandatory Const Auto
{autofill}
Keyword Property ENV_EnvDamageType_Thermal Mandatory Const Auto
{autofill}
Keyword Property ENV_EffectTypeEnvironmentalDamageSoak Mandatory Const Auto
{autofill}

Keyword Property FloraTypeInorganic Mandatory Const Auto
{autofill}

Keyword Property FloraTypeOrganic Mandatory Const Auto
{autofill}

Keyword Property ResourceTypeOrganic Mandatory Const Auto
{autofill}

Keyword	Property Artifact_Power Mandatory Const Auto
{autofill}

Keyword Property BEHostileBoardingEncounterKeyword Mandatory Const Auto
{autofill}

Actor PlayerRef


;timer sequence triggered by change location event
int TimerID_Poll = 1 Const
float TimerDur_Poll = 60.0 Const
int NextPollEvent = 0

int TimerID_CoolDown = 2 const
;duration is global: COM_ActionEventScriptFilter_CoolDownMinutes
bool CoolingDown

int TimerID_RecentlyDisembarked = 3 const
float timerDur_RecentlyDisembarked = 30.0 const


;used to prevent overflows from spammy events
State Processing
	Event ObjectReference.OnSpellCast(ObjectReference akSender, Form akSpell)
	EndEvent

	Event ObjectReference.OnItemAdded(ObjectReference akSender, Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
	EndEvent
EndState

Event OnTimer(int aiTimerID)
	if aiTimerID == TimerID_Poll
		if NextPollEvent == 0
			CheckAndSendGravityEvents() ;NOTE gravity changes will only be commented on after change location events. If quests cause gravity to change, they should call the affinity event directly 
			NextPollEvent = 1
			StartTimer(TimerDur_Poll, TimerID_Poll)
		elseif NextPollEvent == 1
			CheckAndSendTemperatureEvents()
			NextPollEvent = 0
			;wait for next change location event to restart the timer
		endif
	elseif aiTimerID == TimerID_CoolDown
		Trace(self, "OnTimer() Cool Down Timer... TimerID_CoolDown: " + TimerID_CoolDown)
		CoolingDown = false
	elseif aiTimerID == TimerID_RecentlyDisembarked
		Trace(self, "OnTimer() TimerID_RecentlyDisembarked. Setting SQ_Companions_RecentlyDisembarked to 0.")
		SQ_Companions_RecentlyDisembarked.SetValue(0)
	endif
EndEvent

Function StartCoolDownTimer()
	float duration = COM_ActionEventScriptFilter_CoolDownMinutes.GetValue() * 60 ;convert minutes to seconds

	StartTimer(duration, TimerID_CoolDown)
	CoolingDown = True

	Trace(self, "StartCoolDownTimer() duration: " + duration + ", TimerID_CoolDown: " + TimerID_CoolDown + ", CoolingDown: " + CoolingDown)
EndFunction



Event OnQuestStarted()
	Trace(self, "OnQuestStarted()")
	PlayerRef = game.GetPlayer()

	;**************************************************************************************************
	;***************************		COM_Event_Action_Arrival 	 		***************************
	;***************************		COM_Event_Action_ShipBoardingOther	***************************
	;***************************		COM_Event_Action_ShipEmbark			***************************
	;***************************		COM_Event_Action_WalkAroundNaked	***************************
	;**************************************************************************************************
	;we use the ActiveCompanion alias for location changes to be sure they make it to the location before they try talking about it
	RegisterForRemoteEvent(ActiveCompanion, "OnLocationChange")
	RegisterForRemoteEvent(ActiveCompanion, "OnExitShipInterior")

	RegisterForRemoteEvent(ActiveEliteCrew, "OnLocationChange")
	RegisterForRemoteEvent(ActiveEliteCrew, "OnExitShipInterior")

	;we watch the ship moving to try to determine if a change location was due to a fast travel from another planet
	Trace(self, "OnQuestStarted() PlayerShip: " + PlayerShip)
	RegisterForRemoteEvent(PlayerShip, "OnShipGravJump")
	RegisterForRemoteEvent(PlayerShip, "OnShipFarTravel")

	;**************************************************************************************************
	;***************************	COM_Event_Action_ChemAddiction					*******************
	;***************************	COM_Event_Action_EnvironmentalDamage_Airborne	*******************
	;***************************	COM_Event_Action_EnvironmentalDamage_Corrosive	*******************
	;***************************	COM_Event_Action_EnvironmentalDamage_Radiation	*******************
	;***************************	COM_Event_Action_EnvironmentalDamage_Thermal	*******************
	;**************************************************************************************************
	RegisterForMagicEffectApplyEvent(PlayerRef, akCasterFilter = none, akEffectFilter = COM_AddictionEffect)
	RegisterForMagicEffectApplyEvent(PlayerRef, akCasterFilter = none, akEffectFilter = ENV_EnvDamageType_Airborne)
	RegisterForMagicEffectApplyEvent(PlayerRef, akCasterFilter = none, akEffectFilter = ENV_EnvDamageType_Corrosive)
	RegisterForMagicEffectApplyEvent(PlayerRef, akCasterFilter = none, akEffectFilter = ENV_EnvDamageType_Radiation)
	RegisterForMagicEffectApplyEvent(PlayerRef, akCasterFilter = none, akEffectFilter = ENV_EnvDamageType_Thermal)

	;**************************************************************************************************
	;***************************		COM_Event_Action_UseWorkbench		***************************
	;**************************************************************************************************
	RegisterForRemoteEvent(PlayerRef, "OnPlayerUseWorkBench")

	;**************************************************************************************************
	;***************************			COM_Event_Action_Swim			***************************
	;**************************************************************************************************
	RegisterForRemoteEvent(PlayerRef, "OnPlayerSwimming")

	;**************************************************************************************************
	;***************************    COM_Event_Action_Crafting_CreateItem    ***************************
	;**************************************************************************************************
	RegisterForRemoteEvent(PlayerRef, "OnPlayerCraftItem")


	;**************************************************************************************************
	;***************************	COM_Event_Action_Crafting_Mod_Weapon	***************************
	;***************************	COM_Event_Action_Crafting_Mod_Armor		***************************
	;**************************************************************************************************
	RegisterForRemoteEvent(PlayerRef, "OnPlayerModArmorWeapon")


	;**************************************************************************************************
	;*************************** COM_Event_Action_Crafting_CreateShipModule	***************************
	;**************************************************************************************************
	RegisterForRemoteEvent(PlayerRef, "OnPlayerModifiedShip")

	;**************************************************************************************************
	;************************ COM_Event_Action_Enhance_PlayerChangeAppearance *************************
	;**************************************************************************************************
	RegisterForMenuOpenCloseEvent("LooksMenu")


	;**************************************************************************************************
	;***************************		COM_Event_Action_DischargeWeapon	***************************
	;**************************************************************************************************
	RegisterForRemoteEvent(PlayerRef, "OnPlayerFireWeapon")


	;**************************************************************************************************
	;***************************		COM_Event_Action_UseHandScanner		***************************
	;**************************************************************************************************
	RegisterForRemoteEvent(PlayerRef, "OnPlayerScannedObject")


	;**************************************************************************************************
	;***************************		COM_Event_Action_UseStarbornPower	***************************
	;**************************************************************************************************
	RegisterForRemoteEvent(PlayerRef, "OnSpellCast")


	;**************************************************************************************************
	;***************************		COM_Event_Action_JumpFromHeight		***************************
	;**************************************************************************************************
	RegisterForRemoteEvent(PlayerRef, "OnPlayerFallLongDistance")

	;**************************************************************************************************
	;***************************		COM_Event_Action_HealCompanion		***************************
	;**************************************************************************************************
	RegisterForRemoteEvent(PlayerRef, "OnPlayerHealTeammate")

	;**************************************************************************************************
	;***************************	  COM_Event_Action_JailComplete			***************************
	;**************************************************************************************************
	RegisterForRemoteEvent(PlayerRef, "OnPlayerJail")


	;**************************************************************************************************
	;***************************	  COM_Event_Action_DrinkAlcohol			***************************
	;***************************	  COM_Event_Action_Consume_Alcohol		***************************
	;**************************************************************************************************
	;TO DO: Replace this with new OnContainerLooted event
	;TTP #2312
	RegisterForRemoteEvent(PlayerRef, "OnItemEquipped")


	;**************************************************************************************************
	;***************************	 COM_Event_Action_DropUsefulItem		***************************
	;**************************************************************************************************
	RegisterForRemoteEvent(PlayerRef, "OnItemRemoved")
	;TO DO: add the filter back when we have the new OnContainerLooted event and we use that for LootCorpse and PlayerEncumbered.
	;TTP #2312
	;AddInventoryEventFilter(COM_DropUsefulItemList) -- THINK I CAN ONLY HAVE ONE PER SCRIPT AND OnItemAdded needs to check container type not item type


	;**************************************************************************************************
	;***************************		COM_Event_Action_LootCorpse			***************************
	;***************************		COM_Event_Action_BecomeOverEncumbered	***********************
	;***************************		COM_Event_Action_Harvest_Animal		***************************
	;***************************		COM_Event_Action_Harvest_Mineral	***************************
	;***************************		COM_Event_Action_Harvest_Plant		***************************
	;**************************************************************************************************
	RegisterForRemoteEvent(PlayerRef, "OnItemAdded")
	AddInventoryEventFilter(None)


	;**************************************************************************************************
	;***************************		COM_Event_Action_Steal				***************************
	;***************************		COM_Event_Action_StealPickpocket		***************************
	;**************************************************************************************************
	RegisterForRemoteEvent(PlayerRef, "OnPlayerItemAdded")
	AddInventoryEventFilter(None)


	;**************************************************************************************************
	;***************************		COM_Event_Action_PickLock 	 		***************************
	;***************************		COM_Event_Action_Hack				***************************
	;**************************************************************************************************
	RegisterForRemoteEvent(PlayerRef, "OnPickLock")

EndEvent

;**************************************************************************************************
;***************************	  COM_Event_Action_JailComplete			***************************
;**************************************************************************************************
Event Actor.OnPlayerJail(Actor akSender, ObjectReference akGuard, Form akFaction, Location akLocation, int aeCrimeGold)
	SendAffinityEvent(COM_Event_Action_JailComplete, akGuard)
EndEvent



;**************************************************************************************************
;***************************		COM_Event_Action_Arrival 	 		***************************
;***************************		COM_Event_Action_ShipBoardingOther	***************************
;***************************		COM_Event_Action_ShipEmbark			***************************
;***************************		COM_Event_Action_WalkAroundNaked	***************************
;**************************************************************************************************
float Timestamp_ShipMoved
Function SetShipMovedTimestamp()
	Timestamp_ShipMoved = Utility.GetCurrentRealTime()
	Trace(self, "SetShipMovedTimestamp() Timestamp_ShipMoved: " + Timestamp_ShipMoved)
EndFunction

Function SetRecentlyDisembarked(bool CheckShipMoved = false)
	float now = Utility.GetCurrentRealTime()
	float timeSinceMoved = now - Timestamp_ShipMoved
	Trace(self, "SetRecentlyDisembarked()CheckShipMoved: " + CheckShipMoved + ", Timestamp_ShipMoved: " + Timestamp_ShipMoved + ", now: " + now + ", timeSinceMoved: " + timeSinceMoved)

	if CheckShipMoved == false || timeSinceMoved < 30
		StartTimer(timerDur_RecentlyDisembarked, TimerID_RecentlyDisembarked)
		SQ_Companions_RecentlyDisembarked.SetValue(1)
	else
		CancelTimer(TimerID_RecentlyDisembarked)
		SQ_Companions_RecentlyDisembarked.SetValue(0)
	endif
	Trace(self, "SetRecentlyDisembarked() SQ_Companions_RecentlyDisembarked.GetValue() " + SQ_Companions_RecentlyDisembarked.GetValue())
EndFunction

Event ReferenceAlias.OnExitShipInterior(ReferenceAlias akSender, ObjectReference akShip)
	Trace(self, "OnExitShipInterior() akSender: " + akSender)
	SetRecentlyDisembarked()
	SendAffinityEvent(COM_Event_Action_Arrival)
EndEvent

Event ReferenceAlias.OnShipGravJump(ReferenceAlias akSender, Location aDestination, int aState)
	Trace(self, "OnShipGravJump() akSender: " + akSender + ", aDestination: " + aDestination + ", aState: " + aState)
	SetShipMovedTimestamp()
EndEvent

Event ReferenceAlias.OnShipFarTravel(ReferenceAlias akSender, Location aDepartureLocation, Location aArrivalLocation, int aState)
	Trace(self, "OnShipFarTravel()akSender: " + akSender + ", aDepartureLocation: " + aDepartureLocation + ", aArrivalLocation: " + aArrivalLocation + ", aState: " + aState)
	SetShipMovedTimestamp()
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSender, Location akOldLoc, Location akNewLoc)
	Trace(self, "OnLocationChange() akSender: " + akSender + ", akOldLoc: " + akOldLoc + ", akNewLoc: " + akNewLoc)

	;REMINDER this is called for the ActiveCompanion alias

	int iClothingSlot = 3 const
	int iSpacesuitSlot = 35 const
	if PlayerRef.WornCoversBipedSlot(iClothingSlot) == false && PlayerRef.WornCoversBipedSlot(iSpacesuitSlot) == false
		SendAffinityEvent(COM_Event_Action_WalkAroundNaked)
	endif

	if akNewLoc
		;are we in a hostile ship?
		SpaceshipReference shipRef = akSender.GetReference().GetCurrentShipRef()
		if shipRef && shipRef.HasKeyword(BEHostileBoardingEncounterKeyword)
			SendAffinityEvent(COM_Event_Action_ShipBoardingOther)
		elseif shipRef
			SendAffinityEvent(COM_Event_Action_ShipEmbark)
		elseif akNewLoc.IsChild(akOldLoc) == false ;ignore leaving a child location into a parent location, assuming player got the line already when entering the parent location earlier
			;try to determine if we've just far traveled or grav jumped to get here - SQ_Companions_RecentlyDisembarked == 1 means recently disembarked
			SetRecentlyDisembarked(CheckShipMoved = true)
			
			bool ignoreCooldown = COM_IgnoreAffinityEventCooldownOnChangeLocation_Locations.Find(akNewLoc) > -1
			Trace(self, "OnLocationChange() ignoreCooldown: " + ignoreCooldown)

			SendAffinityEvent(COM_Event_Action_Arrival, ignoreCooldown = ignoreCooldown)
		endif
	endif

	;trigger a poll timer to check for other location based things - this timer spaces out the things they want to comment on
	StartTimer(TimerDur_Poll, TimerID_Poll)

EndEvent




;**************************************************************************************************
;***************************	COM_Event_Action_ChemAddiction					*******************
;***************************	COM_Event_Action_EnvironmentalDamage_Airborne	*******************
;***************************	COM_Event_Action_EnvironmentalDamage_Corrosive	*******************
;***************************	COM_Event_Action_EnvironmentalDamage_Radiation	*******************
;***************************	COM_Event_Action_EnvironmentalDamage_Thermal	*******************
;**************************************************************************************************
Event OnMagicEffectApply(ObjectReference akTarget, ObjectReference akCaster, MagicEffect akEffect)
	if akTarget == PlayerRef

		if akEffect ==  COM_AddictionEffect
			SendAffinityEvent(COM_Event_Action_ChemAddiction)

		elseif akEffect.HasKeyword(ENV_EnvDamageType_Airborne)
			SendAffinityEvent(COM_Event_Action_EnvironmentalDamage_Airborne, akCaster)

		elseif akEffect.HasKeyword(ENV_EnvDamageType_Corrosive)
			SendAffinityEvent(COM_Event_Action_EnvironmentalDamage_Corrosive, akCaster)

		elseif akEffect.HasKeyword(ENV_EnvDamageType_Radiation)
			SendAffinityEvent(COM_Event_Action_EnvironmentalDamage_Radiation, akCaster)

		elseif akEffect.HasKeyword(ENV_EnvDamageType_Thermal)
			SendAffinityEvent(COM_Event_Action_EnvironmentalDamage_Thermal, akCaster)

		elseif akEffect.HasKeyword(ENV_EffectTypeEnvironmentalDamageSoak)
			SendAffinityEvent(COM_Event_Action_EnvironmentalHazardWarning, akCaster)

		endif
	endif

EndEvent



;**************************************************************************************************
;***************************		COM_Event_Action_UseWorkbench		***************************
;**************************************************************************************************
; COM_Event_Action_UseWorkbench is no longer being used. No companion lines were written for this, 
; so commenting out to prevent the timer delay from firing, but leaving in here in case it's needed for
; future use. Associated bug: GEN-432521. 
;Event Actor.OnPlayerUseWorkBench(Actor akSender, ObjectReference akWorkBench)
;	SendAffinityEvent(COM_Event_Action_UseWorkbench, akWorkBench)
;EndEvent


;**************************************************************************************************
;***************************			COM_Event_Action_Swim			***************************
;**************************************************************************************************
Event Actor.OnPlayerSwimming(Actor akSender)
	SendAffinityEvent(COM_Event_Action_Swim)
EndEvent


;**************************************************************************************************
;***************************		COM_Event_Action_UseStarbornPower	***************************
;**************************************************************************************************
Event ObjectReference.OnSpellCast(ObjectReference akSender, Form akSpell)
	GotoState("Processing")
	if akSpell.HasKeyword(Artifact_Power)
		SendAffinityEvent(COM_Event_Action_UseStarbornPower)
	endif
	GotoState(None)
EndEvent


;**************************************************************************************************
;***************************    COM_Event_Action_Crafting_CreateItem    ***************************
;**************************************************************************************************
Event actor.OnPlayerCraftItem(Actor akSender, ObjectReference akBench, Location akLocation, Form akCreatedItem)
	Trace(self, "OnPlayerCraftItem() akSender: " + akSender + ", akBench: " + akBench + ", akLocation: " + akLocation + ", akCreatedItem: " + akCreatedItem + ",  ")
	SendAffinityEvent(COM_Event_Action_Crafting_CreateItem)
EndEvent


;**************************************************************************************************
;***************************	COM_Event_Action_Crafting_Mod_Armor		***************************
;***************************	COM_Event_Action_Crafting_Mod_Weapon	***************************
;**************************************************************************************************
Event Actor.OnPlayerModArmorWeapon(Actor akSender, Form akBaseObject, ObjectMod akModBaseObject)
	if akBaseObject is Weapon
		SendAffinityEvent(COM_Event_Action_Crafting_Mod_Weapon)
	elseif akBaseObject is Armor
		SendAffinityEvent(COM_Event_Action_Crafting_Mod_Armor)
	endif
endEvent


;**************************************************************************************************
;*************************** COM_Event_Action_Crafting_CreateShipModule	***************************
;**************************************************************************************************
Event Actor.OnPlayerModifiedShip(Actor akSender, SpaceshipReference akShip)
	SendAffinityEvent(COM_Event_Action_Crafting_CreateShipModule, akShip)
EndEvent

;**************************************************************************************************
;************************ COM_Event_Action_Enhance_PlayerChangeAppearance *************************
;**************************************************************************************************
Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)
	if asMenuName == "LooksMenu" && abOpening == false
		SendAffinityEvent(COM_Event_Action_Enhance_PlayerChangeAppearance)
	endif
EndEvent


;**************************************************************************************************
;***************************		COM_Event_Action_DischargeWeapon		***************************
;**************************************************************************************************

Event Actor.OnPlayerFireWeapon(Actor akSender, Form akBaseObject)
	trace(self, "OnPlayerFireWeapon() akBaseObject:" + akBaseObject)



	;trace(self, "OnPlayerFireWeapon")

	;check location keywords for settelements
	;find all ActorTypeNPC refs nearby, see if they are all non-hostile
	;then send the dischargeweapon event

	location locToTest = akSender.GetCurrentLocation()

	if locToTest && akBaseObject && CommonArrayFunctions.CheckFormAgainstKeywordArray(akBaseObject, DischargeWeapon_WeaponKeywordExceptions) == false

		if CommonArrayFunctions.CheckFormAgainstKeywordArray(locToTest, DischargeWeapon_LocationKeywordRequirements)
			trace(self, "OnPlayerFireWeapon - player in settlement area")

			ObjectReference[] NPCs = akSender.FindAllReferencesWithKeyword(ActorTypeNPC, DischargeWeapon_RadiusToLookForHostileActors)

			bool AnyHostiles = CommonArrayFunctions.IsActorInArrayHostileToActor(akSender, NPCs)

			if AnyHostiles == false
				trace(self, "OnPlayerFireWeapon - no hostiles in the area, will send the COM_Event_Action_DischargeWeapon event")

				SendAffinityEvent(COM_Event_Action_DischargeWeapon)
			endif
		endif
	endif
endEvent


;**************************************************************************************************
;***************************		COM_Event_Action_UseHandScanner		***************************
;**************************************************************************************************
Event Actor.OnPlayerScannedObject(Actor akSender, ObjectReference akScannedRef)
	Trace(self, "OnPlayerScannedObject() akSender: " + akSender + ", akScannedRef: " + akScannedRef)

	SendAffinityEvent(COM_Event_Action_UseHandScanner, akScannedRef)
EndEvent



;**************************************************************************************************
;***************************		COM_Event_Action_JumpFromHeight		***************************
;**************************************************************************************************
Event Actor.OnPlayerFallLongDistance(Actor akSender, float afDamage)
	SendAffinityEvent(COM_Event_Action_JumpFromHeight)
endEvent


;**************************************************************************************************
;***************************		COM_Event_Action_HealCompanion		***************************
;**************************************************************************************************
Event Actor.OnPlayerHealTeammate(Actor akSender, Actor akTeammate)
	if akTeammate == Alias_CurrentCompanion.GetActorReference()
		SendAffinityEvent(COM_Event_Action_HealCompanion, akTeammate)
	endif
EndEvent


;**************************************************************************************************
;***************************	  COM_Event_Action_Consume_Alcohol			***************************
;***************************	  COM_Event_Action_Consume_Drugs			***************************
;**************************************************************************************************
Event Actor.OnItemEquipped(Actor akSender, Form akBaseObject, ObjectReference akReference)
	if akBaseObject.HasKeyword(COM_ObjType_ChemBad)
		SendAffinityEvent(COM_Event_Action_Consume_Drugs)
	elseif akBaseObject.HasKeyword(COM_ObjType_Drink)
		SendAffinityEvent(COM_Event_Action_Consume_Alcohol)
    endif
EndEvent


;**************************************************************************************************
;***************************		COM_Event_Action_DropUsefulItem		***************************
;**************************************************************************************************
int iDroppingItemIntoWorld = 3 Const
Event ObjectReference.OnItemRemoved(ObjectReference akSender, Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, int aiTransferReason)
	;assume akDestContainer == None means dropped on ground
	if aiTransferReason == iDroppingItemIntoWorld && akBaseItem.HasKeywordInFormList(COM_DropUsefulItemList_Ignored) == false && akBaseItem.HasKeywordInFormList(COM_DropUsefulItemList) && Game.GetPlayer().IsInCombat() == false
		SendAffinityEvent(COM_Event_Action_DropUsefulItem)
	endif
EndEvent


	;**************************************************************************************************
	;***************************		COM_Event_Action_LootCorpse			***************************
	;***************************		COM_Event_Action_BecomeOverEncumbered	***********************
	;***************************		COM_Event_Action_Harvest_Animal		***************************
	;***************************		COM_Event_Action_Harvest_Mineral	***************************
	;***************************		COM_Event_Action_Harvest_Plant		***************************
	;**************************************************************************************************
;TO DO: Replace this with new OnContainerLooted event
;TTP #2312 Companions: OnLootContainer event.
;#2312 was cut, so we will continue using an unfiltered OnItemAdded
Event ObjectReference.OnItemAdded(ObjectReference akSender, Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)
    GotoState("Processing")
	Actor containerActor = akSourceContainer as Actor
    if containerActor && containerActor.IsDead()
		if akBaseItem.HasKeyword(ResourceTypeOrganic)
			SendAffinityEvent(COM_Event_Action_Harvest_Animal) ;is an animal "part"
			;NOTE: this is ALSO sent by SQ_ParentScript.HarvestActor()
		else
    		SendAffinityEvent(COM_Event_Action_LootCorpse, targetRef = akSourceContainer) ;is something else
		endif
    endif

	if akSourceContainer
		if akSourceContainer.HasKeyword(FloraTypeInorganic)
			SendAffinityEvent(COM_Event_Action_Harvest_Mineral) ;came from a mineral type flora
		elseif akSourceContainer.HasKeyword(FloraTypeOrganic)
			SendAffinityEvent(COM_Event_Action_Harvest_Plant) ;came for a plant type flora
		endif
	endif

    if PlayerRef.IsOverEncumbered()
    	SendAffinityEvent(COM_Event_Action_BecomeOverEncumbered)
    endif
	GotoState(None)
EndEvent


;**************************************************************************************************
;***************************		COM_Event_Action_Steal				***************************
;***************************		COM_Event_Action_StealPickpocket	***************************
;**************************************************************************************************
; Received when the player gains an item in their inventory
; aeAcquireType is one of the following:
; 0: None
; 1: Steal
; 2: Buy
; 3: Pickpocket
; 4: Pickup
; 5: Container
; 6: Dead body
Event Actor.OnPlayerItemAdded(Actor akSender, Form akBaseObject, ObjectReference akOwner, ObjectReference akSourceContainer, int aeAcquireType)
	Actor CompanionRef = ActiveCompanion.GetActorRef()
	if aeAcquireType == 1 && CompanionRef.HasDetectionLOS(PlayerRef)
		SendAffinityEvent(COM_Event_Action_Steal)
	elseif aeAcquireType == 3 && CompanionRef.HasDetectionLOS(PlayerRef)
		SendAffinityEvent(COM_Event_Action_StealPickpocket)
	endif
endEvent



;**************************************************************************************************
;************************** COM_Event_Action_Crafting_CreateOutpostModule *************************
;**************************************************************************************************
;called by OutpostBeaconScript
Function OutpostObjectPlaced(ObjectReference placedRef)
	Trace(self, "OutpostObjectPlaced() placedRef: " + placedRef)
	SendAffinityEvent(COM_Event_Action_Crafting_CreateOutpostModule, placedRef)
EndFunction



;**************************************************************************************************
;***************************		COM_Event_Action_GravityHigh		***************************
;***************************		COM_Event_Action_GravityLow			***************************
;***************************		COM_Event_Action_ZeroG				***************************
;**************************************************************************************************
float lastCompanionGravityScale = 1.0
Function CheckAndSendGravityEvents()
	Trace(self, "CheckAndSendGravityEvents() ")
	Actor companionRef = ActiveCompanion.GetActorReference()
	if companionRef
		float companionGravityScale = companionRef.GetGravityScale()

		Trace(self, "CheckAndSendGravityEvents() companionGravityScale: " + companionGravityScale + ", lastCompanionGravityScale: " + lastCompanionGravityScale)
		if companionGravityScale != lastCompanionGravityScale
			lastCompanionGravityScale = companionGravityScale

			;send affinity event
			if companionGravityScale > COM_Event_Action_GravityHigh_Threshold
				Trace(self, "CheckAndSendGravityEvents() sending COM_Event_Action_GravityHigh")
				SendAffinityEvent(COM_Event_Action_GravityHigh)
			elseif companionGravityScale < COM_Event_Action_GravityLow_Threshold
				Trace(self, "CheckAndSendGravityEvents() sending COM_Event_Action_GravityLow")
				SendAffinityEvent(COM_Event_Action_GravityLow)
			elseif companionGravityScale <= 0
				Trace(self, "CheckAndSendGravityEvents() sending CheckAndSendGravityEvents")
				SendAffinityEvent(COM_Event_Action_ZeroG)
			else
				Trace(self, "CheckAndSendGravityEvents() gravity normal, NOT sending an affinity event.")
			endif

		endif
	endif
EndFunction


;**************************************************************************************************
;***************************		COM_Event_Action_TempHigh			***************************
;***************************		COM_Event_Action_TempLow			***************************
;**************************************************************************************************
int lastCompanionTemperature = 0 
int iTemp_Hot = 1 Const
int iTemp_Normal = 0 Const ;normal "enough" - only extreme temps are considered for commenting on
int iTemp_Cold = -1 Const

Function CheckAndSendTemperatureEvents()
	Trace(self, "CheckAndSendTemperatureEvents() ")
	Actor companionRef = ActiveCompanion.GetActorReference()
	if companionRef 

		if COM_CREW_CND_Comment_TemperatureCommentsAllowed.IsTrue(akRefObject = companionRef) == false
			Trace(self, "CheckAndSendTemperatureEvents() COM_CREW_CND_Comment_TemperatureCommentsAllowed is false, skipping temperature comment ")
		else
			int temperature = iTemp_Normal

			if companionRef.GetCurrentPlanet().HasKeywordInFormList(COM_LocationKeywords_VeryHot)
				temperature = iTemp_Hot
			elseif companionRef.GetCurrentPlanet().HasKeywordInFormList(COM_LocationKeywords_VeryCold)
				temperature = iTemp_Cold
			endif

			Trace(self, "CheckAndSendTemperatureEvents() temperature: " + temperature + ", lastCompanionTemperature: " + lastCompanionTemperature)
			if temperature != lastCompanionTemperature
				lastCompanionTemperature = temperature

				;send affinity event
				if temperature >= iTemp_Hot
					Trace(self, "CheckAndSendTemperatureEvents() sending COM_Event_Action_GravityHigh")
					SendAffinityEvent(COM_Event_Action_TempHigh)
				elseif temperature <= iTemp_Cold
					Trace(self, "CheckAndSendTemperatureEvents() sending COM_Event_Action_GravityLow")
					SendAffinityEvent(COM_Event_Action_TempLow)
				else
					Trace(self, "CheckAndSendTemperatureEvents() temp normal, NOT sending an affinity event.")
				endif

			endif

		endif
	endif
EndFunction


;**************************************************************************************************
;***************************		COM_Event_Action_PickLock 	 		***************************
;***************************		COM_Event_Action_Hack				***************************
;**************************************************************************************************
event Actor.OnPickLock(Actor akSender, ObjectReference akLockedRef, bool abCrime, bool abSucceeded, TerminalMenu akLockedTerminalMenu, int aiTerminalMenuItem)
	Trace(self, "OnPickLock() akLockedRef: " + akLockedRef + ", abSucceeded: " + abSucceeded)

	if abSucceeded
		if akLockedRef.GetBaseObject() is Terminal
			Trace(self, "OnPickLock() sending COM_Event_Action_Hack")
			SendAffinityEvent(COM_Event_Action_Hack)
		else
			Trace(self, "OnPickLock() sending COM_Event_Action_PickLock")
			SendAffinityEvent(COM_Event_Action_PickLock)
		endif
	endif
EndEvent




;--------------------------------------------------------------------------------------------------





;**************************************************************************************************
;***************************			 SendAffinityEvent				***************************
;**************************************************************************************************
Function SendAffinityEvent(AffinityEvent EventToSend, ObjectReference targetRef = none, bool ignoreCooldown = false)
	Trace(self, "SendAffinityEvent() EventToSend: " + EventToSend + ", ignoreCooldown: " + ignoreCooldown)

	bool PlayerInDialogue = Game.IsPlayerInDialogue()
	
	bool CompanionInScene = false
	Actor companionRef = ActiveCompanion.GetActorReference()
	if companionRef
		CompanionInScene = companionRef.IsInScene()
	endif

	if ignoreCooldown
		CoolingDown = false
	endif


	Trace(self, "SendAffinityEvent() EventToSend:" + EventToSend + ", targetRef: " + targetRef + ", PlayerInDialogue: " + PlayerInDialogue + ", CompanionInScene: " + CompanionInScene + ", CoolingDown: " + CoolingDown)

	if CoolingDown == false && PlayerInDialogue == false && CompanionInScene == false && IsNearImportantScene() == false
		Trace(self, "SendAffinityEvent() sending EventToSend:" + EventToSend)
		EventToSend.send(akTarget = targetRef)
		StartCoolDownTimer()
	Else
		Trace(self, "SendAffinityEvent() NOT sending EventToSend:" + EventToSend)
	endif

EndFunction

bool Function IsNearImportantScene(bool CheckPlayer = true, bool CheckCompanion = true)

	bool returnVal

	int i = 0
	While (returnVal == false && i < ImportantSceneData.length)
		ImportantSceneDatum currentDatum = ImportantSceneData[i]

		bool sceneIsPlaying = currentDatum.ImportantScene.IsPlaying()

		Trace(self, "IsNearImportantScene() ImportantScene: " + currentDatum.ImportantScene + ", sceneIsPlaying: " + sceneIsPlaying)
		if sceneIsPlaying
				
			ObjectReference refToCheck = currentDatum.aliasToCheck.GetReference()

			if CheckPlayer && Game.GetPlayer().GetDistance(refToCheck) <= SceneNearDistance
				Trace(self, "IsNearImportantScene() player is nearby and we care about that.")
				returnVal = true

			elseif CheckCompanion
				ObjectReference companionRef = ActiveCompanion.GetReference()

				if companionRef && companionRef.GetDistance(refToCheck) <= SceneNearDistance
					Trace(self, "IsNearImportantScene() companion is nearby and we care about that.")
					returnVal = true
				endif
			endif
		endif

		i += 1
	EndWhile

	Trace(self, "IsNearImportantScene() returnVal: " + returnVal)
	return returnVal
EndFunction



Function DebugResetActionFilterCooldown()
	Trace(self, "DebugResetActionFilterCooldown() setting CoolingDown to false ")
	CoolingDown = false
EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "Companions",  string SubLogName = "AffinityEventScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "Companions",  string SubLogName = "AffinityEventScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction
