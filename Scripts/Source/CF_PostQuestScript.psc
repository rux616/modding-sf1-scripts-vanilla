Scriptname CF_PostQuestScript extends Quest
{Quest script for CF_Post, the CF Postquest Script.}

Group QuestProperties
	ActorValue[] property VigilanceSystemActorValues Auto Const Mandatory
	DialogueShipServicesScript property DialogueShipServices Auto Const Mandatory
EndGroup

Group AutofillProperties
	SQ_PlayerShipScript property SQ_PlayerShip Auto Const Mandatory
	LocationAlias property SuvorovOrbitLocation Auto Const Mandatory

	ReferenceAlias property TheKey Auto Const Mandatory
	ReferenceAlias property Vigilance Auto Const Mandatory
	ReferenceAlias property PlayerShip Auto Const Mandatory
	ReferenceAlias property PlayerShipPilotSeat Auto Const Mandatory
	ReferenceAlias property TheKeyMapMarker Auto Const Mandatory

	ReferenceAlias property Captain_RokovShip Auto Const Mandatory
	ReferenceAlias property Captain_MathisShip Auto Const Mandatory
	ReferenceAlias property Captain_NaevaShip Auto Const Mandatory
	ReferenceAlias property Captain_AdlerShip Auto Const Mandatory
	ReferenceAlias property Captain_HuanShip Auto Const Mandatory
	ReferenceAlias property Captain_EstelleShip Auto Const Mandatory

	GlobalVariable property CrimsonFleetCaptainState_Rokov Auto Const Mandatory
	GlobalVariable property CrimsonFleetCaptainState_Mathis Auto Const Mandatory
	GlobalVariable property CrimsonFleetCaptainState_Naeva Auto Const Mandatory
	GlobalVariable property CrimsonFleetCaptainState_Adler Auto Const Mandatory
	GlobalVariable property CrimsonFleetCaptainState_Huan Auto Const Mandatory
	GlobalVariable property CrimsonFleetCaptainState_Estelle Auto Const Mandatory

	ReferenceAlias property CFPost_CFVigilanceMarker Auto Const Mandatory
	ReferenceAlias property CFPost_SDVigilanceMarker Auto Const Mandatory
	Faction property CrimeFactionUC Auto Const Mandatory
	Faction property UCSysDefFaction Auto Const Mandatory
	Faction property CrimeFactionCrimsonFleet Auto Const Mandatory
	ActorValue property Health Auto Const Mandatory
EndGroup

;Local Variables
bool waitingForPlayerToSit

;Local Consts
;Standard values for the CF Captain State globals.
int CONST_CaptainState_Active = 0 Const
int CONST_CaptainState_Inactive = 1 Const
int CONST_CaptainState_Dead = 2 Const
int CONST_CaptainState_Imprisoned = 3 Const
int CONST_CaptainState_Freed = 4 Const

;Vigilance values.
float CONST_VigilanceCrippledHealthPercent = 0.05 Const

;Stages
int CONST_Stage_QuickstartCF = 0 Const
int CONST_Stage_QuickstartSD = 1 Const
int CONST_Stage_PostquestStartup_CF = 100 Const
int CONST_Stage_PostquestFinal_CF = 110 Const
int CONST_Stage_PostquestStartup_SD = 200 Const
int CONST_Stage_PostquestFinal_SD = 210 Const


;------------------------------------
;Quickstart Setup
;-----------------

;DEBUG - For quickstarts, force the player onto their ship (spawned by the LC088 Quickstarts), then move them to the Key.
Function QuickstartToKey()
	Actor player = Game.GetPlayer()
	InputEnableLayer myEnableLayer = InputEnableLayer.Create()
	myEnableLayer.DisablePlayerControls(abCamSwitch=True)
	SpaceshipReference playerShipRef = PlayerShip.GetShipRef()
	playerShipRef.InstantUndock()
	playerShipRef.MoveTo(TheKeyMapMarker.GetRef().GetLinkedRef())
	player.MoveTo(playerShipRef)
	PlayerShipPilotSeat.GetRef().Activate(player)
	myEnableLayer.Delete()
EndFunction


;------------------------------------
;Postquest Functions
;--------------------

Function RegisterForPostquestLocationChange()
	RegisterForRemoteEvent(PlayerShip, "OnLocationChange")
EndFunction

Event ReferenceAlias.OnLocationChange(ReferenceAlias source, Location akOldLoc, Location akNewLoc)
	Location survorovOrbitLoc = SuvorovOrbitLocation.GetLocation()
	if ((akNewLoc != survorovOrbitLoc) && (!survorovOrbitLoc.IsChild(akNewLoc)))
		UnregisterForRemoteEvent(PlayerShip, "OnLocationChange")
		if (GetStageDone(CONST_Stage_PostquestStartup_CF))
			SetStage(CONST_Stage_PostquestFinal_CF)
		ElseIf (GetStageDone(CONST_Stage_PostquestStartup_SD))
			SetStage(CONST_Stage_PostquestFinal_SD)
		EndIf
	EndIf
EndEvent


;------------------------------------
;Postquest - CF
;---------------

Function CF_CleanupAllCaptainShips()
	CF_CleanupCaptainShip(CrimsonFleetCaptainState_Rokov.GetValueInt(), Captain_RokovShip)
	CF_CleanupCaptainShip(CrimsonFleetCaptainState_Mathis.GetValueInt(), Captain_MathisShip)
	CF_CleanupCaptainShip(CrimsonFleetCaptainState_Naeva.GetValueInt(), Captain_NaevaShip)
	CF_CleanupCaptainShip(CrimsonFleetCaptainState_Adler.GetValueInt(), Captain_AdlerShip)
	CF_CleanupCaptainShip(CrimsonFleetCaptainState_Huan.GetValueInt(), Captain_HuanShip)
	CF_CleanupCaptainShip(CrimsonFleetCaptainState_Estelle.GetValueInt(), Captain_EstelleShip)
EndFunction

Function CF_CleanupCaptainShip(int captainState, ReferenceAlias captainShip)
	if (captainState == CONST_CaptainState_Active)
		SpaceshipReference captainShipRef = captainShip.GetShipRef()
		captainShipRef.EnableNoWait()
		if (captainShipRef.IsDockedWith(Vigilance.GetShipRef()))
			captainShipRef.InstantUndock()
		EndIf
		captainShip.TryToEvaluatePackage()
		captainShipRef.InstantDock(TheKey.GetShipRef())
	EndIf
EndFunction

Function CF_ConvertVigilance()
	SpaceshipReference vigilanceRef = Vigilance.GetShipRef()
	vigilanceRef.RemoveFromFaction(CrimeFactionUC)
	vigilanceRef.RemoveFromFaction(UCSysDefFaction)
	vigilanceRef.AddToFaction(CrimeFactionCrimsonFleet)
EndFunction


Function CF_DisableCaptainShips()
	Captain_RokovShip.TryToDisableNoWait()
	Captain_MathisShip.TryToDisableNoWait()
	Captain_AdlerShip.TryToDisableNoWait()
	Captain_HuanShip.TryToDisableNoWait()
	Captain_EstelleShip.TryToDisableNoWait()
EndFunction

Function CF_MoveAndCrippleVigilance()
	SpaceshipReference vigilanceRef = Vigilance.GetShipRef()
	vigilanceRef.Enable()
	vigilanceRef.MoveTo(CFPost_CFVigilanceMarker.GetRef())
	int i = 0
	While (i < VigilanceSystemActorValues.Length)
		vigilanceRef.EnablePartRepair(VigilanceSystemActorValues[i], False)
		vigilanceRef.DamageValue(VigilanceSystemActorValues[i], vigilanceRef.GetValue(VigilanceSystemActorValues[i]))
		i = i + 1
	EndWhile
	vigilanceRef.EnablePartRepair(Health, False)
	vigilanceRef.DamageValue(Health, vigilanceRef.GetValue(Health) * (1-CONST_VigilanceCrippledHealthPercent))
EndFunction


;------------------------------------
;Postquest - SD
;---------------

Function SD_CleanupAllCaptainShips()
	SD_CleanupCaptainShip(CrimsonFleetCaptainState_Rokov.GetValueInt(), Captain_RokovShip)
	SD_CleanupCaptainShip(CrimsonFleetCaptainState_Mathis.GetValueInt(), Captain_MathisShip)
	SD_CleanupCaptainShip(CrimsonFleetCaptainState_Naeva.GetValueInt(), Captain_NaevaShip)
	SD_CleanupCaptainShip(CrimsonFleetCaptainState_Adler.GetValueInt(), Captain_AdlerShip)
	SD_CleanupCaptainShip(CrimsonFleetCaptainState_Huan.GetValueInt(), Captain_HuanShip)
	SD_CleanupCaptainShip(CrimsonFleetCaptainState_Estelle.GetValueInt(), Captain_EstelleShip)
EndFunction

Function SD_CleanupCaptainShip(int captainState, ReferenceAlias captainShip)
	if (captainState == CONST_CaptainState_Active)
		captainShip.GetShipRef().DisableNoWait()
	EndIf
EndFunction

Function SD_MoveVigilance()
	SpaceshipReference vigilanceRef = Vigilance.GetShipRef()
	vigilanceRef.Enable()
	vigilanceRef.MoveTo(CFPost_SDVigilanceMarker.GetRef())
EndFunction