# Starfield Papyrus Scripts Master List

Starfield v1.13.61.0

## Table Of Contents
- [Starfield Papyrus Scripts Master List](#starfield-papyrus-scripts-master-list)
    - [Table Of Contents](#table-of-contents)
- [Inheritance](#inheritance)
- [Details](#details)
    - [Script: Debug](#script-debug)
        - [Function: AutomatedTestLogDebug (Native) (Global)](#function-automatedtestlogdebug-native-global)
        - [Function: AutomatedTestLogError (Native) (Global)](#function-automatedtestlogerror-native-global)
        - [Function: AutomatedTestLogProgress (Native) (Global)](#function-automatedtestlogprogress-native-global)
        - [Function: CenterOnCell (Native) (Global)](#function-centeroncell-native-global)
        - [Function: CenterOnCellAndWait (Native) (Global)](#function-centeroncellandwait-native-global)
        - [Function: PlayerMoveToAndWait (Native) (Global)](#function-playermovetoandwait-native-global)
        - [Function: CloseUserLog (Native) (Global)](#function-closeuserlog-native-global)
        - [Function: DBSendPlayerPosition (Native) (Global)](#function-dbsendplayerposition-native-global)
        - [Function: DumpAliasData (Native) (Global)](#function-dumpaliasdata-native-global)
        - [Function: DumpEventRegistrations (Native) (Global)](#function-dumpeventregistrations-native-global)
        - [Function: EnableAI (Native) (Global)](#function-enableai-native-global)
        - [Function: EnableCollisions (Native) (Global)](#function-enablecollisions-native-global)
        - [Function: EnableDetection (Native) (Global)](#function-enabledetection-native-global)
        - [Function: EnableMenus (Native) (Global)](#function-enablemenus-native-global)
        - [Function: ExecuteConsole (Native) (Global)](#function-executeconsole-native-global)
        - [Function: GetConfigName (Native) (Global)](#function-getconfigname-native-global)
        - [Function: GetPlatformName (Native) (Global)](#function-getplatformname-native-global)
        - [Function: GetVersionNumber (Native) (Global)](#function-getversionnumber-native-global)
        - [Function: MessageBox (Native) (Global)](#function-messagebox-native-global)
        - [Function: Notification (Native) (Global)](#function-notification-native-global)
        - [Function: OpenUserLog (Native) (Global)](#function-openuserlog-native-global)
        - [Function: QuitGame (Native) (Global)](#function-quitgame-native-global)
        - [Function: SetGodMode (Native) (Global)](#function-setgodmode-native-global)
        - [Function: ShowRefPosition (Native) (Global)](#function-showrefposition-native-global)
        - [Function: StartScriptProfiling (Native) (Global)](#function-startscriptprofiling-native-global)
        - [Function: StartStackProfiling (Native) (Global)](#function-startstackprofiling-native-global)
        - [Function: StartStackRootProfiling (Native) (Global)](#function-startstackrootprofiling-native-global)
        - [Function: StopScriptProfiling (Native) (Global)](#function-stopscriptprofiling-native-global)
        - [Function: StopStackProfiling (Native) (Global)](#function-stopstackprofiling-native-global)
        - [Function: StopStackRootProfiling (Native) (Global)](#function-stopstackrootprofiling-native-global)
        - [Function: Trace (Native) (Global)](#function-trace-native-global)
        - [Function: TraceFunction (Native) (Global)](#function-tracefunction-native-global)
        - [Function: TraceStack (Native) (Global)](#function-tracestack-native-global)
        - [Function: TraceUser (Native) (Global)](#function-traceuser-native-global)
        - [Function: TraceConditionalGlobal (Global)](#function-traceconditionalglobal-global)
        - [Function: TraceConditional (Global)](#function-traceconditional-global)
        - [Function: TraceAndBox (Global)](#function-traceandbox-global)
        - [Function: TraceSelf (Global)](#function-traceself-global)
        - [Function: TraceLog (Global)](#function-tracelog-global)
    - [Script: Game](#script-game)
        - [Function: AddAchievement (Native) (Global)](#function-addachievement-native-global)
        - [Function: AddToAvailableCrew (Native) (Global)](#function-addtoavailablecrew-native-global)
        - [Function: AddPerkPoints (Native) (Global)](#function-addperkpoints-native-global)
        - [Function: AddPlayerOwnedShip (Native) (Global)](#function-addplayerownedship-native-global)
        - [Function: AdvanceSkill (Native) (Global)](#function-advanceskill-native-global)
        - [Function: AreHostileActorsNear (Native) (Global)](#function-arehostileactorsnear-native-global)
        - [Function: ClearPrison (Native) (Global)](#function-clearprison-native-global)
        - [Function: ClearTempEffects (Native) (Global)](#function-cleartempeffects-native-global)
        - [Function: Error (Native) (Global)](#function-error-native-global)
        - [Function: FadeOutGame (Native) (Global)](#function-fadeoutgame-native-global)
        - [Function: FastTravel (Native) (Global)](#function-fasttravel-native-global)
        - [Function: FindClosestReferenceOfType (Native) (Global)](#function-findclosestreferenceoftype-native-global)
        - [Function: FindRandomReferenceOfType (Native) (Global)](#function-findrandomreferenceoftype-native-global)
        - [Function: FindClosestReferenceOfAnyTypeInList (Native) (Global)](#function-findclosestreferenceofanytypeinlist-native-global)
        - [Function: FindRandomReferenceOfAnyTypeInList (Native) (Global)](#function-findrandomreferenceofanytypeinlist-native-global)
        - [Function: FindClosestReferenceOfTypeFromRef (Global)](#function-findclosestreferenceoftypefromref-global)
        - [Function: FindRandomReferenceOfTypeFromRef (Global)](#function-findrandomreferenceoftypefromref-global)
        - [Function: FindClosestReferenceOfAnyTypeInListFromRef (Global)](#function-findclosestreferenceofanytypeinlistfromref-global)
        - [Function: FindRandomReferenceOfAnyTypeInListFromRef (Global)](#function-findrandomreferenceofanytypeinlistfromref-global)
        - [Function: FindClosestActor (Native) (Global)](#function-findclosestactor-native-global)
        - [Function: FindClosestLivingActor (Native) (Global)](#function-findclosestlivingactor-native-global)
        - [Function: FindRandomActor (Native) (Global)](#function-findrandomactor-native-global)
        - [Function: FindRandomLivingActor (Native) (Global)](#function-findrandomlivingactor-native-global)
        - [Function: FindClosestActorFromRef (Global)](#function-findclosestactorfromref-global)
        - [Function: FindClosestLivingActorFromRef (Global)](#function-findclosestlivingactorfromref-global)
        - [Function: FindRandomActorFromRef (Global)](#function-findrandomactorfromref-global)
        - [Function: FindRandomLivingActorFromRef (Global)](#function-findrandomlivingactorfromref-global)
        - [Function: ForceDisableSSRDirLight (Native) (Global)](#function-forcedisablessrdirlight-native-global)
        - [Function: ForceThirdPerson (Native) (Global)](#function-forcethirdperson-native-global)
        - [Function: ForceFirstPerson (Native) (Global)](#function-forcefirstperson-native-global)
        - [Function: GetXPForLevel (Native) (Global)](#function-getxpforlevel-native-global)
        - [Function: ShowFirstPersonGeometry (Native) (Global)](#function-showfirstpersongeometry-native-global)
        - [Function: ShowAllMapMarkers (Native) (Global)](#function-showallmapmarkers-native-global)
        - [Function: GameplayAutomatedTestComplete (Native) (Global)](#function-gameplayautomatedtestcomplete-native-global)
        - [Function: GetAggressionAV (Native) (Global)](#function-getaggressionav-native-global)
        - [Function: GetAgilityAV (Native) (Global)](#function-getagilityav-native-global)
        - [Function: GetAllLocations (Native) (Global)](#function-getalllocations-native-global)
        - [Function: GetMatchingLocations (Native) (Global)](#function-getmatchinglocations-native-global)
        - [Function: GetMatchingLocation (Global)](#function-getmatchinglocation-global)
        - [Function: GetCameraHeadingAngle (Native) (Global)](#function-getcameraheadingangle-native-global)
        - [Function: GetCaps (Global)](#function-getcaps-global)
        - [Function: GetCredits (Global)](#function-getcredits-global)
        - [Function: GetCharismaAV (Native) (Global)](#function-getcharismaav-native-global)
        - [Function: GetConfidenceAV (Native) (Global)](#function-getconfidenceav-native-global)
        - [Function: GetDieRoll (Global)](#function-getdieroll-global)
        - [Function: GetDieRollSuccess (Global)](#function-getdierollsuccess-global)
        - [Function: GetDifficulty (Native) (Global)](#function-getdifficulty-native-global)
        - [Function: GetEnduranceAV (Native) (Global)](#function-getenduranceav-native-global)
        - [Function: GetForm (Native) (Global)](#function-getform-native-global)
        - [Function: GetFormFromFile (Native) (Global)](#function-getformfromfile-native-global)
        - [Function: GetGameSettingFloat (Native) (Global)](#function-getgamesettingfloat-native-global)
        - [Function: GetGameSettingInt (Native) (Global)](#function-getgamesettingint-native-global)
        - [Function: GetGameSettingString (Native) (Global)](#function-getgamesettingstring-native-global)
        - [Function: GetGameSettingUInt (Native) (Global)](#function-getgamesettinguint-native-global)
        - [Function: GetGameSettingBool (Native) (Global)](#function-getgamesettingbool-native-global)
        - [Function: GetHealthAV (Native) (Global)](#function-gethealthav-native-global)
        - [Function: GetIntelligenceAV (Native) (Global)](#function-getintelligenceav-native-global)
        - [Function: GetLuckAV (Native) (Global)](#function-getluckav-native-global)
        - [Function: GetInvulnerableAV (Native) (Global)](#function-getinvulnerableav-native-global)
        - [Function: GetPerceptionAV (Native) (Global)](#function-getperceptionav-native-global)
        - [Function: GetPlayer (Native) (Global)](#function-getplayer-native-global)
        - [Function: GetPlayerActiveQuests (Native) (Global)](#function-getplayeractivequests-native-global)
        - [Function: GetPlayerActiveDialogueUnsaidInfo (Native) (Global)](#function-getplayeractivedialogueunsaidinfo-native-global)
        - [Function: GetPlayerFollowers (Native) (Global)](#function-getplayerfollowers-native-global)
        - [Function: GetPlayerLevel (Global)](#function-getplayerlevel-global)
        - [Function: GetPlayerGrabbedRef (Native) (Global)](#function-getplayergrabbedref-native-global)
        - [Function: GetPlayerRadioFrequency (Native) (Global)](#function-getplayerradiofrequency-native-global)
        - [Function: GetPlayersLastRiddenHorse (Native) (Global)](#function-getplayerslastriddenhorse-native-global)
        - [Function: GetRealHoursPassed (Native) (Global)](#function-getrealhourspassed-native-global)
        - [Function: GetSuspiciousAV (Native) (Global)](#function-getsuspiciousav-native-global)
        - [Function: GetStrengthAV (Native) (Global)](#function-getstrengthav-native-global)
        - [Function: GivePlayerCaps (Global)](#function-giveplayercaps-global)
        - [Function: HideContrabandScanWarning (Native) (Global)](#function-hidecontrabandscanwarning-native-global)
        - [Function: HideHudMenus (Native) (Global)](#function-hidehudmenus-native-global)
        - [Function: RemovePlayerCaps (Global)](#function-removeplayercaps-global)
        - [Function: IncrementSkill (Native) (Global)](#function-incrementskill-native-global)
        - [Function: IncrementStat (Native) (Global)](#function-incrementstat-native-global)
        - [Function: IsActivateControlsEnabled (Native) (Global)](#function-isactivatecontrolsenabled-native-global)
        - [Function: IsAutomatedTestControllingPlayerInProgress (Native) (Global)](#function-isautomatedtestcontrollingplayerinprogress-native-global)
        - [Function: IsVATSControlsEnabled (Native) (Global)](#function-isvatscontrolsenabled-native-global)
        - [Function: IsVATSPlaybackActive (Native) (Global)](#function-isvatsplaybackactive-native-global)
        - [Function: IsCamSwitchControlsEnabled (Native) (Global)](#function-iscamswitchcontrolsenabled-native-global)
        - [Function: IsFarTravelControlsEnabled (Native) (Global)](#function-isfartravelcontrolsenabled-native-global)
        - [Function: IsFastTravelControlsEnabled (Native) (Global)](#function-isfasttravelcontrolsenabled-native-global)
        - [Function: IsFastTravelEnabled (Native) (Global)](#function-isfasttravelenabled-native-global)
        - [Function: IsFavoritesControlsEnabled (Native) (Global)](#function-isfavoritescontrolsenabled-native-global)
        - [Function: IsGravJumpControlsEnabled (Native) (Global)](#function-isgravjumpcontrolsenabled-native-global)
        - [Function: IsGuardPursuingPlayer (Native) (Global)](#function-isguardpursuingplayer-native-global)
        - [Function: IsTakeoffControlsEnabled (Native) (Global)](#function-istakeoffcontrolsenabled-native-global)
        - [Function: IsFightingControlsEnabled (Native) (Global)](#function-isfightingcontrolsenabled-native-global)
        - [Function: IsJournalControlsEnabled (Native) (Global)](#function-isjournalcontrolsenabled-native-global)
        - [Function: IsJumpingControlsEnabled (Native) (Global)](#function-isjumpingcontrolsenabled-native-global)
        - [Function: IsLookingControlsEnabled (Native) (Global)](#function-islookingcontrolsenabled-native-global)
        - [Function: IsMenuControlsEnabled (Native) (Global)](#function-ismenucontrolsenabled-native-global)
        - [Function: IsMovementControlsEnabled (Native) (Global)](#function-ismovementcontrolsenabled-native-global)
        - [Function: IsPluginInstalled (Native) (Global)](#function-isplugininstalled-native-global)
        - [Function: IsPlayerInDialogue (Native) (Global)](#function-isplayerindialogue-native-global)
        - [Function: IsPlayerInMessageBox (Native) (Global)](#function-isplayerinmessagebox-native-global)
        - [Function: IsPlayerInRadioRange (Native) (Global)](#function-isplayerinradiorange-native-global)
        - [Function: IsPlayerListening (Native) (Global)](#function-isplayerlistening-native-global)
        - [Function: IsPlayerLoitering (Native) (Global)](#function-isplayerloitering-native-global)
        - [Function: IsPlayerSpaceshipOwner (Native) (Global)](#function-isplayerspaceshipowner-native-global)
        - [Function: IsPlayerRadioOn (Native) (Global)](#function-isplayerradioon-native-global)
        - [Function: IsResearchComplete (Native) (Global)](#function-isresearchcomplete-native-global)
        - [Function: IsSneakingControlsEnabled (Native) (Global)](#function-issneakingcontrolsenabled-native-global)
        - [Function: PassTime (Native) (Global)](#function-passtime-native-global)
        - [Function: PlayBink (Native) (Global)](#function-playbink-native-global)
        - [Function: PlayBinkNoWait (Native) (Global)](#function-playbinknowait-native-global)
        - [Function: PrecacheCharGen (Native) (Global)](#function-precachechargen-native-global)
        - [Function: PrecacheCharGenClear (Native) (Global)](#function-precachechargenclear-native-global)
        - [Function: PopPlayerTo (Native) (Global)](#function-popplayerto-native-global)
        - [Function: QueryStat (Native) (Global)](#function-querystat-native-global)
        - [Function: QuitToMainMenu (Native) (Global)](#function-quittomainmenu-native-global)
        - [Function: RemoveFromAvailableCrew (Native) (Global)](#function-removefromavailablecrew-native-global)
        - [Function: RemovePlayerOwnedShip (Native) (Global)](#function-removeplayerownedship-native-global)
        - [Function: RequestAutoSave (Native) (Global)](#function-requestautosave-native-global)
        - [Function: RequestDialogueSkip (Native) (Global)](#function-requestdialogueskip-native-global)
        - [Function: RequestDialogueExit (Native) (Global)](#function-requestdialogueexit-native-global)
        - [Function: RequestDialogueSelect (Native) (Global)](#function-requestdialogueselect-native-global)
        - [Function: RequestGameplayBotState (Native) (Global)](#function-requestgameplaybotstate-native-global)
        - [Function: RequestMessageBoxSelect (Native) (Global)](#function-requestmessageboxselect-native-global)
        - [Function: RequestHUDRolloverRefresh (Native) (Global)](#function-requesthudrolloverrefresh-native-global)
        - [Function: RequestModel (Native) (Global)](#function-requestmodel-native-global)
        - [Function: RequestSave (Native) (Global)](#function-requestsave-native-global)
        - [Function: RequestSaveByName (Native) (Global)](#function-requestsavebyname-native-global)
        - [Function: CreateStarbornGame (Native) (Global)](#function-createstarborngame-native-global)
        - [Function: RewardPlayerXP (Native) (Global)](#function-rewardplayerxp-native-global)
        - [Function: ServeTime (Native) (Global)](#function-servetime-native-global)
        - [Function: SetCameraTarget (Native) (Global)](#function-setcameratarget-native-global)
        - [Function: SetCharGenHUDMode (Native) (Global)](#function-setchargenhudmode-native-global)
        - [Function: SetHandscannerDistortionLevel (Native) (Global)](#function-sethandscannerdistortionlevel-native-global)
        - [Function: SetInChargen (Native) (Global)](#function-setinchargen-native-global)
        - [Function: SetPlayerAIDriven (Native) (Global)](#function-setplayeraidriven-native-global)
        - [Function: SetPlayerOnElevator (Native) (Global)](#function-setplayeronelevator-native-global)
        - [Function: TrySetPlayerHomeSpaceShip (Native) (Global)](#function-trysetplayerhomespaceship-native-global)
        - [Function: GetPlayerHomeSpaceShip (Native) (Global)](#function-getplayerhomespaceship-native-global)
        - [Function: GetPlayerOwnedShips (Native) (Global)](#function-getplayerownedships-native-global)
        - [Function: SetPlayerRadioFrequency (Native) (Global)](#function-setplayerradiofrequency-native-global)
        - [Function: SetPlayerReportCrime (Native) (Global)](#function-setplayerreportcrime-native-global)
        - [Function: SetSittingRotation (Native) (Global)](#function-setsittingrotation-native-global)
        - [Function: ShakeCamera (Native) (Global)](#function-shakecamera-native-global)
        - [Function: ShakeController (Native) (Global)](#function-shakecontroller-native-global)
        - [Function: SetLocalTime (Native) (Global)](#function-setlocaltime-native-global)
        - [Function: GetLocalTime (Native) (Global)](#function-getlocaltime-native-global)
        - [Function: ShowContrabandScanWarning (Native) (Global)](#function-showcontrabandscanwarning-native-global)
        - [Function: ShowCustomWatchAlert (Native) (Global)](#function-showcustomwatchalert-native-global)
        - [Function: ShowFatigueWarningOnHUD (Native) (Global)](#function-showfatiguewarningonhud-native-global)
        - [Function: ShowMissionBoardMenu (Native) (Global)](#function-showmissionboardmenu-native-global)
        - [Function: ShowRaceMenu (Native) (Global)](#function-showracemenu-native-global)
        - [Function: ShowGalaxyStarMapMenu (Native) (Global)](#function-showgalaxystarmapmenu-native-global)
        - [Function: ShowTitleSequenceMenu (Native) (Global)](#function-showtitlesequencemenu-native-global)
        - [Function: HideTitleSequenceMenu (Native) (Global)](#function-hidetitlesequencemenu-native-global)
        - [Function: StartTitleSequence (Native) (Global)](#function-starttitlesequence-native-global)
        - [Function: TriggerScreenBlood (Native) (Global)](#function-triggerscreenblood-native-global)
        - [Function: PlayEventCamera (Native) (Global)](#function-playeventcamera-native-global)
        - [Function: StartDialogueCameraOrCenterOnTarget (Native) (Global)](#function-startdialoguecameraorcenterontarget-native-global)
        - [Function: StopDialogueCamera (Native) (Global)](#function-stopdialoguecamera-native-global)
        - [Function: TurnPlayerRadioOn (Native) (Global)](#function-turnplayerradioon-native-global)
        - [Function: UsingGamepad (Native) (Global)](#function-usinggamepad-native-global)
        - [Function: Warning (Native) (Global)](#function-warning-native-global)
    - [Script: Math](#script-math)
        - [Function: abs](#function-abs)
        - [Function: acos (Native) (Global)](#function-acos-native-global)
        - [Function: asin (Native) (Global)](#function-asin-native-global)
        - [Function: atan (Native) (Global)](#function-atan-native-global)
        - [Function: Ceiling (Native) (Global)](#function-ceiling-native-global)
        - [Function: cos (Native) (Global)](#function-cos-native-global)
        - [Function: DegreesToRadians (Native) (Global)](#function-degreestoradians-native-global)
        - [Function: Floor (Native) (Global)](#function-floor-native-global)
        - [Function: pow (Native) (Global)](#function-pow-native-global)
        - [Function: RadiansToDegrees (Native) (Global)](#function-radianstodegrees-native-global)
        - [Function: sin (Native) (Global)](#function-sin-native-global)
        - [Function: sqrt (Native) (Global)](#function-sqrt-native-global)
        - [Function: tan (Native) (Global)](#function-tan-native-global)
        - [Function: Max (Global)](#function-max-global)
        - [Function: Min (Global)](#function-min-global)
        - [Function: Clamp (Global)](#function-clamp-global)
        - [Function: Normalize (Global)](#function-normalize-global)
        - [Function: Round (Global)](#function-round-global)
        - [Function: ExtractDigit (Global)](#function-extractdigit-global)
        - [Function: HoursAsDays (Global)](#function-hoursasdays-global)
        - [Function: MinutesAsDays (Global)](#function-minutesasdays-global)
        - [Function: SecondsAsDays (Global)](#function-secondsasdays-global)
        - [Function: DaysAsHours (Global)](#function-daysashours-global)
        - [Function: DaysAsMinutes (Global)](#function-daysasminutes-global)
        - [Function: DaysAsSeconds (Global)](#function-daysasseconds-global)
    - [Script: ScriptObject](#script-scriptobject)
        - [Event: OnActorValueChanged](#event-onactorvaluechanged)
        - [Event: OnActorValueGreaterThan](#event-onactorvaluegreaterthan)
        - [Event: OnActorValueLessThan](#event-onactorvaluelessthan)
        - [Event: OnAffinityEventSent](#event-onaffinityeventsent)
        - [Event: OnAnimationEvent](#event-onanimationevent)
        - [Event: OnAnimationEventUnregistered](#event-onanimationeventunregistered)
        - [Event: OnBeginState](#event-onbeginstate)
        - [Event: OnChallengeCompleted](#event-onchallengecompleted)
        - [Event: OnDistanceLessThan](#event-ondistancelessthan)
        - [Event: OnDistanceGreaterThan](#event-ondistancegreaterthan)
        - [Event: OnEndState](#event-onendstate)
        - [Event: OnGainLOS](#event-ongainlos)
        - [Event: OnHit](#event-onhit)
        - [Event: OnInit](#event-oninit)
        - [Event: OnLostLOS](#event-onlostlos)
        - [Event: OnMagicEffectApply](#event-onmagiceffectapply)
        - [Event: OnMenuOpenCloseEvent](#event-onmenuopencloseevent)
        - [Event: OnPlayerFastTravel](#event-onplayerfasttravel)
        - [Event: OnPlayerSleepStart](#event-onplayersleepstart)
        - [Event: OnPlayerSleepStop](#event-onplayersleepstop)
        - [Event: OnPlayerTeleport](#event-onplayerteleport)
        - [Event: OnPlayerWaitStart](#event-onplayerwaitstart)
        - [Event: OnPlayerWaitStop](#event-onplayerwaitstop)
        - [Event: OnRadiationDamage](#event-onradiationdamage)
        - [Event: OnTimer](#event-ontimer)
        - [Event: OnTimerGameTime](#event-ontimergametime)
        - [Event: OnTrackedStatsEvent](#event-ontrackedstatsevent)
        - [Event: OnStarmapTargetSelectEvent](#event-onstarmaptargetselectevent)
        - [Event: OnPlanetSiteSelectEvent](#event-onplanetsiteselectevent)
        - [Event: OnTutorialEvent](#event-ontutorialevent)
        - [Event: OnGameplayOptionChanged](#event-ongameplayoptionchanged)
        - [Function: AddInventoryEventFilter (Native)](#function-addinventoryeventfilter-native)
        - [Function: CallFunction (Native)](#function-callfunction-native)
        - [Function: CallFunctionNoWait (Native)](#function-callfunctionnowait-native)
        - [Function: CancelTimer (Native)](#function-canceltimer-native)
        - [Function: CancelTimerGameTime (Native)](#function-canceltimergametime-native)
        - [Function: GetPropertyValue (Native)](#function-getpropertyvalue-native)
        - [Function: GetState](#function-getstate)
        - [Function: GotoState](#function-gotostate)
        - [Function: CastAs (Native)](#function-castas-native)
        - [Function: PauseTimer (Native)](#function-pausetimer-native)
        - [Function: PauseTimerGameTime (Native)](#function-pausetimergametime-native)
        - [Function: IsBoundGameObjectAvailable (Native)](#function-isboundgameobjectavailable-native)
        - [Function: RegisterForActorValueChangedEvent (Native)](#function-registerforactorvaluechangedevent-native)
        - [Function: RegisterForActorValueGreaterThanEvent (Native)](#function-registerforactorvaluegreaterthanevent-native)
        - [Function: RegisterForActorValueLessThanEvent (Native)](#function-registerforactorvaluelessthanevent-native)
        - [Function: RegisterForAffinityEvent (Native)](#function-registerforaffinityevent-native)
        - [Function: RegisterForAnimationEvent (Native)](#function-registerforanimationevent-native)
        - [Function: RegisterForChallengeEvents (Native)](#function-registerforchallengeevents-native)
        - [Function: RegisterForCustomEvent (Native)](#function-registerforcustomevent-native)
        - [Function: RegisterForDetectionLOSGain (Native)](#function-registerfordetectionlosgain-native)
        - [Function: RegisterForDetectionLOSLost (Native)](#function-registerfordetectionloslost-native)
        - [Function: RegisterForDirectLOSGain (Native)](#function-registerfordirectlosgain-native)
        - [Function: RegisterForDirectLOSLost (Native)](#function-registerfordirectloslost-native)
        - [Function: RegisterForDistanceLessThanEvent (Native)](#function-registerfordistancelessthanevent-native)
        - [Function: RegisterForDistanceGreaterThanEvent (Native)](#function-registerfordistancegreaterthanevent-native)
        - [Function: RegisterForHitEvent (Native)](#function-registerforhitevent-native)
        - [Function: RegisterForHitEventAggressorRefArray](#function-registerforhiteventaggressorrefarray)
        - [Function: RegisterForHitEventAggressorFactionArray](#function-registerforhiteventaggressorfactionarray)
        - [Function: RegisterForMagicEffectApplyEvent (Native)](#function-registerformagiceffectapplyevent-native)
        - [Function: RegisterForMenuOpenCloseEvent (Native)](#function-registerformenuopencloseevent-native)
        - [Function: RegisterForPlayerSleep (Native)](#function-registerforplayersleep-native)
        - [Function: RegisterForPlayerTeleport (Native)](#function-registerforplayerteleport-native)
        - [Function: RegisterForPlayerWait (Native)](#function-registerforplayerwait-native)
        - [Function: RegisterForRadiationDamageEvent (Native)](#function-registerforradiationdamageevent-native)
        - [Function: RegisterForRemoteEvent (Native)](#function-registerforremoteevent-native)
        - [Function: RegisterForTrackedStatsEvent (Native)](#function-registerfortrackedstatsevent-native)
        - [Function: RegisterForStarmapTargetSelectEvent (Native)](#function-registerforstarmaptargetselectevent-native)
        - [Function: RegisterForPlanetSiteSelectEvent (Native)](#function-registerforplanetsiteselectevent-native)
        - [Function: RegisterForTutorialEvent (Native)](#function-registerfortutorialevent-native)
        - [Function: RegisterForGameplayOptionChangedEvent (Native)](#function-registerforgameplayoptionchangedevent-native)
        - [Function: RemoveAllInventoryEventFilters (Native)](#function-removeallinventoryeventfilters-native)
        - [Function: RemoveInventoryEventFilter (Native)](#function-removeinventoryeventfilter-native)
        - [Function: SendCustomEvent (Native)](#function-sendcustomevent-native)
        - [Function: SetPropertyValue (Native)](#function-setpropertyvalue-native)
        - [Function: SetPropertyValueNoWait (Native)](#function-setpropertyvaluenowait-native)
        - [Function: StartTimer (Native)](#function-starttimer-native)
        - [Function: StartTimerGameTime (Native)](#function-starttimergametime-native)
        - [Function: UnregisterForActorValueChangedEvent (Native)](#function-unregisterforactorvaluechangedevent-native)
        - [Function: UnregisterForActorValueGreaterThanEvent (Native)](#function-unregisterforactorvaluegreaterthanevent-native)
        - [Function: UnregisterForActorValueLessThanEvent (Native)](#function-unregisterforactorvaluelessthanevent-native)
        - [Function: UnregisterForAffinityEvent (Native)](#function-unregisterforaffinityevent-native)
        - [Function: UnregisterForAllActorValueEvents (Native)](#function-unregisterforallactorvalueevents-native)
        - [Function: UnregisterForAllAffinityEvents (Native)](#function-unregisterforallaffinityevents-native)
        - [Function: UnregisterForAllEvents (Native)](#function-unregisterforallevents-native)
        - [Function: UnregisterForAllCustomEvents (Native)](#function-unregisterforallcustomevents-native)
        - [Function: UnregisterForAllHitEvents (Native)](#function-unregisterforallhitevents-native)
        - [Function: UnregisterForAllMagicEffectApplyEvents (Native)](#function-unregisterforallmagiceffectapplyevents-native)
        - [Function: UnregisterForAllMenuOpenCloseEvents (Native)](#function-unregisterforallmenuopencloseevents-native)
        - [Function: UnregisterForAllRadiationDamageEvents (Native)](#function-unregisterforallradiationdamageevents-native)
        - [Function: UnregisterForAllRemoteEvents (Native)](#function-unregisterforallremoteevents-native)
        - [Function: UnregisterForAllTrackedStatsEvents (Native)](#function-unregisterforalltrackedstatsevents-native)
        - [Function: UnregisterForAnimationEvent (Native)](#function-unregisterforanimationevent-native)
        - [Function: UnregisterForChallengeEvents (Native)](#function-unregisterforchallengeevents-native)
        - [Function: UnregisterForCustomEvent (Native)](#function-unregisterforcustomevent-native)
        - [Function: UnregisterForDistanceEvents (Native)](#function-unregisterfordistanceevents-native)
        - [Function: UnregisterForHitEvent (Native)](#function-unregisterforhitevent-native)
        - [Function: UnregisterForLOS (Native)](#function-unregisterforlos-native)
        - [Function: UnregisterForMagicEffectApplyEvent (Native)](#function-unregisterformagiceffectapplyevent-native)
        - [Function: UnregisterForMenuOpenCloseEvent (Native)](#function-unregisterformenuopencloseevent-native)
        - [Function: UnregisterForPlayerSleep (Native)](#function-unregisterforplayersleep-native)
        - [Function: UnregisterForPlayerTeleport (Native)](#function-unregisterforplayerteleport-native)
        - [Function: UnregisterForPlayerWait (Native)](#function-unregisterforplayerwait-native)
        - [Function: UnregisterForRadiationDamageEvent (Native)](#function-unregisterforradiationdamageevent-native)
        - [Function: UnregisterForRemoteEvent (Native)](#function-unregisterforremoteevent-native)
        - [Function: UnregisterForTrackedStatsEvent (Native)](#function-unregisterfortrackedstatsevent-native)
        - [Function: UnregisterForTrackedStatsEventThreshold (Native)](#function-unregisterfortrackedstatseventthreshold-native)
        - [Function: UnregisterForStarmapTargetSelectEvent (Native)](#function-unregisterforstarmaptargetselectevent-native)
        - [Function: UnregisterForPlanetSiteSelectEvent (Native)](#function-unregisterforplanetsiteselectevent-native)
        - [Function: UnregisterForTutorialEvent (Native)](#function-unregisterfortutorialevent-native)
        - [Function: UnregisterForGameplayOptionChangedEvent (Native)](#function-unregisterforgameplayoptionchangedevent-native)
        - [Script: ActiveMagicEffect](#script-activemagiceffect)
            - [Event: OnEffectStart](#event-oneffectstart)
            - [Event: OnEffectFinish](#event-oneffectfinish)
            - [Event: OnActivate](#event-onactivate)
            - [Event: OnBuilderMenuSelect](#event-onbuildermenuselect)
            - [Event: OnCellAttach](#event-oncellattach)
            - [Event: OnCellDetach](#event-oncelldetach)
            - [Event: OnCellLoad](#event-oncellload)
            - [Event: OnClose](#event-onclose)
            - [Event: OnContainerChanged](#event-oncontainerchanged)
            - [Event: OnCrewAssigned](#event-oncrewassigned)
            - [Event: OnCrewDismissed](#event-oncrewdismissed)
            - [Event: OnDestroyed](#event-ondestroyed)
            - [Event: OnDestructionStageChanged](#event-ondestructionstagechanged)
            - [Event: OnEnterFurniture](#event-onenterfurniture)
            - [Event: OnEquipped](#event-onequipped)
            - [Event: OnExitFurniture](#event-onexitfurniture)
            - [Event: OnGrab](#event-ongrab)
            - [Event: OnItemAdded](#event-onitemadded)
            - [Event: OnItemRemoved](#event-onitemremoved)
            - [Event: OnLoad](#event-onload)
            - [Event: OnLockStateChanged](#event-onlockstatechanged)
            - [Event: OnMapMarkerDiscovered](#event-onmapmarkerdiscovered)
            - [Event: OnObjectRepaired](#event-onobjectrepaired)
            - [Event: OnObjectDestroyed](#event-onobjectdestroyed)
            - [Event: OnOpen](#event-onopen)
            - [Event: OnOutpostItemPowerOff](#event-onoutpostitempoweroff)
            - [Event: OnOutpostItemPowerOn](#event-onoutpostitempoweron)
            - [Event: OnPipboyRadioDetection](#event-onpipboyradiodetection)
            - [Event: OnPlayerDialogueTarget](#event-onplayerdialoguetarget)
            - [Event: OnPowerOn](#event-onpoweron)
            - [Event: OnPowerOff](#event-onpoweroff)
            - [Event: OnQuickContainerOpened](#event-onquickcontaineropened)
            - [Event: OnRead](#event-onread)
            - [Event: OnRelease](#event-onrelease)
            - [Event: OnReset](#event-onreset)
            - [Event: OnScanned](#event-onscanned)
            - [Event: OnSell](#event-onsell)
            - [Event: OnTerminalMenuItemRun](#event-onterminalmenuitemrun)
            - [Event: OnWorkshopCargoLinkChanged](#event-onworkshopcargolinkchanged)
            - [Event: OnSpellCast](#event-onspellcast)
            - [Event: OnTranslationAlmostComplete](#event-ontranslationalmostcomplete)
            - [Event: OnTranslationComplete](#event-ontranslationcomplete)
            - [Event: OnTranslationFailed](#event-ontranslationfailed)
            - [Event: OnTrapHitStart](#event-ontraphitstart)
            - [Event: OnTrapHitStop](#event-ontraphitstop)
            - [Event: OnTriggerEnter](#event-ontriggerenter)
            - [Event: OnTriggerLeave](#event-ontriggerleave)
            - [Event: OnUnequipped](#event-onunequipped)
            - [Event: OnUnload](#event-onunload)
            - [Event: OnWorkshopFlyCam](#event-onworkshopflycam)
            - [Event: OnWorkshopMode](#event-onworkshopmode)
            - [Event: OnWorkshopObjectGrabbed](#event-onworkshopobjectgrabbed)
            - [Event: OnWorkshopObjectMoved](#event-onworkshopobjectmoved)
            - [Event: OnWorkshopObjectPlaced](#event-onworkshopobjectplaced)
            - [Event: OnWorkshopObjectRemoved](#event-onworkshopobjectremoved)
            - [Event: OnWorkshopOutputLink](#event-onworkshopoutputlink)
            - [Event: OnWorkshopNPCTransfer](#event-onworkshopnpctransfer)
            - [Event: OnActorActivatedRef](#event-onactoractivatedref)
            - [Event: OnAffinityEvent](#event-onaffinityevent)
            - [Event: OnCombatListAdded](#event-oncombatlistadded)
            - [Event: OnCombatListRemoved](#event-oncombatlistremoved)
            - [Event: OnCombatStateChanged](#event-oncombatstatechanged)
            - [Event: OnCommandModeCompleteCommand](#event-oncommandmodecompletecommand)
            - [Event: OnCommandModeEnter](#event-oncommandmodeenter)
            - [Event: OnCommandModeExit](#event-oncommandmodeexit)
            - [Event: OnCommandModeGiveCommand](#event-oncommandmodegivecommand)
            - [Event: OnCompanionDismiss](#event-oncompaniondismiss)
            - [Event: OnConsciousnessStateChanged](#event-onconsciousnessstatechanged)
            - [Event: OnCripple](#event-oncripple)
            - [Event: OnDeferredKill](#event-ondeferredkill)
            - [Event: OnDeath](#event-ondeath)
            - [Event: OnDifficultyChanged](#event-ondifficultychanged)
            - [Event: OnDying](#event-ondying)
            - [Event: OnEnterBleedout](#event-onenterbleedout)
            - [Event: OnEnterOutpostBeaconMode](#event-onenteroutpostbeaconmode)
            - [Event: OnEnterShipInterior](#event-onentershipinterior)
            - [Event: OnEnterSneaking](#event-onentersneaking)
            - [Event: OnEscortWaitStart](#event-onescortwaitstart)
            - [Event: OnEscortWaitStop](#event-onescortwaitstop)
            - [Event: OnExitShipInterior](#event-onexitshipinterior)
            - [Event: OnPlayerFollowerWarp](#event-onplayerfollowerwarp)
            - [Event: OnGetUp](#event-ongetup)
            - [Event: OnHomeShipSet](#event-onhomeshipset)
            - [Event: OnPlayerFailedPlotRoute](#event-onplayerfailedplotroute)
            - [Event: OnPlayerModifiedShip](#event-onplayermodifiedship)
            - [Event: OnItemEquipped](#event-onitemequipped)
            - [Event: OnItemUnequipped](#event-onitemunequipped)
            - [Event: OnKill](#event-onkill)
            - [Event: OnLocationChange](#event-onlocationchange)
            - [Event: OnPackageChange](#event-onpackagechange)
            - [Event: OnPackageEnd](#event-onpackageend)
            - [Event: OnPackageStart](#event-onpackagestart)
            - [Event: OnPartialCripple](#event-onpartialcripple)
            - [Event: OnPickLock](#event-onpicklock)
            - [Event: OnPickpocketFailed](#event-onpickpocketfailed)
            - [Event: OnPlayerCompleteResearch](#event-onplayercompleteresearch)
            - [Event: OnPlayerCraftItem](#event-onplayercraftitem)
            - [Event: OnPlayerCreateRobot](#event-onplayercreaterobot)
            - [Event: OnPlayerEnterVertibird](#event-onplayerentervertibird)
            - [Event: OnPlayerFallLongDistance](#event-onplayerfalllongdistance)
            - [Event: OnPlayerFireWeapon](#event-onplayerfireweapon)
            - [Event: OnPlayerHealTeammate](#event-onplayerhealteammate)
            - [Event: OnPlayerItemAdded](#event-onplayeritemadded)
            - [Event: OnPlayerLoadGame](#event-onplayerloadgame)
            - [Event: OnPlayerLoiteringBegin](#event-onplayerloiteringbegin)
            - [Event: OnPlayerLoiteringEnd](#event-onplayerloiteringend)
            - [Event: OnPlayerModArmorWeapon](#event-onplayermodarmorweapon)
            - [Event: OnPlayerModRobot](#event-onplayermodrobot)
            - [Event: OnPlayerSwimming](#event-onplayerswimming)
            - [Event: OnPlayerUseWorkBench](#event-onplayeruseworkbench)
            - [Event: OnRaceSwitchComplete](#event-onraceswitchcomplete)
            - [Event: OnRecoverFromBleedout](#event-onrecoverfrombleedout)
            - [Event: OnSit](#event-onsit)
            - [Event: OnSpeechChallengeAvailable](#event-onspeechchallengeavailable)
            - [Event: OnPlayerPlanetSurveyComplete](#event-onplayerplanetsurveycomplete)
            - [Event: OnPlayerScannedObject](#event-onplayerscannedobject)
            - [Event: OnOutpostPlaced](#event-onoutpostplaced)
            - [Event: OnPlayerArrested](#event-onplayerarrested)
            - [Event: OnPlayerAssaultActor](#event-onplayerassaultactor)
            - [Event: OnPlayerCrimeGold](#event-onplayercrimegold)
            - [Event: OnPlayerJail](#event-onplayerjail)
            - [Event: OnPlayerPayFine](#event-onplayerpayfine)
            - [Event: OnPlayerMurderActor](#event-onplayermurderactor)
            - [Event: OnPlayerTrespass](#event-onplayertrespass)
            - [Event: OnPlayerBuyShip](#event-onplayerbuyship)
            - [Event: OnPlayerSellShip](#event-onplayersellship)
            - [Event: OnShipBought](#event-onshipbought)
            - [Event: OnShipDock](#event-onshipdock)
            - [Event: OnShipFarTravel](#event-onshipfartravel)
            - [Event: OnShipGravJump](#event-onshipgravjump)
            - [Event: OnShipLanding](#event-onshiplanding)
            - [Event: OnShipRampDown](#event-onshiprampdown)
            - [Event: OnShipRefueled](#event-onshiprefueled)
            - [Event: OnShipScan](#event-onshipscan)
            - [Event: OnShipSold](#event-onshipsold)
            - [Event: OnShipSystemDamaged](#event-onshipsystemdamaged)
            - [Event: OnShipSystemPowerChange](#event-onshipsystempowerchange)
            - [Event: OnShipSystemRepaired](#event-onshipsystemrepaired)
            - [Event: OnShipTakeOff](#event-onshiptakeoff)
            - [Event: OnShipUndock](#event-onshipundock)
            - [Function: Dispel (Native)](#function-dispel-native)
            - [Function: GetBaseObject (Native)](#function-getbaseobject-native)
            - [Function: GetCasterActor (Native)](#function-getcasteractor-native)
            - [Function: GetDuration (Native)](#function-getduration-native)
            - [Function: GetElapsedTime (Native)](#function-getelapsedtime-native)
            - [Function: GetMagicItem (Native)](#function-getmagicitem-native)
            - [Function: GetMagnitude (Native)](#function-getmagnitude-native)
            - [Function: GetResistanceValue (Native)](#function-getresistancevalue-native)
            - [Function: GetTargetActor (Native)](#function-gettargetactor-native)
            - [Function: StartObjectProfiling (Native)](#function-startobjectprofiling-native)
            - [Function: StopObjectProfiling (Native)](#function-stopobjectprofiling-native)
        - [Script: Alias](#script-alias)
            - [Event: OnAliasInit](#event-onaliasinit)
            - [Event: OnAliasReset](#event-onaliasreset)
            - [Event: OnAliasShutdown](#event-onaliasshutdown)
            - [Event: OnAliasStarted](#event-onaliasstarted)
            - [Function: GetOwningQuest (Native)](#function-getowningquest-native)
            - [Function: RefillAlias (Native)](#function-refillalias-native)
            - [Function: RefillDependentAliases (Native)](#function-refilldependentaliases-native)
            - [Function: StartObjectProfiling (Native)](#function-startobjectprofiling-native-1)
            - [Function: StopObjectProfiling (Native)](#function-stopobjectprofiling-native-1)
            - [Function: IsFilled](#function-isfilled)
            - [Function: IsSameType](#function-issametype)
            - [Function: CopyIntoAlias](#function-copyintoalias)
            - [Script: LocationAlias](#script-locationalias)
                - [Function: Clear (Native)](#function-clear-native)
                - [Function: GetLocation (Native)](#function-getlocation-native)
                - [Function: ForceLocationTo (Native)](#function-forcelocationto-native)
                - [Function: ClearAndRefillAlias](#function-clearandrefillalias)
            - [Script: RefCollectionAlias](#script-refcollectionalias)
                - [Event: OnAliasChanged](#event-onaliaschanged)
                - [Event: OnActivate](#event-onactivate-1)
                - [Event: OnBuilderMenuSelect](#event-onbuildermenuselect-1)
                - [Event: OnCellAttach](#event-oncellattach-1)
                - [Event: OnCellDetach](#event-oncelldetach-1)
                - [Event: OnCellLoad](#event-oncellload-1)
                - [Event: OnClose](#event-onclose-1)
                - [Event: OnContainerChanged](#event-oncontainerchanged-1)
                - [Event: OnCrewAssigned](#event-oncrewassigned-1)
                - [Event: OnCrewDismissed](#event-oncrewdismissed-1)
                - [Event: OnDestroyed](#event-ondestroyed-1)
                - [Event: OnDestructionStageChanged](#event-ondestructionstagechanged-1)
                - [Event: OnEnterFurniture](#event-onenterfurniture-1)
                - [Event: OnEquipped](#event-onequipped-1)
                - [Event: OnExitFurniture](#event-onexitfurniture-1)
                - [Event: OnGrab](#event-ongrab-1)
                - [Event: OnItemAdded](#event-onitemadded-1)
                - [Event: OnItemRemoved](#event-onitemremoved-1)
                - [Event: OnLoad](#event-onload-1)
                - [Event: OnLockStateChanged](#event-onlockstatechanged-1)
                - [Event: OnMapMarkerDiscovered](#event-onmapmarkerdiscovered-1)
                - [Event: OnObjectRepaired](#event-onobjectrepaired-1)
                - [Event: OnObjectDestroyed](#event-onobjectdestroyed-1)
                - [Event: OnOpen](#event-onopen-1)
                - [Event: OnOutpostItemPowerOff](#event-onoutpostitempoweroff-1)
                - [Event: OnOutpostItemPowerOn](#event-onoutpostitempoweron-1)
                - [Event: OnPipboyRadioDetection](#event-onpipboyradiodetection-1)
                - [Event: OnPowerOn](#event-onpoweron-1)
                - [Event: OnPowerOff](#event-onpoweroff-1)
                - [Event: OnQuickContainerOpened](#event-onquickcontaineropened-1)
                - [Event: OnRead](#event-onread-1)
                - [Event: OnRelease](#event-onrelease-1)
                - [Event: OnReset](#event-onreset-1)
                - [Event: OnScanned](#event-onscanned-1)
                - [Event: OnSell](#event-onsell-1)
                - [Event: OnShipDock](#event-onshipdock-1)
                - [Event: OnShipFarTravel](#event-onshipfartravel-1)
                - [Event: OnShipGravJump](#event-onshipgravjump-1)
                - [Event: OnShipLanding](#event-onshiplanding-1)
                - [Event: OnShipSystemPowerChange](#event-onshipsystempowerchange-1)
                - [Event: OnShipTakeOff](#event-onshiptakeoff-1)
                - [Event: OnShipUndock](#event-onshipundock-1)
                - [Event: OnSpellCast](#event-onspellcast-1)
                - [Event: OnTerminalMenuItemRun](#event-onterminalmenuitemrun-1)
                - [Event: OnTranslationAlmostComplete](#event-ontranslationalmostcomplete-1)
                - [Event: OnTranslationComplete](#event-ontranslationcomplete-1)
                - [Event: OnTranslationFailed](#event-ontranslationfailed-1)
                - [Event: OnTrapHitStart](#event-ontraphitstart-1)
                - [Event: OnTrapHitStop](#event-ontraphitstop-1)
                - [Event: OnTriggerEnter](#event-ontriggerenter-1)
                - [Event: OnTriggerLeave](#event-ontriggerleave-1)
                - [Event: OnUnequipped](#event-onunequipped-1)
                - [Event: OnUnload](#event-onunload-1)
                - [Event: OnWorkshopCargoLinkChanged](#event-onworkshopcargolinkchanged-1)
                - [Event: OnWorkshopFlyCam](#event-onworkshopflycam-1)
                - [Event: OnWorkshopMode](#event-onworkshopmode-1)
                - [Event: OnWorkshopObjectGrabbed](#event-onworkshopobjectgrabbed-1)
                - [Event: OnWorkshopObjectMoved](#event-onworkshopobjectmoved-1)
                - [Event: OnWorkshopObjectPlaced](#event-onworkshopobjectplaced-1)
                - [Event: OnWorkshopObjectRemoved](#event-onworkshopobjectremoved-1)
                - [Event: OnWorkshopOutputLink](#event-onworkshopoutputlink-1)
                - [Event: OnWorkshopNPCTransfer](#event-onworkshopnpctransfer-1)
                - [Event: OnActorActivatedRef](#event-onactoractivatedref-1)
                - [Event: OnAffinityEvent](#event-onaffinityevent-1)
                - [Event: OnCombatListAdded](#event-oncombatlistadded-1)
                - [Event: OnCombatListRemoved](#event-oncombatlistremoved-1)
                - [Event: OnCombatStateChanged](#event-oncombatstatechanged-1)
                - [Event: OnCommandModeCompleteCommand](#event-oncommandmodecompletecommand-1)
                - [Event: OnCommandModeEnter](#event-oncommandmodeenter-1)
                - [Event: OnCommandModeExit](#event-oncommandmodeexit-1)
                - [Event: OnCommandModeGiveCommand](#event-oncommandmodegivecommand-1)
                - [Event: OnCompanionDismiss](#event-oncompaniondismiss-1)
                - [Event: OnConsciousnessStateChanged](#event-onconsciousnessstatechanged-1)
                - [Event: OnCripple](#event-oncripple-1)
                - [Event: OnDeferredKill](#event-ondeferredkill-1)
                - [Event: OnDeath](#event-ondeath-1)
                - [Event: OnDifficultyChanged](#event-ondifficultychanged-1)
                - [Event: OnDying](#event-ondying-1)
                - [Event: OnEnterBleedout](#event-onenterbleedout-1)
                - [Event: OnEnterOutpostBeaconMode](#event-onenteroutpostbeaconmode-1)
                - [Event: OnEnterShipInterior](#event-onentershipinterior-1)
                - [Event: OnEnterSneaking](#event-onentersneaking-1)
                - [Event: OnEscortWaitStart](#event-onescortwaitstart-1)
                - [Event: OnEscortWaitStop](#event-onescortwaitstop-1)
                - [Event: OnExitShipInterior](#event-onexitshipinterior-1)
                - [Event: OnPlayerFollowerWarp](#event-onplayerfollowerwarp-1)
                - [Event: OnGetUp](#event-ongetup-1)
                - [Event: OnHomeShipSet](#event-onhomeshipset-1)
                - [Event: OnOutpostPlaced](#event-onoutpostplaced-1)
                - [Event: OnPlayerFailedPlotRoute](#event-onplayerfailedplotroute-1)
                - [Event: OnPlayerModifiedShip](#event-onplayermodifiedship-1)
                - [Event: OnItemEquipped](#event-onitemequipped-1)
                - [Event: OnItemUnequipped](#event-onitemunequipped-1)
                - [Event: OnKill](#event-onkill-1)
                - [Event: OnLocationChange](#event-onlocationchange-1)
                - [Event: OnPackageChange](#event-onpackagechange-1)
                - [Event: OnPackageEnd](#event-onpackageend-1)
                - [Event: OnPackageStart](#event-onpackagestart-1)
                - [Event: OnPartialCripple](#event-onpartialcripple-1)
                - [Event: OnPickLock](#event-onpicklock-1)
                - [Event: OnPickpocketFailed](#event-onpickpocketfailed-1)
                - [Event: OnPlayerCompleteResearch](#event-onplayercompleteresearch-1)
                - [Event: OnPlayerCraftItem](#event-onplayercraftitem-1)
                - [Event: OnPlayerCreateRobot](#event-onplayercreaterobot-1)
                - [Event: OnPlayerDialogueTarget](#event-onplayerdialoguetarget-1)
                - [Event: OnPlayerEnterVertibird](#event-onplayerentervertibird-1)
                - [Event: OnPlayerFallLongDistance](#event-onplayerfalllongdistance-1)
                - [Event: OnPlayerFireWeapon](#event-onplayerfireweapon-1)
                - [Event: OnPlayerHealTeammate](#event-onplayerhealteammate-1)
                - [Event: OnPlayerItemAdded](#event-onplayeritemadded-1)
                - [Event: OnPlayerLoadGame](#event-onplayerloadgame-1)
                - [Event: OnPlayerLoiteringBegin](#event-onplayerloiteringbegin-1)
                - [Event: OnPlayerLoiteringEnd](#event-onplayerloiteringend-1)
                - [Event: OnPlayerModArmorWeapon](#event-onplayermodarmorweapon-1)
                - [Event: OnPlayerModRobot](#event-onplayermodrobot-1)
                - [Event: OnPlayerSwimming](#event-onplayerswimming-1)
                - [Event: OnPlayerUseWorkBench](#event-onplayeruseworkbench-1)
                - [Event: OnRaceSwitchComplete](#event-onraceswitchcomplete-1)
                - [Event: OnRecoverFromBleedout](#event-onrecoverfrombleedout-1)
                - [Event: OnSit](#event-onsit-1)
                - [Event: OnSpeechChallengeAvailable](#event-onspeechchallengeavailable-1)
                - [Event: OnPlayerPlanetSurveyComplete](#event-onplayerplanetsurveycomplete-1)
                - [Event: OnPlayerScannedObject](#event-onplayerscannedobject-1)
                - [Event: OnPlayerArrested](#event-onplayerarrested-1)
                - [Event: OnPlayerAssaultActor](#event-onplayerassaultactor-1)
                - [Event: OnPlayerCrimeGold](#event-onplayercrimegold-1)
                - [Event: OnPlayerJail](#event-onplayerjail-1)
                - [Event: OnPlayerPayFine](#event-onplayerpayfine-1)
                - [Event: OnPlayerMurderActor](#event-onplayermurderactor-1)
                - [Event: OnPlayerTrespass](#event-onplayertrespass-1)
                - [Event: OnPlayerBuyShip](#event-onplayerbuyship-1)
                - [Event: OnPlayerSellShip](#event-onplayersellship-1)
                - [Event: OnShipBought](#event-onshipbought-1)
                - [Event: OnShipSold](#event-onshipsold-1)
                - [Event: OnShipSystemDamaged](#event-onshipsystemdamaged-1)
                - [Event: OnShipSystemRepaired](#event-onshipsystemrepaired-1)
                - [Event: OnShipRampDown](#event-onshiprampdown-1)
                - [Event: OnShipRefueled](#event-onshiprefueled-1)
                - [Event: OnShipScan](#event-onshipscan-1)
                - [Function: AddToFaction](#function-addtofaction)
                - [Function: BlockActivation](#function-blockactivation)
                - [Function: GetActorAt](#function-getactorat)
                - [Function: GetShipAt](#function-getshipat)
                - [Function: GetRandom](#function-getrandom)
                - [Function: GetRandomObjects](#function-getrandomobjects)
                - [Function: GetFirstOwnedObject](#function-getfirstownedobject)
                - [Function: EnableAll](#function-enableall)
                - [Function: DisableAll](#function-disableall)
                - [Function: EvaluateAll](#function-evaluateall)
                - [Function: MoveAllTo](#function-moveallto)
                - [Function: MoveAllToPackageLocation](#function-movealltopackagelocation)
                - [Function: IsOwnedObjectInList](#function-isownedobjectinlist)
                - [Function: IsDetectedBy](#function-isdetectedby)
                - [Function: HasDetectionLOS](#function-hasdetectionlos)
                - [Function: SetOpen](#function-setopen)
                - [Function: Lock](#function-lock)
                - [Function: KillAll](#function-killall)
                - [Function: StartCombatAll](#function-startcombatall)
                - [Function: RemoveFromFaction](#function-removefromfaction)
                - [Function: RemoveFromAllFactions](#function-removefromallfactions)
                - [Function: ResetAll](#function-resetall)
                - [Function: SetGhost](#function-setghost)
                - [Function: SetProtected](#function-setprotected)
                - [Function: SetEssential](#function-setessential)
                - [Function: StopCombat](#function-stopcombat)
                - [Function: StopCombatAlarm](#function-stopcombatalarm)
                - [Function: AddRefCollection](#function-addrefcollection)
                - [Function: RemoveRefCollection](#function-removerefcollection)
                - [Function: AddArray](#function-addarray)
                - [Function: GetCountDead](#function-getcountdead)
                - [Function: GetCountDeadOr3DUnloaded](#function-getcountdeador3dunloaded)
                - [Function: GetCountAliveAnd3DLoaded](#function-getcountaliveand3dloaded)
                - [Function: GetCountDisabled](#function-getcountdisabled)
                - [Function: RemoveDisabled](#function-removedisabled)
                - [Function: SetValue](#function-setvalue)
                - [Function: LinkCollectionTo](#function-linkcollectionto)
                - [Function: SetUnconscious](#function-setunconscious)
                - [Function: AddRef (Native)](#function-addref-native)
                - [Function: Find (Native)](#function-find-native)
                - [Function: GetArray (Native)](#function-getarray-native)
                - [Function: GetActorArray (Native)](#function-getactorarray-native)
                - [Function: GetAt (Native)](#function-getat-native)
                - [Function: GetCount (Native)](#function-getcount-native)
                - [Function: RemoveAll (Native)](#function-removeall-native)
                - [Function: RemoveRef (Native)](#function-removeref-native)
            - [Script: ReferenceAlias](#script-referencealias)
                - [Event: OnAliasChanged](#event-onaliaschanged-1)
                - [Event: OnActivate](#event-onactivate-2)
                - [Event: OnBuilderMenuSelect](#event-onbuildermenuselect-2)
                - [Event: OnCellAttach](#event-oncellattach-2)
                - [Event: OnCellDetach](#event-oncelldetach-2)
                - [Event: OnCellLoad](#event-oncellload-2)
                - [Event: OnClose](#event-onclose-2)
                - [Event: OnContainerChanged](#event-oncontainerchanged-2)
                - [Event: OnDestroyed](#event-ondestroyed-2)
                - [Event: OnDestructionStageChanged](#event-ondestructionstagechanged-2)
                - [Event: OnEnterFurniture](#event-onenterfurniture-2)
                - [Event: OnEquipped](#event-onequipped-2)
                - [Event: OnExitFurniture](#event-onexitfurniture-2)
                - [Event: OnGrab](#event-ongrab-2)
                - [Event: OnItemAdded](#event-onitemadded-2)
                - [Event: OnItemRemoved](#event-onitemremoved-2)
                - [Event: OnLoad](#event-onload-2)
                - [Event: OnLockStateChanged](#event-onlockstatechanged-2)
                - [Event: OnMapMarkerDiscovered](#event-onmapmarkerdiscovered-2)
                - [Event: OnObjectRepaired](#event-onobjectrepaired-2)
                - [Event: OnObjectDestroyed](#event-onobjectdestroyed-2)
                - [Event: OnOpen](#event-onopen-2)
                - [Event: OnOutpostItemPowerOff](#event-onoutpostitempoweroff-2)
                - [Event: OnOutpostItemPowerOn](#event-onoutpostitempoweron-2)
                - [Event: OnPipboyRadioDetection](#event-onpipboyradiodetection-2)
                - [Event: OnPlayerDialogueTarget](#event-onplayerdialoguetarget-2)
                - [Event: OnPowerOn](#event-onpoweron-2)
                - [Event: OnPowerOff](#event-onpoweroff-2)
                - [Event: OnQuickContainerOpened](#event-onquickcontaineropened-2)
                - [Event: OnRead](#event-onread-2)
                - [Event: OnRelease](#event-onrelease-2)
                - [Event: OnReset](#event-onreset-2)
                - [Event: OnScanned](#event-onscanned-2)
                - [Event: OnSell](#event-onsell-2)
                - [Event: OnSpellCast](#event-onspellcast-2)
                - [Event: OnTerminalMenuItemRun](#event-onterminalmenuitemrun-2)
                - [Event: OnTranslationAlmostComplete](#event-ontranslationalmostcomplete-2)
                - [Event: OnTranslationComplete](#event-ontranslationcomplete-2)
                - [Event: OnTranslationFailed](#event-ontranslationfailed-2)
                - [Event: OnTrapHitStart](#event-ontraphitstart-2)
                - [Event: OnTrapHitStop](#event-ontraphitstop-2)
                - [Event: OnTriggerEnter](#event-ontriggerenter-2)
                - [Event: OnTriggerLeave](#event-ontriggerleave-2)
                - [Event: OnUnequipped](#event-onunequipped-2)
                - [Event: OnUnload](#event-onunload-2)
                - [Event: OnWorkshopCargoLinkChanged](#event-onworkshopcargolinkchanged-2)
                - [Event: OnWorkshopFlyCam](#event-onworkshopflycam-2)
                - [Event: OnWorkshopMode](#event-onworkshopmode-2)
                - [Event: OnWorkshopObjectGrabbed](#event-onworkshopobjectgrabbed-2)
                - [Event: OnWorkshopObjectMoved](#event-onworkshopobjectmoved-2)
                - [Event: OnWorkshopObjectPlaced](#event-onworkshopobjectplaced-2)
                - [Event: OnWorkshopObjectRemoved](#event-onworkshopobjectremoved-2)
                - [Event: OnWorkshopOutputLink](#event-onworkshopoutputlink-2)
                - [Event: OnWorkshopNPCTransfer](#event-onworkshopnpctransfer-2)
                - [Event: OnActorActivatedRef](#event-onactoractivatedref-2)
                - [Event: OnAffinityEvent](#event-onaffinityevent-2)
                - [Event: OnCombatListAdded](#event-oncombatlistadded-2)
                - [Event: OnCombatListRemoved](#event-oncombatlistremoved-2)
                - [Event: OnCombatStateChanged](#event-oncombatstatechanged-2)
                - [Event: OnCommandModeCompleteCommand](#event-oncommandmodecompletecommand-2)
                - [Event: OnCommandModeEnter](#event-oncommandmodeenter-2)
                - [Event: OnCommandModeExit](#event-oncommandmodeexit-2)
                - [Event: OnCommandModeGiveCommand](#event-oncommandmodegivecommand-2)
                - [Event: OnCompanionDismiss](#event-oncompaniondismiss-2)
                - [Event: OnConsciousnessStateChanged](#event-onconsciousnessstatechanged-2)
                - [Event: OnCrewAssigned](#event-oncrewassigned-2)
                - [Event: OnCrewDismissed](#event-oncrewdismissed-2)
                - [Event: OnCripple](#event-oncripple-2)
                - [Event: OnDeferredKill](#event-ondeferredkill-2)
                - [Event: OnDeath](#event-ondeath-2)
                - [Event: OnDifficultyChanged](#event-ondifficultychanged-2)
                - [Event: OnDying](#event-ondying-2)
                - [Event: OnUnconscious](#event-onunconscious)
                - [Event: OnEnterBleedout](#event-onenterbleedout-2)
                - [Event: OnEnterOutpostBeaconMode](#event-onenteroutpostbeaconmode-2)
                - [Event: OnEnterShipInterior](#event-onentershipinterior-2)
                - [Event: OnEnterSneaking](#event-onentersneaking-2)
                - [Event: OnEscortWaitStart](#event-onescortwaitstart-2)
                - [Event: OnEscortWaitStop](#event-onescortwaitstop-2)
                - [Event: OnExitShipInterior](#event-onexitshipinterior-2)
                - [Event: OnPlayerFollowerWarp](#event-onplayerfollowerwarp-2)
                - [Event: OnGetUp](#event-ongetup-2)
                - [Event: OnHomeShipSet](#event-onhomeshipset-2)
                - [Event: OnPlayerArrested](#event-onplayerarrested-2)
                - [Event: OnPlayerAssaultActor](#event-onplayerassaultactor-2)
                - [Event: OnPlayerFailedPlotRoute](#event-onplayerfailedplotroute-2)
                - [Event: OnPlayerModifiedShip](#event-onplayermodifiedship-2)
                - [Event: OnItemEquipped](#event-onitemequipped-2)
                - [Event: OnItemUnequipped](#event-onitemunequipped-2)
                - [Event: OnKill](#event-onkill-2)
                - [Event: OnLocationChange](#event-onlocationchange-2)
                - [Event: OnOutpostPlaced](#event-onoutpostplaced-2)
                - [Event: OnPackageChange](#event-onpackagechange-2)
                - [Event: OnPackageEnd](#event-onpackageend-2)
                - [Event: OnPackageStart](#event-onpackagestart-2)
                - [Event: OnPartialCripple](#event-onpartialcripple-2)
                - [Event: OnPickLock](#event-onpicklock-2)
                - [Event: OnPickpocketFailed](#event-onpickpocketfailed-2)
                - [Event: OnPlayerBuyShip](#event-onplayerbuyship-2)
                - [Event: OnPlayerCompleteResearch](#event-onplayercompleteresearch-2)
                - [Event: OnPlayerCraftItem](#event-onplayercraftitem-2)
                - [Event: OnPlayerCreateRobot](#event-onplayercreaterobot-2)
                - [Event: OnPlayerCrimeGold](#event-onplayercrimegold-2)
                - [Event: OnPlayerEnterVertibird](#event-onplayerentervertibird-2)
                - [Event: OnPlayerFallLongDistance](#event-onplayerfalllongdistance-2)
                - [Event: OnPlayerFireWeapon](#event-onplayerfireweapon-2)
                - [Event: OnPlayerJail](#event-onplayerjail-2)
                - [Event: OnPlayerHealTeammate](#event-onplayerhealteammate-2)
                - [Event: OnPlayerItemAdded](#event-onplayeritemadded-2)
                - [Event: OnPlayerLoadGame](#event-onplayerloadgame-2)
                - [Event: OnPlayerLoiteringBegin](#event-onplayerloiteringbegin-2)
                - [Event: OnPlayerLoiteringEnd](#event-onplayerloiteringend-2)
                - [Event: OnPlayerModArmorWeapon](#event-onplayermodarmorweapon-2)
                - [Event: OnPlayerModRobot](#event-onplayermodrobot-2)
                - [Event: OnPlayerMurderActor](#event-onplayermurderactor-2)
                - [Event: OnPlayerPayFine](#event-onplayerpayfine-2)
                - [Event: OnPlayerSellShip](#event-onplayersellship-2)
                - [Event: OnPlayerSwimming](#event-onplayerswimming-2)
                - [Event: OnPlayerTrespass](#event-onplayertrespass-2)
                - [Event: OnPlayerUseWorkBench](#event-onplayeruseworkbench-2)
                - [Event: OnRaceSwitchComplete](#event-onraceswitchcomplete-2)
                - [Event: OnRecoverFromBleedout](#event-onrecoverfrombleedout-2)
                - [Event: OnSit](#event-onsit-2)
                - [Event: OnSpeechChallengeAvailable](#event-onspeechchallengeavailable-2)
                - [Event: OnPlayerPlanetSurveyComplete](#event-onplayerplanetsurveycomplete-2)
                - [Event: OnPlayerScannedObject](#event-onplayerscannedobject-2)
                - [Event: OnShipDock](#event-onshipdock-2)
                - [Event: OnShipFarTravel](#event-onshipfartravel-2)
                - [Event: OnShipGravJump](#event-onshipgravjump-2)
                - [Event: OnShipLanding](#event-onshiplanding-2)
                - [Event: OnShipRampDown](#event-onshiprampdown-2)
                - [Event: OnShipScan](#event-onshipscan-2)
                - [Event: OnShipSystemPowerChange](#event-onshipsystempowerchange-2)
                - [Event: OnShipTakeOff](#event-onshiptakeoff-2)
                - [Event: OnShipUndock](#event-onshipundock-2)
                - [Event: OnShipSystemDamaged](#event-onshipsystemdamaged-2)
                - [Event: OnShipSystemRepaired](#event-onshipsystemrepaired-2)
                - [Event: OnShipRefueled](#event-onshiprefueled-2)
                - [Event: OnShipBought](#event-onshipbought-2)
                - [Event: OnShipSold](#event-onshipsold-2)
                - [Function: ApplyToRef (Native)](#function-applytoref-native)
                - [Function: Clear (Native)](#function-clear-native-1)
                - [Function: GetReference (Native)](#function-getreference-native)
                - [Function: ForceRefTo (Native)](#function-forcerefto-native)
                - [Function: ForceRefIfEmpty](#function-forcerefifempty)
                - [Function: GetActorReference](#function-getactorreference)
                - [Function: GetRef](#function-getref)
                - [Function: GetActorRef](#function-getactorref)
                - [Function: GetShipReference](#function-getshipreference)
                - [Function: GetShipRef](#function-getshipref)
                - [Function: RemoveFromRef (Native)](#function-removefromref-native)
                - [Function: TryToAddToFaction](#function-trytoaddtofaction)
                - [Function: TryToRemoveFromFaction](#function-trytoremovefromfaction)
                - [Function: TryToStopCombat](#function-trytostopcombat)
                - [Function: TryToDisable](#function-trytodisable)
                - [Function: TryToDisableNoWait](#function-trytodisablenowait)
                - [Function: TryToEnable](#function-trytoenable)
                - [Function: TryToEnableNoWait](#function-trytoenablenowait)
                - [Function: TryToEvaluatePackage](#function-trytoevaluatepackage)
                - [Function: TryToKill](#function-trytokill)
                - [Function: TryToMoveTo](#function-trytomoveto)
                - [Function: TryToReset](#function-trytoreset)
                - [Function: TryToClear](#function-trytoclear)
                - [Function: TryToDelete](#function-trytodelete)
                - [Function: TryToGetCurrentLocation](#function-trytogetcurrentlocation)
                - [Function: TryToGetActorValue](#function-trytogetactorvalue)
                - [Function: TryToGetValue](#function-trytogetvalue)
                - [Function: TryToSetActorValue](#function-trytosetactorvalue)
                - [Function: TryToSetValue](#function-trytosetvalue)
                - [Function: TryIsLocked](#function-tryislocked)
                - [Function: TryToSetPlayerResistingArrest](#function-trytosetplayerresistingarrest)
                - [Function: TryToSendPlayerToJail](#function-trytosendplayertojail)
                - [Function: TryToPlayerPayFine](#function-trytoplayerpayfine)
                - [Function: TryToSendSmugglingAlarm](#function-trytosendsmugglingalarm)
                - [Function: TryToInstantDock](#function-trytoinstantdock)
                - [Function: TryToMoveNear](#function-trytomovenear)
                - [Function: TryToGetCrimeFaction](#function-trytogetcrimefaction)
                - [Function: ClearAndRefillAlias](#function-clearandrefillalias-1)
        - [Script: Form](#script-form)
            - [Function: GetFormID (Native)](#function-getformid-native)
            - [Function: GetFormEditorID (Native)](#function-getformeditorid-native)
            - [Function: GetGoldValue (Native)](#function-getgoldvalue-native)
            - [Function: GetWeight (Native)](#function-getweight-native)
            - [Function: HasKeyword (Native)](#function-haskeyword-native)
            - [Function: HasKeywordInFormList (Native)](#function-haskeywordinformlist-native)
            - [Function: PlayerKnows (Native)](#function-playerknows-native)
            - [Function: StartObjectProfiling (Native)](#function-startobjectprofiling-native-2)
            - [Function: StopObjectProfiling (Native)](#function-stopobjectprofiling-native-2)
            - [Script: Action](#script-action)
            - [Script: Activator](#script-activator)
                - [Function: IsRadio (Native)](#function-isradio-native)
                - [Script: Flora](#script-flora)
                - [Script: Furniture](#script-furniture)
                    - [Function: GetAssociatedForm (Native)](#function-getassociatedform-native)
                - [Script: TalkingActivator](#script-talkingactivator)
            - [Script: ActorBase](#script-actorbase)
                - [Function: GetClass (Native)](#function-getclass-native)
                - [Function: GetDeadCount (Native)](#function-getdeadcount-native)
                - [Function: GetGiftFilter (Native)](#function-getgiftfilter-native)
                - [Function: GetRace (Native)](#function-getrace-native)
                - [Function: GetLevel (Native)](#function-getlevel-native)
                - [Function: GetLevelExact (Native)](#function-getlevelexact-native)
                - [Function: GetSex (Native)](#function-getsex-native)
                - [Function: GetPronoun (Native)](#function-getpronoun-native)
                - [Function: DeriveGeneticParentAppearance (Native)](#function-derivegeneticparentappearance-native)
                - [Function: GetUniqueActor (Native)](#function-getuniqueactor-native)
                - [Function: IsEssential (Native)](#function-isessential-native)
                - [Function: IsProtected (Native)](#function-isprotected-native)
                - [Function: IsUnique (Native)](#function-isunique-native)
                - [Function: SetEssential (Native)](#function-setessential-native)
                - [Function: SetProtected (Native)](#function-setprotected-native)
                - [Function: SetOutfit (Native)](#function-setoutfit-native)
            - [Script: ActorValue](#script-actorvalue)
                - [Function: GetResource (Native)](#function-getresource-native)
            - [Script: AffinityEvent](#script-affinityevent)
                - [Function: Send (Native)](#function-send-native)
                - [Function: Reset (Native)](#function-reset-native)
            - [Script: Ammo](#script-ammo)
            - [Script: Armor](#script-armor)
            - [Script: AssociationType](#script-associationtype)
            - [Script: Book](#script-book)
            - [Script: CameraShot](#script-camerashot)
            - [Script: Cell](#script-cell)
                - [Function: EnableFastTravel (Native)](#function-enablefasttravel-native)
                - [Function: GetActorOwner (Native)](#function-getactorowner-native)
                - [Function: GetFactionOwner (Native)](#function-getfactionowner-native)
                - [Function: GetParentRef (Native)](#function-getparentref-native)
                - [Function: IsAttached (Native)](#function-isattached-native)
                - [Function: IsInterior (Native)](#function-isinterior-native)
                - [Function: IsLoaded (Native)](#function-isloaded-native)
                - [Function: Reset (Native)](#function-reset-native-1)
                - [Function: SetActorOwner (Native)](#function-setactorowner-native)
                - [Function: SetFactionOwner (Native)](#function-setfactionowner-native)
                - [Function: SetFogColor (Native)](#function-setfogcolor-native)
                - [Function: SetFogPlanes (Native)](#function-setfogplanes-native)
                - [Function: SetFogPower (Native)](#function-setfogpower-native)
                - [Function: SetGravityScale (Native)](#function-setgravityscale-native)
                - [Function: SetOffLimits (Native)](#function-setofflimits-native)
                - [Function: SetPublic (Native)](#function-setpublic-native)
            - [Script: Challenge](#script-challenge)
                - [Function: StartPlayerChallenge (Native)](#function-startplayerchallenge-native)
            - [Script: Class](#script-class)
            - [Script: CombatStyle](#script-combatstyle)
            - [Script: ConditionForm](#script-conditionform)
                - [Function: IsTrue (Native)](#function-istrue-native)
            - [Script: Container](#script-container)
            - [Script: Curve](#script-curve)
                - [Function: HasValueAt (Native)](#function-hasvalueat-native)
                - [Function: GetValueAt (Native)](#function-getvalueat-native)
                - [Function: GetValues](#function-getvalues)
            - [Script: Door](#script-door)
            - [Script: EffectShader](#script-effectshader)
                - [Function: Play (Native)](#function-play-native)
                - [Function: Stop (Native)](#function-stop-native)
            - [Script: Enchantment](#script-enchantment)
                - [Function: IsHostile (Native)](#function-ishostile-native)
            - [Script: Explosion](#script-explosion)
            - [Script: Faction](#script-faction)
                - [Function: CanPayCrimeGold (Native)](#function-canpaycrimegold-native)
                - [Function: GetCrimeGold (Native)](#function-getcrimegold-native)
                - [Function: GetCrimeGoldNonViolent (Native)](#function-getcrimegoldnonviolent-native)
                - [Function: GetCrimeGoldViolent (Native)](#function-getcrimegoldviolent-native)
                - [Function: GetInfamy (Native)](#function-getinfamy-native)
                - [Function: GetInfamyNonViolent (Native)](#function-getinfamynonviolent-native)
                - [Function: GetInfamyViolent (Native)](#function-getinfamyviolent-native)
                - [Function: GetFactionReaction (Native)](#function-getfactionreaction-native)
                - [Function: GetStolenItemValueCrime (Native)](#function-getstolenitemvaluecrime-native)
                - [Function: GetStolenItemValueNoCrime (Native)](#function-getstolenitemvaluenocrime-native)
                - [Function: IsFactionInCrimeGroup (Native)](#function-isfactionincrimegroup-native)
                - [Function: IsPlayerEnemy (Native)](#function-isplayerenemy-native)
                - [Function: IsPlayerExpelled (Native)](#function-isplayerexpelled-native)
                - [Function: ModCrimeGold (Native)](#function-modcrimegold-native)
                - [Function: PlayerPayCrimeGold (Native)](#function-playerpaycrimegold-native)
                - [Function: RemovePlayerContrabandAndStolenItems (Native)](#function-removeplayercontrabandandstolenitems-native)
                - [Function: SendAssaultAlarm (Native)](#function-sendassaultalarm-native)
                - [Function: SendPlayerToJail (Native)](#function-sendplayertojail-native)
                - [Function: SendPlayerToJailEx (Native)](#function-sendplayertojailex-native)
                - [Function: SetAlly (Native)](#function-setally-native)
                - [Function: SetCrimeGold (Native)](#function-setcrimegold-native)
                - [Function: SetCrimeGoldViolent (Native)](#function-setcrimegoldviolent-native)
                - [Function: SetEnemy (Native)](#function-setenemy-native)
                - [Function: SetPlayerEnemy (Native)](#function-setplayerenemy-native)
                - [Function: SetPlayerExpelled (Native)](#function-setplayerexpelled-native)
            - [Script: FormList](#script-formlist)
                - [Function: AddForm (Native)](#function-addform-native)
                - [Function: Find (Native)](#function-find-native-1)
                - [Function: GetSize (Native)](#function-getsize-native)
                - [Function: GetArray (Native)](#function-getarray-native-1)
                - [Function: GetAt (Native)](#function-getat-native-1)
                - [Function: HasForm (Native)](#function-hasform-native)
                - [Function: RemoveAddedForm (Native)](#function-removeaddedform-native)
                - [Function: Revert (Native)](#function-revert-native)
            - [Script: GameplayOption](#script-gameplayoption)
                - [Function: GetRewardValue (Native)](#function-getrewardvalue-native)
                - [Function: GetValue (Native)](#function-getvalue-native)
                - [Function: GetXPTotal (Native) (Global)](#function-getxptotal-native-global)
                - [Function: NotifyGameplayOptionUpdateFinished (Native) (Global)](#function-notifygameplayoptionupdatefinished-native-global)
            - [Script: GlobalVariable](#script-globalvariable)
                - [Function: GetValue (Native)](#function-getvalue-native-1)
                - [Function: SetValue (Native)](#function-setvalue-native)
                - [Function: GetValueInt](#function-getvalueint)
                - [Function: SetValueInt](#function-setvalueint)
                - [Function: Mod](#function-mod)
                - [Property: Value](#property-value)
                    - [Function: get](#function-get)
                    - [Function: set](#function-set)
            - [Script: Hazard](#script-hazard)
            - [Script: HeadPart](#script-headpart)
            - [Script: Idle](#script-idle)
            - [Script: IdleMarker](#script-idlemarker)
            - [Script: ImageSpaceModifier](#script-imagespacemodifier)
                - [Function: Apply (Native)](#function-apply-native)
                - [Function: ApplyCrossFade (Native)](#function-applycrossfade-native)
                - [Function: PopTo (Native)](#function-popto-native)
                - [Function: Remove (Native)](#function-remove-native)
                - [Function: RemoveCrossFade (Native) (Global)](#function-removecrossfade-native-global)
            - [Script: ImpactDataSet](#script-impactdataset)
            - [Script: Ingredient](#script-ingredient)
                - [Function: IsHostile (Native)](#function-ishostile-native-1)
                - [Function: LearnEffect (Native)](#function-learneffect-native)
                - [Function: LearnNextEffect (Native)](#function-learnnexteffect-native)
                - [Function: LearnAllEffects (Native)](#function-learnalleffects-native)
            - [Script: InstanceNamingRules](#script-instancenamingrules)
                - [Function: MergeWith (Native)](#function-mergewith-native)
            - [Script: Keyword](#script-keyword)
                - [Function: SendStoryEvent (Native)](#function-sendstoryevent-native)
                - [Function: SendStoryEventAndWait (Native)](#function-sendstoryeventandwait-native)
                - [Script: LocationRefType](#script-locationreftype)
            - [Script: LegendaryItem](#script-legendaryitem)
            - [Script: LeveledActor](#script-leveledactor)
                - [Function: AddForm (Native)](#function-addform-native-1)
                - [Function: Revert (Native)](#function-revert-native-1)
            - [Script: LeveledItem](#script-leveleditem)
                - [Function: AddForm (Native)](#function-addform-native-2)
                - [Function: Revert (Native)](#function-revert-native-2)
            - [Script: LeveledSpaceshipBase](#script-leveledspaceshipbase)
                - [Function: AddForm (Native)](#function-addform-native-3)
                - [Function: Revert (Native)](#function-revert-native-3)
            - [Script: LeveledSpell](#script-leveledspell)
                - [Function: AddForm (Native)](#function-addform-native-4)
                - [Function: Revert (Native)](#function-revert-native-4)
            - [Script: Light](#script-light)
            - [Script: Location](#script-location)
                - [Event: OnLocationExplored](#event-onlocationexplored)
                - [Event: OnLocationLoaded](#event-onlocationloaded)
                - [Function: AddKeyword (Native)](#function-addkeyword-native)
                - [Function: AddLinkedLocation (Native)](#function-addlinkedlocation-native)
                - [Function: CountActors (Native)](#function-countactors-native)
                - [Function: DisableSpaceTravelToAllExcept (Native)](#function-disablespacetraveltoallexcept-native)
                - [Function: EnableSpaceTravel (Native)](#function-enablespacetravel-native)
                - [Function: GetActors (Native)](#function-getactors-native)
                - [Function: GetAllLinkedLocations (Native)](#function-getalllinkedlocations-native)
                - [Function: GetCurrentPlanet (Native)](#function-getcurrentplanet-native)
                - [Function: GetKeywordData (Native)](#function-getkeyworddata-native)
                - [Function: GetMinLevel (Native)](#function-getminlevel-native)
                - [Function: GetMaxLevel (Native)](#function-getmaxlevel-native)
                - [Function: GetParentLocations (Native)](#function-getparentlocations-native)
                - [Function: GetRefTypeAliveCount (Native)](#function-getreftypealivecount-native)
                - [Function: GetRefTypeDeadCount (Native)](#function-getreftypedeadcount-native)
                - [Function: GetValue (Native)](#function-getvalue-native-2)
                - [Function: HasCommonParent (Native)](#function-hascommonparent-native)
                - [Function: HasEverBeenExplored (Native)](#function-haseverbeenexplored-native)
                - [Function: HasRefType (Native)](#function-hasreftype-native)
                - [Function: IsExplored (Native)](#function-isexplored-native)
                - [Function: IsChild (Native)](#function-ischild-native)
                - [Function: IsLinkedLocation (Native)](#function-islinkedlocation-native)
                - [Function: IsLoaded (Native)](#function-isloaded-native-1)
                - [Function: IsSameLocation](#function-issamelocation)
                - [Function: ModifyKeywordData](#function-modifykeyworddata)
                - [Function: RemoveKeyword (Native)](#function-removekeyword-native)
                - [Function: RemoveLinkedLocation (Native)](#function-removelinkedlocation-native)
                - [Function: Reset (Native)](#function-reset-native-2)
                - [Function: SetKeywordData (Native)](#function-setkeyworddata-native)
                - [Function: SetExplored (Native)](#function-setexplored-native)
                - [Function: SetFactionOwner (Native)](#function-setfactionowner-native-1)
                - [Function: SetMinLevel (Native)](#function-setminlevel-native)
                - [Function: SetMaxLevel (Native)](#function-setmaxlevel-native)
                - [Function: SetNeverResets (Native)](#function-setneverresets-native)
                - [Function: SetValue (Native)](#function-setvalue-native-1)
                - [Function: ModValue](#function-modvalue)
            - [Script: MagicEffect](#script-magiceffect)
                - [Function: GetAssociatedSkill (Native)](#function-getassociatedskill-native)
            - [Script: Message](#script-message)
                - [Function: Show (Native)](#function-show-native)
                - [Function: ShowAsHelpMessage (Native)](#function-showashelpmessage-native)
                - [Function: UnshowAsHelpMessage (Native)](#function-unshowashelpmessage-native)
                - [Function: ClearHelpMessages (Native) (Global)](#function-clearhelpmessages-native-global)
                - [Function: ResetHelpMessage (Native) (Global)](#function-resethelpmessage-native-global)
                - [Function: AttachLoadDoors (Native)](#function-attachloaddoors-native)
            - [Script: MiscObject](#script-miscobject)
                - [Function: GetObjectResourceCount (Native)](#function-getobjectresourcecount-native)
                - [Script: ConstructibleObject](#script-constructibleobject)
                - [Script: Key](#script-key)
                - [Script: SoulGem](#script-soulgem)
            - [Script: MusicType](#script-musictype)
                - [Function: Add (Native)](#function-add-native)
                - [Function: Remove (Native)](#function-remove-native-1)
            - [Script: Note](#script-note)
            - [Script: ObjectMod](#script-objectmod)
            - [Script: ObjectReference](#script-objectreference)
                - [Property: X](#property-x)
                    - [Function: get](#function-get-1)
                - [Property: Y](#property-y)
                    - [Function: get](#function-get-2)
                - [Property: Z](#property-z)
                    - [Function: get](#function-get-3)
                - [Property: CONST\_NearPosition\_Min](#property-const_nearposition_min)
                - [Property: CONST\_NearPosition\_Max](#property-const_nearposition_max)
                - [Property: CONST\_NearPosition\_Random](#property-const_nearposition_random)
                - [Property: CONST\_NearPosition\_DeadAhead](#property-const_nearposition_deadahead)
                - [Property: CONST\_NearPosition\_ForwardTight](#property-const_nearposition_forwardtight)
                - [Property: CONST\_NearPosition\_ForwardWide](#property-const_nearposition_forwardwide)
                - [Property: CONST\_NearPosition\_Behind](#property-const_nearposition_behind)
                - [Property: CONST\_NearPosition\_Above](#property-const_nearposition_above)
                - [Property: CONST\_NearPosition\_Below](#property-const_nearposition_below)
                - [Property: CONST\_NearPosition\_Left](#property-const_nearposition_left)
                - [Property: CONST\_NearPosition\_Right](#property-const_nearposition_right)
                - [Property: CONST\_NearPosition\_TightArc](#property-const_nearposition_tightarc)
                - [Property: CONST\_NearPosition\_WideArc](#property-const_nearposition_widearc)
                - [Property: CONST\_NearDistance\_Min](#property-const_neardistance_min)
                - [Property: CONST\_NearDistance\_Max](#property-const_neardistance_max)
                - [Property: CONST\_NearDistance\_RandomFar](#property-const_neardistance_randomfar)
                - [Property: CONST\_NearDistance\_Random](#property-const_neardistance_random)
                - [Property: CONST\_NearDistance\_VeryClose](#property-const_neardistance_veryclose)
                - [Property: CONST\_NearDistance\_Close](#property-const_neardistance_close)
                - [Property: CONST\_NearDistance\_Short](#property-const_neardistance_short)
                - [Property: CONST\_NearDistance\_Moderate](#property-const_neardistance_moderate)
                - [Property: CONST\_NearDistance\_Long](#property-const_neardistance_long)
                - [Property: CONST\_NearDistance\_VeryLong](#property-const_neardistance_verylong)
                - [Property: CONST\_NearDistance\_Close\_Min](#property-const_neardistance_close_min)
                - [Property: CONST\_NearDistance\_Close\_Max](#property-const_neardistance_close_max)
                - [Property: CONST\_NearDistance\_Short\_Min](#property-const_neardistance_short_min)
                - [Property: CONST\_NearDistance\_Short\_Max](#property-const_neardistance_short_max)
                - [Property: CONST\_NearDistance\_Moderate\_Min](#property-const_neardistance_moderate_min)
                - [Property: CONST\_NearDistance\_Moderate\_Max](#property-const_neardistance_moderate_max)
                - [Property: CONST\_NearDistance\_Long\_Min](#property-const_neardistance_long_min)
                - [Property: CONST\_NearDistance\_Long\_Max](#property-const_neardistance_long_max)
                - [Property: CONST\_NearDistance\_VeryLong\_Min](#property-const_neardistance_verylong_min)
                - [Property: CONST\_NearDistance\_VeryLong\_Max](#property-const_neardistance_verylong_max)
                - [Property: CONST\_NearFacing\_Min](#property-const_nearfacing_min)
                - [Property: CONST\_NearFacing\_Max](#property-const_nearfacing_max)
                - [Property: CONST\_NearFacing\_TotallyRandom](#property-const_nearfacing_totallyrandom)
                - [Property: CONST\_NearFacing\_Random](#property-const_nearfacing_random)
                - [Property: CONST\_NearFacing\_Direct](#property-const_nearfacing_direct)
                - [Property: CONST\_NearFacing\_TowardSmall](#property-const_nearfacing_towardsmall)
                - [Property: CONST\_NearFacing\_TowardLarge](#property-const_nearfacing_towardlarge)
                - [Property: CONST\_NearFacing\_AwaySmall](#property-const_nearfacing_awaysmall)
                - [Property: CONST\_NearFacing\_AwayLarge](#property-const_nearfacing_awaylarge)
                - [Property: CONST\_NearFacing\_LeftSideOn](#property-const_nearfacing_leftsideon)
                - [Property: CONST\_NearFacing\_RightSideOn](#property-const_nearfacing_rightsideon)
                - [Property: CONST\_NearFacing\_BottomSideOn](#property-const_nearfacing_bottomsideon)
                - [Property: CONST\_NearFacing\_TopSideOn](#property-const_nearfacing_topsideon)
                - [Property: CONST\_NearFacing\_HeadingCorrectionToDirectFacing](#property-const_nearfacing_headingcorrectiontodirectfacing)
                - [Property: CONST\_NearFacing\_TightAngle](#property-const_nearfacing_tightangle)
                - [Property: CONST\_NearFacing\_WideAngle](#property-const_nearfacing_wideangle)
                - [Property: Motion\_Fixed](#property-motion_fixed)
                - [Property: Motion\_Dynamic](#property-motion_dynamic)
                - [Property: Motion\_Keyframed](#property-motion_keyframed)
                - [Event: OnActivate](#event-onactivate-3)
                - [Event: OnBuilderMenuSelect](#event-onbuildermenuselect-3)
                - [Event: OnCellAttach](#event-oncellattach-3)
                - [Event: OnCellDetach](#event-oncelldetach-3)
                - [Event: OnCellLoad](#event-oncellload-3)
                - [Event: OnClose](#event-onclose-3)
                - [Event: OnContainerChanged](#event-oncontainerchanged-3)
                - [Event: OnCrewAssigned](#event-oncrewassigned-3)
                - [Event: OnCrewDismissed](#event-oncrewdismissed-3)
                - [Event: OnDestroyed](#event-ondestroyed-3)
                - [Event: OnDestructionStageChanged](#event-ondestructionstagechanged-3)
                - [Event: OnEnterFurniture](#event-onenterfurniture-3)
                - [Event: OnEquipped](#event-onequipped-3)
                - [Event: OnExitFurniture](#event-onexitfurniture-3)
                - [Event: OnGrab](#event-ongrab-3)
                - [Event: OnItemAdded](#event-onitemadded-3)
                - [Event: OnItemRemoved](#event-onitemremoved-3)
                - [Event: OnLoad](#event-onload-3)
                - [Event: OnLockStateChanged](#event-onlockstatechanged-3)
                - [Event: OnMapMarkerDiscovered](#event-onmapmarkerdiscovered-3)
                - [Event: OnObjectRepaired](#event-onobjectrepaired-3)
                - [Event: OnObjectDestroyed](#event-onobjectdestroyed-3)
                - [Event: OnOpen](#event-onopen-3)
                - [Event: OnOutpostItemPowerOff](#event-onoutpostitempoweroff-3)
                - [Event: OnOutpostItemPowerOn](#event-onoutpostitempoweron-3)
                - [Event: OnPipboyRadioDetection](#event-onpipboyradiodetection-3)
                - [Event: OnPlayerDialogueTarget](#event-onplayerdialoguetarget-3)
                - [Event: OnPowerOn](#event-onpoweron-3)
                - [Event: OnPowerOff](#event-onpoweroff-3)
                - [Event: OnQuickContainerOpened](#event-onquickcontaineropened-3)
                - [Event: OnRead](#event-onread-3)
                - [Event: OnRelease](#event-onrelease-3)
                - [Event: OnReset](#event-onreset-3)
                - [Event: OnScanned](#event-onscanned-3)
                - [Event: OnSell](#event-onsell-3)
                - [Event: OnSpellCast](#event-onspellcast-3)
                - [Event: OnTerminalMenuItemRun](#event-onterminalmenuitemrun-3)
                - [Event: OnTranslationAlmostComplete](#event-ontranslationalmostcomplete-3)
                - [Event: OnTranslationComplete](#event-ontranslationcomplete-3)
                - [Event: OnTranslationFailed](#event-ontranslationfailed-3)
                - [Event: OnTrapHitStart](#event-ontraphitstart-3)
                - [Event: OnTrapHitStop](#event-ontraphitstop-3)
                - [Event: OnTriggerEnter](#event-ontriggerenter-3)
                - [Event: OnTriggerLeave](#event-ontriggerleave-3)
                - [Event: OnUnequipped](#event-onunequipped-3)
                - [Event: OnUnload](#event-onunload-3)
                - [Event: OnWorkshopCargoLinkChanged](#event-onworkshopcargolinkchanged-3)
                - [Event: OnWorkshopFlyCam](#event-onworkshopflycam-3)
                - [Event: OnWorkshopMode](#event-onworkshopmode-3)
                - [Event: OnWorkshopObjectGrabbed](#event-onworkshopobjectgrabbed-3)
                - [Event: OnWorkshopObjectMoved](#event-onworkshopobjectmoved-3)
                - [Event: OnWorkshopObjectPlaced](#event-onworkshopobjectplaced-3)
                - [Event: OnWorkshopObjectRemoved](#event-onworkshopobjectremoved-3)
                - [Event: OnWorkshopOutputLink](#event-onworkshopoutputlink-3)
                - [Event: OnWorkshopNPCTransfer](#event-onworkshopnpctransfer-3)
                - [Function: GetCurrentShipRef](#function-getcurrentshipref)
                - [Function: Unlock](#function-unlock)
                - [Function: rampRumble](#function-ramprumble)
                - [Function: IsNearPlayer](#function-isnearplayer)
                - [Function: IsInInterior](#function-isininterior)
                - [Function: MoveToIfUnloaded](#function-movetoifunloaded)
                - [Function: HasRefType](#function-hasreftype)
                - [Function: MoveToWhenUnloaded](#function-movetowhenunloaded)
                - [Function: Activate (Native)](#function-activate-native)
                - [Function: AddDependentAnimatedObjectReference (Native)](#function-adddependentanimatedobjectreference-native)
                - [Function: AddDynamicTerminalMenuItem (Native)](#function-adddynamicterminalmenuitem-native)
                - [Function: AddAliasedItem](#function-addaliaseditem)
                - [Function: AddAliasedItemSingle](#function-addaliaseditemsingle)
                - [Function: AddAliasedItemWithKeywords](#function-addaliaseditemwithkeywords)
                - [Function: AddAliasedItemWithKeywordsSingle](#function-addaliaseditemwithkeywordssingle)
                - [Function: AddItem (Native)](#function-additem-native)
                - [Function: AddKeyword (Native)](#function-addkeyword-native-1)
                - [Function: AddKeyIfNeeded (Native)](#function-addkeyifneeded-native)
                - [Function: AddSpell (Native)](#function-addspell-native)
                - [Function: AddTextReplacementData (Native)](#function-addtextreplacementdata-native)
                - [Function: AddTextReplacementValue (Native)](#function-addtextreplacementvalue-native)
                - [Function: AddToMap (Native)](#function-addtomap-native)
                - [Function: AddToMapScanned](#function-addtomapscanned)
                - [Function: AddTransferLink (Native)](#function-addtransferlink-native)
                - [Function: AssignCrew (Native)](#function-assigncrew-native)
                - [Function: ApplyConveyorBelt (Native)](#function-applyconveyorbelt-native)
                - [Function: ApplyHavokImpulse (Native)](#function-applyhavokimpulse-native)
                - [Function: ApplyFanMotor (Native)](#function-applyfanmotor-native)
                - [Function: AreAllInTrigger (Native)](#function-areallintrigger-native)
                - [Function: AreAnyInTrigger (Native)](#function-areanyintrigger-native)
                - [Function: FanMotorOn (Native)](#function-fanmotoron-native)
                - [Function: IsFanMotorOn (Native)](#function-isfanmotoron-native)
                - [Function: AttachMod (Native)](#function-attachmod-native)
                - [Function: AttachModToInventoryItem (Native)](#function-attachmodtoinventoryitem-native)
                - [Function: AttachTo (Native)](#function-attachto-native)
                - [Function: BlockActivation (Native)](#function-blockactivation-native)
                - [Function: CalculateEncounterLevel (Native)](#function-calculateencounterlevel-native)
                - [Function: CanFastTravelToMarker (Native)](#function-canfasttraveltomarker-native)
                - [Function: CanProduceForWorkshop (Native)](#function-canproduceforworkshop-native)
                - [Function: ClearDestruction (Native)](#function-cleardestruction-native)
                - [Function: ClearDynamicTerminalMenuItems (Native)](#function-cleardynamicterminalmenuitems-native)
                - [Function: ClearFromOldLocations (Native)](#function-clearfromoldlocations-native)
                - [Function: ConveyorBeltOn (Native)](#function-conveyorbelton-native)
                - [Function: CountActorsLinkedToMe (Native)](#function-countactorslinkedtome-native)
                - [Function: CountLinkedRefChain (Native)](#function-countlinkedrefchain-native)
                - [Function: CountRefsLinkedToMe (Native)](#function-countrefslinkedtome-native)
                - [Function: CreateDetectionEvent (Native)](#function-createdetectionevent-native)
                - [Function: DamageObject (Native)](#function-damageobject-native)
                - [Function: DamageValue (Native)](#function-damagevalue-native)
                - [Function: Delete (Native)](#function-delete-native)
                - [Function: Disable (Native)](#function-disable-native)
                - [Function: DisableLinkChain (Native)](#function-disablelinkchain-native)
                - [Function: DisableNoWait (Native)](#function-disablenowait-native)
                - [Function: DispelSpell (Native)](#function-dispelspell-native)
                - [Function: Drop (Native)](#function-drop-native)
                - [Function: DropFirstObject (Native)](#function-dropfirstobject-native)
                - [Function: DropObject (Native)](#function-dropobject-native)
                - [Function: Enable (Native)](#function-enable-native)
                - [Function: EnableFastTravel (Native)](#function-enablefasttravel-native-1)
                - [Function: EnableLinkChain (Native)](#function-enablelinkchain-native)
                - [Function: EnableNoWait (Native)](#function-enablenowait-native)
                - [Function: FindAllReferencesOfType (Native)](#function-findallreferencesoftype-native)
                - [Function: FindAllReferencesWithKeyword (Native)](#function-findallreferenceswithkeyword-native)
                - [Function: ForceAddRagdollToWorld (Native)](#function-forceaddragdolltoworld-native)
                - [Function: ForceRemoveRagdollFromWorld (Native)](#function-forceremoveragdollfromworld-native)
                - [Function: GetActorBaseForResource (Native)](#function-getactorbaseforresource-native)
                - [Function: GetActorOwner (Native)](#function-getactorowner-native-1)
                - [Function: GetActorRefOwner (Native)](#function-getactorrefowner-native)
                - [Function: GetActorsLinkedToMe (Native)](#function-getactorslinkedtome-native)
                - [Function: GetAllCrewMembers (Native)](#function-getallcrewmembers-native)
                - [Function: GetAllRefsInTrigger (Native)](#function-getallrefsintrigger-native)
                - [Function: GetAngleX (Native)](#function-getanglex-native)
                - [Function: GetAngleY (Native)](#function-getangley-native)
                - [Function: GetAngleZ (Native)](#function-getanglez-native)
                - [Function: GetAnimationVariableBool (Native)](#function-getanimationvariablebool-native)
                - [Function: GetAnimationVariableInt (Native)](#function-getanimationvariableint-native)
                - [Function: GetAnimationVariableFloat (Native)](#function-getanimationvariablefloat-native)
                - [Function: GetBaseObject (Native)](#function-getbaseobject-native-1)
                - [Function: GetBaseValue (Native)](#function-getbasevalue-native)
                - [Function: GetBiomeActors (Native)](#function-getbiomeactors-native)
                - [Function: GetBiomeFlora (Native)](#function-getbiomeflora-native)
                - [Function: GetCurrentDestructionStage (Native)](#function-getcurrentdestructionstage-native)
                - [Function: GetCurrentLocation (Native)](#function-getcurrentlocation-native)
                - [Function: GetCurrentPlanet (Native)](#function-getcurrentplanet-native-1)
                - [Function: GetCurrentScene (Native)](#function-getcurrentscene-native)
                - [Function: GetDayLength](#function-getdaylength)
                - [Function: GetDebugTextColor (Native)](#function-getdebugtextcolor-native)
                - [Function: GetDebugTextSize (Native)](#function-getdebugtextsize-native)
                - [Function: GetDebugTextString (Native)](#function-getdebugtextstring-native)
                - [Function: GetDestructibleOutpostObjects (Native)](#function-getdestructibleoutpostobjects-native)
                - [Function: GetDistance (Native)](#function-getdistance-native)
                - [Function: GetEditorLocation (Native)](#function-geteditorlocation-native)
                - [Function: GetFactionOwner (Native)](#function-getfactionowner-native-1)
                - [Function: GetFloraForResource (Native)](#function-getfloraforresource-native)
                - [Function: GetGravityScale (Native)](#function-getgravityscale-native)
                - [Function: GetHeadingAngle (Native)](#function-getheadingangle-native)
                - [Function: GetHeight (Native)](#function-getheight-native)
                - [Function: GetHighestItemCountKeywords (Native)](#function-gethighestitemcountkeywords-native)
                - [Function: GetInventoryValue (Native)](#function-getinventoryvalue-native)
                - [Function: GetItemCount (Native)](#function-getitemcount-native)
                - [Function: GetItemCountKeywords (Native)](#function-getitemcountkeywords-native)
                - [Function: GetComponentCount (Native)](#function-getcomponentcount-native)
                - [Function: GetContainer (Native)](#function-getcontainer-native)
                - [Function: GetItemHealthPercent (Native)](#function-getitemhealthpercent-native)
                - [Function: GetKey (Native)](#function-getkey-native)
                - [Function: GetLength (Native)](#function-getlength-native)
                - [Function: GetLinkedCell (Native)](#function-getlinkedcell-native)
                - [Function: GetLinkedRef (Native)](#function-getlinkedref-native)
                - [Function: GetLinkedRefChain (Native)](#function-getlinkedrefchain-native)
                - [Function: GetLockLevel (Native)](#function-getlocklevel-native)
                - [Function: GetLocRefTypes (Native)](#function-getlocreftypes-native)
                - [Function: GetNthLinkedRef (Native)](#function-getnthlinkedref-native)
                - [Function: GetMass (Native)](#function-getmass-native)
                - [Function: GetOpenState (Native)](#function-getopenstate-native)
                - [Function: GetParentCell (Native)](#function-getparentcell-native)
                - [Function: GetPercentageKnown (Native)](#function-getpercentageknown-native)
                - [Function: GetPositionX (Native)](#function-getpositionx-native)
                - [Function: GetPositionY (Native)](#function-getpositiony-native)
                - [Function: GetPositionZ (Native)](#function-getpositionz-native)
                - [Function: GetSpacePosition (Native)](#function-getspaceposition-native)
                - [Function: GetSpaceTransform (Native)](#function-getspacetransform-native)
                - [Function: GetRadioFrequency (Native)](#function-getradiofrequency-native)
                - [Function: GetRadioVolume (Native)](#function-getradiovolume-native)
                - [Function: GetResourceDamage (Native)](#function-getresourcedamage-native)
                - [Function: GetSafePosition (Native)](#function-getsafeposition-native)
                - [Function: GetWeight (Native)](#function-getweight-native-1)
                - [Function: GetWeightInContainer (Native)](#function-getweightincontainer-native)
                - [Function: GetRefsLinkedToMe (Native)](#function-getrefslinkedtome-native)
                - [Function: GetWorkshopOwnedObjects (Native)](#function-getworkshopownedobjects-native)
                - [Function: GetWorkshopResourceDamage (Native)](#function-getworkshopresourcedamage-native)
                - [Function: GetWorkshopResourceObjects (Native)](#function-getworkshopresourceobjects-native)
                - [Function: GetScale (Native)](#function-getscale-native)
                - [Function: GetSpaceshipAutopilotAI (Native)](#function-getspaceshipautopilotai-native)
                - [Function: GetTeleportCell (Native)](#function-getteleportcell-native)
                - [Function: GetTransitionCell (Native)](#function-gettransitioncell-native)
                - [Function: GetTransmitterDistance (Native)](#function-gettransmitterdistance-native)
                - [Function: GetTriggerObjectCount (Native)](#function-gettriggerobjectcount-native)
                - [Function: GetValue (Native)](#function-getvalue-native-3)
                - [Function: GetValueInt](#function-getvalueint-1)
                - [Function: GetValuePercentage (Native)](#function-getvaluepercentage-native)
                - [Function: GetValueResources (Native)](#function-getvalueresources-native)
                - [Function: GetValueEnumGlobal (Global)](#function-getvalueenumglobal-global)
                - [Function: GetVoiceType (Native)](#function-getvoicetype-native)
                - [Function: GetWidth (Native)](#function-getwidth-native)
                - [Function: GetWorkshop (Native)](#function-getworkshop-native)
                - [Function: GetWorldSpace (Native)](#function-getworldspace-native)
                - [Function: GetSelfAsActor](#function-getselfasactor)
                - [Function: GetSingleRefArray](#function-getsinglerefarray)
                - [Function: HasActorRefOwner (Native)](#function-hasactorrefowner-native)
                - [Function: HasCrew (Native)](#function-hascrew-native)
                - [Function: HasDirectLOS (Native)](#function-hasdirectlos-native)
                - [Function: HasEffectKeyword (Native)](#function-haseffectkeyword-native)
                - [Function: HasKeyword (Native)](#function-haskeyword-native-1)
                - [Function: HasKeywordInFormList (Native)](#function-haskeywordinformlist-native-1)
                - [Function: HasLocRefType (Native)](#function-haslocreftype-native)
                - [Function: HasMagicEffect (Native)](#function-hasmagiceffect-native)
                - [Function: HasNode (Native)](#function-hasnode-native)
                - [Function: HasOwner](#function-hasowner)
                - [Function: HasSharedPowerGrid (Native)](#function-hassharedpowergrid-native)
                - [Function: IgnoreFriendlyHits (Native)](#function-ignorefriendlyhits-native)
                - [Function: InterruptCast (Native)](#function-interruptcast-native)
                - [Function: IsActivationBlocked (Native)](#function-isactivationblocked-native)
                - [Function: Is3DLoaded (Native)](#function-is3dloaded-native)
                - [Function: IsConveyorBeltOn (Native)](#function-isconveyorbelton-native)
                - [Function: IsCreated (Native)](#function-iscreated-native)
                - [Function: IsCrew](#function-iscrew)
                - [Function: IsDebugTextBillboard (Native)](#function-isdebugtextbillboard-native)
                - [Function: IsDeleted (Native)](#function-isdeleted-native)
                - [Function: IsDestroyed (Native)](#function-isdestroyed-native)
                - [Function: IsDisabled (Native)](#function-isdisabled-native)
                - [Function: IsDoorInaccessible (Native)](#function-isdoorinaccessible-native)
                - [Function: IsEnabled](#function-isenabled)
                - [Function: IsFurnitureInUse (Native)](#function-isfurnitureinuse-native)
                - [Function: IsFurnitureMarkerInUse (Native)](#function-isfurnituremarkerinuse-native)
                - [Function: IsIgnoringFriendlyHits (Native)](#function-isignoringfriendlyhits-native)
                - [Function: IsInDialogueWithPlayer (Native)](#function-isindialoguewithplayer-native)
                - [Function: IsInTrigger (Native)](#function-isintrigger-native)
                - [Function: IsInSpace (Native)](#function-isinspace-native)
                - [Function: IsLockBroken (Native)](#function-islockbroken-native)
                - [Function: IsLocked (Native)](#function-islocked-native)
                - [Function: IsMapMarkerVisible (Native)](#function-ismapmarkervisible-native)
                - [Function: IsOwnedBy (Native)](#function-isownedby-native)
                - [Function: IsPowered (Native)](#function-ispowered-native)
                - [Function: IsQuestItem (Native)](#function-isquestitem-native)
                - [Function: IsRadioOn (Native)](#function-isradioon-native)
                - [Function: IsScanned (Native)](#function-isscanned-native)
                - [Function: IsRefInTransitionCell (Native)](#function-isrefintransitioncell-native)
                - [Function: IsTeleportAreaLoaded (Native)](#function-isteleportarealoaded-native)
                - [Function: IsSpellTarget (Native)](#function-isspelltarget-native)
                - [Function: IsWithinBuildableArea (Native)](#function-iswithinbuildablearea-native)
                - [Function: KnockAreaEffect (Native)](#function-knockareaeffect-native)
                - [Function: Lock (Native)](#function-lock-native)
                - [Function: MakeAliasedRefFromInventory (Native)](#function-makealiasedreffrominventory-native)
                - [Function: MakeTransmitterRepeater (Native)](#function-maketransmitterrepeater-native)
                - [Function: ModValue (Native)](#function-modvalue-native)
                - [Function: ModValueTo](#function-modvalueto)
                - [Function: MoveContainerContentToUnfilledContainers (Native)](#function-movecontainercontenttounfilledcontainers-native)
                - [Function: MoveTo (Native)](#function-moveto-native)
                - [Function: MoveToMyEditorLocation (Native)](#function-movetomyeditorlocation-native)
                - [Function: MoveToNearestNavmeshLocation (Native)](#function-movetonearestnavmeshlocation-native)
                - [Function: MoveToNode (Native)](#function-movetonode-native)
                - [Function: OpenOneWayTransferMenu (Native)](#function-openonewaytransfermenu-native)
                - [Function: PlaceAtMe (Native)](#function-placeatme-native)
                - [Function: PlaceShipAtMe (Native)](#function-placeshipatme-native)
                - [Function: PlaceShipAtMeOffset](#function-placeshipatmeoffset)
                - [Function: PlaceActorAtMe (Native)](#function-placeactoratme-native)
                - [Function: PlaceDuplicateActorAtMe (Native)](#function-placeduplicateactoratme-native)
                - [Function: PlaceAtNode (Native)](#function-placeatnode-native)
                - [Function: PlaceCellAtMe (Native)](#function-placecellatme-native)
                - [Function: PlaceLockedRefKeyAtMe (Native)](#function-placelockedrefkeyatme-native)
                - [Function: PlayAnimation (Native)](#function-playanimation-native)
                - [Function: PlayAnimationAndWait (Native)](#function-playanimationandwait-native)
                - [Function: PlayGamebryoAnimation (Native)](#function-playgamebryoanimation-native)
                - [Function: PlayImpactEffect (Native)](#function-playimpacteffect-native)
                - [Function: PlaySyncedAnimationSS (Native)](#function-playsyncedanimationss-native)
                - [Function: PlaySyncedAnimationAndWaitSS (Native)](#function-playsyncedanimationandwaitss-native)
                - [Function: PlayTerrainEffect (Native)](#function-playterraineffect-native)
                - [Function: PauseAudio (Native)](#function-pauseaudio-native)
                - [Function: PreloadExteriorCell (Native)](#function-preloadexteriorcell-native)
                - [Function: PreloadTargetArea (Native)](#function-preloadtargetarea-native)
                - [Function: ProcessTrapHit (Native)](#function-processtraphit-native)
                - [Function: PromoteToLegendary (Native)](#function-promotetolegendary-native)
                - [Function: PushActorAway (Native)](#function-pushactoraway-native)
                - [Function: RemoveAllItems (Native)](#function-removeallitems-native)
                - [Function: RemoveAllItemsEx (Native)](#function-removeallitemsex-native)
                - [Function: RemoveResources (Native)](#function-removeresources-native)
                - [Function: RemoveItem (Native)](#function-removeitem-native)
                - [Function: RemoveItemByComponent (Native)](#function-removeitembycomponent-native)
                - [Function: RemoveKeyword (Native)](#function-removekeyword-native-1)
                - [Function: RemoveAllMods (Native)](#function-removeallmods-native)
                - [Function: RemoveAllModsFromInventoryItem (Native)](#function-removeallmodsfrominventoryitem-native)
                - [Function: RemoveMod (Native)](#function-removemod-native)
                - [Function: RemoveModFromInventoryItem (Native)](#function-removemodfrominventoryitem-native)
                - [Function: RemoveDependentAnimatedObjectReference (Native)](#function-removedependentanimatedobjectreference-native)
                - [Function: RemoveTransferLink (Native)](#function-removetransferlink-native)
                - [Function: Repair (Native)](#function-repair-native)
                - [Function: Reset (Native)](#function-reset-native-3)
                - [Function: SetRequiresScanning (Native)](#function-setrequiresscanning-native)
                - [Function: ResetKeyword (Native)](#function-resetkeyword-native)
                - [Function: RestoreValue (Native)](#function-restorevalue-native)
                - [Function: ResumeAudio (Native)](#function-resumeaudio-native)
                - [Function: ReverseConveyorBelt (Native)](#function-reverseconveyorbelt-native)
                - [Function: Say (Native)](#function-say-native)
                - [Function: SayCustom (Native)](#function-saycustom-native)
                - [Function: SendStealAlarm (Native)](#function-sendstealalarm-native)
                - [Function: SetActivateTextOverride (Native)](#function-setactivatetextoverride-native)
                - [Function: SetActorCause (Native)](#function-setactorcause-native)
                - [Function: SetActorOwner (Native)](#function-setactorowner-native-1)
                - [Function: SetActorRefOwner (Native)](#function-setactorrefowner-native)
                - [Function: SetAngle (Native)](#function-setangle-native)
                - [Function: SetAnimationVariableBool (Native)](#function-setanimationvariablebool-native)
                - [Function: SetAnimationVariableInt (Native)](#function-setanimationvariableint-native)
                - [Function: SetAnimationVariableFloat (Native)](#function-setanimationvariablefloat-native)
                - [Function: SetAttractionActive (Native)](#function-setattractionactive-native)
                - [Function: SetConveyorBeltVelocity (Native)](#function-setconveyorbeltvelocity-native)
                - [Function: RotateCarouselDisplayCase (Native)](#function-rotatecarouseldisplaycase-native)
                - [Function: SetDebugTextBillboard (Native)](#function-setdebugtextbillboard-native)
                - [Function: SetDebugTextColor (Native)](#function-setdebugtextcolor-native)
                - [Function: SetDebugTextSize (Native)](#function-setdebugtextsize-native)
                - [Function: SetDebugTextString (Native)](#function-setdebugtextstring-native)
                - [Function: SetDestroyed (Native)](#function-setdestroyed-native)
                - [Function: SetDirectAtTarget (Native)](#function-setdirectattarget-native)
                - [Function: SetMarkerDiscovered (Native)](#function-setmarkerdiscovered-native)
                - [Function: SetDoorInaccessible (Native)](#function-setdoorinaccessible-native)
                - [Function: SetFactionOwner (Native)](#function-setfactionowner-native-2)
                - [Function: SetHarvested (Native)](#function-setharvested-native)
                - [Function: SetLinkedRef (Native)](#function-setlinkedref-native)
                - [Function: SetLockLevel (Native)](#function-setlocklevel-native)
                - [Function: SetLocRefType (Native)](#function-setlocreftype-native)
                - [Function: SetMapMarkerCategory (Native)](#function-setmapmarkercategory-native)
                - [Function: SetMapMarkerType (Native)](#function-setmapmarkertype-native)
                - [Function: SetMapMarkerUnexploredName (Native)](#function-setmapmarkerunexploredname-native)
                - [Function: SetMarkerAllowGravJump (Native)](#function-setmarkerallowgravjump-native)
                - [Function: SetMarkerUndiscoveredVisibility (Native)](#function-setmarkerundiscoveredvisibility-native)
                - [Function: SetMarkerVisibleOnStarMap (Native)](#function-setmarkervisibleonstarmap-native)
                - [Function: SetMotionType (Native)](#function-setmotiontype-native)
                - [Function: SetNoFavorAllowed (Native)](#function-setnofavorallowed-native)
                - [Function: SetOpen (Native)](#function-setopen-native)
                - [Function: SetOverrideName (Native)](#function-setoverridename-native)
                - [Function: SetPersistLoc (Native)](#function-setpersistloc-native)
                - [Function: SetPlayerHasTaken (Native)](#function-setplayerhastaken-native)
                - [Function: SetPosition (Native)](#function-setposition-native)
                - [Function: SetRadioOn (Native)](#function-setradioon-native)
                - [Function: SetRadioFrequency (Native)](#function-setradiofrequency-native)
                - [Function: SetRadioVolume (Native)](#function-setradiovolume-native)
                - [Function: SetWorkshopState (Native)](#function-setworkshopstate-native)
                - [Function: SetScale (Native)](#function-setscale-native)
                - [Function: SetScanned (Native)](#function-setscanned-native)
                - [Function: SetValue (Native)](#function-setvalue-native-2)
                - [Function: IncrementLoopingValue](#function-incrementloopingvalue)
                - [Function: ShowHangarMenu (Native)](#function-showhangarmenu-native)
                - [Function: ShowWorkshopBuilderMenu (Native)](#function-showworkshopbuildermenu-native)
                - [Function: ShowWorkshopTargetMenu (Native)](#function-showworkshoptargetmenu-native)
                - [Function: SplineTranslateTo (Native)](#function-splinetranslateto-native)
                - [Function: SplineTranslateToRef](#function-splinetranslatetoref)
                - [Function: SplineTranslateToRefNode (Native)](#function-splinetranslatetorefnode-native)
                - [Function: StartSequenceOnReferences (Native) (Global)](#function-startsequenceonreferences-native-global)
                - [Function: StartSequence (Native)](#function-startsequence-native)
                - [Function: StartWorkshop (Native)](#function-startworkshop-native)
                - [Function: StopAllSequencesOnReferences (Native) (Global)](#function-stopallsequencesonreferences-native-global)
                - [Function: StopAllSequences (Native)](#function-stopallsequences-native)
                - [Function: StopSequence (Native)](#function-stopsequence-native)
                - [Function: StopTranslation (Native)](#function-stoptranslation-native)
                - [Function: TranslateTo (Native)](#function-translateto-native)
                - [Function: TranslateToRef](#function-translatetoref)
                - [Function: UnassignCrew (Native)](#function-unassigncrew-native)
                - [Function: WaitForAnimationEvent (Native)](#function-waitforanimationevent-native)
                - [Function: WaitFor3DLoad (Native)](#function-waitfor3dload-native)
                - [Function: IsInLocation](#function-isinlocation)
                - [Function: TryToStartCombat](#function-trytostartcombat)
                - [Function: TryToStopCombat](#function-trytostopcombat-1)
                - [Function: TryToStopCombatAlarm](#function-trytostopcombatalarm)
                - [Function: TryToAddToFaction](#function-trytoaddtofaction-1)
                - [Function: TryToRemoveFromFaction](#function-trytoremovefromfaction-1)
                - [Function: TryToRemoveFromAllFactions](#function-trytoremovefromallfactions)
                - [Function: TryToEvaluatePackage](#function-trytoevaluatepackage-1)
                - [Function: TryToKill](#function-trytokill-1)
                - [Function: TryToSetGhost](#function-trytosetghost)
                - [Function: TryToSetProtected](#function-trytosetprotected)
                - [Function: TryToSetEssential](#function-trytosetessential)
                - [Function: PlaceShipNearMe](#function-placeshipnearme)
                - [Function: MoveNear](#function-movenear)
                - [Script: Actor](#script-actor)
                    - [Event: OnActorActivatedRef](#event-onactoractivatedref-3)
                    - [Event: OnAffinityEvent](#event-onaffinityevent-3)
                    - [Event: OnCombatStateChanged](#event-oncombatstatechanged-3)
                    - [Event: OnCombatListAdded](#event-oncombatlistadded-3)
                    - [Event: OnCombatListRemoved](#event-oncombatlistremoved-3)
                    - [Event: OnCommandModeCompleteCommand](#event-oncommandmodecompletecommand-3)
                    - [Event: OnCommandModeEnter](#event-oncommandmodeenter-3)
                    - [Event: OnCommandModeExit](#event-oncommandmodeexit-3)
                    - [Event: OnCommandModeGiveCommand](#event-oncommandmodegivecommand-3)
                    - [Event: OnCompanionDismiss](#event-oncompaniondismiss-3)
                    - [Event: OnConsciousnessStateChanged](#event-onconsciousnessstatechanged-3)
                    - [Event: OnCripple](#event-oncripple-3)
                    - [Event: OnDeferredKill](#event-ondeferredkill-3)
                    - [Event: OnDeath](#event-ondeath-3)
                    - [Event: OnDifficultyChanged](#event-ondifficultychanged-3)
                    - [Event: OnDying](#event-ondying-3)
                    - [Event: OnEnterBleedout](#event-onenterbleedout-3)
                    - [Event: OnEnterOutpostBeaconMode](#event-onenteroutpostbeaconmode-3)
                    - [Event: OnEnterShipInterior](#event-onentershipinterior-3)
                    - [Event: OnEnterSneaking](#event-onentersneaking-3)
                    - [Event: OnEscortWaitStart](#event-onescortwaitstart-3)
                    - [Event: OnEscortWaitStop](#event-onescortwaitstop-3)
                    - [Event: OnExitShipInterior](#event-onexitshipinterior-3)
                    - [Event: OnGetUp](#event-ongetup-3)
                    - [Event: OnHomeShipSet](#event-onhomeshipset-3)
                    - [Event: OnItemEquipped](#event-onitemequipped-3)
                    - [Event: OnItemUnequipped](#event-onitemunequipped-3)
                    - [Event: OnKill](#event-onkill-3)
                    - [Event: OnLocationChange](#event-onlocationchange-3)
                    - [Event: OnOutpostPlaced](#event-onoutpostplaced-3)
                    - [Event: OnPackageChange](#event-onpackagechange-3)
                    - [Event: OnPackageEnd](#event-onpackageend-3)
                    - [Event: OnPackageStart](#event-onpackagestart-3)
                    - [Event: OnPartialCripple](#event-onpartialcripple-3)
                    - [Event: OnPickLock](#event-onpicklock-3)
                    - [Event: OnPickpocketFailed](#event-onpickpocketfailed-3)
                    - [Event: OnPlayerArrested](#event-onplayerarrested-3)
                    - [Event: OnPlayerAssaultActor](#event-onplayerassaultactor-3)
                    - [Event: OnPlayerBuyShip](#event-onplayerbuyship-3)
                    - [Event: OnPlayerCraftItem](#event-onplayercraftitem-3)
                    - [Event: OnPlayerCreateRobot](#event-onplayercreaterobot-3)
                    - [Event: OnPlayerCompleteResearch](#event-onplayercompleteresearch-3)
                    - [Event: OnPlayerCrimeGold](#event-onplayercrimegold-3)
                    - [Event: OnPlayerEnterVertibird](#event-onplayerentervertibird-3)
                    - [Event: OnPlayerFailedPlotRoute](#event-onplayerfailedplotroute-3)
                    - [Event: OnPlayerFallLongDistance](#event-onplayerfalllongdistance-3)
                    - [Event: OnPlayerFireWeapon](#event-onplayerfireweapon-3)
                    - [Event: OnPlayerFollowerWarp](#event-onplayerfollowerwarp-3)
                    - [Event: OnPlayerHealTeammate](#event-onplayerhealteammate-3)
                    - [Event: OnPlayerItemAdded](#event-onplayeritemadded-3)
                    - [Event: OnPlayerJail](#event-onplayerjail-3)
                    - [Event: OnPlayerLoadGame](#event-onplayerloadgame-3)
                    - [Event: OnPlayerLoiteringBegin](#event-onplayerloiteringbegin-3)
                    - [Event: OnPlayerLoiteringEnd](#event-onplayerloiteringend-3)
                    - [Event: OnPlayerModArmorWeapon](#event-onplayermodarmorweapon-3)
                    - [Event: OnPlayerModifiedShip](#event-onplayermodifiedship-3)
                    - [Event: OnPlayerModRobot](#event-onplayermodrobot-3)
                    - [Event: OnPlayerMurderActor](#event-onplayermurderactor-3)
                    - [Event: OnPlayerPayFine](#event-onplayerpayfine-3)
                    - [Event: OnPlayerPlanetSurveyComplete](#event-onplayerplanetsurveycomplete-3)
                    - [Event: OnPlayerScannedObject](#event-onplayerscannedobject-3)
                    - [Event: OnPlayerSellShip](#event-onplayersellship-3)
                    - [Event: OnPlayerSwimming](#event-onplayerswimming-3)
                    - [Event: OnPlayerTrespass](#event-onplayertrespass-3)
                    - [Event: OnPlayerUseWorkBench](#event-onplayeruseworkbench-3)
                    - [Event: OnRaceSwitchComplete](#event-onraceswitchcomplete-3)
                    - [Event: OnRecoverFromBleedout](#event-onrecoverfrombleedout-3)
                    - [Event: OnSit](#event-onsit-3)
                    - [Event: OnSpeechChallengeAvailable](#event-onspeechchallengeavailable-3)
                    - [Event: OnUnconscious](#event-onunconscious-1)
                    - [Property: PathingResult\_Success](#property-pathingresult_success)
                    - [Property: PathingResult\_Failure](#property-pathingresult_failure)
                    - [Property: PathingResult\_Stopped](#property-pathingresult_stopped)
                    - [Property: PathingResult\_Cleared](#property-pathingresult_cleared)
                    - [Property: PathingResult\_Timeout](#property-pathingresult_timeout)
                    - [Property: CritStage\_None](#property-critstage_none)
                    - [Property: CritStage\_GooStart](#property-critstage_goostart)
                    - [Property: CritStage\_GooEnd](#property-critstage_gooend)
                    - [Property: CritStage\_DisintegrateStart](#property-critstage_disintegratestart)
                    - [Property: CritStage\_DisintegrateEnd](#property-critstage_disintegrateend)
                    - [Property: CritStage\_FreezeStart](#property-critstage_freezestart)
                    - [Property: CritStage\_FreezeEnd](#property-critstage_freezeend)
                    - [Function: ModFavorPoints](#function-modfavorpoints)
                    - [Function: ModFavorPointsWithGlobal (Global)](#function-modfavorpointswithglobal-global)
                    - [Function: MakePlayerFriend](#function-makeplayerfriend)
                    - [Function: AddBountyCrime (Native)](#function-addbountycrime-native)
                    - [Function: AddPassiveAffinity (Native)](#function-addpassiveaffinity-native)
                    - [Function: AddPerk (Native)](#function-addperk-native)
                    - [Function: AllowBleedoutDialogue (Native)](#function-allowbleedoutdialogue-native)
                    - [Function: AllowPCDialogue (Native)](#function-allowpcdialogue-native)
                    - [Function: AttachAshPile (Native)](#function-attachashpile-native)
                    - [Function: AttackOutpostObjects (Native)](#function-attackoutpostobjects-native)
                    - [Function: AttemptAnimationSetSwitch (Native)](#function-attemptanimationsetswitch-native)
                    - [Function: CanFlyHere (Native)](#function-canflyhere-native)
                    - [Function: ChangeAnimArchetype (Native)](#function-changeanimarchetype-native)
                    - [Function: ChangeAnimFlavor (Native)](#function-changeanimflavor-native)
                    - [Function: ChangeHeadPart (Native)](#function-changeheadpart-native)
                    - [Function: ClearArrested (Native)](#function-cleararrested-native)
                    - [Function: ClearExpressionOverride (Native)](#function-clearexpressionoverride-native)
                    - [Function: ClearExtraArrows (Native)](#function-clearextraarrows-native)
                    - [Function: ClearForcedLandingMarker](#function-clearforcedlandingmarker)
                    - [Function: ClearLookAt (Native)](#function-clearlookat-native)
                    - [Function: Dismount (Native)](#function-dismount-native)
                    - [Function: DispelAllSpells (Native)](#function-dispelallspells-native)
                    - [Function: DoCombatSpellApply (Native)](#function-docombatspellapply-native)
                    - [Function: EnableAI (Native)](#function-enableai-native)
                    - [Function: EndDeferredKill (Native)](#function-enddeferredkill-native)
                    - [Function: EquipItem (Native)](#function-equipitem-native)
                    - [Function: EquipSpell (Native)](#function-equipspell-native)
                    - [Function: EvaluatePackage (Native)](#function-evaluatepackage-native)
                    - [Function: GetBribeAmount (Native)](#function-getbribeamount-native)
                    - [Function: GetAllCombatTargets (Native)](#function-getallcombattargets-native)
                    - [Function: GetAllActorsInCombatWithMe (Native)](#function-getallactorsincombatwithme-native)
                    - [Function: GetCrewAssignment (Native)](#function-getcrewassignment-native)
                    - [Function: GetCrimeFaction (Native)](#function-getcrimefaction-native)
                    - [Function: GetCombatState (Native)](#function-getcombatstate-native)
                    - [Function: GetCombatTarget (Native)](#function-getcombattarget-native)
                    - [Function: GetCurrentPackage (Native)](#function-getcurrentpackage-native)
                    - [Function: GetDialogueTarget (Native)](#function-getdialoguetarget-native)
                    - [Function: GetEquippedItemType (Native)](#function-getequippeditemtype-native)
                    - [Function: GetEquippedWeapon (Native)](#function-getequippedweapon-native)
                    - [Function: GetEquippedShield (Native)](#function-getequippedshield-native)
                    - [Function: GetEquippedSpell (Native)](#function-getequippedspell-native)
                    - [Function: GetFactionRank (Native)](#function-getfactionrank-native)
                    - [Function: GetFactionReaction (Native)](#function-getfactionreaction-native-1)
                    - [Function: GetFlyingState (Native)](#function-getflyingstate-native)
                    - [Function: GetFurnitureUsing (Native)](#function-getfurnitureusing-native)
                    - [Function: GetForcedLandingMarker (Native)](#function-getforcedlandingmarker-native)
                    - [Function: GetGoldAmount (Native)](#function-getgoldamount-native)
                    - [Function: GetGroupFaction (Native)](#function-getgroupfaction-native)
                    - [Function: GetHighestRelationshipRank (Native)](#function-gethighestrelationshiprank-native)
                    - [Function: GetKiller (Native)](#function-getkiller-native)
                    - [Function: GetLevel (Native)](#function-getlevel-native-1)
                    - [Function: GetLightLevel (Native)](#function-getlightlevel-native)
                    - [Function: GetLowestRelationshipRank (Native)](#function-getlowestrelationshiprank-native)
                    - [Function: GetLeveledActorBase (Native)](#function-getleveledactorbase-native)
                    - [Function: GetMatchingPlanetActorBase (Native)](#function-getmatchingplanetactorbase-native)
                    - [Function: GetNoBleedoutRecovery (Native)](#function-getnobleedoutrecovery-native)
                    - [Function: GetPlayerControls (Native)](#function-getplayercontrols-native)
                    - [Function: GetRace (Native)](#function-getrace-native-1)
                    - [Function: GetRelationshipRank (Native)](#function-getrelationshiprank-native)
                    - [Function: GetSitState (Native)](#function-getsitstate-native)
                    - [Function: GetSleepState (Native)](#function-getsleepstate-native)
                    - [Function: GetSpaceship (Native)](#function-getspaceship-native)
                    - [Function: HasAssociation (Native)](#function-hasassociation-native)
                    - [Function: HasFamilyRelationship (Native)](#function-hasfamilyrelationship-native)
                    - [Function: HasDetectionLOS (Native)](#function-hasdetectionlos-native)
                    - [Function: HasMagicEffect (Native)](#function-hasmagiceffect-native-1)
                    - [Function: HasMagicEffectWithKeyword (Native)](#function-hasmagiceffectwithkeyword-native)
                    - [Function: HasParentRelationship (Native)](#function-hasparentrelationship-native)
                    - [Function: HasPerk (Native)](#function-hasperk-native)
                    - [Function: HasSpell (Native)](#function-hasspell-native)
                    - [Function: IsAIEnabled (Native)](#function-isaienabled-native)
                    - [Function: IsAlarmed (Native)](#function-isalarmed-native)
                    - [Function: IsAlerted (Native)](#function-isalerted-native)
                    - [Function: IsAllowedToFly (Native)](#function-isallowedtofly-native)
                    - [Function: IsArrested (Native)](#function-isarrested-native)
                    - [Function: IsArrestingTarget (Native)](#function-isarrestingtarget-native)
                    - [Function: IsBeingRidden (Native)](#function-isbeingridden-native)
                    - [Function: IsBeingRiddenBy (Native)](#function-isbeingriddenby-native)
                    - [Function: IsBleedingOut (Native)](#function-isbleedingout-native)
                    - [Function: IsBribed (Native)](#function-isbribed-native)
                    - [Function: IsChild (Native)](#function-ischild-native-1)
                    - [Function: IsCommandedActor (Native)](#function-iscommandedactor-native)
                    - [Function: IsDead (Native)](#function-isdead-native)
                    - [Function: IsDetectedBy (Native)](#function-isdetectedby-native)
                    - [Function: IsDoingFavor (Native)](#function-isdoingfavor-native)
                    - [Function: IsEquipped (Native)](#function-isequipped-native)
                    - [Function: IsEssential (Native)](#function-isessential-native-1)
                    - [Function: IsFlying (Native)](#function-isflying-native)
                    - [Function: IsGuard (Native)](#function-isguard-native)
                    - [Function: IsGhost (Native)](#function-isghost-native)
                    - [Function: IsHostileToActor (Native)](#function-ishostiletoactor-native)
                    - [Function: IsInCombat (Native)](#function-isincombat-native)
                    - [Function: IsInFaction (Native)](#function-isinfaction-native)
                    - [Function: IsInIronSights (Native)](#function-isinironsights-native)
                    - [Function: IsInKillMove (Native)](#function-isinkillmove-native)
                    - [Function: IsInScene (Native)](#function-isinscene-native)
                    - [Function: IsIntimidated (Native)](#function-isintimidated-native)
                    - [Function: IsOnMount (Native)](#function-isonmount-native)
                    - [Function: IsOverEncumbered (Native)](#function-isoverencumbered-native)
                    - [Function: IsOwner](#function-isowner)
                    - [Function: IsPlayersLastRiddenHorse (Native)](#function-isplayerslastriddenhorse-native)
                    - [Function: IsPlayerTeammate (Native)](#function-isplayerteammate-native)
                    - [Function: IsRunning (Native)](#function-isrunning-native)
                    - [Function: IsSeatOccupied (Native)](#function-isseatoccupied-native)
                    - [Function: IsSneaking (Native)](#function-issneaking-native)
                    - [Function: IsSprinting (Native)](#function-issprinting-native)
                    - [Function: IsTalking (Native)](#function-istalking-native)
                    - [Function: IsTrespassing (Native)](#function-istrespassing-native)
                    - [Function: IsUnconscious (Native)](#function-isunconscious-native)
                    - [Function: IsWeaponDrawn (Native)](#function-isweapondrawn-native)
                    - [Function: Kill (Native)](#function-kill-native)
                    - [Function: KillEssential](#function-killessential)
                    - [Function: KillSilent (Native)](#function-killsilent-native)
                    - [Function: ApplyUnityCharacterData (Native)](#function-applyunitycharacterdata-native)
                    - [Function: CopyAppearance (Native)](#function-copyappearance-native)
                    - [Function: MarkItemAsFavorite (Native)](#function-markitemasfavorite-native)
                    - [Function: ModFactionRank (Native)](#function-modfactionrank-native)
                    - [Function: MoveToFurniture](#function-movetofurniture)
                    - [Function: MoveToPackageLocation (Native)](#function-movetopackagelocation-native)
                    - [Function: OpenInventory (Native)](#function-openinventory-native)
                    - [Function: PathToReference (Native)](#function-pathtoreference-native)
                    - [Function: PlayIdle (Native)](#function-playidle-native)
                    - [Function: PlayIdleAction (Native)](#function-playidleaction-native)
                    - [Function: PlayIdleWithTarget (Native)](#function-playidlewithtarget-native)
                    - [Function: PlaySubGraphAnimation (Native)](#function-playsubgraphanimation-native)
                    - [Function: RemoveFromFaction (Native)](#function-removefromfaction-native)
                    - [Function: RemoveFromAllFactions (Native)](#function-removefromallfactions-native)
                    - [Function: RemovePerk (Native)](#function-removeperk-native)
                    - [Function: RemoveSpell (Native)](#function-removespell-native)
                    - [Function: ResetHealthAndLimbs (Native)](#function-resethealthandlimbs-native)
                    - [Function: Resurrect (Native)](#function-resurrect-native)
                    - [Function: SendAssaultAlarm (Native)](#function-sendassaultalarm-native-1)
                    - [Function: SendSmugglingAlarm (Native)](#function-sendsmugglingalarm-native)
                    - [Function: SendTrespassAlarm (Native)](#function-sendtrespassalarm-native)
                    - [Function: SetAlert (Native)](#function-setalert-native)
                    - [Function: SetAllowFlying (Native)](#function-setallowflying-native)
                    - [Function: SetAlpha (Native)](#function-setalpha-native)
                    - [Function: SetAttackActorOnSight (Native)](#function-setattackactoronsight-native)
                    - [Function: SetAvoidPlayer (Native)](#function-setavoidplayer-native)
                    - [Function: SetCommandState (Native)](#function-setcommandstate-native)
                    - [Function: SetBribed (Native)](#function-setbribed-native)
                    - [Function: SetCanDoCommand (Native)](#function-setcandocommand-native)
                    - [Function: SetCombatStyle (Native)](#function-setcombatstyle-native)
                    - [Function: SetCrimeFaction (Native)](#function-setcrimefaction-native)
                    - [Function: SetCriticalStage (Native)](#function-setcriticalstage-native)
                    - [Function: SetDoingFavor (Native)](#function-setdoingfavor-native)
                    - [Function: ChangeAnimFaceArchetype (Native)](#function-changeanimfacearchetype-native)
                    - [Function: SetEssential (Native)](#function-setessential-native-1)
                    - [Function: SetFactionRank (Native)](#function-setfactionrank-native)
                    - [Function: SetForcedLandingMarker (Native)](#function-setforcedlandingmarker-native)
                    - [Function: SetGhost (Native)](#function-setghost-native)
                    - [Function: SetGroupFaction (Native)](#function-setgroupfaction-native)
                    - [Function: SetHasCharGenSkeleton (Native)](#function-sethaschargenskeleton-native)
                    - [Function: AddToFaction](#function-addtofaction-1)
                    - [Function: SetHeadTracking (Native)](#function-setheadtracking-native)
                    - [Function: SetIntimidated (Native)](#function-setintimidated-native)
                    - [Function: SetLookAt (Native)](#function-setlookat-native)
                    - [Function: SetNoBleedoutRecovery (Native)](#function-setnobleedoutrecovery-native)
                    - [Function: SetNotShowOnStealthMeter (Native)](#function-setnotshowonstealthmeter-native)
                    - [Function: SetOutfit (Native)](#function-setoutfit-native-1)
                    - [Function: SetOverrideVoiceType (Native)](#function-setoverridevoicetype-native)
                    - [Function: SetOverrideVoiceTypeRandom](#function-setoverridevoicetyperandom)
                    - [Function: SetPlayerControls (Native)](#function-setplayercontrols-native)
                    - [Function: SetPlayerResistingArrest (Native)](#function-setplayerresistingarrest-native)
                    - [Function: SetPlayerTeammate (Native)](#function-setplayerteammate-native)
                    - [Function: SetProtected (Native)](#function-setprotected-native-1)
                    - [Function: SetRace (Native)](#function-setrace-native)
                    - [Function: SetRelationshipRank (Native)](#function-setrelationshiprank-native)
                    - [Function: SetRestrained (Native)](#function-setrestrained-native)
                    - [Function: SetSubGraphFloatVariable (Native)](#function-setsubgraphfloatvariable-native)
                    - [Function: SetUnconscious (Native)](#function-setunconscious-native)
                    - [Function: SetVehicle (Native)](#function-setvehicle-native)
                    - [Function: SetWantSprinting (Native)](#function-setwantsprinting-native)
                    - [Function: SheatheWeapon (Native)](#function-sheatheweapon-native)
                    - [Function: ShowBarterMenu (Native)](#function-showbartermenu-native)
                    - [Function: ShowCrewAssign (Native)](#function-showcrewassign-native)
                    - [Function: StartCombat (Native)](#function-startcombat-native)
                    - [Function: StartDeferredKill (Native)](#function-startdeferredkill-native)
                    - [Function: StartVampireFeed (Native)](#function-startvampirefeed-native)
                    - [Function: StartFrenzyAttack (Native)](#function-startfrenzyattack-native)
                    - [Function: StopCombat (Native)](#function-stopcombat-native)
                    - [Function: StopCombatAlarm (Native)](#function-stopcombatalarm-native)
                    - [Function: SwitchToPowerArmor (Native)](#function-switchtopowerarmor-native)
                    - [Function: SnapIntoInteraction (Native)](#function-snapintointeraction-native)
                    - [Function: TrapSoul (Native)](#function-trapsoul-native)
                    - [Function: UnequipAll (Native)](#function-unequipall-native)
                    - [Function: UnequipItem (Native)](#function-unequipitem-native)
                    - [Function: UnequipItemSlot (Native)](#function-unequipitemslot-native)
                    - [Function: UnequipSpell (Native)](#function-unequipspell-native)
                    - [Function: UnLockOwnedDoorsInCell (Native)](#function-unlockowneddoorsincell-native)
                    - [Function: WillIntimidateSucceed (Native)](#function-willintimidatesucceed-native)
                    - [Function: WornCoversBipedSlot (Native)](#function-worncoversbipedslot-native)
                    - [Function: WornHasKeyword (Native)](#function-wornhaskeyword-native)
                    - [Function: WouldBeStealing (Native)](#function-wouldbestealing-native)
                    - [Function: WouldRefuseCommand (Native)](#function-wouldrefusecommand-native)
                    - [Function: StartSneaking (Native)](#function-startsneaking-native)
                    - [Function: DrawWeapon (Native)](#function-drawweapon-native)
                    - [Function: DogPlaceInMouth (Native)](#function-dogplaceinmouth-native)
                    - [Function: DogDropItems (Native)](#function-dogdropitems-native)
                    - [Function: ForceMovementDirection (Native)](#function-forcemovementdirection-native)
                    - [Function: ForceMovementSpeed (Native)](#function-forcemovementspeed-native)
                    - [Function: ForceMovementRotationSpeed (Native)](#function-forcemovementrotationspeed-native)
                    - [Function: ForceMovementDirectionRamp (Native)](#function-forcemovementdirectionramp-native)
                    - [Function: ForceMovementSpeedRamp (Native)](#function-forcemovementspeedramp-native)
                    - [Function: ForceMovementRotationSpeedRamp (Native)](#function-forcemovementrotationspeedramp-native)
                    - [Function: ForceTargetDirection (Native)](#function-forcetargetdirection-native)
                    - [Function: ForceTargetSpeed (Native)](#function-forcetargetspeed-native)
                    - [Function: ForceTargetAngle (Native)](#function-forcetargetangle-native)
                    - [Function: ClearForcedMovement (Native)](#function-clearforcedmovement-native)
                    - [Function: CanMoveVertical (Native)](#function-canmovevertical-native)
                    - [Function: CanStrafe (Native)](#function-canstrafe-native)
                    - [Function: GetActorInDialogueWithRobot (Native)](#function-getactorindialoguewithrobot-native)
                - [Script: SpaceshipReference](#script-spaceshipreference)
                    - [Event: OnCombatStateChanged](#event-oncombatstatechanged-4)
                    - [Event: OnSpaceshipCombatListAdded](#event-onspaceshipcombatlistadded)
                    - [Event: OnSpaceshipCombatListRemoved](#event-onspaceshipcombatlistremoved)
                    - [Event: OnEnterBleedout](#event-onenterbleedout-4)
                    - [Event: OnEscortWaitStart](#event-onescortwaitstart-4)
                    - [Event: OnEscortWaitStop](#event-onescortwaitstop-4)
                    - [Event: OnLocationChange](#event-onlocationchange-4)
                    - [Event: OnRecoverFromBleedout](#event-onrecoverfrombleedout-4)
                    - [Event: OnShipDock](#event-onshipdock-3)
                    - [Event: OnShipFarTravel](#event-onshipfartravel-3)
                    - [Event: OnShipGravJump](#event-onshipgravjump-3)
                    - [Event: OnShipLanding](#event-onshiplanding-3)
                    - [Event: OnShipRampDown](#event-onshiprampdown-3)
                    - [Event: OnShipRefueled](#event-onshiprefueled-3)
                    - [Event: OnShipScan](#event-onshipscan-3)
                    - [Event: OnShipSystemPowerChange](#event-onshipsystempowerchange-3)
                    - [Event: OnShipSystemDamaged](#event-onshipsystemdamaged-3)
                    - [Event: OnShipSystemRepaired](#event-onshipsystemrepaired-3)
                    - [Event: OnShipTakeOff](#event-onshiptakeoff-3)
                    - [Event: OnDeath](#event-ondeath-4)
                    - [Event: OnDying](#event-ondying-4)
                    - [Event: OnKill](#event-onkill-4)
                    - [Event: OnShipUndock](#event-onshipundock-3)
                    - [Event: OnShipBought](#event-onshipbought-3)
                    - [Event: OnShipSold](#event-onshipsold-3)
                    - [Function: AddPerk (Native)](#function-addperk-native-1)
                    - [Function: AddToFaction](#function-addtofaction-2)
                    - [Function: CanLandAtMarker (Native)](#function-canlandatmarker-native)
                    - [Function: CheckContrabandStatus (Native)](#function-checkcontrabandstatus-native)
                    - [Function: DisableWithGravJump (Native)](#function-disablewithgravjump-native)
                    - [Function: DisableWithGravJumpNoWait (Native)](#function-disablewithgravjumpnowait-native)
                    - [Function: DisableWithTakeOffOrLanding (Native)](#function-disablewithtakeofforlanding-native)
                    - [Function: DisableWithTakeOffOrLandingNoWait (Native)](#function-disablewithtakeofforlandingnowait-native)
                    - [Function: EnablePartRepair (Native)](#function-enablepartrepair-native)
                    - [Function: EvaluatePackage (Native)](#function-evaluatepackage-native-1)
                    - [Function: EnableAI (Native)](#function-enableai-native-1)
                    - [Function: EnableWithGravJump (Native)](#function-enablewithgravjump-native)
                    - [Function: EnableWithGravJumpNoWait (Native)](#function-enablewithgravjumpnowait-native)
                    - [Function: EnableWithLanding (Native)](#function-enablewithlanding-native)
                    - [Function: EnableWithLandingNoWait (Native)](#function-enablewithlandingnowait-native)
                    - [Function: GetAllCombatTargets (Native)](#function-getallcombattargets-native-1)
                    - [Function: GetCombatTarget (Native)](#function-getcombattarget-native-1)
                    - [Function: GetContrabandWeight (Native)](#function-getcontrabandweight-native)
                    - [Function: GetCrimeFaction (Native)](#function-getcrimefaction-native-1)
                    - [Function: GetCurrentPackage (Native)](#function-getcurrentpackage-native-1)
                    - [Function: GetExteriorLoadDoors (Native)](#function-getexteriorloaddoors-native)
                    - [Function: GetExteriorRefs (Native)](#function-getexteriorrefs-native)
                    - [Function: GetFactionRank (Native)](#function-getfactionrank-native-1)
                    - [Function: GetActorFactionReaction (Native)](#function-getactorfactionreaction-native)
                    - [Function: GetDockedShips (Native)](#function-getdockedships-native)
                    - [Function: GetFactionReaction (Native)](#function-getfactionreaction-native-2)
                    - [Function: GetFirstDockedShip (Native)](#function-getfirstdockedship-native)
                    - [Function: GetKiller (Native)](#function-getkiller-native-1)
                    - [Function: GetLandingRamps (Native)](#function-getlandingramps-native)
                    - [Function: GetLevel (Native)](#function-getlevel-native-2)
                    - [Function: GetLeveledSpaceshipBase (Native)](#function-getleveledspaceshipbase-native)
                    - [Function: GetNoBleedoutRecovery (Native)](#function-getnobleedoutrecovery-native-1)
                    - [Function: GetPartCount (Native)](#function-getpartcount-native)
                    - [Function: GetPartPower (Native)](#function-getpartpower-native)
                    - [Function: GetShipMaxCargoWeight (Native)](#function-getshipmaxcargoweight-native)
                    - [Function: GetWeaponGroupBaseObject (Native)](#function-getweapongroupbaseobject-native)
                    - [Function: HasPerk (Native)](#function-hasperk-native-1)
                    - [Function: InstantDock (Native)](#function-instantdock-native)
                    - [Function: InstantUndock (Native)](#function-instantundock-native)
                    - [Function: IsAIEnabled (Native)](#function-isaienabled-native-1)
                    - [Function: IsAlarmed (Native)](#function-isalarmed-native-1)
                    - [Function: IsAlerted (Native)](#function-isalerted-native-1)
                    - [Function: IsDead (Native)](#function-isdead-native-1)
                    - [Function: IsDetectedBy (Native)](#function-isdetectedby-native-1)
                    - [Function: IsDocked (Native)](#function-isdocked-native)
                    - [Function: IsDockedWith (Native)](#function-isdockedwith-native)
                    - [Function: IsDockedAsChild (Native)](#function-isdockedaschild-native)
                    - [Function: IsEssential (Native)](#function-isessential-native-2)
                    - [Function: IsGhost (Native)](#function-isghost-native-1)
                    - [Function: IsHostileToSpaceship (Native)](#function-ishostiletospaceship-native)
                    - [Function: IsInCombat (Native)](#function-isincombat-native-1)
                    - [Function: IsInFaction (Native)](#function-isinfaction-native-1)
                    - [Function: IsInScene (Native)](#function-isinscene-native-1)
                    - [Function: IsLanded (Native)](#function-islanded-native)
                    - [Function: IsProtected (Native)](#function-isprotected-native-1)
                    - [Function: IsRampDown (Native)](#function-isrampdown-native)
                    - [Function: Kill (Native)](#function-kill-native-1)
                    - [Function: KillEssential (Native)](#function-killessential-native)
                    - [Function: KillSilent (Native)](#function-killsilent-native-1)
                    - [Function: ModFactionRank (Native)](#function-modfactionrank-native-1)
                    - [Function: MoveToPackageLocation (Native)](#function-movetopackagelocation-native-1)
                    - [Function: OpenInventory (Native)](#function-openinventory-native-1)
                    - [Function: LockPowerAllocation (Native)](#function-lockpowerallocation-native)
                    - [Function: PathToReference (Native)](#function-pathtoreference-native-1)
                    - [Function: RemoveFromAllFactions (Native)](#function-removefromallfactions-native-1)
                    - [Function: RemoveFromFaction (Native)](#function-removefromfaction-native-1)
                    - [Function: RemovePerk (Native)](#function-removeperk-native-1)
                    - [Function: SendAssaultAlarm (Native)](#function-sendassaultalarm-native-2)
                    - [Function: SendPiracyAlarm (Native)](#function-sendpiracyalarm-native)
                    - [Function: SendSmugglingAlarm (Native)](#function-sendsmugglingalarm-native-1)
                    - [Function: SetAlert (Native)](#function-setalert-native-1)
                    - [Function: SetAttackShipOnSight (Native)](#function-setattackshiponsight-native)
                    - [Function: SetAvoidPlayer (Native)](#function-setavoidplayer-native-1)
                    - [Function: SetCombatStyle (Native)](#function-setcombatstyle-native-1)
                    - [Function: SetCrimeFaction (Native)](#function-setcrimefaction-native-1)
                    - [Function: SetEssential (Native)](#function-setessential-native-2)
                    - [Function: SetFactionRank (Native)](#function-setfactionrank-native-1)
                    - [Function: SetGhost (Native)](#function-setghost-native-1)
                    - [Function: SetNoBleedoutRecovery (Native)](#function-setnobleedoutrecovery-native-1)
                    - [Function: SetNotShowOnStealthMeter (Native)](#function-setnotshowonstealthmeter-native-1)
                    - [Function: SetPartPower (Native)](#function-setpartpower-native)
                    - [Function: SetPlayerResistingArrest (Native)](#function-setplayerresistingarrest-native-1)
                    - [Function: SetProtected (Native)](#function-setprotected-native-2)
                    - [Function: ShowBarterMenu (Native)](#function-showbartermenu-native-1)
                    - [Function: StartCombat (Native)](#function-startcombat-native-1)
                    - [Function: StopCombat (Native)](#function-stopcombat-native-1)
                    - [Function: StopCombatAlarm (Native)](#function-stopcombatalarm-native-1)
                    - [Function: TakeOff (Native)](#function-takeoff-native)
                    - [Function: SetForwardVelocity (Native)](#function-setforwardvelocity-native)
                    - [Function: SetUnconscious (Native)](#function-setunconscious-native-1)
                    - [Function: SetIgnoreFriendlyHits (Native)](#function-setignorefriendlyhits-native)
                    - [Function: GetGravJumpRange (Native)](#function-getgravjumprange-native)
                    - [Function: GetReactorClassKeyword (Native)](#function-getreactorclasskeyword-native)
                    - [Function: IsExteriorLoadDoorInaccessible](#function-isexteriorloaddoorinaccessible)
                    - [Function: SetExteriorLoadDoorInaccessible](#function-setexteriorloaddoorinaccessible)
                    - [Function: IsLandingDeckClear](#function-islandingdeckclear)
            - [Script: Outfit](#script-outfit)
            - [Script: Package](#script-package)
                - [Function: GetOwningQuest (Native)](#function-getowningquest-native-1)
                - [Function: GetTemplate (Native)](#function-gettemplate-native)
                - [Event: OnStart](#event-onstart)
                - [Event: OnEnd](#event-onend)
                - [Event: OnChange](#event-onchange)
            - [Script: PackIn](#script-packin)
            - [Script: Perk](#script-perk)
                - [Event: OnEntryRun](#event-onentryrun)
            - [Script: Planet](#script-planet)
                - [Function: GetAtmosphereType (Native)](#function-getatmospheretype-native)
                - [Function: GetDayLength (Native)](#function-getdaylength-native)
                - [Function: GetGravity (Native)](#function-getgravity-native)
                - [Function: GetKeywordTypeList (Native)](#function-getkeywordtypelist-native)
                - [Function: GetPressure (Native)](#function-getpressure-native)
                - [Function: GetSurveyPercent (Native)](#function-getsurveypercent-native)
                - [Function: GetTemperature (Native)](#function-gettemperature-native)
                - [Function: GetType (Native)](#function-gettype-native)
                - [Function: IsTraitKnown (Native)](#function-istraitknown-native)
                - [Function: SetTraitKnown (Native)](#function-settraitknown-native)
                - [Function: GetLocation (Native)](#function-getlocation-native-1)
            - [Script: Potion](#script-potion)
                - [Function: IsHostile (Native)](#function-ishostile-native-2)
            - [Script: Projectile](#script-projectile)
            - [Script: Quest](#script-quest)
                - [Struct: QuestStage](#struct-queststage)
                - [Event: OnMissionAccepted](#event-onmissionaccepted)
                - [Event: OnQuestInit](#event-onquestinit)
                - [Event: OnQuestShutdown](#event-onquestshutdown)
                - [Event: OnQuestStarted](#event-onqueststarted)
                - [Event: OnQuestRejected](#event-onquestrejected)
                - [Event: OnQuestTimerStart](#event-onquesttimerstart)
                - [Event: OnQuestTimerEnd](#event-onquesttimerend)
                - [Event: OnQuestTimerPause](#event-onquesttimerpause)
                - [Event: OnQuestTimerResume](#event-onquesttimerresume)
                - [Event: OnQuestTimerMod](#event-onquesttimermod)
                - [Event: OnReset](#event-onreset-4)
                - [Event: OnStageSet](#event-onstageset)
                - [Event: OnSpeechChallengeCompletion](#event-onspeechchallengecompletion)
                - [Event: OnStoryActivateActor](#event-onstoryactivateactor)
                - [Event: OnStoryActorAttach](#event-onstoryactorattach)
                - [Event: OnStoryAddToPlayer](#event-onstoryaddtoplayer)
                - [Event: OnStoryArrest](#event-onstoryarrest)
                - [Event: OnStoryAssaultActor](#event-onstoryassaultactor)
                - [Event: OnStoryAttractionObject](#event-onstoryattractionobject)
                - [Event: OnStoryBribeNPC](#event-onstorybribenpc)
                - [Event: OnStoryCastMagic](#event-onstorycastmagic)
                - [Event: OnStoryChangeLocation](#event-onstorychangelocation)
                - [Event: OnStoryExploredLocation](#event-onstoryexploredlocation)
                - [Event: OnStoryCraftItem](#event-onstorycraftitem)
                - [Event: OnStoryCrimeGold](#event-onstorycrimegold)
                - [Event: OnStoryCure](#event-onstorycure)
                - [Event: OnStoryDialogue](#event-onstorydialogue)
                - [Event: OnStoryDiscoverDeadBody](#event-onstorydiscoverdeadbody)
                - [Event: OnStoryEscapeJail](#event-onstoryescapejail)
                - [Event: OnStoryFlatterNPC](#event-onstoryflatternpc)
                - [Event: OnStoryHackTerminal](#event-onstoryhackterminal)
                - [Event: OnStoryHello](#event-onstoryhello)
                - [Event: OnStoryIncreaseLevel](#event-onstoryincreaselevel)
                - [Event: OnStoryInfection](#event-onstoryinfection)
                - [Event: OnStoryIntimidateNPC](#event-onstoryintimidatenpc)
                - [Event: OnStoryIronSights](#event-onstoryironsights)
                - [Event: OnStoryJail](#event-onstoryjail)
                - [Event: OnStoryKillActor](#event-onstorykillactor)
                - [Event: OnStoryLocationLoaded](#event-onstorylocationloaded)
                - [Event: OnStoryMineExplosion](#event-onstorymineexplosion)
                - [Event: OnStoryNewVoicePower](#event-onstorynewvoicepower)
                - [Event: OnStoryPayFine](#event-onstorypayfine)
                - [Event: OnStoryPickLock](#event-onstorypicklock)
                - [Event: OnStoryPickPocket](#event-onstorypickpocket)
                - [Event: OnStoryPiracyActor](#event-onstorypiracyactor)
                - [Event: OnStoryPlayerGetsFavor](#event-onstoryplayergetsfavor)
                - [Event: OnStoryRelationshipChange](#event-onstoryrelationshipchange)
                - [Event: OnStoryRemoveFromPlayer](#event-onstoryremovefromplayer)
                - [Event: OnStoryScript](#event-onstoryscript)
                - [Event: OnStoryServedTime](#event-onstoryservedtime)
                - [Event: OnStoryShipDock](#event-onstoryshipdock)
                - [Event: OnStoryShipLanding](#event-onstoryshiplanding)
                - [Event: OnStorySpeechChallengeCompletion](#event-onstoryspeechchallengecompletion)
                - [Event: OnStoryTrespass](#event-onstorytrespass)
                - [Function: ModObjectiveGlobal (Global)](#function-modobjectiveglobal-global)
                - [Function: SetAllStages](#function-setallstages)
                - [Function: SetQuestStage (Global)](#function-setqueststage-global)
                - [Function: GetQuestStageDone (Global)](#function-getqueststagedone-global)
                - [Function: SetObjectiveSkipped](#function-setobjectiveskipped)
                - [Function: SetObjectiveActive](#function-setobjectiveactive)
                - [Function: CompleteAllObjectives (Native)](#function-completeallobjectives-native)
                - [Function: CompleteQuest (Native)](#function-completequest-native)
                - [Function: FailAllObjectives (Native)](#function-failallobjectives-native)
                - [Function: GetAlias (Native)](#function-getalias-native)
                - [Function: GetCurrentStageID (Native)](#function-getcurrentstageid-native)
                - [Function: GetCurrentStageTargets (Native)](#function-getcurrentstagetargets-native)
                - [Function: GetStage](#function-getstage)
                - [Function: GetQuestTimeRemaining (Native)](#function-getquesttimeremaining-native)
                - [Function: GetStageDone](#function-getstagedone)
                - [Function: HasObjective (Native)](#function-hasobjective-native)
                - [Function: IsActive (Native)](#function-isactive-native)
                - [Function: IsCompleted (Native)](#function-iscompleted-native)
                - [Function: IsObjectiveCompleted (Native)](#function-isobjectivecompleted-native)
                - [Function: IsObjectiveDisplayed (Native)](#function-isobjectivedisplayed-native)
                - [Function: IsObjectiveFailed (Native)](#function-isobjectivefailed-native)
                - [Function: SetObjectiveDisplayedAtTop (Native)](#function-setobjectivedisplayedattop-native)
                - [Function: IsQuestTimerPaused (Native)](#function-isquesttimerpaused-native)
                - [Function: IsRunning (Native)](#function-isrunning-native-1)
                - [Function: IsStageDone (Native)](#function-isstagedone-native)
                - [Function: IsStarting (Native)](#function-isstarting-native)
                - [Function: IsStopping (Native)](#function-isstopping-native)
                - [Function: IsStopped (Native)](#function-isstopped-native)
                - [Function: ModQuestTimer (Native)](#function-modquesttimer-native)
                - [Function: PauseQuestTimer (Native)](#function-pausequesttimer-native)
                - [Function: RemoveRequestedPCMQuestLocations (Native)](#function-removerequestedpcmquestlocations-native)
                - [Function: Reset (Native)](#function-reset-native-4)
                - [Function: SetActive (Native)](#function-setactive-native)
                - [Function: SetCurrentStageID (Native)](#function-setcurrentstageid-native)
                - [Function: SetObjectiveCompleted (Native)](#function-setobjectivecompleted-native)
                - [Function: SetObjectiveDisplayed (Native)](#function-setobjectivedisplayed-native)
                - [Function: SetObjectiveFailed (Native)](#function-setobjectivefailed-native)
                - [Function: SetObjectiveFailedIfNotCompleted](#function-setobjectivefailedifnotcompleted)
                - [Function: SetStage](#function-setstage)
                - [Function: SetStageNoWait (Native)](#function-setstagenowait-native)
                - [Function: Start (Native)](#function-start-native)
                - [Function: StartNoWait (Native)](#function-startnowait-native)
                - [Function: StartQuestTimer (Native)](#function-startquesttimer-native)
                - [Function: Stop (Native)](#function-stop-native-1)
                - [Function: StopQuestTimer (Native)](#function-stopquesttimer-native)
                - [Function: UpdateCurrentInstanceGlobal (Native) (Global)](#function-updatecurrentinstanceglobal-native-global)
            - [Script: Race](#script-race)
            - [Script: ResearchProject](#script-researchproject)
                - [Function: Complete (Native)](#function-complete-native)
            - [Script: Resource](#script-resource)
                - [Function: GetCreatedObject (Native)](#function-getcreatedobject-native)
            - [Script: Scene](#script-scene)
                - [Event: OnAction](#event-onaction)
                - [Event: OnBegin](#event-onbegin)
                - [Event: OnEnd](#event-onend-1)
                - [Event: OnPhaseBegin](#event-onphasebegin)
                - [Event: OnPhaseEnd](#event-onphaseend)
                - [Function: ForceStart (Native)](#function-forcestart-native)
                - [Function: Start (Native)](#function-start-native-1)
                - [Function: Stop (Native)](#function-stop-native-2)
                - [Function: IsPlaying (Native)](#function-isplaying-native)
                - [Function: GetOwningQuest (Native)](#function-getowningquest-native-2)
                - [Function: IsActionComplete (Native)](#function-isactioncomplete-native)
                - [Function: Pause (Native)](#function-pause-native)
            - [Script: Scroll](#script-scroll)
                - [Function: Cast (Native)](#function-cast-native)
            - [Script: ShaderParticleGeometry](#script-shaderparticlegeometry)
                - [Function: Apply (Native)](#function-apply-native-1)
                - [Function: Remove (Native)](#function-remove-native-2)
            - [Script: Shout](#script-shout)
            - [Script: SpaceshipBase](#script-spaceshipbase)
                - [Function: IsUnique (Native)](#function-isunique-native-1)
            - [Script: SpeechChallengeObject](#script-speechchallengeobject)
            - [Script: Spell](#script-spell)
                - [Function: Cast (Native)](#function-cast-native-1)
                - [Function: RemoteCast (Native)](#function-remotecast-native)
                - [Function: IsHostile (Native)](#function-ishostile-native-3)
            - [Script: Static](#script-static)
                - [Script: MovableStatic](#script-movablestatic)
            - [Script: Terminal](#script-terminal)
            - [Script: TerminalMenu](#script-terminalmenu)
                - [Function: OnTerminalMenuItemRun](#function-onterminalmenuitemrun)
                - [Function: OnTerminalMenuEnter](#function-onterminalmenuenter)
                - [Function: AddDynamicMenuItem (Native)](#function-adddynamicmenuitem-native)
                - [Function: AddDynamicBodyTextItem (Native)](#function-adddynamicbodytextitem-native)
                - [Function: ClearDynamicMenuItems (Native)](#function-cleardynamicmenuitems-native)
                - [Function: ClearDynamicBodyTextItems (Native)](#function-cleardynamicbodytextitems-native)
                - [Function: GetCurrentTerminalObjectRef (Native) (Global)](#function-getcurrentterminalobjectref-native-global)
            - [Script: TextureSet](#script-textureset)
            - [Script: Topic](#script-topic)
                - [Function: Add (Native)](#function-add-native-1)
            - [Script: TopicInfo](#script-topicinfo)
                - [Event: OnBegin](#event-onbegin-1)
                - [Event: OnEnd](#event-onend-2)
                - [Function: GetOwningQuest (Native)](#function-getowningquest-native-3)
                - [Function: HasBeenSaid (Native)](#function-hasbeensaid-native)
            - [Script: VisualEffect](#script-visualeffect)
                - [Function: Play (Native)](#function-play-native-1)
                - [Function: Stop (Native)](#function-stop-native-3)
            - [Script: VoiceType](#script-voicetype)
                - [Function: GetSex (Native)](#function-getsex-native-1)
            - [Script: Weapon](#script-weapon)
                - [Function: Fire (Native)](#function-fire-native)
                - [Function: GetAmmo (Native)](#function-getammo-native)
            - [Script: Weather](#script-weather)
                - [Function: EnableAmbientParticles (Native) (Global)](#function-enableambientparticles-native-global)
                - [Function: FindWeather (Native) (Global)](#function-findweather-native-global)
                - [Function: ForceActive (Native)](#function-forceactive-native)
                - [Function: GetClassification (Native)](#function-getclassification-native)
                - [Function: GetCurrentWeather (Native) (Global)](#function-getcurrentweather-native-global)
                - [Function: GetCurrentWeatherTransition (Native) (Global)](#function-getcurrentweathertransition-native-global)
                - [Function: GetOutgoingWeather (Native) (Global)](#function-getoutgoingweather-native-global)
                - [Function: GetSkyMode (Native) (Global)](#function-getskymode-native-global)
                - [Function: ReleaseOverride (Native) (Global)](#function-releaseoverride-native-global)
                - [Function: SetActive (Native)](#function-setactive-native-1)
            - [Script: WordOfPower](#script-wordofpower)
            - [Script: WorldSpace](#script-worldspace)
            - [Script: WwiseEvent](#script-wwiseevent)
                - [Struct WwiseSwitchParam](#struct-wwiseswitchparam)
                - [Struct: WwiseRTPCParam](#struct-wwisertpcparam)
                - [Function: MakeNewWwiseSwitchParam (Global)](#function-makenewwwiseswitchparam-global)
                - [Function: MakeNewWwiseRTPCParam (Global)](#function-makenewwwisertpcparam-global)
                - [Function: Play](#function-play)
                - [Function: PlayUI](#function-playui)
                - [Function: PlayAndWait](#function-playandwait)
                - [Function: PlayUIAndWait](#function-playuiandwait)
                - [Function: PlayWithRTPC (Native)](#function-playwithrtpc-native)
                - [Function: PlayUIWithRTPC (Native)](#function-playuiwithrtpc-native)
                - [Function: StopInstance (Native) (Global)](#function-stopinstance-native-global)
                - [Function: UpdateInstanceRTPC (Native) (Global)](#function-updateinstancertpc-native-global)
                - [Function: UpdateInstanceRTPCs (Global)](#function-updateinstancertpcs-global)
                - [Function: SetGlobalRTPC (Native) (Global)](#function-setglobalrtpc-native-global)
                - [Function: SetGlobalState (Native) (Global)](#function-setglobalstate-native-global)
                - [Function: PlayMenuSound (Native) (Global)](#function-playmenusound-native-global)
                - [Function: ExtractSwitchGroups (Global)](#function-extractswitchgroups-global)
                - [Function: ExtractSwitchStates (Global)](#function-extractswitchstates-global)
                - [Function: ExtractRTPCNames (Global)](#function-extractrtpcnames-global)
                - [Function: ExtractRTPCValues (Global)](#function-extractrtpcvalues-global)
                - [Function: PlayImpl (Native)](#function-playimpl-native)
                - [Function: PlayUIImpl (Native)](#function-playuiimpl-native)
                - [Function: PlayAndWaitImpl (Native)](#function-playandwaitimpl-native)
                - [Function: PlayUIAndWaitImpl (Native)](#function-playuiandwaitimpl-native)
                - [Function: UpdateInstanceRTPCsImpl (Native) (Global)](#function-updateinstancertpcsimpl-native-global)
        - [Script: InputEnableLayer](#script-inputenablelayer)
            - [Function: Create (Native) (Global)](#function-create-native-global)
            - [Function: Delete (Native)](#function-delete-native-1)
            - [Function: DisablePlayerControls (Native)](#function-disableplayercontrols-native)
            - [Function: EnableActivate (Native)](#function-enableactivate-native)
            - [Function: EnableVATS (Native)](#function-enablevats-native)
            - [Function: EnableCamSwitch (Native)](#function-enablecamswitch-native)
            - [Function: EnableFarTravel (Native)](#function-enablefartravel-native)
            - [Function: EnableFastTravel (Native)](#function-enablefasttravel-native-2)
            - [Function: EnableFavorites (Native)](#function-enablefavorites-native)
            - [Function: EnableGravJump (Native)](#function-enablegravjump-native)
            - [Function: EnableTakeoff (Native)](#function-enabletakeoff-native)
            - [Function: EnableFighting (Native)](#function-enablefighting-native)
            - [Function: EnableJournal (Native)](#function-enablejournal-native)
            - [Function: EnableJumping (Native)](#function-enablejumping-native)
            - [Function: EnableLocationDiscovery (Native)](#function-enablelocationdiscovery-native)
            - [Function: EnableLooking (Native)](#function-enablelooking-native)
            - [Function: EnableMenu (Native)](#function-enablemenu-native)
            - [Function: EnableMovement (Native)](#function-enablemovement-native)
            - [Function: EnableRunning (Native)](#function-enablerunning-native)
            - [Function: EnableSprinting (Native)](#function-enablesprinting-native)
            - [Function: EnableZKey (Native)](#function-enablezkey-native)
            - [Function: EnableHandscanner (Native)](#function-enablehandscanner-native)
            - [Function: EnablePlayerControls (Native)](#function-enableplayercontrols-native)
            - [Function: EnableInventoryMenuAccess (Native)](#function-enableinventorymenuaccess-native)
            - [Function: EnableSneaking (Native)](#function-enablesneaking-native)
            - [Function: IsActivateEnabled (Native)](#function-isactivateenabled-native)
            - [Function: IsVATSEnabled (Native)](#function-isvatsenabled-native)
            - [Function: IsCamSwitchEnabled (Native)](#function-iscamswitchenabled-native)
            - [Function: IsFarTravelEnabled (Native)](#function-isfartravelenabled-native)
            - [Function: IsFastTravelEnabled (Native)](#function-isfasttravelenabled-native)
            - [Function: IsFavoritesEnabled (Native)](#function-isfavoritesenabled-native)
            - [Function: IsGravJumpEnabled (Native)](#function-isgravjumpenabled-native)
            - [Function: IsTakeoffEnabled (Native)](#function-istakeoffenabled-native)
            - [Function: IsFightingEnabled (Native)](#function-isfightingenabled-native)
            - [Function: IsJournalEnabled (Native)](#function-isjournalenabled-native)
            - [Function: IsJumpingEnabled (Native)](#function-isjumpingenabled-native)
            - [Function: IsLocationDiscoveryEnabled (Native)](#function-islocationdiscoveryenabled-native)
            - [Function: IsLookingEnabled (Native)](#function-islookingenabled-native)
            - [Function: IsMenuEnabled (Native)](#function-ismenuenabled-native)
            - [Function: IsMovementEnabled (Native)](#function-ismovementenabled-native)
            - [Function: IsRunningEnabled (Native)](#function-isrunningenabled-native)
            - [Function: IsSprintingEnabled (Native)](#function-issprintingenabled-native)
            - [Function: IsZKeyEnabled (Native)](#function-iszkeyenabled-native)
            - [Function: IsHandscannerEnabled (Native)](#function-ishandscannerenabled-native)
            - [Function: IsSneakingEnabled (Native)](#function-issneakingenabled-native)
            - [Function: IsInventoryMenuAccessEnabled (Native)](#function-isinventorymenuaccessenabled-native)
            - [Function: Reset (Native)](#function-reset-native-5)
    - [Script: Utility](#script-utility)
        - [Function: CallGlobalFunction (Native) (Global)](#function-callglobalfunction-native-global)
        - [Function: CallGlobalFunctionNoWait (Native) (Global)](#function-callglobalfunctionnowait-native-global)
        - [Function: GameTimeToString (Native) (Global)](#function-gametimetostring-native-global)
        - [Function: GetCurrentGameTime (Native) (Global)](#function-getcurrentgametime-native-global)
        - [Function: GetCurrentRealTime (Native) (Global)](#function-getcurrentrealtime-native-global)
        - [Function: GetCurrentStackID (Native) (Global)](#function-getcurrentstackid-native-global)
        - [Function: IntToHex (Native) (Global)](#function-inttohex-native-global)
        - [Function: IsGameMenuPaused (Native) (Global)](#function-isgamemenupaused-native-global)
        - [Function: RandomFloat (Native) (Global)](#function-randomfloat-native-global)
        - [Function: RandomFloatsFromSeed (Native) (Global)](#function-randomfloatsfromseed-native-global)
        - [Function: RandomInt (Native) (Global)](#function-randomint-native-global)
        - [Function: RandomIntsFromSeed (Native) (Global)](#function-randomintsfromseed-native-global)
        - [Function: SetINIFloat (Native) (Global)](#function-setinifloat-native-global)
        - [Function: SetINIInt (Native) (Global)](#function-setiniint-native-global)
        - [Function: SetINIBool (Native) (Global)](#function-setinibool-native-global)
        - [Function: SetINIString (Native) (Global)](#function-setinistring-native-global)
        - [Function: SplitStringChars (Native) (Global)](#function-splitstringchars-native-global)
        - [Function: Wait (Native) (Global)](#function-wait-native-global)
        - [Function: WaitGameTime (Native) (Global)](#function-waitgametime-native-global)
        - [Function: WaitMenuPause (Native) (Global)](#function-waitmenupause-native-global)
        - [Function: CaptureFrameRate (Native) (Global)](#function-captureframerate-native-global)
        - [Function: EnterTestData (Native) (Global)](#function-entertestdata-native-global)
        - [Function: PostStartUpTimes (Native) (Global)](#function-poststartuptimes-native-global)
        - [Function: StartFrameRateCapture (Native) (Global)](#function-startframeratecapture-native-global)
        - [Function: EndFrameRateCapture (Native) (Global)](#function-endframeratecapture-native-global)
        - [Function: GetAverageFrameRate (Native) (Global)](#function-getaverageframerate-native-global)
        - [Function: GetMinFrameRate (Native) (Global)](#function-getminframerate-native-global)
        - [Function: GetMaxFrameRate (Native) (Global)](#function-getmaxframerate-native-global)
        - [Function: GetCurrentMemory (Native) (Global)](#function-getcurrentmemory-native-global)
        - [Function: GetBudgetCount (Native) (Global)](#function-getbudgetcount-native-global)
        - [Function: GetCurrentBudget (Native) (Global)](#function-getcurrentbudget-native-global)
        - [Function: GetBudgetLimit (Native) (Global)](#function-getbudgetlimit-native-global)
        - [Function: OverBudget (Native) (Global)](#function-overbudget-native-global)
        - [Function: GetBudgetName (Native) (Global)](#function-getbudgetname-native-global)
        - [Function: ExpiryDay (Global)](#function-expiryday-global)
        - [Function: HasExpiryDayPassed (Global)](#function-hasexpirydaypassed-global)
        - [Function: GetHoursUntilLocalHour (Global)](#function-gethoursuntillocalhour-global)
        - [Function: GetFirstPlayer (Global)](#function-getfirstplayer-global)
        - [Function: GetFirstNonPlayer (Global)](#function-getfirstnonplayer-global)


# Inheritance
- [Debug](#script-debug)
- [Game](#script-game)
- [Math](#script-math)
- [ScriptObject](#script-scriptobject)
    - [ActiveMagicEffect](#script-activemagiceffect)
    - [Alias](#script-alias)
        - [LocationAlias](#script-locationalias)
        - [RefCollectionAlias](#script-refcollectionalias)
        - [ReferenceAlias](#script-referencealias)
    - [Form](#script-form)
        - [Action](#script-action)
        - [Activator](#script-activator)
            - [Flora](#script-flora)
            - [Furniture](#script-furniture)
            - [TalkingActivator](#script-talkingactivator)
        - [ActorBase](#script-actorbase)
        - [ActorValue](#script-actorvalue)
        - [AffinityEvent](#script-affinityevent)
        - [Ammo](#script-ammo)
        - [Armor](#script-armor)
        - [AssociationType](#script-associationtype)
        - [Book](#script-book)
        - [CameraShot](#script-camerashot)
        - [Cell](#script-cell)
        - [Challenge](#script-challenge)
        - [Class](#script-class)
        - [CombatStyle](#script-combatstyle)
        - [ConditionForm](#script-conditionform)
        - [Container](#script-container)
        - [Curve](#script-curve)
        - [Door](#script-door)
        - [EffectShader](#script-effectshader)
        - [Enchantment](#script-enchantment)
        - [Explosion](#script-explosion)
        - [Faction](#script-faction)
        - [FormList](#script-formlist)
        - [GameplayOption](#script-gameplayoption)
        - [GlobalVariable](#script-globalvariable)
        - [Hazard](#script-hazard)
        - [HeadPart](#script-headpart)
        - [Idle](#script-idle)
        - [IdleMarker](#script-idlemarker)
        - [ImageSpaceModifier](#script-imagespacemodifier)
        - [ImpactDataSet](#script-impactdataset)
        - [Ingredient](#script-ingredient)
        - [InstanceNamingRules](#script-instancenamingrules)
        - [Keyword](#script-keyword)
            - [LocationRefType](#script-locationreftype)
        - [LegendaryItem](#script-legendaryitem)
        - [LeveledActor](#script-leveledactor)
        - [LeveledItem](#script-leveleditem)
        - [LeveledSpaceshipBase](#script-leveledspaceshipbase)
        - [LeveledSpell](#script-leveledspell)
        - [Light](#script-light)
        - [Location](#script-location)
        - [MagicEffect](#script-magiceffect)
        - [Message](#script-message)
        - [MiscObject](#script-miscobject)
            - [ConstructibleObject](#script-constructibleobject)
            - [Key](#script-key)
            - [SoulGem](#script-soulgem)
        - [MusicType](#script-musictype)
        - [Note](#script-note)
        - [ObjectMod](#script-objectmod)
        - [ObjectReference](#script-objectreference)
            - [Actor](#script-actor)
            - [SpaceshipReference](#script-spaceshipreference)
        - [Outfit](#script-outfit)
        - [Package](#script-package)
        - [PackIn](#script-packin)
        - [Perk](#script-perk)
        - [Planet](#script-planet)
        - [Potion](#script-potion)
        - [Projectile](#script-projectile)
        - [Quest](#script-quest)
        - [Race](#script-race)
        - [ResearchProject](#script-researchproject)
        - [Resource](#script-resource)
        - [Scene](#script-scene)
        - [Scroll](#script-scroll)
        - [ShaderParticleGeometry](#script-shaderparticlegeometry)
        - [Shout](#script-shout)
        - [SpaceshipBase](#script-spaceshipbase)
        - [SpeechChallengeObject](#script-speechchallengeobject)
        - [Spell](#script-spell)
        - [Static](#script-static)
        - [Terminal](#script-terminal)
        - [TerminalMenu](#script-terminalmenu)
        - [TextureSet](#script-textureset)
        - [Topic](#script-topic)
        - [TopicInfo](#script-topicinfo)
        - [VisualEffect](#script-visualeffect)
        - [VoiceType](#script-voicetype)
        - [Weapon](#script-weapon)
        - [Weather](#script-weather)
        - [WordOfPower](#script-wordofpower)
        - [WorldSpace](#script-worldspace)
        - [WwiseEvent](#script-wwiseevent)
    - [InputEnableLayer](#script-inputenablelayer)
- [Utility](#script-utility)

([TOC](#table-of-contents))


# Details

## Script: Debug
`Scriptname Debug Native DebugOnly Hidden`

Note that these functions will do nothing in release console builds

([TOC](#table-of-contents))

### Function: AutomatedTestLogDebug (Native) (Global)
`Function AutomatedTestLogDebug(string asMessage) native global`

Logs a debug message to the automated testing logger

([TOC](#table-of-contents))

### Function: AutomatedTestLogError (Native) (Global)
`Function AutomatedTestLogError(string asMessage) native global`

Logs an error message to the automated testing logger

([TOC](#table-of-contents))

### Function: AutomatedTestLogProgress (Native) (Global)
`Function AutomatedTestLogProgress(string asMessage) native global`

Logs a test progress message to the automated testing logger

([TOC](#table-of-contents))

### Function: CenterOnCell (Native) (Global)
`Function CenterOnCell(string asCellname) native global`

COC functionality

([TOC](#table-of-contents))

### Function: CenterOnCellAndWait (Native) (Global)
`float Function CenterOnCellAndWait(string asCellname) native global`

COC functionality

([TOC](#table-of-contents))

### Function: PlayerMoveToAndWait (Native) (Global)
`float Function PlayerMoveToAndWait(string asDestRef) native global`

player.moveto functionality

([TOC](#table-of-contents))

### Function: CloseUserLog (Native) (Global)
`Function CloseUserLog(string asLogName) native global`

Closes the specified user log

([TOC](#table-of-contents))

### Function: DBSendPlayerPosition (Native) (Global)
`Function DBSendPlayerPosition() native global`

Prints out the players position to the database (non-release PC and Xenon builds only)

([TOC](#table-of-contents))

### Function: DumpAliasData (Native) (Global)
`Function DumpAliasData(Quest akQuest) native global`

Dumps all alias fill information for the quest to the AliasDump log in Logs/Script/

([TOC](#table-of-contents))

### Function: DumpEventRegistrations (Native) (Global)
`Function DumpEventRegistrations(ScriptObject akScript) native global`

Dumps all event registrations for the specified script to the Papyrus log

([TOC](#table-of-contents))

### Function: EnableAI (Native) (Global)
`Function EnableAI(bool abEnable = true) native global`

Enable/disable AI processing

([TOC](#table-of-contents))

### Function: EnableCollisions (Native) (Global)
`Function EnableCollisions(bool abEnable = true) native global`

Enable/disable collision detection

([TOC](#table-of-contents))

### Function: EnableDetection (Native) (Global)
`Function EnableDetection(bool abEnable = true) native global`

Enable/disable AI detection

([TOC](#table-of-contents))

### Function: EnableMenus (Native) (Global)
`Function EnableMenus(bool abEnable = true) native global`

Enable/disable menu rendering

([TOC](#table-of-contents))

### Function: ExecuteConsole (Native) (Global)
`Function ExecuteConsole(string aCommand) native global`

Execute the specified console command

([TOC](#table-of-contents))

### Function: GetConfigName (Native) (Global)
`string Function GetConfigName() native global`

Returns the config name

([TOC](#table-of-contents))

### Function: GetPlatformName (Native) (Global)
`string Function GetPlatformName() native global`

Returns the platform name

([TOC](#table-of-contents))

### Function: GetVersionNumber (Native) (Global)
`string Function GetVersionNumber() native global`

Returns the version number string

([TOC](#table-of-contents))

### Function: MessageBox (Native) (Global)
`Function MessageBox(string asMessageBoxText) native global`

Displays an in-game message box

([TOC](#table-of-contents))

### Function: Notification (Native) (Global)
`Function Notification(string asNotificationText) native global`

Displays an in-game notification

([TOC](#table-of-contents))

### Function: OpenUserLog (Native) (Global)
`bool Function OpenUserLog(string asLogName) native global`

Opens a user log - fails if the log is already open

([TOC](#table-of-contents))

### Function: QuitGame (Native) (Global)
`Function QuitGame() native global`

Quits the game

([TOC](#table-of-contents))

### Function: SetGodMode (Native) (Global)
`Function SetGodMode(bool abGodMode) native global`

TGM functionality

([TOC](#table-of-contents))

### Function: ShowRefPosition (Native) (Global)
`Function ShowRefPosition(ObjectReference arRef) native global`

Used to add a tripod to a reference (non-release builds only)

([TOC](#table-of-contents))

### Function: StartScriptProfiling (Native) (Global)
`Function StartScriptProfiling(string asScriptName) native global`

Start profiling a specific script - setting doesn't persist across saves

Will do nothing on release console builds, and if the `Papyrus:bEnableProfiling` ini setting is off

([TOC](#table-of-contents))

### Function: StartStackProfiling (Native) (Global)
`Function StartStackProfiling() native global`

Start profiling the calling stack - setting doesn't persist across saves

Will do nothing on release console builds, and if the `Papyrus:bEnableProfiling` ini setting is off

([TOC](#table-of-contents))

### Function: StartStackRootProfiling (Native) (Global)
`Function StartStackRootProfiling(string asScriptName, ScriptObject akObj = None) native global`

Starts profiling all stacks that start in the specified script (and object, if any) - setting doesn't persist across saves

Will do nothing on release console builds, and if the `Papyrus:bEnableProfiling` ini setting is off

([TOC](#table-of-contents))

### Function: StopScriptProfiling (Native) (Global)
`Function StopScriptProfiling(string asScriptName) native global`

Stop profiling a specific script - setting doesn't persist across saves

Will do nothing on release console builds, and if the `Papyrus:bEnableProfiling` ini setting is off

([TOC](#table-of-contents))

### Function: StopStackProfiling (Native) (Global)
`Function StopStackProfiling() native global`

Stop profiling the calling stack - setting doesn't persist across saves

Will do nothing on release console builds, and if the `Papyrus:bEnableProfiling` ini setting is off

([TOC](#table-of-contents))

### Function: StopStackRootProfiling (Native) (Global)
`Function StopStackRootProfiling(string asScriptName, ScriptObject akObj = None) native global`

Stop profiling all stacks that start in the specified script (and object, if any) - setting doesn't persist across saves

Will do nothing on release console builds, and if the `Papyrus:bEnableProfiling` ini setting is off

([TOC](#table-of-contents))

### Function: Trace (Native) (Global)
`Function Trace(string asTextToPrint, int aiSeverity = 0) native global`

Outputs the string to the log

Severity is one of the following:

0 - Info

1 - Warning

2 - Error

([TOC](#table-of-contents))

### Function: TraceFunction (Native) (Global)
`Function TraceFunction(string asTextToPrint = "Tracing function on request", int aiSeverity = 0) native global`

Outputs the current function to the log, including all variable values

([TOC](#table-of-contents))

### Function: TraceStack (Native) (Global)
`Function TraceStack(string asTextToPrint = "Tracing stack on request", int aiSeverity = 0) native global`

Outputs the current stack to the log

([TOC](#table-of-contents))

### Function: TraceUser (Native) (Global)
`bool Function TraceUser(string asUserLog, string asTextToPrint, int aiSeverity = 0) native global`

Outputs the string to a user log - fails if the log hasn't been opened

([TOC](#table-of-contents))

### Function: TraceConditionalGlobal (Global)
`Function TraceConditionalGlobal(string TextToPrint, GlobalVariable ShowTrace) Global`

As `TraceConditional()` but checks to make sure the global exists to avoid error messages in the log

([TOC](#table-of-contents))

### Function: TraceConditional (Global)
`Function TraceConditional(string TextToPrint, bool ShowTrace, int Severity = 0) Global`

Suppressible Trace

As `Trace()` but takes a second parameter `bool ShowTrace` (which if false suppresses the message). Used to turn off and on traces that might be otherwise annoying.

([TOC](#table-of-contents))

### Function: TraceAndBox (Global)
`Function TraceAndBox(string asTextToPrint, int aiSeverity = 0) global`

A convenience function to both throw a message box AND write to the trace log, since message boxes sometimes stack in weird ways and won't show up reliably.

([TOC](#table-of-contents))

### Function: TraceSelf (Global)
`Function TraceSelf(ScriptObject CallingScript, string FunctionName, string StringToTrace) global`

Convenient way to trace the script name and optional function name as a prefix to the trace string

Note: always pass in `SELF` as the `CallingScript`

([TOC](#table-of-contents))

### Function: TraceLog (Global)
`bool Function TraceLog(ScriptObject CallingObject, string asTextToPrint, string logName, string SubLogName = "", int aiSeverity = 0, bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = false, bool bPrefixTracesWithCallingObject = true) global`

([TOC](#table-of-contents))

## Script: Game
`Scriptname Game Native Hidden`

([TOC](#table-of-contents))

### Function: AddAchievement (Native) (Global)
`Function AddAchievement(int aiAchievementID) native global`

Adds the specified achievement to the player's profile

([TOC](#table-of-contents))

### Function: AddToAvailableCrew (Native) (Global)
`bool Function AddToAvailableCrew(Actor akActor) native global`

Adds the specified actor to the player's unassigned crew list

([TOC](#table-of-contents))

### Function: AddPerkPoints (Native) (Global)
`Function AddPerkPoints(int aiPerkPoints) native global`

Add the specified number of perk points to the player

([TOC](#table-of-contents))

### Function: AddPlayerOwnedShip (Native) (Global)
`Function AddPlayerOwnedShip(SpaceshipReference arRef) native global`

Add the specified spaceship to the player's owned ships

([TOC](#table-of-contents))

### Function: AdvanceSkill (Native) (Global)
`Function AdvanceSkill(string asSkillName, float afMagnitude) native global`

Advance the given skill on the player by the provided amount of skill usage

([TOC](#table-of-contents))

### Function: AreHostileActorsNear (Native) (Global)
`bool Function AreHostileActorsNear() native global`

Check if hostile actors are near

([TOC](#table-of-contents))

### Function: ClearPrison (Native) (Global)
`Function ClearPrison() native global`

Clears the prison variables on the player

([TOC](#table-of-contents))

### Function: ClearTempEffects (Native) (Global)
`Function ClearTempEffects() native global`

Clears temp effects from game

([TOC](#table-of-contents))

### Function: Error (Native) (Global)
`Function Error(string asMessage) native global betaOnly`

Issue an error with stack trace to the script log and warning system

([TOC](#table-of-contents))

### Function: FadeOutGame (Native) (Global)
`Function FadeOutGame(bool abFadingOut, bool abBlackFade, float afSecsBeforeFade, float afFadeDuration, bool abStayFaded = false) native global`

Fades out the game to black, or vice versa

([TOC](#table-of-contents))

### Function: FastTravel (Native) (Global)
`Function FastTravel(ObjectReference akDestination) native global`

Fast-travels the player to the specified object's location

([TOC](#table-of-contents))

### Function: FindClosestReferenceOfType (Native) (Global)
`ObjectReference Function FindClosestReferenceOfType(Form arBaseObject, float afX, float afY, float afZ, float afRadius) native global`

Finds the closest reference of a given base object within a given radius of a location

([TOC](#table-of-contents))

### Function: FindRandomReferenceOfType (Native) (Global)
`ObjectReference Function FindRandomReferenceOfType(Form arBaseObject, float afX, float afY, float afZ, float afRadius) native global`

Finds a random reference of a given base object within a given radius of a location

([TOC](#table-of-contents))

### Function: FindClosestReferenceOfAnyTypeInList (Native) (Global)
`ObjectReference Function FindClosestReferenceOfAnyTypeInList(FormList arBaseObjects, float afX, float afY, float afZ, float afRadius) native global`

Finds the closest reference of any base object in the list within a given radius of a location

([TOC](#table-of-contents))

### Function: FindRandomReferenceOfAnyTypeInList (Native) (Global)
`ObjectReference Function FindRandomReferenceOfAnyTypeInList(FormList arBaseObjects, float afX, float afY, float afZ, float afRadius) native global`

Finds a random reference of a any base object in the list within a given radius of a location

([TOC](#table-of-contents))

### Function: FindClosestReferenceOfTypeFromRef (Global)
`ObjectReference Function FindClosestReferenceOfTypeFromRef(Form arBaseObject, ObjectReference arCenter, float afRadius) global`

Finds the closest reference of a given base object within a given radius of a reference

([TOC](#table-of-contents))

### Function: FindRandomReferenceOfTypeFromRef (Global)
`ObjectReference Function FindRandomReferenceOfTypeFromRef(Form arBaseObject, ObjectReference arCenter, float afRadius) global`

Finds a random reference of a given base object within a given radius of a reference

([TOC](#table-of-contents))

### Function: FindClosestReferenceOfAnyTypeInListFromRef (Global)
`ObjectReference Function FindClosestReferenceOfAnyTypeInListFromRef(FormList arBaseObjects, ObjectReference arCenter, float afRadius) global`

Finds the closest reference of a given base object within a given radius of a reference

([TOC](#table-of-contents))

### Function: FindRandomReferenceOfAnyTypeInListFromRef (Global)
`ObjectReference Function FindRandomReferenceOfAnyTypeInListFromRef(FormList arBaseObjects, ObjectReference arCenter, float afRadius) global`

Finds a random reference of a given base object within a given radius of a reference

([TOC](#table-of-contents))

### Function: FindClosestActor (Native) (Global)
`Actor Function FindClosestActor(float afX, float afY, float afZ, float afRadius) native global`

Finds the closest actor within a given radius of a location (may return dead actors)

([TOC](#table-of-contents))

### Function: FindClosestLivingActor (Native) (Global)
`Actor Function FindClosestLivingActor(float afX, float afY, float afZ, float afRadius) native global`

Finds the closest living actor within a given radius of a location

([TOC](#table-of-contents))

### Function: FindRandomActor (Native) (Global)
`Actor Function FindRandomActor(float afX, float afY, float afZ, float afRadius) native global`

Finds a random actor within a given radius of a location (may return dead actors)

([TOC](#table-of-contents))

### Function: FindRandomLivingActor (Native) (Global)
`Actor Function FindRandomLivingActor(float afX, float afY, float afZ, float afRadius) native global`

Finds a random living actor within a given radius of a location

([TOC](#table-of-contents))

### Function: FindClosestActorFromRef (Global)
`Actor Function FindClosestActorFromRef(ObjectReference arCenter, float afRadius) global`

Finds the closest actor within a given radius of a reference (may return dead actors)

([TOC](#table-of-contents))

### Function: FindClosestLivingActorFromRef (Global)
`Actor Function FindClosestLivingActorFromRef(ObjectReference arCenter, float afRadius) global`

Finds the closest living actor within a given radius of a reference

([TOC](#table-of-contents))

### Function: FindRandomActorFromRef (Global)
`Actor Function FindRandomActorFromRef(ObjectReference arCenter, float afRadius) global`

Finds a random actor within a given radius of a reference (may return dead actors)

([TOC](#table-of-contents))

### Function: FindRandomLivingActorFromRef (Global)
`Actor Function FindRandomLivingActorFromRef(ObjectReference arCenter, float afRadius) global`

Finds a random living actor within a given radius of a reference

([TOC](#table-of-contents))

### Function: ForceDisableSSRDirLight (Native) (Global)
`Function ForceDisableSSRDirLight( bool abDisableSSR, bool abDisableDirLight ) native global`

Disable SSR, and/or directional lighting. Note: disable state reset after 240 frames if this function is not continually called.

([TOC](#table-of-contents))

### Function: ForceThirdPerson (Native) (Global)
`Function ForceThirdPerson() native global`

Make the player got to 3rd person camera mode

([TOC](#table-of-contents))

### Function: ForceFirstPerson (Native) (Global)
`Function ForceFirstPerson() native global`

Make the player got to 1st person camera mode

([TOC](#table-of-contents))

### Function: GetXPForLevel (Native) (Global)
`int Function GetXPForLevel(int auiLevel) native global`

Return the total amount of XP required to get to the particular level (not the gap between two levels)

([TOC](#table-of-contents))

### Function: ShowFirstPersonGeometry (Native) (Global)
`Function ShowFirstPersonGeometry( bool abShow = true ) native global`

Show the players first person geometry.

([TOC](#table-of-contents))

### Function: ShowAllMapMarkers (Native) (Global)
`Function ShowAllMapMarkers( ) native global`

Show all the map markers on the world map.

([TOC](#table-of-contents))

### Function: GameplayAutomatedTestComplete (Native) (Global)
`Function GameplayAutomatedTestComplete( bool abSuccessful ) native global DebugOnly`

Tell the code that the gameplay automated test has been completed.

([TOC](#table-of-contents))

### Function: GetAggressionAV (Native) (Global)
`ActorValue Function GetAggressionAV() native global`

Get the Aggression Actor Value

([TOC](#table-of-contents))

### Function: GetAgilityAV (Native) (Global)
`ActorValue Function GetAgilityAV() native global`

Get the Agility Actor Value

([TOC](#table-of-contents))

### Function: GetAllLocations (Native) (Global)
`Location[] Function GetAllLocations() native global`

Returns a list of all Locations

([TOC](#table-of-contents))

### Function: GetMatchingLocations (Native) (Global)
`Location[] function GetMatchingLocations(Location ParentLocation = none, keyword[] WantedKeywords = none, keyword[] UnwantedKeywords = none, LocationRefType[] WantedRefTypes = none, LocationRefType[] UnwantedRefTypes = none,  bool MustFindAllWantedKeywords = true, bool MustNotFindAnyUnwantedKeywords = true, bool MustFindAllWantedRefTypes = true, bool MustNotFindAnyUnwantedRefTypes = true, int LimitOfLocationsToReturn = 0) Global native`

 Returns a list of locations matching the following criteria

`ParentLocation` - if not none, returns only locations which have this as a parent location

`WantedKeywords` - if not empty, locations must have these keywords

`UnwantedKeywords` - if not empty, locations must not have these keywords

`WantedRefTypes` - if not empty, locations must have references with these LocationRefTypes

`UnwantedRefTypes` - if not empty, locations must not have these RefTypes

`MustFindAllWantedKeywords` - if true, locations must have ALL of the keywords. If false, location must have AT LEAST ONE of the keywords

`MustNotFindAnyUnwantedKeywords` - if true, locations must not have ANY of the keywords. If false, location must not have ALL of the keywords present at the same time

`MustFindAllWantedRefTypes` - if true, locations must have ALL of the RefTypes. If false, location must have AT LEAST ONE of the RefTypes

`MustNotFindAnyUnwantedRefTypes` - if true, locations must not have ANY of the RefTypes. If false, location must not have ALL of the RefTypes present at the same time

`LimitOfLocationsToReturn` - if > 0, randomly select this many locations to return. If <= 0, return all matching locations

([TOC](#table-of-contents))

### Function: GetMatchingLocation (Global)
`Location function GetMatchingLocation(Location ParentLocation = none, keyword[] WantedKeywords = none, keyword[] UnwantedKeywords = none, LocationRefType[] WantedRefTypes = none, LocationRefType[] UnwantedRefTypes = none,  bool MustFindAllWantedKeywords = true, bool MustNotFindAnyUnwantedKeywords = true, bool MustFindAllWantedRefTypes = true, bool MustNotFindAnyUnwantedRefTypes = true) Global`

 Returns a location matching the following criteria

`ParentLocation` - if not none, returns only locations which have this as a parent location

`WantedKeywords` - if not empty, locations must have these keywords

`UnwantedKeywords` - if not empty, locations must not have these keywords

`WantedRefTypes` - if not empty, locations must have references with these LocationRefTypes

`UnwantedRefTypes` - if not empty, locations must not have these RefTypes

`MustFindAllWantedKeywords` - if true, locations must have ALL of the keywords. If false, location must have AT LEAST ONE of the keywords

`MustNotFindAnyUnwantedKeywords` - if true, locations must not have ANY of the keywords. If false, location must not have ALL of the keywords present at the same time

`MustFindAllWantedRefTypes` - if true, locations must have ALL of the RefTypes. If false, location must have AT LEAST ONE of the RefTypes

`MustNotFindAnyUnwantedRefTypes` - if true, locations must not have ANY of the RefTypes. If false, location must not have ALL of the RefTypes present at the same time

([TOC](#table-of-contents))

### Function: GetCameraHeadingAngle (Native) (Global)
`float Function GetCameraHeadingAngle(ObjectReference akTarget) native global`

Gets the angle between the camera's heading and the target object in degrees - in the range from `-180` to `180`

([TOC](#table-of-contents))

### Function: GetCaps (Global)
`MiscObject Function GetCaps() global`

Returns the caps misc item

([TOC](#table-of-contents))

### Function: GetCredits (Global)
`MiscObject Function GetCredits() global`

([TOC](#table-of-contents))

### Function: GetCharismaAV (Native) (Global)
`ActorValue Function GetCharismaAV() native global`

Get the Charisma Actor Value

([TOC](#table-of-contents))

### Function: GetConfidenceAV (Native) (Global)
`ActorValue Function GetConfidenceAV() native global`

Get the Confidence Actor Value

([TOC](#table-of-contents))

### Function: GetDieRoll (Global)
`int Function GetDieRoll(int MinResult = 1, int NumberOfSides = 100, int DebugDieRoll = -1) global`

Get a die roll result

([TOC](#table-of-contents))

### Function: GetDieRollSuccess (Global)
`bool Function GetDieRollSuccess(int Chance, int MinResult = 1, int NumberOfSides = 100, int DebugDieRoll = -1, int ForcedDieRoll = -1) global`

Get if a die roll result was a success

([TOC](#table-of-contents))

### Function: GetDifficulty (Native) (Global)
`int Function GetDifficulty() native global`

Returns the game's current difficulty

Type is as follows:
- 0 - Very Easy
- 1 - Easy
- 2 - Normal
- 3 - Hard
- 4 - Very Hard
- 5 - Survival w/ Hardcore

([TOC](#table-of-contents))

### Function: GetEnduranceAV (Native) (Global)
`ActorValue Function GetEnduranceAV() native global`

Get the Endurance Actor Value

([TOC](#table-of-contents))

### Function: GetForm (Native) (Global)
`Form Function GetForm(int aiFormID) native global`

Returns the form specified by the ID

([TOC](#table-of-contents))

### Function: GetFormFromFile (Native) (Global)
`Form Function GetFormFromFile(int aiFormID, string asFilename) native global`

Returns the form specified by the ID originating in the given file

([TOC](#table-of-contents))

### Function: GetGameSettingFloat (Native) (Global)
`float Function GetGameSettingFloat(string asGameSetting) native global`

Obtains the value of a float game setting

([TOC](#table-of-contents))

### Function: GetGameSettingInt (Native) (Global)
`int Function GetGameSettingInt(string asGameSetting) native global`

Obtains the value of an int game setting

([TOC](#table-of-contents))

### Function: GetGameSettingString (Native) (Global)
`string Function GetGameSettingString(string asGameSetting) native global`

Obtains the value of a string game setting

([TOC](#table-of-contents))

### Function: GetGameSettingUInt (Native) (Global)
`int Function GetGameSettingUInt(string asGameSetting) native global`

Obtains the value of an unsigned int game setting

([TOC](#table-of-contents))

### Function: GetGameSettingBool (Native) (Global)
`bool Function GetGameSettingBool(string asGameSetting) native global`

Obtains the value of a bool game setting

([TOC](#table-of-contents))

### Function: GetHealthAV (Native) (Global)
`ActorValue Function GetHealthAV() native global`

Get the Health Actor Value

([TOC](#table-of-contents))

### Function: GetIntelligenceAV (Native) (Global)
`ActorValue Function GetIntelligenceAV() native global`

Get the Intelligence Actor Value

([TOC](#table-of-contents))

### Function: GetLuckAV (Native) (Global)
`ActorValue Function GetLuckAV() native global`

Get the Luck Actor Value

([TOC](#table-of-contents))

### Function: GetInvulnerableAV (Native) (Global)
`ActorValue Function GetInvulnerableAV() native global`

Get the Invulnerable Actor Value

([TOC](#table-of-contents))

### Function: GetPerceptionAV (Native) (Global)
`ActorValue Function GetPerceptionAV() native global`

Get the Perception Actor Value

([TOC](#table-of-contents))

### Function: GetPlayer (Native) (Global)
`Actor Function GetPlayer() native global`

Returns the player actor

([TOC](#table-of-contents))

### Function: GetPlayerActiveQuests (Native) (Global)
`Quest[] Function GetPlayerActiveQuests() native global`

Returns a list of quests that are active on the player

([TOC](#table-of-contents))

### Function: GetPlayerActiveDialogueUnsaidInfo (Native) (Global)
`int[] Function GetPlayerActiveDialogueUnsaidInfo() native global`

Returns an array of how many unsaid topics are tied to each dialogue option in the active conversation

([TOC](#table-of-contents))

### Function: GetPlayerFollowers (Native) (Global)
`Actor[] Function GetPlayerFollowers( ) native global`

Returns a list of actors that are following the player (including both those running

a Follow procedure and those flagged by their package to be treated as followers).

([TOC](#table-of-contents))

### Function: GetPlayerLevel (Global)
`int Function GetPlayerLevel() global`

Returns the player's level

([TOC](#table-of-contents))

### Function: GetPlayerGrabbedRef (Native) (Global)
`ObjectReference Function GetPlayerGrabbedRef() native global`

Returns the reference the player is currently grabbing

([TOC](#table-of-contents))

### Function: GetPlayerRadioFrequency (Native) (Global)
`float Function GetPlayerRadioFrequency() native global`

Returns the current frequency setting of the player's radio

([TOC](#table-of-contents))

### Function: GetPlayersLastRiddenHorse (Native) (Global)
`Actor Function GetPlayersLastRiddenHorse() native global`

Returns the horse last ridden by the player

([TOC](#table-of-contents))

### Function: GetRealHoursPassed (Native) (Global)
`float Function GetRealHoursPassed() native global`

Returns the number of days spent in play

([TOC](#table-of-contents))

### Function: GetSuspiciousAV (Native) (Global)
`ActorValue Function GetSuspiciousAV() native global`

Get the Suspicious Actor Value

([TOC](#table-of-contents))

### Function: GetStrengthAV (Native) (Global)
`ActorValue Function GetStrengthAV() native global`

Get the Strength Actor Value

([TOC](#table-of-contents))

### Function: GivePlayerCaps (Global)
`Function GivePlayerCaps(int nCaps) global`

Adds a specified amount of caps to the player

([TOC](#table-of-contents))

### Function: HideContrabandScanWarning (Native) (Global)
`Function HideContrabandScanWarning(bool abSkipCompletionAnim = false, bool abWasDetectionEvaded = false) native global`

Hides the Contraband Scan Warning, skipping or completing the scan as a success or failure.

If `abSkipCompletionAnim` is `true`, `abWasDetectionEvaded` will be ignored.

([TOC](#table-of-contents))

### Function: HideHudMenus (Native) (Global)
`Function HideHudMenus() native global`

Hides the hud and spaceship hud menus.

([TOC](#table-of-contents))

### Function: RemovePlayerCaps (Global)
`Function RemovePlayerCaps(int nCaps) global`

Removes a specified amount of caps from the player

([TOC](#table-of-contents))

### Function: IncrementSkill (Native) (Global)
`Function IncrementSkill(ActorValue akActorValue, int aiCount = 1) native global`

Increment the given skill on the player by the given number of points

([TOC](#table-of-contents))

### Function: IncrementStat (Native) (Global)
`Function IncrementStat(string asStatName, int aiModAmount = 1) native global`

Modifies the specified MiscStat by the given amount.

([TOC](#table-of-contents))

### Function: IsActivateControlsEnabled (Native) (Global)
`bool Function IsActivateControlsEnabled() native global`

Are the activation controls enabled?

([TOC](#table-of-contents))

### Function: IsAutomatedTestControllingPlayerInProgress (Native) (Global)
`bool Function IsAutomatedTestControllingPlayerInProgress() native global DebugOnly`

Is there an automated test controlling the player (bot) running currently?

([TOC](#table-of-contents))

### Function: IsVATSControlsEnabled (Native) (Global)
`bool Function IsVATSControlsEnabled() native global`

Are the VATS controls enabled?

([TOC](#table-of-contents))

### Function: IsVATSPlaybackActive (Native) (Global)
`bool Function IsVATSPlaybackActive() native global`

Is VATS playback active?

([TOC](#table-of-contents))

### Function: IsCamSwitchControlsEnabled (Native) (Global)
`bool Function IsCamSwitchControlsEnabled() native global`

Are the camera switch controls enabled?

([TOC](#table-of-contents))

### Function: IsFarTravelControlsEnabled (Native) (Global)
`bool Function IsFarTravelControlsEnabled() native global`

Is ship far travel enabled?

([TOC](#table-of-contents))

### Function: IsFastTravelControlsEnabled (Native) (Global)
`bool Function IsFastTravelControlsEnabled() native global`

Is fast travel controls enabled? Returns `false` if `EnableFastTravel(false)` has been called

([TOC](#table-of-contents))

### Function: IsFastTravelEnabled (Native) (Global)
`bool Function IsFastTravelEnabled() native global`

Is fast travel enabled?

([TOC](#table-of-contents))

### Function: IsFavoritesControlsEnabled (Native) (Global)
`bool Function IsFavoritesControlsEnabled() native global`

Is favorites menu enabled?

([TOC](#table-of-contents))

### Function: IsGravJumpControlsEnabled (Native) (Global)
`bool Function IsGravJumpControlsEnabled() native global`

Is ship grav jump enabled?

([TOC](#table-of-contents))

### Function: IsGuardPursuingPlayer (Native) (Global)
`bool Function IsGuardPursuingPlayer() native global`

are any guards pursuing the player for crime?

([TOC](#table-of-contents))

### Function: IsTakeoffControlsEnabled (Native) (Global)
`bool Function IsTakeoffControlsEnabled() native global`

Is ship takeoff enabled?

([TOC](#table-of-contents))

### Function: IsFightingControlsEnabled (Native) (Global)
`bool Function IsFightingControlsEnabled() native global`

Are the fighting controls enabled?

([TOC](#table-of-contents))

### Function: IsJournalControlsEnabled (Native) (Global)
`bool Function IsJournalControlsEnabled() native global`

Are the journal menu controls enabled?

([TOC](#table-of-contents))

### Function: IsJumpingControlsEnabled (Native) (Global)
`bool Function IsJumpingControlsEnabled() native global`

Are the jumping controls enabled? (Note: Movement also enables/disables jumping)

([TOC](#table-of-contents))

### Function: IsLookingControlsEnabled (Native) (Global)
`bool Function IsLookingControlsEnabled() native global`

Are the looking controls enabled?

([TOC](#table-of-contents))

### Function: IsMenuControlsEnabled (Native) (Global)
`bool Function IsMenuControlsEnabled() native global`

Are the menu controls enabled?

([TOC](#table-of-contents))

### Function: IsMovementControlsEnabled (Native) (Global)
`bool Function IsMovementControlsEnabled() native global`

Are the movement controls enabled?

([TOC](#table-of-contents))

### Function: IsPluginInstalled (Native) (Global)
`bool Function IsPluginInstalled(string asName) native global`

Is the specified plugin (esm or esp) installed?

([TOC](#table-of-contents))

### Function: IsPlayerInDialogue (Native) (Global)
`bool Function IsPlayerInDialogue() native global`

Is the player currently considered in dialogue?

([TOC](#table-of-contents))

### Function: IsPlayerInMessageBox (Native) (Global)
`bool Function IsPlayerInMessageBox() native global`

Is the player currently being displayed a message box?

([TOC](#table-of-contents))

### Function: IsPlayerInRadioRange (Native) (Global)
`bool Function IsPlayerInRadioRange(float afFrequency) native global`

Is the player within the outer radius of a transmitter using the given frequency?

([TOC](#table-of-contents))

### Function: IsPlayerListening (Native) (Global)
`bool Function IsPlayerListening(float afFrequency) native global`

Is the player actively listening to a transmitter using the given frequency.

(Pipboy is on, set to a frequency that would receive the transmission, and within the transmitter's outer radius.)

([TOC](#table-of-contents))

### Function: IsPlayerLoitering (Native) (Global)
`bool Function IsPlayerLoitering() native global`

Is the player loitering

([TOC](#table-of-contents))

### Function: IsPlayerSpaceshipOwner (Native) (Global)
`bool Function IsPlayerSpaceshipOwner(SpaceshipReference arRef) native global`

Is the player an owner of this spaceship reference

([TOC](#table-of-contents))

### Function: IsPlayerRadioOn (Native) (Global)
`bool Function IsPlayerRadioOn() native global`

Is the player's radio currently on?

([TOC](#table-of-contents))

### Function: IsResearchComplete (Native) (Global)
`bool Function IsResearchComplete( ResearchProject akResearchProject ) native global`

has the player completed this research project

([TOC](#table-of-contents))

### Function: IsSneakingControlsEnabled (Native) (Global)
`bool Function IsSneakingControlsEnabled() native global`

Are the sneaking controls enabled?

([TOC](#table-of-contents))

### Function: PassTime (Native) (Global)
`Function PassTime(int aiHours) native global`

Pass time as if the player has waited the given number of hours.

([TOC](#table-of-contents))

### Function: PlayBink (Native) (Global)
`Function PlayBink(string asFileName, bool abInterruptible = false, bool abMuteAudio = true, bool abMuteMusic = true, bool abLetterbox = true, bool abIsNewGameBink = false ) native global`

Plays a bink video - does not return until bink has finished, use with care!

([TOC](#table-of-contents))

### Function: PlayBinkNoWait (Native) (Global)
`Function PlayBinkNoWait(string asFileName, bool abInterruptible = false, bool abMuteAudio = true, bool abMuteMusic = true, bool abLetterbox = true, bool abIsNewGameBink = false, bool aPlayDuringLoadingScreen = false) native global`

Plays a bink video, use with care!

([TOC](#table-of-contents))

### Function: PrecacheCharGen (Native) (Global)
`Function PrecacheCharGen() native global`

Precaches character gen data.

([TOC](#table-of-contents))

### Function: PrecacheCharGenClear (Native) (Global)
`Function PrecacheCharGenClear() native global`

Clears Precached character gen data.

([TOC](#table-of-contents))

### Function: PopPlayerTo (Native) (Global)
`bool Function PopPlayerTo(ObjectReference akTarget, float afXOffset = 0.0, float afYOffset = 0.0, float afZOffset = 0.0, bool abMatchRotation = true, bool abCheckForCollision = false) native global`

Pops the player to the location of the target without any load or screen fade. Note that the target reference must be in the same cell as the player.

If you have to move the player to a reference in another cell, use `MoveTo` instead.

([TOC](#table-of-contents))

### Function: QueryStat (Native) (Global)
`int Function QueryStat(string asStat) native global`

Queries the given stat and returns its value

([TOC](#table-of-contents))

### Function: QuitToMainMenu (Native) (Global)
`Function QuitToMainMenu() native global`

Forces the game back to the main menu

([TOC](#table-of-contents))

### Function: RemoveFromAvailableCrew (Native) (Global)
`Function RemoveFromAvailableCrew(Actor akActor) native global`

Removes the specified actor from the player's list of available crew members.

([TOC](#table-of-contents))

### Function: RemovePlayerOwnedShip (Native) (Global)
`bool Function RemovePlayerOwnedShip(SpaceshipReference arRef) native global`

Remove the specified spaceship from the player's owned ships

([TOC](#table-of-contents))

### Function: RequestAutoSave (Native) (Global)
`Function RequestAutoSave() native global`

Request that an auto-save be made

([TOC](#table-of-contents))

### Function: RequestDialogueSkip (Native) (Global)
`Function RequestDialogueSkip() native global`

Request that the dialogue menu skips the current line of dialogue

([TOC](#table-of-contents))

### Function: RequestDialogueExit (Native) (Global)
`Function RequestDialogueExit() native global`

Request that the dialogue menu exits if possible

([TOC](#table-of-contents))

### Function: RequestDialogueSelect (Native) (Global)
`Function RequestDialogueSelect(int aiIndex) native global`

Request to select a dialogue option

([TOC](#table-of-contents))

### Function: RequestGameplayBotState (Native) (Global)
`Function RequestGameplayBotState(ObjectReference arRef, int aiState) native global`

Request to start a state with the target reference

([TOC](#table-of-contents))

### Function: RequestMessageBoxSelect (Native) (Global)
`Function RequestMessageBoxSelect(int aiIndex) native global`

Request to select a MessageBox option

([TOC](#table-of-contents))

### Function: RequestHUDRolloverRefresh (Native) (Global)
`Function RequestHUDRolloverRefresh() native global`

Request that the HUD's rollover refresh itself

([TOC](#table-of-contents))

### Function: RequestModel (Native) (Global)
`Function RequestModel(string asModelName) native global`

Requests the specified model

([TOC](#table-of-contents))

### Function: RequestSave (Native) (Global)
`Function RequestSave() native global`

Request that a normal save be made

([TOC](#table-of-contents))

### Function: RequestSaveByName (Native) (Global)
`Function RequestSaveByName(string asSaveName) native global DebugOnly`

Request that a save with a specific name be made

([TOC](#table-of-contents))

### Function: CreateStarbornGame (Native) (Global)
`Function CreateStarbornGame() native global`

Request that the game resets into NG+ with the current player character

([TOC](#table-of-contents))

### Function: RewardPlayerXP (Native) (Global)
`Function RewardPlayerXP(int auiXPAmount, bool abDirect = false) native global`

Rewards the player with XP, if direct is true, then will ignore various XP adjustments like entry points and intelligence

([TOC](#table-of-contents))

### Function: ServeTime (Native) (Global)
`Function ServeTime() native global`

Has the player serve their prison time

([TOC](#table-of-contents))

### Function: SetCameraTarget (Native) (Global)
`Function SetCameraTarget(Actor arTarget) native global`

Sets the camera target actor

([TOC](#table-of-contents))

### Function: SetCharGenHUDMode (Native) (Global)
`Function SetCharGenHUDMode(int aiCGHUDMode) native global`

Sets or clears CharGen-specific HUD modes.

([TOC](#table-of-contents))

### Function: SetHandscannerDistortionLevel (Native) (Global)
`Function SetHandscannerDistortionLevel(int aLevel) native global`

Sets the distortion level on the handscanner (0-3)

([TOC](#table-of-contents))

### Function: SetInChargen (Native) (Global)
`Function SetInChargen(bool abDisableSaving, bool abDisableWaiting, bool abShowControlsDisabledMessage) native global`

Informs the game whether we are in CharGen or not

([TOC](#table-of-contents))

### Function: SetPlayerAIDriven (Native) (Global)
`Function SetPlayerAIDriven(bool abAIDriven = true) native global`

Enables or disables the AI driven flag on Player

([TOC](#table-of-contents))

### Function: SetPlayerOnElevator (Native) (Global)
`Function SetPlayerOnElevator(bool abOnElevator= true) native global`

Enables or disables the Player on Elevator flag

([TOC](#table-of-contents))

### Function: TrySetPlayerHomeSpaceShip (Native) (Global)
`bool Function TrySetPlayerHomeSpaceShip(ObjectReference akHomeShip) native global`

Attempts to set the player's home ship

([TOC](#table-of-contents))

### Function: GetPlayerHomeSpaceShip (Native) (Global)
`SpaceshipReference Function GetPlayerHomeSpaceShip() native global`

Gets the home ship of the player

([TOC](#table-of-contents))

### Function: GetPlayerOwnedShips (Native) (Global)
`SpaceshipReference[] Function GetPlayerOwnedShips() native global`

Gets spaceships the player owns

([TOC](#table-of-contents))

### Function: SetPlayerRadioFrequency (Native) (Global)
`Function SetPlayerRadioFrequency(float afFrequency) native global`

Sets the player's radio's current frequency

([TOC](#table-of-contents))

### Function: SetPlayerReportCrime (Native) (Global)
`Function SetPlayerReportCrime(bool abReportCrime = true) native global`

Enables or disables  crime reporting on Player

([TOC](#table-of-contents))

### Function: SetSittingRotation (Native) (Global)
`Function SetSittingRotation(float afValue) native global`

Set the players sitting camera rotation - in degrees, offset from the standard angle.

([TOC](#table-of-contents))

### Function: ShakeCamera (Native) (Global)
`Function ShakeCamera(ObjectReference akSource = None, float afStrength = 0.5, float afDuration = 0.0) native global`

Shakes the object from the location of the passed-in object. If none, it will shake the camera from the player's location.

Strength is clamped from 0 to 1

Duration in seconds. By default (0.0) use the game setting.

([TOC](#table-of-contents))

### Function: ShakeController (Native) (Global)
`Function ShakeController(float afSmallMotorStrength, float afBigMotorStreangth, float afDuration) native global`

Shakes the controller for the specified length of time (in seconds). The strength values are clamped from 0 to 1

([TOC](#table-of-contents))

### Function: SetLocalTime (Native) (Global)
`Function SetLocalTime(float afLocalTime) native global`

Rotates the current planet such that the local time will match the specified time

([TOC](#table-of-contents))

### Function: GetLocalTime (Native) (Global)
`float Function GetLocalTime() native global`

Get the local time in normalized 24-hour day scale for this planet

([TOC](#table-of-contents))

### Function: ShowContrabandScanWarning (Native) (Global)
`Function ShowContrabandScanWarning(int aiChanceToEvadeDetection, bool abScanInProgress = false) native global`

Shows the Contraband Scan Warning.

`aiChanceToEvadeDetection`: an integer representing the percent to evade detection.

`abScanInProgress`: a boolean that specifies whether a security scan is in progress.

([TOC](#table-of-contents))

### Function: ShowCustomWatchAlert (Native) (Global)
`Function ShowCustomWatchAlert(string aAnimName) native global`

Shows a custom watch animation on the HUD watch

([TOC](#table-of-contents))

### Function: ShowFatigueWarningOnHUD (Native) (Global)
`Function ShowFatigueWarningOnHUD() native global`

Causes the Fatigue Warning to show on the HUD

([TOC](#table-of-contents))

### Function: ShowMissionBoardMenu (Native) (Global)
`Function ShowMissionBoardMenu(keyword akFilterByKeyword = None, int iFaction = -1) native global`

Opens the mission board menu with an optional keyword parameter to filter the list

([TOC](#table-of-contents))

### Function: ShowRaceMenu (Native) (Global)
`Function ShowRaceMenu( ObjectReference akMenuTarget = None, int uiMode = 0, ObjectReference akMenuSpouseFemale = None, ObjectReference akMenuSpouseMale = None, ObjectReference akVendor = None ) native global`

Displays the race/sex menu

([TOC](#table-of-contents))

### Function: ShowGalaxyStarMapMenu (Native) (Global)
`Function ShowGalaxyStarMapMenu() native global`

Shows the Galaxy Star Map menu.

([TOC](#table-of-contents))

### Function: ShowTitleSequenceMenu (Native) (Global)
`Function ShowTitleSequenceMenu() native global`

([TOC](#table-of-contents))

### Function: HideTitleSequenceMenu (Native) (Global)
`Function HideTitleSequenceMenu() native global`

([TOC](#table-of-contents))

### Function: StartTitleSequence (Native) (Global)
`Function StartTitleSequence(string asSequenceName) native global`

([TOC](#table-of-contents))

### Function: TriggerScreenBlood (Native) (Global)
`Function TriggerScreenBlood(int aiValue) native global`

Trigger screen blood with the given count

([TOC](#table-of-contents))

### Function: PlayEventCamera (Native) (Global)
`Function PlayEventCamera(CameraShot akCamera, ObjectReference akRef) native global`

Play an event camera

([TOC](#table-of-contents))

### Function: StartDialogueCameraOrCenterOnTarget (Native) (Global)
`Function StartDialogueCameraOrCenterOnTarget(ObjectReference akCameraTarget = None) native global`

start dialogue camera if in third person or in dialogue camera or swing the camera to speaker if in 1st

([TOC](#table-of-contents))

### Function: StopDialogueCamera (Native) (Global)
`Function StopDialogueCamera(bool abConsiderResume = false, bool abSwitchingTo1stP = false) native global`

Stop dialogue camera

([TOC](#table-of-contents))

### Function: TurnPlayerRadioOn (Native) (Global)
`Function TurnPlayerRadioOn(bool abRadioOn = true) native global`

Turns on/off the player's radio

([TOC](#table-of-contents))

### Function: UsingGamepad (Native) (Global)
`bool Function UsingGamepad() native global`

Returns true if we're using a gamepad

([TOC](#table-of-contents))

### Function: Warning (Native) (Global)
`Function Warning(string asMessage) native global betaOnly`

Issue a warning to the script log and warning system

## Script: Math
`Scriptname Math Native Hidden`

([TOC](#table-of-contents))

### Function: abs
float Function abs(float afValue) global native

Calculates the absolute value of the passed in value - N for N, and N for (-N)

([TOC](#table-of-contents))

### Function: acos (Native) (Global)
`float Function acos(float afValue) global native`

Calculates the arccosine of the passed in value, returning degrees

([TOC](#table-of-contents))

### Function: asin (Native) (Global)
`float Function asin(float afValue) global native`

Calculates the arcsine of the passed in value, returning degrees

([TOC](#table-of-contents))

### Function: atan (Native) (Global)
`float Function atan(float afValue) global native`

Calculates the arctangent of the passed in value, returning degrees

([TOC](#table-of-contents))

### Function: Ceiling (Native) (Global)
`int Function Ceiling(float afValue) global native`

Calculates the ceiling of the passed in value - the smallest integer greater than or equal to the value

([TOC](#table-of-contents))

### Function: cos (Native) (Global)
`float Function cos(float afValue) global native`

Calculates the cosine of the passed in value (in degrees)

([TOC](#table-of-contents))

### Function: DegreesToRadians (Native) (Global)
`float Function DegreesToRadians(float afDegrees) global native`

Converts degrees to radians

([TOC](#table-of-contents))

### Function: Floor (Native) (Global)
`int Function Floor(float afValue) global native`

Calculates the floor of the passed in value - the largest integer less than or equal to the value

([TOC](#table-of-contents))

### Function: pow (Native) (Global)
`float Function pow(float x, float y) global native`

Calculates x raised to the y power

([TOC](#table-of-contents))

### Function: RadiansToDegrees (Native) (Global)
`float Function RadiansToDegrees(float afRadians) global native`

Converts radians to degrees

([TOC](#table-of-contents))

### Function: sin (Native) (Global)
`float Function sin(float afValue) global native`

Calculates the sine of the passed in value (in degrees)

([TOC](#table-of-contents))

### Function: sqrt (Native) (Global)
`float Function sqrt(float afValue) global native`

Calculate the square root of the passed in value

([TOC](#table-of-contents))

### Function: tan (Native) (Global)
`float Function tan(float afValue) global native`

Calculates the tangent of the passed in value (in degrees)

([TOC](#table-of-contents))

### Function: Max (Global)
`float Function Max(float afValue1, float afValue2) global`

return the max of the two numbers

([TOC](#table-of-contents))

### Function: Min (Global)
`float Function Min(float afValue1, float afValue2) global`

return the min of the two numbers

([TOC](#table-of-contents))

### Function: Clamp (Global)
`float Function Clamp(float ValueToClamp, float afValueMin, float afValueMax) global`

return clamped value

([TOC](#table-of-contents))

### Function: Normalize (Global)
`float Function Normalize(float afValue, float afMin, float afMax) global`

return a normalized value between 0 and 1

([TOC](#table-of-contents))

### Function: Round (Global)
`int Function Round(float afValueToRound) global`

rounds away from zero if decimal part is >= 0.5 otherwise rounds towards zero

([TOC](#table-of-contents))

### Function: ExtractDigit (Global)
`int Function ExtractDigit(int number, int position, int NonExistentDigit = -1) global`

extracts the value of a number at a particular position (0-based, one's place is 0)

examples:

`ExtractDigit(567, 0) == 7`

`ExtractDigit(567, 1) == 6`

`ExtractDigit(567, 2) == 5`

`ExtractDigit(567, 999) == -1`

`ExtractDigit(567, 999, 0) == 0`

([TOC](#table-of-contents))

### Function: HoursAsDays (Global)
`float Function HoursAsDays(float afHours) global`

return a number days for a number of hours - useful for doing math with `GameDaysPassed`, etc.

([TOC](#table-of-contents))

### Function: MinutesAsDays (Global)
`float Function MinutesAsDays(float afMinutes) global`

return a number days for a number of minutes - useful for doing math with `GameDaysPassed`, etc.

([TOC](#table-of-contents))

### Function: SecondsAsDays (Global)
`float Function SecondsAsDays(float afSeconds) global`

return a number of days for a number of seconds - useful for doing math with `GameDaysPassed`, etc.

([TOC](#table-of-contents))

### Function: DaysAsHours (Global)
`float Function DaysAsHours(float afDays) global`

return a number of hours for a number of days - useful for doing math with `GameDaysPassed`, etc.

([TOC](#table-of-contents))

### Function: DaysAsMinutes (Global)
`float Function DaysAsMinutes(float afDays) global`

return a number of Minutes for a number of days - useful for doing math with `GameDaysPassed`, etc.

([TOC](#table-of-contents))

### Function: DaysAsSeconds (Global)
`float Function DaysAsSeconds(float afDays) global`

return a number of Seconds for a number of days - useful for doing math with `GameDaysPassed`, etc.

## Script: ScriptObject
`Scriptname ScriptObject Native Hidden`

([TOC](#table-of-contents))

### Event: OnActorValueChanged
`Event OnActorValueChanged(ObjectReference akObjRef, ActorValue akActorValue)`

Event called when an actor value changed for a specified actor and actor value - must register for this event.

([TOC](#table-of-contents))

### Event: OnActorValueGreaterThan
`Event OnActorValueGreaterThan(ObjectReference akObjRef, ActorValue akActorValue)`

Event called when an actor value changed for a specified actor and actor value to a value greater than the registration compare value

Must register for this event. Must also re-register every time it is called.

([TOC](#table-of-contents))

### Event: OnActorValueLessThan
`Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)`

Event called when an actor value changed for a specified actor and actor value to a value less than the registration compare value

Must register for this event. Must also re-register every time it is called.

([TOC](#table-of-contents))

### Event: OnAffinityEventSent
`Event OnAffinityEventSent(AffinityEvent akAffinityEvent, ObjectReference akTarget)`

Received when an affinity event is run (after registering)

([TOC](#table-of-contents))

### Event: OnAnimationEvent
`Event OnAnimationEvent(ObjectReference akSource, string asEventName)`

Animation event, sent when an object we are listening to hits one of the events we are listening for

([TOC](#table-of-contents))

### Event: OnAnimationEventUnregistered
`Event OnAnimationEventUnregistered(ObjectReference akSource, string asEventName)`

Event sent when you have been unregistered from receiving an animation event because the target object's animation graph has been unloaded

([TOC](#table-of-contents))

### Event: OnBeginState
`Event OnBeginState(string asOldState)`

Event called after the script's state changes - passing in the old state

Not called on auto states when the script is first initialized

([TOC](#table-of-contents))

### Event: OnChallengeCompleted
`Event OnChallengeCompleted(ObjectReference akOwner, Challenge akChallenge)`

Event called when a challenge is completed

([TOC](#table-of-contents))

### Event: OnDistanceLessThan
`Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)`

Distance event - sent when the two objects are less then the registered distance apart.

Obj1 and Obj2 are interchangeable.

check the event ID to make sure it's the event you're expecting

([TOC](#table-of-contents))

### Event: OnDistanceGreaterThan
`Event OnDistanceGreaterThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)`

Distance event - sent when the two objects are greater then the registered distance apart.

Obj1 and Obj2 are interchangeable.

check the event ID to make sure it's the event you're expecting

([TOC](#table-of-contents))

### Event: OnEndState
`Event OnEndState(string asNewState)`

Event called before the script's state changes - passing in the new state

([TOC](#table-of-contents))

### Event: OnGainLOS
`Event OnGainLOS(ObjectReference akViewer, ObjectReference akTarget)`

LOS event, sent whenever the viewer first sees the target (after registering)

([TOC](#table-of-contents))

### Event: OnHit
`Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)`

Event received when the target is hit by a source (weapon, spell, explosion) or projectile attack (after registering)

([TOC](#table-of-contents))

### Event: OnInit
`Event OnInit()`

Event sent as soon as all of the scripts properties have received a value, and before any other event can be received. This should be used to set up any internal variables you have, but keep in mind that the world may not exist or be completely loaded yet.

([TOC](#table-of-contents))

### Event: OnLostLOS
`Event OnLostLOS(ObjectReference akViewer, ObjectReference akTarget)`

Lost LOS event, sent whenever the viewer first loses sight of the target (after registering)

([TOC](#table-of-contents))

### Event: OnMagicEffectApply
`Event OnMagicEffectApply(ObjectReference akTarget, ObjectReference akCaster, MagicEffect akEffect)`

Event received when a magic affect is being applied to the target (after registering)

([TOC](#table-of-contents))

### Event: OnMenuOpenCloseEvent
`Event OnMenuOpenCloseEvent(string asMenuName, bool abOpening)`

Event received when a menu opens/closes

([TOC](#table-of-contents))

### Event: OnPlayerFastTravel
`Event OnPlayerFastTravel()`

Received when the player fast travels(after registering)

([TOC](#table-of-contents))

### Event: OnPlayerSleepStart
`Event OnPlayerSleepStart(float afSleepStartTime, float afDesiredSleepEndTime, ObjectReference akBed)`

Received when the player sleeps. Start and desired end time are in game time days (after registering)

([TOC](#table-of-contents))

### Event: OnPlayerSleepStop
`Event OnPlayerSleepStop(bool abInterrupted, ObjectReference akBed)`

Received when the player stops sleeping - whether naturally or interrupted (after registering)

([TOC](#table-of-contents))

### Event: OnPlayerTeleport
`Event OnPlayerTeleport()`

Received when the player teleports (load door, fast travel, moveto) (after registering)

([TOC](#table-of-contents))

### Event: OnPlayerWaitStart
`Event OnPlayerWaitStart(float afWaitStartTime, float afDesiredWaitEndTime)`

Received when the player waits. Start and desired end time are in game time days (after registering)

([TOC](#table-of-contents))

### Event: OnPlayerWaitStop
`Event OnPlayerWaitStop(bool abInterrupted)`

Received when the player stops waiting - whether naturally or interrupted (after registering)

([TOC](#table-of-contents))

### Event: OnRadiationDamage
`Event OnRadiationDamage(ObjectReference akTarget, bool abIngested)`

Event received when a target takes radiation damage

([TOC](#table-of-contents))

### Event: OnTimer
`Event OnTimer(int aiTimerID)`

Timer event, sent when a timer on this script expires. The ID of the expired timer is passed in as the parameter. This event is sent only once for each timer that expires.

([TOC](#table-of-contents))

### Event: OnTimerGameTime
`Event OnTimerGameTime(int aiTimerID)`

Timer event, sent when a game-time timer on this script expires. The ID of the expired timer is passed in as the parameter. This event is sent only once for each timer that expires.

([TOC](#table-of-contents))

### Event: OnTrackedStatsEvent
`Event OnTrackedStatsEvent(string arStatName, int aiStatValue)`

Event received when a tracked stat is updated for the player

([TOC](#table-of-contents))

### Event: OnStarmapTargetSelectEvent
`Event OnStarmapTargetSelectEvent(Location aSite)`

Event sent from the Starmap to cue dialogue

([TOC](#table-of-contents))

### Event: OnPlanetSiteSelectEvent
`Event OnPlanetSiteSelectEvent(Location aSite)`

Event sent from the PlanetLandingSiteSelectMenu to cue dialogue

([TOC](#table-of-contents))

### Event: OnTutorialEvent
`Event OnTutorialEvent(String asEventName, Message aMessage)`

Occurrence of a tutorial-related event

([TOC](#table-of-contents))

### Event: OnGameplayOptionChanged
`Event OnGameplayOptionChanged(GameplayOption[] aChangedOptions)`

Occurrence of a GameplayOptionChanged event from the settings menu

([TOC](#table-of-contents))

### Function: AddInventoryEventFilter (Native)
`Function AddInventoryEventFilter(Form akFilter) native protected selfonly`

Add an inventory event filter to this effect. Item added/removed events matching the specified form (or in the specified form list) will now be let through. A "None" filter will let everything through.

Objects without filters CANNOT receive inventory add/remove events!

([TOC](#table-of-contents))

### Function: CallFunction (Native)
`Var Function CallFunction(string asFuncName, Var[] aParams) native`

Calls a member function on this script specified by name. Note that the compiler cannot check that the function exists, nor that the parameters are the right type. It will also not be able to auto-cast, so you must pre-cast the parameters to the right type (derived or parent types won't work). Will error if the function is not valid or doesn't exist on the object

([TOC](#table-of-contents))

### Function: CallFunctionNoWait (Native)
`Function CallFunctionNoWait(string asFuncName, Var[] aParams) native`

Calls a member function on this script without waiting for it to return. Note that the compiler cannot check that the function exists, nor that the parameters are the right type. It will also not be able to auto-cast, so you must pre-cast the parameters to the right type (derived or parent types won't work). Will error if the function is not valid or doesn't exist on the object

([TOC](#table-of-contents))

### Function: CancelTimer (Native)
`Function CancelTimer(int aiTimerID = 0) native protected selfonly`

Cancels a pending timer on this script with the specified ID

([TOC](#table-of-contents))

### Function: CancelTimerGameTime (Native)
`Function CancelTimerGameTime(int aiTimerID = 0) native protected selfonly`

Cancels a pending game-time timer on this script with the specified ID

([TOC](#table-of-contents))

### Function: GetPropertyValue (Native)
`Var Function GetPropertyValue(string asPropertyName) native`

Gets the value of a property on this script specified by name. Note that the compiler cannot check that the property exists. Will error if the property doesn't exist on the object, or is write-only

([TOC](#table-of-contents))

### Function: GetState
`string Function GetState() protected selfonly`

Obtains the script's current state

([TOC](#table-of-contents))

### Function: GotoState
`Function GotoState(string asNewState) protected selfonly`

Sets the script's current state, calling the appropriate end/begin state events

([TOC](#table-of-contents))

### Function: CastAs (Native)
`ScriptObject Function CastAs(string asScriptName) native`

Attempts to cast this object as the specified script. The compiler won't type check this cast, and the cast may fail. But this will allow you to point at the specific script you want without adding a dependency on said script (for when it is part of a mod or DLC that the user may not have installed). If the type doesn't exist or the cast fails it will return None

([TOC](#table-of-contents))

### Function: PauseTimer (Native)
`Function PauseTimer(int aiTimerID, bool abPause = true) native protected selfonly`

Pause or resume the given timer with `aiTimerID`

it will attempt to pause if `abPause` is true or resume if false

If the timer is already in the requested state nothing happens.

([TOC](#table-of-contents))

### Function: PauseTimerGameTime (Native)
`Function PauseTimerGameTime(int aiTimerID, bool abPause = true) native protected selfonly`

Pause or resume the given game-time timer with aiTimerID

It will attempt to pause if abPause is true or resume if false

If the timer is already in the requested state nothing happens.

([TOC](#table-of-contents))

### Function: IsBoundGameObjectAvailable (Native)
`bool Function IsBoundGameObjectAvailable() native`

Returns true if this object is attached to an in-game object and that object is available to be operated on. If this returns false then any form, alias, or active magic effect native functions will most likely fail.

([TOC](#table-of-contents))

### Function: RegisterForActorValueChangedEvent (Native)
`Function RegisterForActorValueChangedEvent(ObjectReference akObjRef, ActorValue akActorValue) native protected selfonly`

Registers to receive an event when an actor value changed for a specified actor and actor value

([TOC](#table-of-contents))

### Function: RegisterForActorValueGreaterThanEvent (Native)
`Function RegisterForActorValueGreaterThanEvent(ObjectReference akObjRef, ActorValue akActorValue, float afCompareValue) native protected selfonly`

Registers to receive an event when an actor value is changed for a specified actor and actor value to a value that is greater than the given value

This must be re-registered for every time it is received if the script wants to keep receiving the event

([TOC](#table-of-contents))

### Function: RegisterForActorValueLessThanEvent (Native)
`Function RegisterForActorValueLessThanEvent(ObjectReference akObjRef, ActorValue akActorValue, float afCompareValue) native protected selfonly`

Registers to receive an event when an actor value is changed for a specified actor and actor value to a value that is less than the given value

This must be re-registered for every time it is received if the script wants to keep receiving the event

([TOC](#table-of-contents))

### Function: RegisterForAffinityEvent (Native)
`Function RegisterForAffinityEvent(AffinityEvent akAffinityEvent) native protected selfonly`

Register for the specified affinity event is fired

([TOC](#table-of-contents))

### Function: RegisterForAnimationEvent (Native)
`bool Function RegisterForAnimationEvent(ObjectReference akSender, string asEventName) native protected selfonly`

Register for the specified animation event from the specified object - returns true if it successfully registered

([TOC](#table-of-contents))

### Function: RegisterForChallengeEvents (Native)
`Function RegisterForChallengeEvents() native protected selfonly`

Register for challenge events

([TOC](#table-of-contents))

### Function: RegisterForCustomEvent (Native)
`Function RegisterForCustomEvent(ScriptObject akSender, CustomEventName asEventName) native protected selfonly`

Register for a custom event to be sent from the specified sender. The event will be sent to:

`Event <type>.<event>(<type> akSender, Var[] akParams)`

For example, `MySpecialEvent` on `MyQuest` would be:

`Event MyQuest.MySpecialEvent(MyQuest akSender, Var[] akParams)`

([TOC](#table-of-contents))

### Function: RegisterForDetectionLOSGain (Native)
`Function RegisterForDetectionLOSGain(Actor akViewer, ObjectReference akTarget) native protected selfonly`

Register for only the first detection-based LOS gain event between the viewer and the target

If the viewer is already looking at the target, an event will be received almost immediately

If the viewer is not the player, the target must be another actor

([TOC](#table-of-contents))

### Function: RegisterForDetectionLOSLost (Native)
`Function RegisterForDetectionLOSLost(Actor akViewer, ObjectReference akTarget) native protected selfonly`

Register for only the first detection-based LOS lost event between the viewer and the target

If the viewer is already not looking at the target, an event will be received almost immediately

If the viewer is not the player, the target must be another actor

([TOC](#table-of-contents))

### Function: RegisterForDirectLOSGain (Native)
`Function RegisterForDirectLOSGain(ObjectReference akViewer, ObjectReference akTarget, string asViewerNode = "", string asTargetNode = "") native protected selfonly`

Register for only the first direct LOS gain event between the viewer and the target

If the viewer is already looking at the target, an event will be received almost immediately

([TOC](#table-of-contents))

### Function: RegisterForDirectLOSLost (Native)
`Function RegisterForDirectLOSLost(ObjectReference akViewer, ObjectReference akTarget, string asViewerNode = "", string asTargetNode = "") native protected selfonly`

Register for only the first direct LOS lost event between the viewer and the target

If the viewer is already not looking at the target, an event will be received almost immediately

([TOC](#table-of-contents))

### Function: RegisterForDistanceLessThanEvent (Native)
`Function RegisterForDistanceLessThanEvent(ScriptObject akObj1, ScriptObject akObj2, float afDistance, int aiEventID = 0) native protected selfonly`

Register for OnDistanceLessThan when the two objects are less than then afDistance apart. The two objects are interchangeable, and if you register for the two swapped it will simply update the distance. The objects may be reference or reference aliases. use a unique aiEventID to specify multiple events per object. Using the same id for multiple register commands will simply update the distance on the existing event

([TOC](#table-of-contents))

### Function: RegisterForDistanceGreaterThanEvent (Native)
`Function RegisterForDistanceGreaterThanEvent(ScriptObject akObj1, ScriptObject akObj2, float afDistance, int aiEventID = 0) native protected selfonly`

Register for OnDistanceGreaterThan when the two objects are greater than then afDistance apart. The two objects are interchangeable, and if you register for the two swapped it will simply update the distance. The objects may be reference or reference aliases. use a unique aiEventID to specify multiple events per object. Using the same id for multiple register commands will simply update the distance  on the existing event

([TOC](#table-of-contents))

### Function: RegisterForHitEvent (Native)
`Function RegisterForHitEvent(ScriptObject akTarget, ScriptObject akAggressorFilter = None, Form akSourceFilter = None, Form akProjectileFilter = None, int aiPowerFilter = -1, int aiSneakFilter = -1, int aiBashFilter = -1, int aiBlockFilter = -1, bool abMatch = true) native protected selfonly`

Registers for a single hit event. Filters may be exact forms, base objects of references, keywords, factions, reference aliases, ref collection aliases, or form lists containing any or all of them. This also filters any remote hit events that come in.

The power/sneak/bash/block filters are -1 for no filter, 0 (or false) for false only, and 1 (or true) for true only.

Targets can be references, ref aliases, or ref collection aliases

If abMatch is false, then it matches anything that DOESN'T match the filter (NOTs the whole thing).

Objects without registrations CANNOT receive hit events!

([TOC](#table-of-contents))

### Function: RegisterForHitEventAggressorRefArray
`Function RegisterForHitEventAggressorRefArray(ScriptObject akTarget, ObjectReference[] akAggressorFilterRefArray, Form akSourceFilter = None, Form akProjectileFilter = None, int aiPowerFilter = -1, int aiSneakFilter = -1, int aiBashFilter = -1, int aiBlockFilter = -1, bool abMatch = true) protected selfonly`

takes an array for aggressors and calls `RegisterForHitEvent` for each one as `akAggressorFilter`

([TOC](#table-of-contents))

### Function: RegisterForHitEventAggressorFactionArray
`Function RegisterForHitEventAggressorRefAliasArray(ScriptObject akTarget, ReferenceAlias[] akAggressorFilterRefAliasArray, Form akSourceFilter = None, Form akProjectileFilter = None, int aiPowerFilter = -1, int aiSneakFilter = -1, int aiBashFilter = -1, int aiBlockFilter = -1, bool abMatch = true) protected selfonly`

takes an array for aggressors and calls `RegisterForHitEvent` for each one as `akAggressorFilter`

([TOC](#table-of-contents))

### Function: RegisterForMagicEffectApplyEvent (Native)
`Function RegisterForMagicEffectApplyEvent(ScriptObject akTarget, ScriptObject akCasterFilter = None, Form akEffectFilter = None, bool abMatch = true) native protected selfonly`

Registers for a single magic effect apply event. Filters may be exact forms, base objects of references, keywords, factions, reference aliases, ref collection aliases, or form lists containing any or all of them. This also filters any remote magic effect apply events that come in.

Targets can be references, ref aliases, or ref collection aliases

If abMatch is false, then it matches anything that DOESN'T match the filter (NOTs the whole thing).

Objects without registrations CANNOT receive magic effect apply events!

([TOC](#table-of-contents))

### Function: RegisterForMenuOpenCloseEvent (Native)
`Function RegisterForMenuOpenCloseEvent(string asMenuName) native protected selfonly`

Registers this alias to receive events when menus are opened / closed

([TOC](#table-of-contents))

### Function: RegisterForPlayerSleep (Native)
`Function RegisterForPlayerSleep() native protected selfonly`

Registers this form to receive events when the player sleeps and wakes up

([TOC](#table-of-contents))

### Function: RegisterForPlayerTeleport (Native)
`Function RegisterForPlayerTeleport() native protected selfonly`

Registers this form to receive events when the player teleports (load door, fast travel, moveto)

([TOC](#table-of-contents))

### Function: RegisterForPlayerWait (Native)
`Function RegisterForPlayerWait() native protected selfonly`

Registers this form to receive events when the player waits

([TOC](#table-of-contents))

### Function: RegisterForRadiationDamageEvent (Native)
`Function RegisterForRadiationDamageEvent(ScriptObject akTarget) native protected selfonly`

Registers for a single radiation damage event from the specified target.

Targets can be actors, ref aliases, or ref collection aliases

Objects without registrations CANNOT receive radiation damage events!

([TOC](#table-of-contents))

### Function: RegisterForRemoteEvent (Native)
`bool Function RegisterForRemoteEvent(ScriptObject akEventSource, ScriptEventName asEventName) native protected selfonly`

Register for the specified event from the specified source. Event must be one sent by the game itself, and not an event defined in ScriptObject. The event will be sent to:

`Event <type>.<event>(<type> akSender, <event args>)`

For example, OnDeath on an Actor would be:

`Event Actor.OnDeath(Actor akSender, Actor akKiller)`

But OnDeath on a reference alias would be:

`Event ReferenceAlias.OnDeath(ReferenceAlias akSender, Actor akKiller)`

Returns true if the registration succeeded

([TOC](#table-of-contents))

### Function: RegisterForTrackedStatsEvent (Native)
`Function RegisterForTrackedStatsEvent(string asStat, int aiThreshold) native protected selfonly`

Registers this script to receive a single-shot stat event when the stat meets or passes the threshold

If the stat already meets or passes the threshold the event will be sent immediately

([TOC](#table-of-contents))

### Function: RegisterForStarmapTargetSelectEvent (Native)
`Function RegisterForStarmapTargetSelectEvent() native protected selfonly`

Registers to receive events from Starmap menu

([TOC](#table-of-contents))

### Function: RegisterForPlanetSiteSelectEvent (Native)
`Function RegisterForPlanetSiteSelectEvent() native protected selfonly`

Registers to receive events from PlanetLandingSiteSelectMenu

([TOC](#table-of-contents))

### Function: RegisterForTutorialEvent (Native)
`Function RegisterForTutorialEvent(String asEventName) native protected selfonly`

Registers to receive tutorial-related events

([TOC](#table-of-contents))

### Function: RegisterForGameplayOptionChangedEvent (Native)
`Function RegisterForGameplayOptionChangedEvent() native protected selfonly`

Registers to receive GameplayOptionChanged events from the settings menu

([TOC](#table-of-contents))

### Function: RemoveAllInventoryEventFilters (Native)
`Function RemoveAllInventoryEventFilters() native protected selfonly`

Remove all inventory event filters from this effect - it will no longer receive any inventory add/remove events

([TOC](#table-of-contents))

### Function: RemoveInventoryEventFilter (Native)
`Function RemoveInventoryEventFilter(Form akFilter) native protected selfonly`

Remove an inventory event filter from this object. Item added/removed events matching the specified form (or in the specified form list) will no longer be let through.

Objects without filters CANNOT receive inventory add/remove events!

([TOC](#table-of-contents))

### Function: SendCustomEvent (Native)
`Function SendCustomEvent(CustomEventName asEvent, Var[] akArgs = None) native protected selfonly`

Sends out a custom event from this object. The custom event must be defined using "`CustomEvent <name of event>`" somewhere in the script that sends it or its parents

([TOC](#table-of-contents))

### Function: SetPropertyValue (Native)
`Function SetPropertyValue(string asPropertyName, Var aValue) native`

Sets a property value on this script specified by name. Note that the compiler cannot check that the property exists, nor that the value is the right type. It will also not be able to auto-cast, so you must pre-cast the value to the right type (derived or parent types won't work). Will error if the property is not valid, doesn't exist on the object, is read-only or an auto-property specified as const.

([TOC](#table-of-contents))

### Function: SetPropertyValueNoWait (Native)
`Function SetPropertyValueNoWait(string asPropertyName, Var aValue) native`

Sets a property value on this script without waiting for it to return. Note that the compiler cannot check that the property exists, nor that the value is the right type. It will also not be able to auto-cast, so you must pre-cast the value to the right type (derived or parent types won't work). Will error if the property is not valid, doesn't exist on the object, is read-only or an auto-property specified as const.

([TOC](#table-of-contents))

### Function: StartTimer (Native)
`Function StartTimer(float afInterval, int aiTimerID = 0) native protected selfonly`

Start a timer on this script with the specified ID. Interval is in seconds and the timer event will fire only once.

([TOC](#table-of-contents))

### Function: StartTimerGameTime (Native)
`Function StartTimerGameTime(float afInterval, int aiTimerID = 0) native protected selfonly`

Start a game-time timer on this script with the specified ID. Interval is in hours and the timer event will fire only once.

([TOC](#table-of-contents))

### Function: UnregisterForActorValueChangedEvent (Native)
`Function UnregisterForActorValueChangedEvent(ObjectReference akObjRef, ActorValue akActorValue) native protected selfonly`

Unregister for the actor value changed event for the specified actor and actor value.

([TOC](#table-of-contents))

### Function: UnregisterForActorValueGreaterThanEvent (Native)
`Function UnregisterForActorValueGreaterThanEvent(ObjectReference akObjRef, ActorValue akActorValue, float afCompareValue) native protected selfonly`

Unregister for the actor value greater than event for the specified actor, actor value and comparison value.

([TOC](#table-of-contents))

### Function: UnregisterForActorValueLessThanEvent (Native)
`Function UnregisterForActorValueLessThanEvent(ObjectReference akObjRef, ActorValue akActorValue, float afCompareValue) native protected selfonly`

Unregister for the actor value greater than event for the specified actor, actor value and comparison value.

([TOC](#table-of-contents))

### Function: UnregisterForAffinityEvent (Native)
`Function UnregisterForAffinityEvent(AffinityEvent akAffinityEvent) native protected selfonly`

Unregister for an affinity event

([TOC](#table-of-contents))

### Function: UnregisterForAllActorValueEvents (Native)
`Function UnregisterForAllActorValueEvents() native protected selfonly`

Unregister for all actor value events

([TOC](#table-of-contents))

### Function: UnregisterForAllAffinityEvents (Native)
`Function UnregisterForAllAffinityEvents() native protected selfonly`

Unregister for all affinity events

([TOC](#table-of-contents))

### Function: UnregisterForAllEvents (Native)
`Function UnregisterForAllEvents() native protected selfonly`

Remove all event registrations - useful if you're trying to delete something and event registrations are keeping it around

([TOC](#table-of-contents))

### Function: UnregisterForAllCustomEvents (Native)
`Function UnregisterForAllCustomEvents() native protected selfonly`

Remove all custom event registrations

([TOC](#table-of-contents))

### Function: UnregisterForAllHitEvents (Native)
`Function UnregisterForAllHitEvents(ScriptObject akTarget = None) native protected selfonly`

Remove all hit event registrations - if target is `None` - ALL event registrations for this script are removed

([TOC](#table-of-contents))

### Function: UnregisterForAllMagicEffectApplyEvents (Native)
`Function UnregisterForAllMagicEffectApplyEvents(ScriptObject akTarget = None) native protected selfonly`

Remove all magic effect apply registrations - if target is `None` - ALL event registrations for this script are removed

([TOC](#table-of-contents))

### Function: UnregisterForAllMenuOpenCloseEvents (Native)
`Function UnregisterForAllMenuOpenCloseEvents() native protected selfonly`

Remove all menu open/close event registrations

([TOC](#table-of-contents))

### Function: UnregisterForAllRadiationDamageEvents (Native)
`Function UnregisterForAllRadiationDamageEvents() native protected selfonly`

Remove all radiation damage event registrations

([TOC](#table-of-contents))

### Function: UnregisterForAllRemoteEvents (Native)
`Function UnregisterForAllRemoteEvents() native protected selfonly`

Remove all remote event registrations

([TOC](#table-of-contents))

### Function: UnregisterForAllTrackedStatsEvents (Native)
`Function UnregisterForAllTrackedStatsEvents() native protected selfonly`

Remove all tracked stat event registrations

([TOC](#table-of-contents))

### Function: UnregisterForAnimationEvent (Native)
`Function UnregisterForAnimationEvent(ObjectReference akSender, string asEventName) native protected selfonly`

Unregister for the specified animation event from the specified object

([TOC](#table-of-contents))

### Function: UnregisterForChallengeEvents (Native)
`Function UnregisterForChallengeEvents() native protected selfonly`

Unregisters this form to receive events when challenges are completed

([TOC](#table-of-contents))

### Function: UnregisterForCustomEvent (Native)
`Function UnregisterForCustomEvent(ScriptObject akSender, CustomEventName asEventName) native protected selfonly`

Unregister for the specified custom event from the specified object

([TOC](#table-of-contents))

### Function: UnregisterForDistanceEvents (Native)
`Function UnregisterForDistanceEvents(ScriptObject akObj1, ScriptObject akObj2, int aiEventID = -1) native protected selfonly`

Unregister for any distance events between the two objects (which are interchangeable)

specify event id to unregister for a specific event, -1 to unregister for all events matching the two objects

([TOC](#table-of-contents))

### Function: UnregisterForHitEvent (Native)
`Function UnregisterForHitEvent(ScriptObject akTarget, ScriptObject akAggressorFilter = None, Form akSourceFilter = None, Form akProjectileFilter = None, int aiPowerFilter = -1, int aiSneakFilter = -1, int aiBashFilter = -1, int aiBlockFilter = -1, bool abMatch = true) native protected selfonly`

Unregister for the specified hit event.

([TOC](#table-of-contents))

### Function: UnregisterForLOS (Native)
`Function UnregisterForLOS(ObjectReference akViewer, ObjectReference akTarget) native protected selfonly`

Unregister for any LOS events between the viewer and target

([TOC](#table-of-contents))

### Function: UnregisterForMagicEffectApplyEvent (Native)
`Function UnregisterForMagicEffectApplyEvent(ScriptObject akTarget, ScriptObject akCasterFilter = None, Form akEffectFilter = None, bool abMatch = true) native protected selfonly`

Unregister for the specified magic effect apply event.

([TOC](#table-of-contents))

### Function: UnregisterForMenuOpenCloseEvent (Native)
`Function UnregisterForMenuOpenCloseEvent(string asMenuName) native protected selfonly`

Unregister for the specified menu open/close event

([TOC](#table-of-contents))

### Function: UnregisterForPlayerSleep (Native)
`Function UnregisterForPlayerSleep() native protected selfonly`

Unregisters this form to receive events when the player sleeps and wakes up

([TOC](#table-of-contents))

### Function: UnregisterForPlayerTeleport (Native)
`Function UnregisterForPlayerTeleport() native protected selfonly`

Unregisters this form to receive events when the player teleports

([TOC](#table-of-contents))

### Function: UnregisterForPlayerWait (Native)
`Function UnregisterForPlayerWait() native protected selfonly`

Unregisters this form to receive events when the player waits

([TOC](#table-of-contents))

### Function: UnregisterForRadiationDamageEvent (Native)
`Function UnregisterForRadiationDamageEvent(ScriptObject akTarget) native protected selfonly`

Unregister for the specified radiation damage event

([TOC](#table-of-contents))

### Function: UnregisterForRemoteEvent (Native)
`Function UnregisterForRemoteEvent(ScriptObject akEventSource, ScriptEventName asEventName) native protected selfonly`

Unregister this script for the specified event from the specified sender

([TOC](#table-of-contents))

### Function: UnregisterForTrackedStatsEvent (Native)
`Function UnregisterForTrackedStatsEvent(string asStat) native protected selfonly`

Unregisters this script from receiving an event for the specified stat

([TOC](#table-of-contents))

### Function: UnregisterForTrackedStatsEventThreshold (Native)
`Function UnregisterForTrackedStatsEventThreshold(string asStat, int aiThreshold) native protected selfonly`

Unregisters this script from receiving an event for the specified stat at the specified threshold

([TOC](#table-of-contents))

### Function: UnregisterForStarmapTargetSelectEvent (Native)
`Function UnregisterForStarmapTargetSelectEvent() native protected selfonly`

Unregisters from receiving events from Starmap menu

([TOC](#table-of-contents))

### Function: UnregisterForPlanetSiteSelectEvent (Native)
`Function UnregisterForPlanetSiteSelectEvent() native protected selfonly`

Unregisters from receiving events from PlanetLandingSiteSelectMenu

([TOC](#table-of-contents))

### Function: UnregisterForTutorialEvent (Native)
`Function UnregisterForTutorialEvent( String asEventName ) native protected selfonly`

Unregisters from receiving tutorial-related events

([TOC](#table-of-contents))

### Function: UnregisterForGameplayOptionChangedEvent (Native)
`Function UnregisterForGameplayOptionChangedEvent() native protected selfonly`

Unregisters from receiving GameplayOptionChanged events from the settings menu

([TOC](#table-of-contents))

### Script: ActiveMagicEffect
`Scriptname ActiveMagicEffect extends ScriptObject Native Hidden`

([TOC](#table-of-contents))

#### Event: OnEffectStart
`Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)`

Event received when this effect is first started (OnInit may not have been run yet!)

([TOC](#table-of-contents))

#### Event: OnEffectFinish
`Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)`

Event received when this effect is finished (effect may already be deleted, calling functions on this effect will fail)

([TOC](#table-of-contents))

#### Event: OnActivate
`Event OnActivate(ObjectReference akActionRef)`

Event received when this reference is activated

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnBuilderMenuSelect
`Event OnBuilderMenuSelect(ActorValue akActorValue)`

Event received when the produced resource on an Workshop producer/builder has changed.

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnCellAttach
`Event OnCellAttach()`

Event received when this object's parent cell is attached

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnCellDetach
`Event OnCellDetach()`

Event received when this object's parent cell is detached

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnCellLoad
`Event OnCellLoad()`

Event received when every object in this object's parent cell is loaded (TODO: Find restrictions)

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnClose
`Event OnClose(ObjectReference akActionRef)`

Event received when this object is closed

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnContainerChanged
`Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)`

Event received when this object enters, exits, or changes containers

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnCrewAssigned
`Event OnCrewAssigned(Actor akCrew, ObjectReference akAssignmentRef, ObjectReference akPreviousAssignmentRef)`

Event received when a reference has a crew member assigned.

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnCrewDismissed
`Event OnCrewDismissed(Actor akCrew, ObjectReference akPreviousAssignmentRef)`

Event received when a reference has a crew member dismissed.

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnDestroyed
`Event OnDestroyed(ObjectReference akDestroyer)`

Event received when this reference is destroyed

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnDestructionStageChanged
`Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)`

Event received when this reference's destruction stage has changed

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnEnterFurniture
`Event OnEnterFurniture(Actor akActionRef)`

Event received when this furniture is entered.

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnEquipped
`Event OnEquipped(Actor akActor)`

Event received when this object is equipped by an actor

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnExitFurniture
`Event OnExitFurniture(ObjectReference akActionRef)`

Event received when this furniture is exited.

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnGrab
`Event OnGrab()`

Event received when this object is grabbed by the player

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnItemAdded
`Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)`

Event received when an item is added to this object's inventory. If the item is a persistent reference, `akItemReference` will point at it - otherwise the parameter will be `None`. For valid Transfer Reasons please refer to the wiki.

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnItemRemoved
`Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, int aiTransferReason)`

Event received when an item is removed from this object's inventory. If the item is a persistent reference, `akItemReference` will point at it - otherwise the parameter will be `None`. For valid Transfer Reasons please refer to the wiki.

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnLoad
`Event OnLoad()`

Event received when this object is completely loaded - will be fired every time this object is loaded

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnLockStateChanged
`Event OnLockStateChanged()`

Event received when the lock on this object changes

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnMapMarkerDiscovered
`Event OnMapMarkerDiscovered()`

Received when this map marker is discovered

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnObjectRepaired
`Event OnObjectRepaired(ObjectReference akReference)`

Event received when an item has been repaired

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnObjectDestroyed
`Event OnObjectDestroyed(ObjectReference akReference)`

Event received when an item has been destroyed

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnOpen
`Event OnOpen(ObjectReference akActionRef)`

Event received when this object is opened

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnOutpostItemPowerOff
`Event OnOutpostItemPowerOff(ObjectReference akPoweredItem)`

Event received when an Outpost item loses power

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnOutpostItemPowerOn
`Event OnOutpostItemPowerOn(ObjectReference akPoweredItem, ObjectReference akPowerGenerator)`

Event received when an Outpost item receives power

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnPipboyRadioDetection
`Event OnPipboyRadioDetection( bool abDetected )`

Event that occurs when the Pipboy enters/leaves the outer-radius of this radio ref

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnPlayerDialogueTarget
`Event OnPlayerDialogueTarget()`

Event received when ref goes into dialogue with player

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnPowerOn
`Event OnPowerOn(ObjectReference akPowerGenerator)`

Event received when a workshop item receives power

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnPowerOff
`Event OnPowerOff()`

Event received when a workshop loses all power

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnQuickContainerOpened
`Event OnQuickContainerOpened()`

Received if the quick container opens

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnRead
`Event OnRead()`

Event received when this object, if a book, is read

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnRelease
`Event OnRelease()`

Event received when this object is released by the player

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnReset
`Event OnReset()`

Event received when this reference is reset

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnScanned
`Event OnScanned()`

Received when this object is scanned

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnSell
`Event OnSell(Actor akSeller)`

Event received when this reference is sold by an actor

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnTerminalMenuItemRun
`Event OnTerminalMenuItemRun(int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)`

Received if terminal object has menu item clicked

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnWorkshopCargoLinkChanged
`Event OnWorkshopCargoLinkChanged(ObjectReference akOldTarget, ObjectReference akNewTarget)`

Event that is triggered when the target for a cargo link on workshop item changes.

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnSpellCast
`Event OnSpellCast(Form akSpell)`

Event received when a spell is cast by this object

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnTranslationAlmostComplete
`Event OnTranslationAlmostComplete()`

Event received when translation is almost complete (from a call to TranslateTo, "almost" is determined by a gamesetting, default is 90% of the way)

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnTranslationComplete
`Event OnTranslationComplete()`

Event received when translation is complete (from a call to TranslateTo)

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnTranslationFailed
`Event OnTranslationFailed()`

Event received when translation is aborted (from a call to StopTranslateTo)

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnTrapHitStart
`Event OnTrapHitStart(ObjectReference akTarget, float afXVel, float afYVel, float afZVel, float afXPos, float afYPos, float afZPos, int aeMaterial, bool abInitialHit, int aeMotionType)`

Event received when this starts hitting a target

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnTrapHitStop
`Event OnTrapHitStop(ObjectReference akTarget)`

Event received when this stops hitting a target

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnTriggerEnter
`Event OnTriggerEnter(ObjectReference akActionRef)`

Event received when this trigger volume is entered

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnTriggerLeave
`Event OnTriggerLeave(ObjectReference akActionRef)`

Event received when this trigger volume is left

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnUnequipped
`Event OnUnequipped(Actor akActor)`

Event received when this object is unequipped by an actor

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnUnload
`Event OnUnload()`

Event received when this object is being unloaded - will be fired every time this object is unloaded

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnWorkshopFlyCam
`Event OnWorkshopFlyCam(bool aStart)`

Event received when the player enters or leaves Workshop FlyCam

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnWorkshopMode
`Event OnWorkshopMode(bool aStart)`

Event received when the player enters or leaves Workshop Mode

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnWorkshopObjectGrabbed
`Event OnWorkshopObjectGrabbed(ObjectReference akReference)`

Event received when the player grabs an existing object reference for edit while in Workshop mode.

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnWorkshopObjectMoved
`Event OnWorkshopObjectMoved(ObjectReference akReference)`

Event received when an existing workshop item is moved in the world

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnWorkshopObjectPlaced
`Event OnWorkshopObjectPlaced(ObjectReference akReference)`

Event received when a workshop item is placed in the world

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnWorkshopObjectRemoved
`Event OnWorkshopObjectRemoved(ObjectReference akReference)`

Event received when a workshop item is removed ( from world and added back to workshop )

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnWorkshopOutputLink
`Event OnWorkshopOutputLink(ObjectReference akSource, ObjectReference akTarget)`

Event received when a new Output Link is created at a Workshop.

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnWorkshopNPCTransfer
`Event OnWorkshopNPCTransfer(Location akNewWorkshop, Keyword akActionKW)`

Event that occurs when a workshop NPC is directed to move to another settlement

Received from the actor this effect is attached to

Event from object reference

([TOC](#table-of-contents))

#### Event: OnActorActivatedRef
`Event OnActorActivatedRef(ObjectReference akActivatedRef)`

Event received when this actor activates a ref

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnAffinityEvent
`Event OnAffinityEvent(AffinityEvent akAffinityEvent, ActorValue akActorValue, GlobalVariable akReactionValue, ObjectReference akTarget)`

Event received when affinity event is run

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnCombatListAdded
`Event OnCombatListAdded(Actor akTarget)`

Event that is triggered when this actor adds another actor to its combat list.

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnCombatListRemoved
`Event OnCombatListRemoved(Actor akTarget)`

Event that is triggered when this actor removes another actor from its combat list.

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnCombatStateChanged
`Event OnCombatStateChanged(ObjectReference akTarget, int aeCombatState)`

Event that is triggered when this actor's combat state against the target changes

State is as follows:

0 - not in combat

1 - in combat

2 - searching

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnCommandModeCompleteCommand
`Event OnCommandModeCompleteCommand(int aeCommandType, ObjectReference akTarget)`

Event received when the actor completes a command in command mode.

Type is as follows:

0 - None

1 - Call

2 - Follow

3 - Move

4 - Attack

5 - Inspect

6 - Retrieve

7 - Stay

8 - Release

9 - Heal

10 - Assign

11 - Ride

12 - Enter

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnCommandModeEnter
`Event OnCommandModeEnter()`

Event received when the player begins commanding this actor.

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnCommandModeExit
`Event OnCommandModeExit()`

Event received when the player ends commanding this actor.

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnCommandModeGiveCommand
`Event OnCommandModeGiveCommand(int aeCommandType, ObjectReference akTarget)`

Event received when the player gives actor a command in command mode.

Type is as follows:

0 - None

1 - Call

2 - Follow

3 - Move

4 - Attack

5 - Inspect

6 - Retrieve

7 - Stay

8 - Release

9 - Heal

10 - Assign

11 - Ride

12 - Enter

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnCompanionDismiss
`Event OnCompanionDismiss()`

Received when player dismisses teammate companion

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnConsciousnessStateChanged
`Event OnConsciousnessStateChanged(bool abUnconscious)`

Event that is triggered when this actor's consciousness state changes

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnCripple
`Event OnCripple(ActorValue akActorValue, bool abCrippled)`

Received immediately after a limb has become crippled or uncrippled.

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnDeferredKill
`Event OnDeferredKill(Actor akKiller)`

Event that is triggered when this actor gets a deferred kill added (they were in deferred kill mode and got "killed")

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnDeath
`Event OnDeath(ObjectReference akKiller)`

Event that is triggered when this actor finishes dying

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnDifficultyChanged
`Event OnDifficultyChanged(int aOldDifficulty, int aNewDifficulty)`

Event received when the player changes their difficulty

Type is as follows:

0 - Very Easy

1 - Easy

2 - Normal

3 - Hard

4 - Very Hard

5 - Survival

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnDying
`Event OnDying(ObjectReference akKiller)`

Event that is triggered when this actor begins dying

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnEnterBleedout
`Event OnEnterBleedout()`

Event received when an actor enters bleedout.

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnEnterOutpostBeaconMode
`Event OnEnterOutpostBeaconMode()`

Event received when the player enters Outpost Beacon placement mode.

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnEnterShipInterior
`Event OnEnterShipInterior(ObjectReference akShip)`

Event received when an actor enters a ship interior cell

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnEnterSneaking
`Event OnEnterSneaking()`

Event received when an actor enters sneaking.

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnEscortWaitStart
`Event OnEscortWaitStart()`

Event received when this actor is in an Escort procedure and begins waiting for the escorted actor to catch up.

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnEscortWaitStop
`Event OnEscortWaitStop()`

Event received when this actor is in an Escort procedure and stops waiting because the escorted actor has caught up.

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnExitShipInterior
`Event OnExitShipInterior(ObjectReference akShip)`

Event received when an actor exits a ship interior cell

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPlayerFollowerWarp
`Event OnPlayerFollowerWarp(ObjectReference akFollower)`

Event received when a player follower is warped

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnGetUp
`Event OnGetUp(ObjectReference akFurniture)`

Event that is triggered when this actor leaves the furniture

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnHomeShipSet
`Event OnHomeShipSet(SpaceshipReference akShip, SpaceshipReference akPrevious)`

Event that is triggered when the actors home ship is set.

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPlayerFailedPlotRoute
`Event OnPlayerFailedPlotRoute(int aeFailedPlotReason)`

Event received when the player plots a failed starmap route

Type is as follows:

0 - Success

1 - Insufficient Fuel

2 - Out of Range

3 - Unexplored System

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPlayerModifiedShip
`Event OnPlayerModifiedShip(SpaceshipReference akShip)`

Event that is triggered when an actor modifies a ship

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnItemEquipped
`Event OnItemEquipped(Form akBaseObject, ObjectReference akReference)`

Event received when this actor equips something - akReference may be None if object is not persistent

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnItemUnequipped
`Event OnItemUnequipped(Form akBaseObject, ObjectReference akReference)`

Event received when this actor unequips something - akReference may be None if object is not persistent

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnKill
`Event OnKill(ObjectReference akVictim)`

Event that is triggered when this actor kills another

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnLocationChange
`Event OnLocationChange(Location akOldLoc, Location akNewLoc)`

Event that is triggered when this actor changes from one location to another

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPackageChange
`Event OnPackageChange(Package akOldPackage)`

Event received when this actor's package changes

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPackageEnd
`Event OnPackageEnd(Package akOldPackage)`

Event received when this actor's package ends

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPackageStart
`Event OnPackageStart(Package akNewPackage)`

Event received when this actor starts a new package

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPartialCripple
`Event OnPartialCripple(ActorValue akActorValue, bool abCrippled)`

Received immediately after the limb of a robot (or other actor whose race allows sub-segment damage) has become (or ceased to be) partially crippled.

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPickLock
`Event OnPickLock(ObjectReference akLockedRef, bool abCrime, bool abSucceeded, TerminalMenu akLockedTerminalMenu, int aiTerminalMenuItem)`

Event received when an actor picks a lock

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPickpocketFailed
`Event OnPickpocketFailed()`

Received when the player fails to pickpocket this actor

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPlayerCompleteResearch
`Event OnPlayerCompleteResearch(ObjectReference akBench, Location akLocation, ResearchProject akProject)`

Received when player completes research

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPlayerCraftItem
`Event OnPlayerCraftItem(ObjectReference akBench, Location akLocation, Form akCreatedItem)`

Received when player crafts an item

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPlayerCreateRobot
`Event OnPlayerCreateRobot(Actor akNewRobot)`

Received when player creates a new robot

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPlayerEnterVertibird
`Event OnPlayerEnterVertibird(ObjectReference akVertibird)`

Received when player enters vertibird

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPlayerFallLongDistance
`Event OnPlayerFallLongDistance(float afDamage)`

Received when player takes fall damage

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPlayerFireWeapon
`Event OnPlayerFireWeapon(Form akBaseObject)`

Received when player fires a weapon out of combat and based on timer

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPlayerHealTeammate
`Event OnPlayerHealTeammate(Actor akTeammate)`

Received when player heals his teammate

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPlayerItemAdded
`Event OnPlayerItemAdded(Form akBaseObject, ObjectReference akOwner, ObjectReference akSourceContainer, int aeAcquireType)`

Received when the player gains an item in their inventory

aeAcquireType is one of the following:

0: None

1: Steal

2: Buy

3: Pickpocket

4: Pickup

5: Container

6: Dead body

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPlayerLoadGame
`Event OnPlayerLoadGame()`

Received immediately after the player has loaded a save game. A good time to check for additional content.

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPlayerLoiteringBegin
`Event OnPlayerLoiteringBegin()`

Received when player starts loitering

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPlayerLoiteringEnd
`Event OnPlayerLoiteringEnd()`

Received when player stops loitering

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPlayerModArmorWeapon
`Event OnPlayerModArmorWeapon(Form akBaseObject, ObjectMod akModBaseObject)`

Received when player mods a weapon or armor in the menu.

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPlayerModRobot
`Event OnPlayerModRobot(Actor akRobot, ObjectMod akModBaseObject)`

Received when the player mods a robot

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPlayerSwimming
`Event OnPlayerSwimming()`

Received when player starts swimming

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPlayerUseWorkBench
`Event OnPlayerUseWorkBench(ObjectReference akWorkBench)`

Received when player uses a workbench

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnRaceSwitchComplete
`Event OnRaceSwitchComplete()`

Event received when this actor finishes changing its race

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnRecoverFromBleedout
`Event OnRecoverFromBleedout()`

Event received when an actor exits bleedout.

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnSit
`Event OnSit(ObjectReference akFurniture)`

Event that is triggered when this actor sits in the furniture

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnSpeechChallengeAvailable
`Event OnSpeechChallengeAvailable(ObjectReference akSpeaker)`

Received when player gets a speech challenge in dialogue

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPlayerPlanetSurveyComplete
`Event OnPlayerPlanetSurveyComplete(Planet akPlanet)`

Received when player completely surveyed a planet

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPlayerScannedObject
`Event OnPlayerScannedObject(ObjectReference akScannedRef)`

Received by the player when they scan an object

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnOutpostPlaced
`Event OnOutpostPlaced(ObjectReference akOutpostBeacon)`

Received when player placed an outpost beacon

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPlayerArrested
`Event OnPlayerArrested(ObjectReference akGuard, Location akLocation, int aeCrimeType )`

Event that is triggered when the player is arrested.

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPlayerAssaultActor
`Event OnPlayerAssaultActor(ObjectReference akVictim, Location akLocation, bool aeCrime )`

Event that is triggered when the player assaults someone.

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPlayerCrimeGold
`Event OnPlayerCrimeGold(ObjectReference akVictim, Form akFaction, int aeCrimeGold, int aeCrimeType )`

Event that is triggered when the player gets crimegold .

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPlayerJail
`Event OnPlayerJail(ObjectReference akGuard, Form akFaction,  Location akLocation,int aeCrimeGold)`

Event that is triggered when the player goes to jail.

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPlayerPayFine
`Event OnPlayerPayFine(ObjectReference akGuard, Form akFaction, int aeCrimeGold)`

Event that is triggered when the player pays fine.

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPlayerMurderActor
`Event OnPlayerMurderActor(ObjectReference akVictim, Location akLocation, bool aeCrime )`

Event that is triggered when the player murders someone.

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPlayerTrespass
`Event OnPlayerTrespass(ObjectReference akVictim, Location akLocation,bool aeCrime)`

Event that is triggered when the player trespassing.

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPlayerBuyShip
`Event OnPlayerBuyShip(SpaceshipReference akShip)`

Event that is triggered when the player buys a ship

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnPlayerSellShip
`Event OnPlayerSellShip(SpaceshipReference akShip)`

Event that is triggered when the player sells a ship

Received from the actor this effect is attached to

Event from actor

([TOC](#table-of-contents))

#### Event: OnShipBought
`Event OnShipBought()`

Event this is triggered when a ship is bought

Received from the actor this effect is attached to

Event from ship

([TOC](#table-of-contents))

#### Event: OnShipDock
`Event OnShipDock(bool abComplete, SpaceshipReference akDocking, SpaceshipReference akParent)`

Event received when a ship initiates and completes docking with a parent

Received from the actor this effect is attached to

Event from ship

([TOC](#table-of-contents))

#### Event: OnShipFarTravel
`Event OnShipFarTravel(Location aDepartureLocation, Location aArrivalLocation, int aState)`

Event received when a ship begins or ends far travel - State { Departure = 0, Arrival = 1 }

Received from the actor this effect is attached to

Event from ship

([TOC](#table-of-contents))

#### Event: OnShipGravJump
`Event OnShipGravJump(Location aDestination, int aState)`

Event received when a ship grav jump event occurs - State { Initiated = 0, AnimStarted = 1, Completed = 2, Failed = 3 }

Received from the actor this effect is attached to

Event from ship

([TOC](#table-of-contents))

#### Event: OnShipLanding
`Event OnShipLanding(bool abComplete)`

Event received when a ship initiates or completes landing

Received from the actor this effect is attached to

Event from ship

([TOC](#table-of-contents))

#### Event: OnShipRampDown
`Event OnShipRampDown()`

Event received when a ship's landing ramp has lowered all the way and connected to the surrounding navmesh

Received from the actor this effect is attached to

Event from ship

([TOC](#table-of-contents))

#### Event: OnShipRefueled
`Event OnShipRefueled(int aFuelAdded)`

Event that is triggered when fuel has been added to this spaceship

Received from the actor this effect is attached to

Event from ship

([TOC](#table-of-contents))

#### Event: OnShipScan
`Event OnShipScan(Location aPlanet, ObjectReference[] aMarkersArray)`

Event that is triggered when the player scans a planet with this spaceship

Received from the actor this effect is attached to

Event from ship

([TOC](#table-of-contents))

#### Event: OnShipSold
`Event OnShipSold()`

Event this is triggered when a ship is sold

Received from the actor this effect is attached to

Event from ship

([TOC](#table-of-contents))

#### Event: OnShipSystemDamaged
`Event OnShipSystemDamaged(ActorValue akSystem, int aBlocksLost, bool aElectromagneticDamage, bool aFullyDamaged)`

Event that is triggered when one of this spaceship's systems loses a power block due to damage

Received from the actor this effect is attached to

Event from ship

([TOC](#table-of-contents))

#### Event: OnShipSystemPowerChange
`Event OnShipSystemPowerChange(ActorValue akSystem, bool abAddPower, bool abDamageRelated)`

Event received when a ship system adds or removes power

Received from the actor this effect is attached to

Event from ship

([TOC](#table-of-contents))

#### Event: OnShipSystemRepaired
`Event OnShipSystemRepaired(ActorValue akSystem, int aBlocksGained, bool aElectromagneticDamage)`

Event that is triggered when one of this spaceship's systems gains a power block due to being repaired

Received from the actor this effect is attached to

Event from ship

([TOC](#table-of-contents))

#### Event: OnShipTakeOff
`Event OnShipTakeOff(bool abComplete)`

Event received when a ship initiates or completes takeoff

Received from the actor this effect is attached to

Event from ship

([TOC](#table-of-contents))

#### Event: OnShipUndock
`Event OnShipUndock(bool abComplete, SpaceshipReference akUndocking, SpaceshipReference akParent)`

Event received when a ship initiates or completes undocking with a parent

Received from the actor this effect is attached to

Event from ship

([TOC](#table-of-contents))

#### Function: Dispel (Native)
`Function Dispel() native`

Dispel this effect

([TOC](#table-of-contents))

#### Function: GetBaseObject (Native)
`MagicEffect Function GetBaseObject() native`

Get the base MagicEffect this active effect is using

([TOC](#table-of-contents))

#### Function: GetCasterActor (Native)
`Actor Function GetCasterActor() native`

Get the actor that cast this spell

([TOC](#table-of-contents))

#### Function: GetDuration (Native)
`float Function GetDuration() native`

Get the duration of this effect

([TOC](#table-of-contents))

#### Function: GetElapsedTime (Native)
`float Function GetElapsedTime() native`

Get the elapsed time of this effect

([TOC](#table-of-contents))

#### Function: GetMagicItem (Native)
`Form Function GetMagicItem() native`

Gets the magic item associated with this effect. May be a Potion, Enchantment, Ingredient, or Spell

([TOC](#table-of-contents))

#### Function: GetMagnitude (Native)
`float Function GetMagnitude() native`

Get the magnitude of this effect

([TOC](#table-of-contents))

#### Function: GetResistanceValue (Native)
`ActorValue Function GetResistanceValue() native`

Get the Resistance ActorValue of this effect

([TOC](#table-of-contents))

#### Function: GetTargetActor (Native)
`Actor Function GetTargetActor() native`

Get the actor this spell is targeting (is attached to)

([TOC](#table-of-contents))

#### Function: StartObjectProfiling (Native)
`Function StartObjectProfiling() native debugOnly`

Turns on profiling for this specific object and all scripts attached to it - setting doesn't persist across saves

Will do nothing on release console builds, and if the Papyrus:bEnableProfiling ini setting is off

([TOC](#table-of-contents))

#### Function: StopObjectProfiling (Native)
`Function StopObjectProfiling() native debugOnly`

Turns off profiling for this specific object and all scripts attached to it - setting doesn't persist across saves

Will do nothing on release console builds, and if the Papyrus:bEnableProfiling ini setting is off

([TOC](#table-of-contents))

### Script: Alias
`Scriptname Alias extends ScriptObject Native Hidden`

([TOC](#table-of-contents))

#### Event: OnAliasInit
`Event OnAliasInit()`

Event received when this alias is initialized and filled - before quest startup stage is run (other aliases on the same quest will also be filled)

([TOC](#table-of-contents))

#### Event: OnAliasReset
`Event OnAliasReset()`

Event received when the quest owning this alias is reset

([TOC](#table-of-contents))

#### Event: OnAliasShutdown
`Event OnAliasShutdown()`

Event received when the alias has been shut down (because the quest has been shut down)

Note that the alias will be empty by the time this event is received

([TOC](#table-of-contents))

#### Event: OnAliasStarted
`Event OnAliasStarted()`

Event received when this alias has been started - after quest startup is run

([TOC](#table-of-contents))

#### Function: GetOwningQuest (Native)
`Quest Function GetOwningQuest() native`

Returns the quest that owns this alias

([TOC](#table-of-contents))

#### Function: RefillAlias (Native)
`Function RefillAlias() native`

Refills this alias. Function won't return until alias has been re-filled.

([TOC](#table-of-contents))

#### Function: RefillDependentAliases (Native)
`Function RefillDependentAliases() native`

Refills the dependent aliases of this alias

([TOC](#table-of-contents))

#### Function: StartObjectProfiling (Native)
`Function StartObjectProfiling() native debugOnly`

Turns on profiling for this specific object and all scripts attached to it - setting doesn't persist across saves

Will do nothing on release console builds, and if the Papyrus:bEnableProfiling ini setting is off

([TOC](#table-of-contents))

#### Function: StopObjectProfiling (Native)
`Function StopObjectProfiling() native debugOnly`

Turns off profiling for this specific object and all scripts attached to it - setting doesn't persist across saves

Will do nothing on release console builds, and if the `Papyrus:bEnableProfiling` ini setting is off

([TOC](#table-of-contents))

#### Function: IsFilled
`bool Function IsFilled()`

checks to see if there is anything in this alias

([TOC](#table-of-contents))

#### Function: IsSameType
`bool Function IsSameType(Alias AliasToCheck)`

checks to see if the passed in alias is the same type (ReferenceAlias, RefCollectionAlias, or LocationAlias)

([TOC](#table-of-contents))

#### Function: CopyIntoAlias
`bool Function CopyIntoAlias(Alias TargetAlias, bool SkipIfEmpty = true, bool CopyOver = true)`

Copies contents of this alias over the contents of the `TargetAlias`, if it's the same type (both are ReferenceAlias, both are RefCollectionAliases, both are LocationAliases)

`skipIfEmpty`: if true (default), it will NOT copy if this alias is empty.

`CopyOver`: if true (default), it will copy over contents in `TargetAlias`. If false, it will only copy if `TargetAlias` is empty.

returns `true` if it copied; returns `false` if it did not copy

([TOC](#table-of-contents))

#### Script: LocationAlias
`Scriptname LocationAlias extends Alias Native Hidden`

([TOC](#table-of-contents))

##### Function: Clear (Native)
`Function Clear() native`

Clears the alias - fails on non-optional aliases

([TOC](#table-of-contents))

##### Function: GetLocation (Native)
`Location Function GetLocation() native`

Get the object reference this alias refers to

([TOC](#table-of-contents))

##### Function: ForceLocationTo (Native)
`Function ForceLocationTo(Location akNewLocation) native`

Forces this alias to the specified location

([TOC](#table-of-contents))

##### Function: ClearAndRefillAlias
`Function ClearAndRefillAlias()`

first clears, then refills alias (so alias will be empty if nothing is found by `RefillAlias` call)

([TOC](#table-of-contents))

#### Script: RefCollectionAlias
`Scriptname RefCollectionAlias extends Alias Native Hidden`

([TOC](#table-of-contents))

##### Event: OnAliasChanged
`Event OnAliasChanged(ObjectReference akObject, bool abRemove)`

Event received when an object has been added/removed to this refcollectionalias.

([TOC](#table-of-contents))

##### Event: OnActivate
`Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when this reference is activated

([TOC](#table-of-contents))

##### Event: OnBuilderMenuSelect
`Event OnBuilderMenuSelect(ObjectReference akSenderRef, ActorValue akActorValue)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when the produced resource on an Workshop producer/builder has changed.

([TOC](#table-of-contents))

##### Event: OnCellAttach
`Event OnCellAttach(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when this object's parent cell is attached

([TOC](#table-of-contents))

##### Event: OnCellDetach
`Event OnCellDetach(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when this object's parent cell is detached

([TOC](#table-of-contents))

##### Event: OnCellLoad
`Event OnCellLoad(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event received when every object in this object's parent cell is loaded (TODO: Find restrictions)

([TOC](#table-of-contents))

##### Event: OnClose
`Event OnClose(ObjectReference akSenderRef, ObjectReference akActionRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when this object is closed

([TOC](#table-of-contents))

##### Event: OnContainerChanged
`Event OnContainerChanged(ObjectReference akSenderRef, ObjectReference akNewContainer, ObjectReference akOldContainer)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when this object enters, exits, or changes containers

([TOC](#table-of-contents))

##### Event: OnCrewAssigned
`Event OnCrewAssigned(ObjectReference akSenderRef, Actor akCrew, ObjectReference akAssignmentRef, ObjectReference akPreviousAssignmentRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when a reference has a crew member assigned.

([TOC](#table-of-contents))

##### Event: OnCrewDismissed
`Event OnCrewDismissed(ObjectReference akSenderRef, Actor akCrew, ObjectReference akPreviousAssignmentRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when a reference has a crew member dismissed.

([TOC](#table-of-contents))

##### Event: OnDestroyed
`Event OnDestroyed(ObjectReference akSenderRef, ObjectReference akDestroyer)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when this reference is destroyed

([TOC](#table-of-contents))

##### Event: OnDestructionStageChanged
`Event OnDestructionStageChanged(ObjectReference akSenderRef, int aiOldStage, int aiCurrentStage)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when this reference's destruction stage has changed

([TOC](#table-of-contents))

##### Event: OnEnterFurniture
`Event OnEnterFurniture(ObjectReference akSenderRef, Actor akActionRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when this furniture is entered.

([TOC](#table-of-contents))

##### Event: OnEquipped
`Event OnEquipped(ObjectReference akSenderRef, Actor akActor)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when this object is equipped by an actor

([TOC](#table-of-contents))

##### Event: OnExitFurniture
`Event OnExitFurniture(ObjectReference akSenderRef, ObjectReference akActionRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when this furniture is exited.

([TOC](#table-of-contents))

##### Event: OnGrab
`Event OnGrab(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when this object is grabbed by the player

([TOC](#table-of-contents))

##### Event: OnItemAdded
`Event OnItemAdded(ObjectReference akSenderRef, Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when an item is added to this object's inventory. If the item is a persistent reference, akItemReference will point at it - otherwise the parameter will be None. For valid Transfer Reasons please refer to the wiki.

([TOC](#table-of-contents))

##### Event: OnItemRemoved
`Event OnItemRemoved(ObjectReference akSenderRef, Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, int aiTransferReason)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when an item is removed from this object's inventory. If the item is a persistent reference, akItemReference will point at it - otherwise the parameter will be None. For valid Transfer Reasons please refer to the wiki.

([TOC](#table-of-contents))

##### Event: OnLoad
`Event OnLoad(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when this object is completely loaded - will be fired every time this object is loaded

([TOC](#table-of-contents))

##### Event: OnLockStateChanged
`Event OnLockStateChanged(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when the lock on this object changes

([TOC](#table-of-contents))

##### Event: OnMapMarkerDiscovered
`Event OnMapMarkerDiscovered(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Received when this map marker is discovered

([TOC](#table-of-contents))

##### Event: OnObjectRepaired
`Event OnObjectRepaired(ObjectReference akSenderRef, ObjectReference akReference)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when an item has been repaired

([TOC](#table-of-contents))

##### Event: OnObjectDestroyed
`Event OnObjectDestroyed(ObjectReference akSenderRef, ObjectReference akReference)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event received when an item has been destroyed

([TOC](#table-of-contents))

##### Event: OnOpen
`Event OnOpen(ObjectReference akSenderRef, ObjectReference akActionRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when this object is opened

([TOC](#table-of-contents))

##### Event: OnOutpostItemPowerOff
`Event OnOutpostItemPowerOff(ObjectReference akSenderRef, ObjectReference akPoweredItem)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when an Outpost item loses power

([TOC](#table-of-contents))

##### Event: OnOutpostItemPowerOn
`Event OnOutpostItemPowerOn(ObjectReference akSenderRef, ObjectReference akPoweredItem, ObjectReference akPowerGenerator)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when an Outpost item receives power

([TOC](#table-of-contents))

##### Event: OnPipboyRadioDetection
`Event OnPipboyRadioDetection(ObjectReference akSenderRef, bool abDetected)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event that occurs when the Pipboy enters/leaves the outer-radius of this radio ref

([TOC](#table-of-contents))

##### Event: OnPowerOn
`Event OnPowerOn(ObjectReference akSenderRef, ObjectReference akPowerGenerator)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when a workshop item receives power

([TOC](#table-of-contents))

##### Event: OnPowerOff
`Event OnPowerOff(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when a workshop loses all power

([TOC](#table-of-contents))

##### Event: OnQuickContainerOpened
`Event OnQuickContainerOpened(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Received if the quick container opens

([TOC](#table-of-contents))

##### Event: OnRead
`Event OnRead(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when this object, if a book, is read

([TOC](#table-of-contents))

##### Event: OnRelease
`Event OnRelease(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when this object is released by the player

([TOC](#table-of-contents))

##### Event: OnReset
`Event OnReset(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when this reference is reset

([TOC](#table-of-contents))

##### Event: OnScanned
`Event OnScanned(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Received when this object is scanned

([TOC](#table-of-contents))

##### Event: OnSell
`Event OnSell(ObjectReference akSenderRef, Actor akSeller)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when this reference is sold by an actor

([TOC](#table-of-contents))

##### Event: OnShipDock
`Event OnShipDock(ObjectReference akSenderRef, bool abComplete, SpaceshipReference akDocking, SpaceshipReference akParent)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when a ship initiates and completes docking with a parent

([TOC](#table-of-contents))

##### Event: OnShipFarTravel
`Event OnShipFarTravel(ObjectReference akSenderRef, Location aDepartureLocation, Location aArrivalLocation, int aState)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when a ship begins or ends far travel - State { Departure = 0, Arrival = 1 }

([TOC](#table-of-contents))

##### Event: OnShipGravJump
`Event OnShipGravJump(ObjectReference akSenderRef, Location aDestination, int aState)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when a ship grav jump event occurs - State { Initiated = 0, AnimStarted = 1, Completed = 2, Failed = 3 }

([TOC](#table-of-contents))

##### Event: OnShipLanding
`Event OnShipLanding(ObjectReference akSenderRef, bool abComplete)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when a ship initiates or completes landing

([TOC](#table-of-contents))

##### Event: OnShipSystemPowerChange
`Event OnShipSystemPowerChange(ObjectReference akSenderRef, ActorValue akSystem, bool abAddPower, bool abDamageRelated)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when a ship system adds or removes power

([TOC](#table-of-contents))

##### Event: OnShipTakeOff
`Event OnShipTakeOff(ObjectReference akSenderRef, bool abComplete)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when a ship initiates or completes takeoff

([TOC](#table-of-contents))

##### Event: OnShipUndock
`Event OnShipUndock(ObjectReference akSenderRef, bool abComplete, SpaceshipReference akUndocking, SpaceshipReference akParent)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when a ship initiates or completes undocking with a parent

([TOC](#table-of-contents))

##### Event: OnSpellCast
`Event OnSpellCast(ObjectReference akSenderRef, Form akSpell)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when a spell is cast by this object

([TOC](#table-of-contents))

##### Event: OnTerminalMenuItemRun
`Event OnTerminalMenuItemRun(ObjectReference akSenderRef, int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Received if terminal object has menu item clicked

([TOC](#table-of-contents))

##### Event: OnTranslationAlmostComplete
`Event OnTranslationAlmostComplete(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when translation is almost complete (from a call to TranslateTo, "almost" is determined by a gamesetting, default is 90% of the way)

([TOC](#table-of-contents))

##### Event: OnTranslationComplete
`Event OnTranslationComplete(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when translation is complete (from a call to TranslateTo)

([TOC](#table-of-contents))

##### Event: OnTranslationFailed
`Event OnTranslationFailed(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when translation is aborted (from a call to StopTranslateTo)

([TOC](#table-of-contents))

##### Event: OnTrapHitStart
`Event OnTrapHitStart(ObjectReference akSenderRef, ObjectReference akTarget, float afXVel, float afYVel, float afZVel, float afXPos, float afYPos, float afZPos, int aeMaterial, bool abInitialHit, int aeMotionType)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when this starts hitting a target

([TOC](#table-of-contents))

##### Event: OnTrapHitStop
`Event OnTrapHitStop(ObjectReference akSenderRef, ObjectReference akTarget)`

Event from object reference

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event received when this stops hitting a target

([TOC](#table-of-contents))

##### Event: OnTriggerEnter
`Event OnTriggerEnter(ObjectReference akSenderRef, ObjectReference akActionRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when this trigger volume is entered

([TOC](#table-of-contents))

##### Event: OnTriggerLeave
`Event OnTriggerLeave(ObjectReference akSenderRef, ObjectReference akActionRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when this trigger volume is left

([TOC](#table-of-contents))

##### Event: OnUnequipped
`Event OnUnequipped(ObjectReference akSenderRef, Actor akActor)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when this object is unequipped by an actor

([TOC](#table-of-contents))

##### Event: OnUnload
`Event OnUnload(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when this object is being unloaded - will be fired every time this object is unloaded

([TOC](#table-of-contents))

##### Event: OnWorkshopCargoLinkChanged
`Event OnWorkshopCargoLinkChanged(ObjectReference akSenderRef, ObjectReference akOldTarget, ObjectReference akNewTarget)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event that is triggered when the target for a cargo link on workshop item changes.

([TOC](#table-of-contents))

##### Event: OnWorkshopFlyCam
`Event OnWorkshopFlyCam(ObjectReference akSenderRef, bool aStart)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when the player enters or leaves Workshop FlyCam

([TOC](#table-of-contents))

##### Event: OnWorkshopMode
`Event OnWorkshopMode(ObjectReference akSenderRef, bool aStart)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when the player enters or leaves Workshop Mode

([TOC](#table-of-contents))

##### Event: OnWorkshopObjectGrabbed
`Event OnWorkshopObjectGrabbed(ObjectReference akSenderRef, ObjectReference akReference)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when the player grabs an existing object reference for edit while in Workshop mode.

([TOC](#table-of-contents))

##### Event: OnWorkshopObjectMoved
`Event OnWorkshopObjectMoved(ObjectReference akSenderRef, ObjectReference akReference)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when an existing workshop item is moved in the world

([TOC](#table-of-contents))

##### Event: OnWorkshopObjectPlaced
`Event OnWorkshopObjectPlaced(ObjectReference akSenderRef, ObjectReference akReference)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when a workshop item is placed in the world

([TOC](#table-of-contents))

##### Event: OnWorkshopObjectRemoved
`Event OnWorkshopObjectRemoved(ObjectReference akSenderRef, ObjectReference akReference)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when a workshop item is removed ( from world and added back to workshop )

([TOC](#table-of-contents))

##### Event: OnWorkshopOutputLink
`Event OnWorkshopOutputLink(ObjectReference akSenderRef, ObjectReference akSource, ObjectReference akTarget)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event received when a new Output Link is created at a Workshop.

([TOC](#table-of-contents))

##### Event: OnWorkshopNPCTransfer
`Event OnWorkshopNPCTransfer(ObjectReference akSenderRef, Location akNewWorkshop, Keyword akActionKW)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from object reference

Event that occurs when a workshop NPC is directed to move to another settlement

([TOC](#table-of-contents))

##### Event: OnActorActivatedRef
`Event OnActorActivatedRef(ObjectReference akSenderRef, ObjectReference akActivatedRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event received when this actor activates a ref

([TOC](#table-of-contents))

##### Event: OnAffinityEvent
`Event OnAffinityEvent(ObjectReference akSenderRef, AffinityEvent akAffinityEvent, ActorValue akActorValue, GlobalVariable akReactionValue, ObjectReference akTarget)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event received when affinity event is run

([TOC](#table-of-contents))

##### Event: OnCombatListAdded
`Event OnCombatListAdded(ObjectReference akSenderRef, Actor akTarget)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event that is triggered when this actor adds another actor to its combat list.

([TOC](#table-of-contents))

##### Event: OnCombatListRemoved
`Event OnCombatListRemoved(ObjectReference akSenderRef, Actor akTarget)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event that is triggered when this actor removes another actor from its combat list.

([TOC](#table-of-contents))

##### Event: OnCombatStateChanged
`Event OnCombatStateChanged(ObjectReference akSenderRef, ObjectReference akTarget, int aeCombatState)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event that is triggered when this reference's combat state against the target changes

State is as follows:
- 0 - not in combat
- 1 - in combat
- 2 - searching

([TOC](#table-of-contents))

##### Event: OnCommandModeCompleteCommand
`Event OnCommandModeCompleteCommand(ObjectReference akSenderRef,  int aeCommand, ObjectReference akTarget)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event received when the object completes a command in command mode.

Type is as follows:

0 - None

1 - Call

2 - Follow

3 - Move

4 - Attack

5 - Inspect

6 - Retrieve

7 - Stay

8 - Release

9 - Heal

10 - Assign

11 - Ride

12 - Enter

([TOC](#table-of-contents))

##### Event: OnCommandModeEnter
`Event OnCommandModeEnter(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event received when the player begins commanding this object

([TOC](#table-of-contents))

##### Event: OnCommandModeExit
`Event OnCommandModeExit(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event received when the player ends commanding this object

([TOC](#table-of-contents))

##### Event: OnCommandModeGiveCommand
`Event OnCommandModeGiveCommand(ObjectReference akSenderRef, int aeCommand, ObjectReference akTarget)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event received when the player gives object a command in command mode.

Type is as follows:

0 - None

1 - Call

2 - Follow

3 - Move

4 - Attack

5 - Inspect

6 - Retrieve

7 - Stay

8 - Release

9 - Heal

10 - Assign

11 - Ride

12 - Enter

([TOC](#table-of-contents))

##### Event: OnCompanionDismiss
`Event OnCompanionDismiss(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Received when player dismisses teammate companion

([TOC](#table-of-contents))

##### Event: OnConsciousnessStateChanged
`Event OnConsciousnessStateChanged(ObjectReference akSenderRef, bool abUnconscious)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event that is triggered when this actor's consciousness state changes

([TOC](#table-of-contents))

##### Event: OnCripple
`Event OnCripple(ObjectReference akSenderRef, ActorValue akActorValue, bool abCrippled)`

received immediately after a limb has become crippled or uncrippled.

([TOC](#table-of-contents))

##### Event: OnDeferredKill
`Event OnDeferredKill(ObjectReference akSenderRef, Actor akKiller)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event that is triggered when this actor gets a deferred kill added

(they were in deferred kill mode and got "killed")

([TOC](#table-of-contents))

##### Event: OnDeath
`Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event that is triggered when this actor finishes dying (only if this alias points at an actor)

([TOC](#table-of-contents))

##### Event: OnDifficultyChanged
`Event OnDifficultyChanged(ObjectReference akSenderRef, int aOldDifficulty, int aNewDifficulty)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event received when the player changes their difficulty

Type is as follows:

0 - Very Easy

1 - Easy

2 - Normal

3 - Hard

4 - Very Hard

5 - Survival

([TOC](#table-of-contents))

##### Event: OnDying
`Event OnDying(ObjectReference akSenderRef, ObjectReference akKiller)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event that is triggered when this actor begins dying (only if this alias points at an actor)

([TOC](#table-of-contents))

##### Event: OnEnterBleedout
`Event OnEnterBleedout(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event received when an actor enters bleedout. (only if this alias points at an actor)

([TOC](#table-of-contents))

##### Event: OnEnterOutpostBeaconMode
`Event OnEnterOutpostBeaconMode(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event received when the player enters Outpost Beacon placement mode.

([TOC](#table-of-contents))

##### Event: OnEnterShipInterior
`Event OnEnterShipInterior(ObjectReference akSenderRef, ObjectReference akShip)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event received when an actor enters a ship interior cell

([TOC](#table-of-contents))

##### Event: OnEnterSneaking
`Event OnEnterSneaking(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event received when an actor enters sneaking.

([TOC](#table-of-contents))

##### Event: OnEscortWaitStart
`Event OnEscortWaitStart(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event received when this actor is in an Escort procedure and begins waiting for the escorted actor to catch up.

([TOC](#table-of-contents))

##### Event: OnEscortWaitStop
`Event OnEscortWaitStop(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event received when this actor is in an Escort procedure and stops waiting because the escorted actor has caught up.

([TOC](#table-of-contents))

##### Event: OnExitShipInterior
`Event OnExitShipInterior(ObjectReference akSenderRef, ObjectReference akShip)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event received when an actor exits a ship interior cell

([TOC](#table-of-contents))

##### Event: OnPlayerFollowerWarp
`Event OnPlayerFollowerWarp(ObjectReference akSenderRef, ObjectReference akFollower)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event received when a player follower is warped

([TOC](#table-of-contents))

##### Event: OnGetUp
`Event OnGetUp(ObjectReference akSenderRef, ObjectReference akFurniture)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event that is triggered when this actor leaves the furniture

([TOC](#table-of-contents))

##### Event: OnHomeShipSet
`Event OnHomeShipSet(ObjectReference akSenderRef, SpaceshipReference akShip, SpaceshipReference akPrevious)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event that is triggered when the actors home ship is set.

([TOC](#table-of-contents))

##### Event: OnOutpostPlaced
`Event OnOutpostPlaced(ObjectReference akSenderRef, ObjectReference akOutpostBeacon)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Received when player placed an outpost beacon

([TOC](#table-of-contents))

##### Event: OnPlayerFailedPlotRoute
`Event OnPlayerFailedPlotRoute(ObjectReference akSenderRef, int aeFailedPlotReason)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event received when the player plots a failed starmap route

Type is as follows:

0 - Success

1 - Insufficient Fuel

2 - Out of Range

3 - Unexplored System

([TOC](#table-of-contents))

##### Event: OnPlayerModifiedShip
`Event OnPlayerModifiedShip(ObjectReference akSenderRef, SpaceshipReference akShip)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event that is triggered when an actor modifies a ship

([TOC](#table-of-contents))

##### Event: OnItemEquipped
`Event OnItemEquipped(ObjectReference akSenderRef, Form akBaseObject, ObjectReference akReference)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event received when this actor equips something - akReference may be None if object is not persistent (only if this alias points at an actor)

([TOC](#table-of-contents))

##### Event: OnItemUnequipped
`Event OnItemUnequipped(ObjectReference akSenderRef, Form akBaseObject, ObjectReference akReference)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event received when this actor unequips something - akReference may be None if object is not persistent (only if this alias points at an actor)

([TOC](#table-of-contents))

##### Event: OnKill
`Event OnKill(ObjectReference akSenderRef, ObjectReference akVictim)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event that is triggered when this actor kills another

([TOC](#table-of-contents))

##### Event: OnLocationChange
`Event OnLocationChange(ObjectReference akSenderRef, Location akOldLoc, Location akNewLoc)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event that is triggered when this actor changes from one location to another (only if this alias points at an actor)

([TOC](#table-of-contents))

##### Event: OnPackageChange
`Event OnPackageChange(ObjectReference akSenderRef, Package akOldPackage)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event received when this actor's package changes (only if this alias points at an actor)

([TOC](#table-of-contents))

##### Event: OnPackageEnd
`Event OnPackageEnd(ObjectReference akSenderRef, Package akOldPackage)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event received when this actor's package ends (only if this alias points at an actor)

([TOC](#table-of-contents))

##### Event: OnPackageStart
`Event OnPackageStart(ObjectReference akSenderRef, Package akNewPackage)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event received when this actor starts a new package (only if this alias points at an actor)

([TOC](#table-of-contents))

##### Event: OnPartialCripple
`Event OnPartialCripple(ObjectReference akSenderRef, ActorValue akActorValue, bool abCrippled)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

received immediately after the limb of a robot (or other actor whose race allows sub-segment damage) has become (or ceased to be) partially crippled.

([TOC](#table-of-contents))

##### Event: OnPickLock
`Event OnPickLock(ObjectReference akSenderRef, ObjectReference akLockedRef, bool abCrime, bool abSucceeded, TerminalMenu akLockedTerminalMenu, int aiTerminalMenuItem)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event received when an actor picks a lock

([TOC](#table-of-contents))

##### Event: OnPickpocketFailed
`Event OnPickpocketFailed(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Received when the player fails to pickpocket this actor

([TOC](#table-of-contents))

##### Event: OnPlayerCompleteResearch
`Event OnPlayerCompleteResearch(ObjectReference akSenderRef, ObjectReference akBench, Location akLocation, ResearchProject akProject)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Received when player completes research

([TOC](#table-of-contents))

##### Event: OnPlayerCraftItem
`Event OnPlayerCraftItem(ObjectReference akSenderRef, ObjectReference akBench, Location akLocation, Form akCreatedItem)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Received when player crafts an item

([TOC](#table-of-contents))

##### Event: OnPlayerCreateRobot
`Event OnPlayerCreateRobot(ObjectReference akSenderRef, Actor akNewRobot)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Received when player creates a new robot

([TOC](#table-of-contents))

##### Event: OnPlayerDialogueTarget
`Event OnPlayerDialogueTarget(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event received when ref goes into dialogue with player

([TOC](#table-of-contents))

##### Event: OnPlayerEnterVertibird
`Event OnPlayerEnterVertibird(ObjectReference akSenderRef, ObjectReference akVertibird)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Received when player enters vertibird

([TOC](#table-of-contents))

##### Event: OnPlayerFallLongDistance
`Event OnPlayerFallLongDistance(ObjectReference akSenderRef, float afDamage)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Received when player takes fall damage

([TOC](#table-of-contents))

##### Event: OnPlayerFireWeapon
`Event OnPlayerFireWeapon(ObjectReference akSenderRef, Form akBaseObject)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Received when player fires a weapon out of combat and based on timer

([TOC](#table-of-contents))

##### Event: OnPlayerHealTeammate
`Event OnPlayerHealTeammate(ObjectReference akSenderRef, Actor akTeammate)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Received when player heals his teammate

([TOC](#table-of-contents))

##### Event: OnPlayerItemAdded
`Event OnPlayerItemAdded(ObjectReference akSenderRef, Form akBaseObject, ObjectReference akOwner, ObjectReference akSourceContainer, int aeAcquireType)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Received when the player gains an item in their inventory

aeAcquireType is one of the following:

0: None

1: Steal

2: Buy

3: Pickpocket

4: Pickup

5: Container

6: Dead body

([TOC](#table-of-contents))

##### Event: OnPlayerLoadGame
`Event OnPlayerLoadGame(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Received immediately after the player has loaded a save game. A good time to check for additional content.

([TOC](#table-of-contents))

##### Event: OnPlayerLoiteringBegin
`Event OnPlayerLoiteringBegin(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Received when player starts loitering

([TOC](#table-of-contents))

##### Event: OnPlayerLoiteringEnd
`Event OnPlayerLoiteringEnd(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Received when player stops loitering

([TOC](#table-of-contents))

##### Event: OnPlayerModArmorWeapon
`Event OnPlayerModArmorWeapon(ObjectReference akSenderRef, Form akBaseObject, ObjectMod akModBaseObject)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Received when player mods a weapon or armor in the menu.

([TOC](#table-of-contents))

##### Event: OnPlayerModRobot
`Event OnPlayerModRobot(ObjectReference akSenderRef, Actor akRobot, ObjectMod akModBaseObject)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Received when the player mods a robot

([TOC](#table-of-contents))

##### Event: OnPlayerSwimming
`Event OnPlayerSwimming(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Received when player starts swimming

([TOC](#table-of-contents))

##### Event: OnPlayerUseWorkBench
`Event OnPlayerUseWorkBench(ObjectReference akSenderRef, ObjectReference akWorkBench)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Received when player uses a workbench

([TOC](#table-of-contents))

##### Event: OnRaceSwitchComplete
`Event OnRaceSwitchComplete(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event received when this actor finishes changing its race

([TOC](#table-of-contents))

##### Event: OnRecoverFromBleedout
`Event OnRecoverFromBleedout(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event received when an actor exits bleedout. (only if this alias points at an actor)

([TOC](#table-of-contents))

##### Event: OnSit
`Event OnSit(ObjectReference akSenderRef, ObjectReference akFurniture)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event that is triggered when this actor sits in the furniture

([TOC](#table-of-contents))

##### Event: OnSpeechChallengeAvailable
`Event OnSpeechChallengeAvailable(ObjectReference akSenderRef, ObjectReference akSpeaker)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Received when player gets a speech challenge in dialogue

([TOC](#table-of-contents))

##### Event: OnPlayerPlanetSurveyComplete
`Event OnPlayerPlanetSurveyComplete(ObjectReference akSenderRef, Planet akPlanet)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Received when player completely surveyed a planet

([TOC](#table-of-contents))

##### Event: OnPlayerScannedObject
`Event OnPlayerScannedObject(ObjectReference akSenderRef, ObjectReference akScannedRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Received by the player when they scan an object

([TOC](#table-of-contents))

##### Event: OnPlayerArrested
`Event OnPlayerArrested(ObjectReference akSenderRef,ObjectReference akGuard, Location akLocation, int aeCrimeType )`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event that is triggered when the player is arrested.

([TOC](#table-of-contents))

##### Event: OnPlayerAssaultActor
`Event OnPlayerAssaultActor(ObjectReference akSenderRef,ObjectReference akVictim, Location akLocation, bool aeCrime )`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event that is triggered when the player assaults someone.

([TOC](#table-of-contents))

##### Event: OnPlayerCrimeGold
`Event OnPlayerCrimeGold(ObjectReference akSenderRef,ObjectReference akVictim, Form akFaction, int aeCrimeGold, int aeCrimeType )`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event that is triggered when the player gets crimegold .

([TOC](#table-of-contents))

##### Event: OnPlayerJail
`Event OnPlayerJail(ObjectReference akSenderRef,ObjectReference akGuard, Form akFaction,  Location akLocation,int aeCrimeGold)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event that is triggered when the player goes to jail.

([TOC](#table-of-contents))

##### Event: OnPlayerPayFine
`Event OnPlayerPayFine(ObjectReference akSenderRef,ObjectReference akGuard, Form akFaction, int aeCrimeGold)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event that is triggered when the player pays fine.

([TOC](#table-of-contents))

##### Event: OnPlayerMurderActor
`Event OnPlayerMurderActor(ObjectReference akSenderRef,ObjectReference akVictim, Location akLocation, bool aeCrime )`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event that is triggered when the player murders someone.

([TOC](#table-of-contents))

##### Event: OnPlayerTrespass
`Event OnPlayerTrespass(ObjectReference akSenderRef,ObjectReference akVictim, Location akLocation, bool aeCrime)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event that is triggered when the player trespassing.

([TOC](#table-of-contents))

##### Event: OnPlayerBuyShip
`Event OnPlayerBuyShip(ObjectReference akSenderRef, SpaceshipReference akShip)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event that is triggered when the player buys a ship

([TOC](#table-of-contents))

##### Event: OnPlayerSellShip
`Event OnPlayerSellShip(ObjectReference akSenderRef, SpaceshipReference akShip)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from actor

Event that is triggered when the player sells a ship

([TOC](#table-of-contents))

##### Event: OnShipBought
`Event OnShipBought(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from spaceship

Event this is triggered when a ship is bought

([TOC](#table-of-contents))

##### Event: OnShipSold
`Event OnShipSold(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from spaceship

Event this is triggered when a ship is sold

([TOC](#table-of-contents))

##### Event: OnShipSystemDamaged
`Event OnShipSystemDamaged(ObjectReference akSenderRef, ActorValue akSystem, int aBlocksLost, bool aElectromagneticDamage, bool aFullyDamaged)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from spaceship

Event that is triggered when one of this spaceship's systems loses a power block due to damage

([TOC](#table-of-contents))

##### Event: OnShipSystemRepaired
`Event OnShipSystemRepaired(ObjectReference akSenderRef, ActorValue akSystem, int aBlocksGained, bool aElectromagneticDamage)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from spaceship

Event that is triggered when one of this spaceship's systems gains a power block due to being repaired

([TOC](#table-of-contents))

##### Event: OnShipRampDown
`Event OnShipRampDown(ObjectReference akSenderRef)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from spaceship

Event received when a ship's landing ramp has lowered all the way and connected to the surrounding navmesh

([TOC](#table-of-contents))

##### Event: OnShipRefueled
`Event OnShipRefueled(ObjectReference akSenderRef, int aFuelAdded)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from spaceship

Event that is triggered when fuel has been added to this spaceship

([TOC](#table-of-contents))

##### Event: OnShipScan
`Event OnShipScan(ObjectReference akSenderRef, Location aPlanet, ObjectReference[] aMarkersArray)`

Received if the object the alias points at receives the events. The sender of each event is the specific ref or actor in the collection that fired the event

Event from spaceship

Event that is triggered when the player scans a planet with this spaceship

([TOC](#table-of-contents))

##### Function: AddToFaction
`Function AddToFaction(faction akFaction)`

add all actors in list to specified faction

([TOC](#table-of-contents))

##### Function: BlockActivation
`Function BlockActivation(bool abBlocked = True, bool abHideActivateText = false)`

block activation on all refs in collection

([TOC](#table-of-contents))

##### Function: GetActorAt
`Actor Function GetActorAt( int aiIndex )`

convenience function - casts the reference at aiIndex as an actor before returning it

([TOC](#table-of-contents))

##### Function: GetShipAt
`SpaceshipReference Function GetShipAt( int aiIndex )`

convenience function - casts the reference at aiIndex as an actor before returning it

([TOC](#table-of-contents))

##### Function: GetRandom
`ObjectReference Function GetRandom()`

return a random reference

([TOC](#table-of-contents))

##### Function: GetRandomObjects
`ObjectReference[] Function GetRandomObjects(int aiNumberToGet = 0)`

Gets a random number of things from the collection

([TOC](#table-of-contents))

##### Function: GetFirstOwnedObject
`ObjectReference function GetFirstOwnedObject(Actor actorOwner)`

return (first) owned object in collection

([TOC](#table-of-contents))

##### Function: EnableAll
`function EnableAll(bool bFadeIn = false)`

Enable everyone in the collection

([TOC](#table-of-contents))

##### Function: DisableAll
`function DisableAll(bool bFadeOut = false)`

Disable everyone in the collection

([TOC](#table-of-contents))

##### Function: EvaluateAll
`function EvaluateAll()`

Evaluate the packages of everyone in the collection

([TOC](#table-of-contents))

##### Function: MoveAllTo
`function MoveAllTo(ObjectReference akTarget)`

Move everyone in collection

([TOC](#table-of-contents))

##### Function: MoveAllToPackageLocation
`function MoveAllToPackageLocation()`

Move all actors to packages locations.

([TOC](#table-of-contents))

##### Function: IsOwnedObjectInList
`bool function IsOwnedObjectInList(Actor actorOwner)`

return true if actorOwner owns anything in the collection

([TOC](#table-of-contents))

##### Function: IsDetectedBy
`bool function IsDetectedBy(Actor detectionTarget)`

return true if detectionTarget is detected by any actor in the collection

([TOC](#table-of-contents))

##### Function: HasDetectionLOS
`bool function HasDetectionLOS(Actor actorTarget)`

return true if any actor in the collection has detection LOS on actorTarget

([TOC](#table-of-contents))

##### Function: SetOpen
`Function SetOpen(bool abOpen = true)`

Open or close all refs.

([TOC](#table-of-contents))

##### Function: Lock
`Function Lock(bool abLock = true, bool abAsOwner = false, bool abTraverseLinkedLockables = true)`

lock/unlock all refs

([TOC](#table-of-contents))

##### Function: KillAll
`Function KillAll(ObjectReference akKiller = NONE)`

convenience function - kills everything in the collection (ships or actors)

([TOC](#table-of-contents))

##### Function: StartCombatAll
`Function StartCombatAll(ObjectReference akCombatTarget)`

convenience function - everything in the collection starts combat with target

([TOC](#table-of-contents))

##### Function: RemoveFromFaction
`Function RemoveFromFaction(faction akFaction)`

remove all actors in list to specified faction

([TOC](#table-of-contents))

##### Function: RemoveFromAllFactions
`Function RemoveFromAllFactions()`

remove all actors in list from all factions

([TOC](#table-of-contents))

##### Function: ResetAll
`function ResetAll()`

Reset everyone in the collection

([TOC](#table-of-contents))

##### Function: SetGhost
`Function SetGhost(bool bSetGhost = True)`

convenience function - set ghost on everyone

([TOC](#table-of-contents))

##### Function: SetProtected
`Function SetProtected(bool bSetProtected = true)`

convenience function - sets/clears Protected on everyone

([TOC](#table-of-contents))

##### Function: SetEssential
`Function SetEssential(bool bSetEssential = true)`

convenience function - sets/clears Essential on everyone

([TOC](#table-of-contents))

##### Function: StopCombat
`Function StopCombat()`

convenience function - stops combat on everyone

([TOC](#table-of-contents))

##### Function: StopCombatAlarm
`Function StopCombatAlarm()`

convenience function - stop combat alarm on everyone

([TOC](#table-of-contents))

##### Function: AddRefCollection
`Function AddRefCollection(RefCollectionAlias refCollectionAliasToAdd)`

Adds the contents of the passed-in collection alias to this one

([TOC](#table-of-contents))

##### Function: RemoveRefCollection
`Function RemoveRefCollection(RefCollectionAlias refCollectionAliasToRemove)`

Removes the contents of the passed-in collection alias from this one

([TOC](#table-of-contents))

##### Function: AddArray
`Function AddArray(ObjectReference[] refArrayToAdd)`

add an array of references to a collection

([TOC](#table-of-contents))

##### Function: GetCountDead
`int Function GetCountDead()`

Get count of dead actors in Collection

([TOC](#table-of-contents))

##### Function: GetCountDeadOr3DUnloaded
`int Function GetCountDeadOr3DUnloaded()`

Get count of dead actors and/or unloaded refs in Collection

([TOC](#table-of-contents))

##### Function: GetCountAliveAnd3DLoaded
`int Function GetCountAliveAnd3DLoaded()`

Get count of dead actors and unloaded refs in Collection

([TOC](#table-of-contents))

##### Function: GetCountDisabled
`int Function GetCountDisabled()`

Get count of disabled refs in Collection

([TOC](#table-of-contents))

##### Function: RemoveDisabled
`int Function RemoveDisabled()`

remove disabled refs in Collection

returns number of refs removed

([TOC](#table-of-contents))

##### Function: SetValue
`function SetValue(ActorValue akActorValue, float fValue)`

set an actor value on all refs in the collection

([TOC](#table-of-contents))

##### Function: LinkCollectionTo
`bool function LinkCollectionTo(RefCollectionAlias LinkedRefCollectionAlias, keyword LinkKeyword = none, bool WrapLinks = false)`

Link this RefCollectionAlias to another refCollectionAlias with this keyword.

Limited by the number of objects in the refCollectionAlias it is called on

If wrapLinks == true : this will not be limited by the link target, but will wrap around to the top of that list

([TOC](#table-of-contents))

##### Function: SetUnconscious
`function SetUnconscious(bool abUnconscious = true)`

lvc Set the conscious/unconscious state of a ref collection

([TOC](#table-of-contents))

##### Function: AddRef (Native)
`Function AddRef(ObjectReference akNewRef) native`

Adds the given ref to this ref collection

([TOC](#table-of-contents))

##### Function: Find (Native)
`int Function Find(ObjectReference akFindRef) native`

Finds the specified reference in the collection. Returns a negative value if not found.

([TOC](#table-of-contents))

##### Function: GetArray (Native)
`ObjectReference[] Function GetArray() native`

Gets an array of all refs in the collection

([TOC](#table-of-contents))

##### Function: GetActorArray (Native)
`Actor[] Function GetActorArray() native`

Gets an array of all actors in the collection

([TOC](#table-of-contents))

##### Function: GetAt (Native)
`ObjectReference Function GetAt( int aiIndex ) native`

Gets the ref at the given index in the collection

([TOC](#table-of-contents))

##### Function: GetCount (Native)
`int Function GetCount() native`

Gets the count of refs in the collection

([TOC](#table-of-contents))

##### Function: RemoveAll (Native)
`Function RemoveAll( ) native`

Empties all refs from the collection

([TOC](#table-of-contents))

##### Function: RemoveRef (Native)
`Function RemoveRef(ObjectReference akRemoveRef ) native`

Takes the specific ref out of the collection

([TOC](#table-of-contents))

#### Script: ReferenceAlias
`Scriptname ReferenceAlias extends Alias Native Hidden`

([TOC](#table-of-contents))

##### Event: OnAliasChanged
`Event OnAliasChanged(ObjectReference akObject, bool abRemove)`

Event received when an object has been added/removed to this referencealias

([TOC](#table-of-contents))

##### Event: OnActivate
`Event OnActivate(ObjectReference akActionRef)`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when this reference is activated

([TOC](#table-of-contents))

##### Event: OnBuilderMenuSelect
`Event OnBuilderMenuSelect(ActorValue akActorValue)`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when the produced resource on an Workshop producer/builder has changed.

([TOC](#table-of-contents))

##### Event: OnCellAttach
`Event OnCellAttach()`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when this object's parent cell is attached

([TOC](#table-of-contents))

##### Event: OnCellDetach
`Event OnCellDetach()`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when this object's parent cell is detached

([TOC](#table-of-contents))

##### Event: OnCellLoad
`Event OnCellLoad()`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when every object in this object's parent cell is loaded (TODO: Find restrictions)

([TOC](#table-of-contents))

##### Event: OnClose
`Event OnClose(ObjectReference akActionRef)`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when this object is closed

([TOC](#table-of-contents))

##### Event: OnContainerChanged
`Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when this object enters, exits, or changes containers

([TOC](#table-of-contents))

##### Event: OnDestroyed
`Event OnDestroyed(ObjectReference akDestroyer)`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when this reference is destroyed

([TOC](#table-of-contents))

##### Event: OnDestructionStageChanged
`Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when this reference's destruction stage has changed

([TOC](#table-of-contents))

##### Event: OnEnterFurniture
`Event OnEnterFurniture(Actor akActionRef)`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when this furniture is entered.

([TOC](#table-of-contents))

##### Event: OnEquipped
`Event OnEquipped(Actor akActor)`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when this object is equipped by an actor

([TOC](#table-of-contents))

##### Event: OnExitFurniture
`Event OnExitFurniture(ObjectReference akActionRef)`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when this furniture is exited.

([TOC](#table-of-contents))

##### Event: OnGrab
`Event OnGrab()`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when this object is grabbed by the player

([TOC](#table-of-contents))

##### Event: OnItemAdded
`Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when an item is added to this object's inventory. If the item is a persistent reference, akItemReference will point at it - otherwise the parameter will be None. For valid Transfer Reasons please refer to the wiki.

([TOC](#table-of-contents))

##### Event: OnItemRemoved
`Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, int aiTransferReason)`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when an item is removed from this object's inventory. If the item is a persistent reference, akItemReference will point at it - otherwise the parameter will be None. For valid Transfer Reasons please refer to the wiki.

([TOC](#table-of-contents))

##### Event: OnLoad
`Event OnLoad()`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when this object is completely loaded - will be fired every time this object is loaded

([TOC](#table-of-contents))

##### Event: OnLockStateChanged
`Event OnLockStateChanged()`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when the lock on this object changes

([TOC](#table-of-contents))

##### Event: OnMapMarkerDiscovered
`Event OnMapMarkerDiscovered()`

Event is received if the object the alias points at receives the event

Event from object reference

Received when this map marker is discovered

([TOC](#table-of-contents))

##### Event: OnObjectRepaired
`Event OnObjectRepaired(ObjectReference akReference)`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when an item has been repaired

([TOC](#table-of-contents))

##### Event: OnObjectDestroyed
`Event OnObjectDestroyed(ObjectReference akReference)`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when an item has been destroyed

([TOC](#table-of-contents))

##### Event: OnOpen
`Event OnOpen(ObjectReference akActionRef)`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when this object is opened

([TOC](#table-of-contents))

##### Event: OnOutpostItemPowerOff
`Event OnOutpostItemPowerOff(ObjectReference akPoweredItem)`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when an Outpost item loses power

([TOC](#table-of-contents))

##### Event: OnOutpostItemPowerOn
`Event OnOutpostItemPowerOn(ObjectReference akPoweredItem, ObjectReference akPowerGenerator)`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when an Outpost item receives power

([TOC](#table-of-contents))

##### Event: OnPipboyRadioDetection
`Event OnPipboyRadioDetection( bool abDetected )`

Event is received if the object the alias points at receives the event

Event from object reference

Event that occurs when the Pipboy enters/leaves the outer-radius of this radio ref

([TOC](#table-of-contents))

##### Event: OnPlayerDialogueTarget
`Event OnPlayerDialogueTarget()`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when ref goes into dialogue with player

([TOC](#table-of-contents))

##### Event: OnPowerOn
`Event OnPowerOn(ObjectReference akPowerGenerator)`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when a workshop item receives power

([TOC](#table-of-contents))

##### Event: OnPowerOff
`Event OnPowerOff()`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when a workshop loses all power

([TOC](#table-of-contents))

##### Event: OnQuickContainerOpened
`Event OnQuickContainerOpened()`

Event is received if the object the alias points at receives the event

Event from object reference

Received if the quick container opens

([TOC](#table-of-contents))

##### Event: OnRead
`Event OnRead()`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when this object, if a book, is read

([TOC](#table-of-contents))

##### Event: OnRelease
`Event OnRelease()`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when this object is released by the player

([TOC](#table-of-contents))

##### Event: OnReset
`Event OnReset()`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when this reference is reset

([TOC](#table-of-contents))

##### Event: OnScanned
`Event OnScanned()`

Event is received if the object the alias points at receives the event

Event from object reference

Received when this object is scanned

([TOC](#table-of-contents))

##### Event: OnSell
`Event OnSell(Actor akSeller)`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when this reference is sold by an actor

([TOC](#table-of-contents))

##### Event: OnSpellCast
`Event OnSpellCast(Form akSpell)`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when a spell is cast by this object

([TOC](#table-of-contents))

##### Event: OnTerminalMenuItemRun
`Event OnTerminalMenuItemRun(int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)`

Event is received if the object the alias points at receives the event

Event from object reference

Received if terminal object has menu item clicked

([TOC](#table-of-contents))

##### Event: OnTranslationAlmostComplete
`Event OnTranslationAlmostComplete()`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when translation is almost complete (from a call to TranslateTo, "almost" is determined by a gamesetting, default is 90% of the way)

([TOC](#table-of-contents))

##### Event: OnTranslationComplete
`Event OnTranslationComplete()`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when translation is complete (from a call to TranslateTo)

([TOC](#table-of-contents))

##### Event: OnTranslationFailed
`Event OnTranslationFailed()`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when translation is aborted (from a call to StopTranslateTo)

([TOC](#table-of-contents))

##### Event: OnTrapHitStart
`Event OnTrapHitStart(ObjectReference akTarget, float afXVel, float afYVel, float afZVel, float afXPos, float afYPos, float afZPos, int aeMaterial, bool abInitialHit, int aeMotionType)`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when this starts hitting a target

([TOC](#table-of-contents))

##### Event: OnTrapHitStop
`Event OnTrapHitStop(ObjectReference akTarget)`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when this stops hitting a target

([TOC](#table-of-contents))

##### Event: OnTriggerEnter
`Event OnTriggerEnter(ObjectReference akActionRef)`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when this trigger volume is entered

([TOC](#table-of-contents))

##### Event: OnTriggerLeave
`Event OnTriggerLeave(ObjectReference akActionRef)`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when this trigger volume is left

([TOC](#table-of-contents))

##### Event: OnUnequipped
`Event OnUnequipped(Actor akActor)`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when this object is unequipped by an actor

([TOC](#table-of-contents))

##### Event: OnUnload
`Event OnUnload()`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when this object is being unloaded - will be fired every time this object is unloaded

([TOC](#table-of-contents))

##### Event: OnWorkshopCargoLinkChanged
`Event OnWorkshopCargoLinkChanged(ObjectReference akOldTarget, ObjectReference akNewTarget)`

Event is received if the object the alias points at receives the event

Event from object reference

Event that iakNewLinkRefs triggered when the target for a cargo link on workshop item changes.

([TOC](#table-of-contents))

##### Event: OnWorkshopFlyCam
`Event OnWorkshopFlyCam(bool aStart)`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when the player enters or leaves Workshop FlyCam

([TOC](#table-of-contents))

##### Event: OnWorkshopMode
`Event OnWorkshopMode(bool aStart)`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when the player enters or leaves Workshop Mode

([TOC](#table-of-contents))

##### Event: OnWorkshopObjectGrabbed
`Event OnWorkshopObjectGrabbed(ObjectReference akReference)`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when the player grabs an existing object reference for edit while in Workshop mode.

([TOC](#table-of-contents))

##### Event: OnWorkshopObjectMoved
`Event OnWorkshopObjectMoved(ObjectReference akReference)`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when an existing workshop item is moved in the world

([TOC](#table-of-contents))

##### Event: OnWorkshopObjectPlaced
`Event OnWorkshopObjectPlaced(ObjectReference akReference)`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when a workshop item is placed in the world

([TOC](#table-of-contents))

##### Event: OnWorkshopObjectRemoved
`Event OnWorkshopObjectRemoved(ObjectReference akReference)`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when a workshop item is removed ( from world and added back to workshop )

([TOC](#table-of-contents))

##### Event: OnWorkshopOutputLink
`Event OnWorkshopOutputLink(ObjectReference akSource, ObjectReference akTarget)`

Event is received if the object the alias points at receives the event

Event from object reference

Event received when a new Output Link is created at a Workshop.

([TOC](#table-of-contents))

##### Event: OnWorkshopNPCTransfer
`Event OnWorkshopNPCTransfer(Location akNewWorkshop, Keyword akActionKW)`

Event is received if the object the alias points at receives the event

Event from object reference

Event that occurs when a workshop NPC is directed to move to another settlement

([TOC](#table-of-contents))

##### Event: OnActorActivatedRef
`Event OnActorActivatedRef(ObjectReference akActivatedRef)`

Event is received if the object the alias points at receives the event

Event from actor

Event received when this actor activates a ref

([TOC](#table-of-contents))

##### Event: OnAffinityEvent
`Event OnAffinityEvent(AffinityEvent akAffinityEvent, ActorValue akActorValue, GlobalVariable akReactionValue, ObjectReference akTarget)`

Event is received if the object the alias points at receives the event

Event from actor

Event received when affinity event is run

([TOC](#table-of-contents))

##### Event: OnCombatListAdded
`Event OnCombatListAdded(Actor akTarget)`

Event is received if the object the alias points at receives the event

Event from actor

Event that is triggered when this actor adds another actor to its combat list.

([TOC](#table-of-contents))

##### Event: OnCombatListRemoved
`Event OnCombatListRemoved(Actor akTarget)`

Event is received if the object the alias points at receives the event

Event from actor

Event that is triggered when this actor removes another actor from its combat list.

([TOC](#table-of-contents))

##### Event: OnCombatStateChanged
`Event OnCombatStateChanged(ObjectReference akTarget, int aeCombatState)`

Event is received if the object the alias points at receives the event

Event from actor

Event that is triggered when this actor's combat state against the target changes

State is as follows:

0 - not in combat

1 - in combat

2 - searching

([TOC](#table-of-contents))

##### Event: OnCommandModeCompleteCommand
`Event OnCommandModeCompleteCommand(int aeCommandType, ObjectReference akTarget)`

Event is received if the object the alias points at receives the event

Event from actor

Event received when the object completes a command in command mode.

Type is as follows:

0 - None

1 - Call

2 - Follow

3 - Move

4 - Attack

5 - Inspect

6 - Retrieve

7 - Stay

8 - Release

9 - Heal

10 - Assign

11 - Ride

12 - Enter

([TOC](#table-of-contents))

##### Event: OnCommandModeEnter
`Event OnCommandModeEnter()`

Event is received if the object the alias points at receives the event

Event from actor

Event received when the player begins commanding this object

([TOC](#table-of-contents))

##### Event: OnCommandModeExit
`Event OnCommandModeExit()`

Event is received if the object the alias points at receives the event

Event from actor

Event received when the player ends commanding this object

([TOC](#table-of-contents))

##### Event: OnCommandModeGiveCommand
`Event OnCommandModeGiveCommand(int aeCommandType, ObjectReference akTarget)`

Event is received if the object the alias points at receives the event

Event from actor

Event received when the player gives object a command in command mode.

Type is as follows:

0 - None

1 - Call

2 - Follow

3 - Move

4 - Attack

5 - Inspect

6 - Retrieve

7 - Stay

8 - Release

9 - Heal

10 - Assign

11 - Ride

12 - Enter

([TOC](#table-of-contents))

##### Event: OnCompanionDismiss
`Event OnCompanionDismiss()`

Event is received if the object the alias points at receives the event

Event from actor

Received when player dismisses teammate companion

([TOC](#table-of-contents))

##### Event: OnConsciousnessStateChanged
`Event OnConsciousnessStateChanged(bool abUnconscious)`

Event is received if the object the alias points at receives the event

Event from actor

Event that is triggered when this actor's consciousness state changes

([TOC](#table-of-contents))

##### Event: OnCrewAssigned
`Event OnCrewAssigned(Actor akCrew, ObjectReference akAssignmentRef, ObjectReference akPreviousAssignmentRef)`

Event is received if the object the alias points at receives the event

Event from actor

Event received when a reference has a crew member assigned.

([TOC](#table-of-contents))

##### Event: OnCrewDismissed
`Event OnCrewDismissed(Actor akCrew, ObjectReference akPreviousAssignmentRef)`

Event is received if the object the alias points at receives the event

Event from actor

Event received when a reference has a crew member dismissed.

([TOC](#table-of-contents))

##### Event: OnCripple
`Event OnCripple(ActorValue akActorValue, bool abCrippled)`

Event is received if the object the alias points at receives the event

Event from actor

received immediately after a limb has become crippled or uncrippled.

([TOC](#table-of-contents))

##### Event: OnDeferredKill
`Event OnDeferredKill(Actor akKiller)`

Event is received if the object the alias points at receives the event

Event from actor

Event that is triggered when this actor gets a deferred kill added

(they were in deferred kill mode and got "killed")

([TOC](#table-of-contents))

##### Event: OnDeath
`Event OnDeath(ObjectReference akKiller)`

Event is received if the object the alias points at receives the event

Event from actor

Event that is triggered when this actor finishes dying (only if this alias points at an actor)

([TOC](#table-of-contents))

##### Event: OnDifficultyChanged
`Event OnDifficultyChanged(int aOldDifficulty, int aNewDifficulty)`

Event is received if the object the alias points at receives the event

Event from actor

Event received when the player changes their difficulty

Type is as follows:

0 - Very Easy

1 - Easy

2 - Normal

3 - Hard

4 - Very Hard

5 - Survival

([TOC](#table-of-contents))

##### Event: OnDying
`Event OnDying(ObjectReference akKiller)`

Event is received if the object the alias points at receives the event

Event from actor

Event that is triggered when this actor begins dying (only if this alias points at an actor)

([TOC](#table-of-contents))

##### Event: OnUnconscious
`Event OnUnconscious(ObjectReference akAttacker)`

Event is received if the object the alias points at receives the event

Event from actor

Event that is triggered when an actor has been "killed" with EM weapons (the actor is still alive)

([TOC](#table-of-contents))

##### Event: OnEnterBleedout
`Event OnEnterBleedout()`

Event is received if the object the alias points at receives the event

Event from actor

Event received when an actor enters bleedout. (only if this alias points at an actor)

([TOC](#table-of-contents))

##### Event: OnEnterOutpostBeaconMode
`Event OnEnterOutpostBeaconMode()`

Event is received if the object the alias points at receives the event

Event from actor

Event received when the player enters Outpost Beacon placement mode.

([TOC](#table-of-contents))

##### Event: OnEnterShipInterior
`Event OnEnterShipInterior(ObjectReference akShip)`

Event is received if the object the alias points at receives the event

Event from actor

Event received when an actor enters a ship interior cell

([TOC](#table-of-contents))

##### Event: OnEnterSneaking
`Event OnEnterSneaking()`

Event is received if the object the alias points at receives the event

Event from actor

Event received when an actor enters sneaking.

([TOC](#table-of-contents))

##### Event: OnEscortWaitStart
`Event OnEscortWaitStart()`

Event is received if the object the alias points at receives the event

Event from actor

Event received when this actor is in an Escort procedure and begins waiting for the escorted actor to catch up.

([TOC](#table-of-contents))

##### Event: OnEscortWaitStop
`Event OnEscortWaitStop()`

Event is received if the object the alias points at receives the event

Event from actor

Event received when this actor is in an Escort procedure and stops waiting because the escorted actor has caught up.

([TOC](#table-of-contents))

##### Event: OnExitShipInterior
`Event OnExitShipInterior(ObjectReference akShip)`

Event is received if the object the alias points at receives the event

Event from actor

Event received when an actor exits a ship interior cell

([TOC](#table-of-contents))

##### Event: OnPlayerFollowerWarp
`Event OnPlayerFollowerWarp(ObjectReference akFollower)`

Event is received if the object the alias points at receives the event

Event from actor

Event received when a player follower is warped

([TOC](#table-of-contents))

##### Event: OnGetUp
`Event OnGetUp(ObjectReference akFurniture)`

Event is received if the object the alias points at receives the event

Event from actor

Event that is triggered when this actor leaves the furniture

([TOC](#table-of-contents))

##### Event: OnHomeShipSet
`Event OnHomeShipSet(SpaceshipReference akShip, SpaceshipReference akPrevious)`

Event is received if the object the alias points at receives the event

Event from actor

Event that is triggered when the actors home ship is set.

([TOC](#table-of-contents))

##### Event: OnPlayerArrested
`Event OnPlayerArrested(ObjectReference akGuard, Location akLocation, int aeCrimeType )`

Event is received if the object the alias points at receives the event

Event from actor

Event that is triggered when the player is arrested.

([TOC](#table-of-contents))

##### Event: OnPlayerAssaultActor
`Event OnPlayerAssaultActor(ObjectReference akVictim, Location akLocation, bool aeCrime )`

Event is received if the object the alias points at receives the event

Event from actor

Event that is triggered when the player assaults someone.

([TOC](#table-of-contents))

##### Event: OnPlayerFailedPlotRoute
`Event OnPlayerFailedPlotRoute(int aeFailedPlotReason)`

Event is received if the object the alias points at receives the event

Event from actor

Event received when the player plots a failed starmap route

Type is as follows:

0 - Success

1 - Insufficient Fuel

2 - Out of Range

3 - Unexplored System

([TOC](#table-of-contents))

##### Event: OnPlayerModifiedShip
`Event OnPlayerModifiedShip(SpaceshipReference akShip)`

Event is received if the object the alias points at receives the event

Event from actor

Event that is triggered when an actor modifies a ship

([TOC](#table-of-contents))

##### Event: OnItemEquipped
`Event OnItemEquipped(Form akBaseObject, ObjectReference akReference)`

Event is received if the object the alias points at receives the event

Event from actor

Event received when this actor equips something - akReference may be None if object is not persistent (only if this alias points at an actor)

([TOC](#table-of-contents))

##### Event: OnItemUnequipped
`Event OnItemUnequipped(Form akBaseObject, ObjectReference akReference)`

Event is received if the object the alias points at receives the event

Event from actor

Event received when this actor unequips something - akReference may be None if object is not persistent (only if this alias points at an actor)

([TOC](#table-of-contents))

##### Event: OnKill
`Event OnKill(ObjectReference akVictim)`

Event is received if the object the alias points at receives the event

Event from actor

Event that is triggered when this actor kills another

([TOC](#table-of-contents))

##### Event: OnLocationChange
`Event OnLocationChange(Location akOldLoc, Location akNewLoc)`

Event is received if the object the alias points at receives the event

Event from actor

Event that is triggered when this actor changes from one location to another (only if this alias points at an actor)

([TOC](#table-of-contents))

##### Event: OnOutpostPlaced
`Event OnOutpostPlaced(ObjectReference akOutpostBeacon)`

Event is received if the object the alias points at receives the event

Event from actor

Received when player placed an outpost beacon

([TOC](#table-of-contents))

##### Event: OnPackageChange
`Event OnPackageChange(Package akOldPackage)`

Event is received if the object the alias points at receives the event

Event from actor

Event received when this actor's package changes (only if this alias points at an actor)

([TOC](#table-of-contents))

##### Event: OnPackageEnd
`Event OnPackageEnd(Package akOldPackage)`

Event is received if the object the alias points at receives the event

Event from actor

Event received when this actor's package ends (only if this alias points at an actor)

([TOC](#table-of-contents))

##### Event: OnPackageStart
`Event OnPackageStart(Package akNewPackage)`

Event is received if the object the alias points at receives the event

Event from actor

Event received when this actor starts a new package (only if this alias points at an actor)

([TOC](#table-of-contents))

##### Event: OnPartialCripple
`Event OnPartialCripple(ActorValue akActorValue, bool abCrippled)`

Event is received if the object the alias points at receives the event

Event from actor

received immediately after the limb of a robot (or other actor whose race allows sub-segment damage) has become (or ceased to be) partially crippled.

([TOC](#table-of-contents))

##### Event: OnPickLock
`Event OnPickLock(ObjectReference akLockedRef, bool abCrime, bool abSucceeded, TerminalMenu akLockedTerminalMenu, int aiTerminalMenuItem)`

Event is received if the object the alias points at receives the event

Event from actor

Event received when an actor picks a lock

([TOC](#table-of-contents))

##### Event: OnPickpocketFailed
`Event OnPickpocketFailed()`

Event is received if the object the alias points at receives the event

Event from actor

Received when the player fails to pickpocket this actor

([TOC](#table-of-contents))

##### Event: OnPlayerBuyShip
`Event OnPlayerBuyShip(SpaceshipReference akShip)`

Event is received if the object the alias points at receives the event

Event from actor

Event that is triggered when the player buys a ship

([TOC](#table-of-contents))

##### Event: OnPlayerCompleteResearch
`Event OnPlayerCompleteResearch(ObjectReference akBench, Location akLocation, ResearchProject akProject)`

Event is received if the object the alias points at receives the event

Event from actor

Received when player completes research

([TOC](#table-of-contents))

##### Event: OnPlayerCraftItem
`Event OnPlayerCraftItem(ObjectReference akBench, Location akLocation, Form akCreatedItem)`

Event is received if the object the alias points at receives the event

Event from actor

Received when player crafts an item

([TOC](#table-of-contents))

##### Event: OnPlayerCreateRobot
`Event OnPlayerCreateRobot(Actor akNewRobot)`

Event is received if the object the alias points at receives the event

Event from actor

Received when player creates a new robot

([TOC](#table-of-contents))

##### Event: OnPlayerCrimeGold
`Event OnPlayerCrimeGold(ObjectReference akVictim, Form akFaction, int aeCrimeGold, int aeCrimeType )`

Event is received if the object the alias points at receives the event

Event from actor

Event that is triggered when the player gets crimegold .

([TOC](#table-of-contents))

##### Event: OnPlayerEnterVertibird
`Event OnPlayerEnterVertibird( ObjectReference akVertibird)`

Event is received if the object the alias points at receives the event

Event from actor

Received when player enters vertibird

([TOC](#table-of-contents))

##### Event: OnPlayerFallLongDistance
`Event OnPlayerFallLongDistance(float afDamage)`

Event is received if the object the alias points at receives the event

Event from actor

Received when player takes fall damage

([TOC](#table-of-contents))

##### Event: OnPlayerFireWeapon
`Event OnPlayerFireWeapon(Form akBaseObject)`

Event is received if the object the alias points at receives the event

Event from actor

Received when player fires a weapon out of combat and based on timer

([TOC](#table-of-contents))

##### Event: OnPlayerJail
`Event OnPlayerJail(ObjectReference akGuard, Form akFaction,  Location akLocation,int aeCrimeGold)`

Event is received if the object the alias points at receives the event

Event from actor

Event that is triggered when the player goes to jail.

([TOC](#table-of-contents))

##### Event: OnPlayerHealTeammate
`Event OnPlayerHealTeammate(Actor akTeammate)`

Event is received if the object the alias points at receives the event

Event from actor

Received when player heals his teammate

([TOC](#table-of-contents))

##### Event: OnPlayerItemAdded
`Event OnPlayerItemAdded(Form akBaseObject, ObjectReference akOwner, ObjectReference akSourceContainer, int aeAcquireType)`

Event is received if the object the alias points at receives the event

Event from actor

Received when the player gains an item in their inventory

aeAcquireType is one of the following:

0: None

1: Steal

2: Buy

3: Pickpocket

4: Pickup

5: Container

6: Dead body

([TOC](#table-of-contents))

##### Event: OnPlayerLoadGame
`Event OnPlayerLoadGame()`

Event is received if the object the alias points at receives the event

Event from actor

Received immediately after the player has loaded a save game. A good time to check for additional content.

([TOC](#table-of-contents))

##### Event: OnPlayerLoiteringBegin
`Event OnPlayerLoiteringBegin()`

Event is received if the object the alias points at receives the event

Event from actor

Received when player starts loitering

([TOC](#table-of-contents))

##### Event: OnPlayerLoiteringEnd
`Event OnPlayerLoiteringEnd()`

Event is received if the object the alias points at receives the event

Event from actor

Received when player stops loitering

([TOC](#table-of-contents))

##### Event: OnPlayerModArmorWeapon
`Event OnPlayerModArmorWeapon(Form akBaseObject, ObjectMod akModBaseObject)`

Event is received if the object the alias points at receives the event

Event from actor

Received when player mods a weapon or armor in the menu.

([TOC](#table-of-contents))

##### Event: OnPlayerModRobot
`Event OnPlayerModRobot(Actor akRobot, ObjectMod akModBaseObject)`

Event is received if the object the alias points at receives the event

Event from actor

Received when the player mods a robot

([TOC](#table-of-contents))

##### Event: OnPlayerMurderActor
`Event OnPlayerMurderActor(ObjectReference akVictim, Location akLocation, bool aeCrime )`

Event is received if the object the alias points at receives the event

Event from actor

Event that is triggered when the player murders someone.

([TOC](#table-of-contents))

##### Event: OnPlayerPayFine
`Event OnPlayerPayFine(ObjectReference akGuard, Form akFaction, int aeCrimeGold)`

Event is received if the object the alias points at receives the event

Event from actor

Event that is triggered when the player pays fine.

([TOC](#table-of-contents))

##### Event: OnPlayerSellShip
`Event OnPlayerSellShip(SpaceshipReference akShip)`

Event is received if the object the alias points at receives the event

Event from actor

Event that is triggered when the player sells a ship

([TOC](#table-of-contents))

##### Event: OnPlayerSwimming
`Event OnPlayerSwimming()`

Event is received if the object the alias points at receives the event

Event from actor

Received when player starts swimming

([TOC](#table-of-contents))

##### Event: OnPlayerTrespass
`Event OnPlayerTrespass(ObjectReference akVictim, Location akLocation, bool aeCrime)`

Event is received if the object the alias points at receives the event

Event from actor

Event that is triggered when the player trespassing.

([TOC](#table-of-contents))

##### Event: OnPlayerUseWorkBench
`Event OnPlayerUseWorkBench( ObjectReference akWorkBench)`

Event is received if the object the alias points at receives the event

Event from actor

Received when player uses a workbench

([TOC](#table-of-contents))

##### Event: OnRaceSwitchComplete
`Event OnRaceSwitchComplete()`

Event is received if the object the alias points at receives the event

Event from actor

Event received when this actor finishes changing its race

([TOC](#table-of-contents))

##### Event: OnRecoverFromBleedout
`Event OnRecoverFromBleedout()`

Event is received if the object the alias points at receives the event

Event from actor

Event received when an actor exits bleedout. (only if this alias points at an actor)

([TOC](#table-of-contents))

##### Event: OnSit
`Event OnSit(ObjectReference akFurniture)`

Event is received if the object the alias points at receives the event

Event from actor

Event that is triggered when this actor sits in the furniture

([TOC](#table-of-contents))

##### Event: OnSpeechChallengeAvailable
`Event OnSpeechChallengeAvailable(ObjectReference akSpeaker)`

Event is received if the object the alias points at receives the event

Event from actor

Received when player gets a speech challenge in dialogue

([TOC](#table-of-contents))

##### Event: OnPlayerPlanetSurveyComplete
`Event OnPlayerPlanetSurveyComplete(Planet akPlanet)`

Event is received if the object the alias points at receives the event

Event from actor

Received when player completely surveyed a planet

([TOC](#table-of-contents))

##### Event: OnPlayerScannedObject
`Event OnPlayerScannedObject(ObjectReference akScannedRef)`

Event is received if the object the alias points at receives the event

Event from actor

Received by the player when they scan an object

([TOC](#table-of-contents))

##### Event: OnShipDock
`Event OnShipDock(bool abComplete, SpaceshipReference akDocking, SpaceshipReference akParent)`

Event is received if the object the alias points at receives the event

Event from spaceship

Event received when a ship initiates and completes docking with a parent

([TOC](#table-of-contents))

##### Event: OnShipFarTravel
`Event OnShipFarTravel(Location aDepartureLocation, Location aArrivalLocation, int aState)`

Event is received if the object the alias points at receives the event

Event from spaceship

Event received when a ship begins or ends far travel - State { Departure = 0, Arrival = 1 }

([TOC](#table-of-contents))

##### Event: OnShipGravJump
`Event OnShipGravJump(Location aDestination, int aState)`

Event is received if the object the alias points at receives the event

Event from spaceship

Event received when a ship grav jump event occurs - State { Initiated = 0, AnimStarted = 1, Completed = 2, Failed = 3 }

([TOC](#table-of-contents))

##### Event: OnShipLanding
`Event OnShipLanding(bool abComplete)`

Event is received if the object the alias points at receives the event

Event from spaceship

Event received when a ship initiates or completes landing

([TOC](#table-of-contents))

##### Event: OnShipRampDown
`Event OnShipRampDown()`

Event is received if the object the alias points at receives the event

Event from spaceship

Event received when a ship's landing ramp has lowered all the way and connected to the surrounding navmesh

([TOC](#table-of-contents))

##### Event: OnShipScan
`Event OnShipScan(Location aPlanet, ObjectReference[] aMarkersArray)`

Event is received if the object the alias points at receives the event

Event from spaceship

Event that is triggered when the player scans a planet with this spaceship

([TOC](#table-of-contents))

##### Event: OnShipSystemPowerChange
`Event OnShipSystemPowerChange(ActorValue akSystem,bool abAddPower, bool abDamageRelated)`

Event is received if the object the alias points at receives the event

Event from spaceship

Event received when a ship system adds or removes power

([TOC](#table-of-contents))

##### Event: OnShipTakeOff
`Event OnShipTakeOff(bool abComplete)`

Event is received if the object the alias points at receives the event

Event from spaceship

Event received when a ship initiates or completes takeoff

([TOC](#table-of-contents))

##### Event: OnShipUndock
`Event OnShipUndock(bool abComplete, SpaceshipReference akUndocking, SpaceshipReference akParent)`

Event is received if the object the alias points at receives the event

Event from spaceship

Event received when a ship initiates or completes undocking with a parent

([TOC](#table-of-contents))

##### Event: OnShipSystemDamaged
`Event OnShipSystemDamaged(ActorValue akSystem, int aBlocksLost, bool aElectromagneticDamage, bool aFullyDamaged)`

Event is received if the object the alias points at receives the event

Event from spaceship

Event that is triggered when one of this spaceship's systems loses a power block due to damage

([TOC](#table-of-contents))

##### Event: OnShipSystemRepaired
`Event OnShipSystemRepaired(ActorValue akSystem, int aBlocksGained, bool aElectromagneticDamage)`

Event is received if the object the alias points at receives the event

Event from spaceship

Event that is triggered when one of this spaceship's systems gains a power block due to being repaired

([TOC](#table-of-contents))

##### Event: OnShipRefueled
`Event OnShipRefueled(int aFuelAdded)`

Event is received if the object the alias points at receives the event

Event from spaceship

Event that is triggered when fuel has been added to this spaceship

([TOC](#table-of-contents))

##### Event: OnShipBought
`Event OnShipBought()`

Event is received if the object the alias points at receives the event

Event from spaceship

Event this is triggered when a ship is bought

([TOC](#table-of-contents))

##### Event: OnShipSold
`Event OnShipSold()`

Event is received if the object the alias points at receives the event

Event from spaceship

Event this is triggered when a ship is sold

([TOC](#table-of-contents))

##### Function: ApplyToRef (Native)
`Function ApplyToRef(ObjectReference akRef) native`

Applies the alias data to the given ref without putting the ref in the alias

([TOC](#table-of-contents))

##### Function: Clear (Native)
`Function Clear() native`

Clears the alias - fails on non-optional aliases

([TOC](#table-of-contents))

##### Function: GetReference (Native)
`ObjectReference Function GetReference() native`

Get the object reference this alias refers to

([TOC](#table-of-contents))

##### Function: ForceRefTo (Native)
`Function ForceRefTo(ObjectReference akNewRef) native`

Forces this alias to use the specified reference

([TOC](#table-of-contents))

##### Function: ForceRefIfEmpty
`bool Function ForceRefIfEmpty(ObjectReference akNewRef)`

returns true if the alias now holds the passed reference, false if it was already filled.

([TOC](#table-of-contents))

##### Function: GetActorReference
`Actor Function GetActorReference()`

Autocast to Actor

([TOC](#table-of-contents))

##### Function: GetRef
`ObjectReference Function GetRef()`

Convenience function

([TOC](#table-of-contents))

##### Function: GetActorRef
`Actor Function GetActorRef()`

Convenience function

([TOC](#table-of-contents))

##### Function: GetShipReference
`SpaceshipReference Function GetShipReference()`

Autocast to ShipReference

([TOC](#table-of-contents))

##### Function: GetShipRef
`SpaceshipReference Function GetShipRef()`

Autocast to ShipReference

([TOC](#table-of-contents))

##### Function: RemoveFromRef (Native)
`Function RemoveFromRef(ObjectReference akRef) native`

Removes this data alias from the given ref

([TOC](#table-of-contents))

##### Function: TryToAddToFaction
`bool Function TryToAddToFaction(Faction FactionToAddTo)`

Attempt to add to given faction

([TOC](#table-of-contents))

##### Function: TryToRemoveFromFaction
`bool Function TryToRemoveFromFaction(Faction FactionToRemoveFrom)`

Attempt to remove from given faction

([TOC](#table-of-contents))

##### Function: TryToStopCombat
`bool Function TryToStopCombat()`

Attempt to stop combat

([TOC](#table-of-contents))

##### Function: TryToDisable
`bool Function TryToDisable()`

Attempt to disable this reference

([TOC](#table-of-contents))

##### Function: TryToDisableNoWait
`bool Function TryToDisableNoWait()`

Attempt to disable this reference without waiting

([TOC](#table-of-contents))

##### Function: TryToEnable
`bool Function TryToEnable()`

Attempt to enable this reference

([TOC](#table-of-contents))

##### Function: TryToEnableNoWait
`bool Function TryToEnableNoWait()`

Attempt to enable this reference without waiting

([TOC](#table-of-contents))

##### Function: TryToEvaluatePackage
`bool Function TryToEvaluatePackage()`

Attempt to evaluate package

([TOC](#table-of-contents))

##### Function: TryToKill
`bool Function TryToKill(ObjectReference akKiller = NONE)`

attempt to kill this reference with the given killer

([TOC](#table-of-contents))

##### Function: TryToMoveTo
`bool Function TryToMoveTo(ObjectReference RefToMoveTo)`

attempt to move this reference to the given reference

([TOC](#table-of-contents))

##### Function: TryToReset
`bool Function TryToReset()`

attempt to reset this reference

([TOC](#table-of-contents))

##### Function: TryToClear
`bool Function TryToClear()`

attempt to clear this reference

([TOC](#table-of-contents))

##### Function: TryToDelete
`bool Function TryToDelete()`

attempt to delete this reference

([TOC](#table-of-contents))

##### Function: TryToGetCurrentLocation
`location Function TryToGetCurrentLocation()`

attempt to get the current location of this reference

([TOC](#table-of-contents))

##### Function: TryToGetActorValue
`float Function TryToGetActorValue(ActorValue ActorValueToGet)`

attempt to get the specified actor value from this reference (wrapper for `TryToGetValue`)

([TOC](#table-of-contents))

##### Function: TryToGetValue
`float Function TryToGetValue(ActorValue akAV)`

attempt to get the specified actor value from this reference

([TOC](#table-of-contents))

##### Function: TryToSetActorValue
`bool Function TryToSetActorValue(ActorValue ValueToSet, float afValue)`

attempt to set the specified actor value on this reference to the given value (wrapper for `TryToSetValue`)

([TOC](#table-of-contents))

##### Function: TryToSetValue
`bool Function TryToSetValue(ActorValue akAV, float afValue)`

attempt to set the specified actor value on this reference to the given value

([TOC](#table-of-contents))

##### Function: TryIsLocked
`bool Function TryIsLocked()`

attempt to determine if this reference is locked

([TOC](#table-of-contents))

##### Function: TryToSetPlayerResistingArrest
`Function TryToSetPlayerResistingArrest()`

attempt to set that the player is resisting arrest on this reference (Actor or SpaceshipReference)

([TOC](#table-of-contents))

##### Function: TryToSendPlayerToJail
`Function TryToSendPlayerToJail(bool abRemoveInventory = true, bool abRealJail = false)`

attempt to send the player to jail

([TOC](#table-of-contents))

##### Function: TryToPlayerPayFine
`Function TryToPlayerPayFine(bool abRemoveStolenItems = true, bool abGoToJail = true)`

attempt to have player pay their fine

([TOC](#table-of-contents))

##### Function: TryToSendSmugglingAlarm
`Function TryToSendSmugglingAlarm()`

attempt to have this reference (SpaceshipReference) send a smuggling alarm

does nothing if called on actor

([TOC](#table-of-contents))

##### Function: TryToInstantDock
`bool Function TryToInstantDock(ReferenceAlias akTarget)`

attempt to have this reference (SpaceshipReference) instantly dock with the given reference

Does nothing if either reference is an actor.

([TOC](#table-of-contents))

##### Function: TryToMoveNear
`bool Function TryToMoveNear(ObjectReference akTarget, int positionVal=0, int distanceVal=0, int facingVal=0)`

attempt to move this reference near to the given reference

([TOC](#table-of-contents))

##### Function: TryToGetCrimeFaction
`Faction Function TryToGetCrimeFaction()`

attempt to get crime faction

([TOC](#table-of-contents))

##### Function: ClearAndRefillAlias
`Function ClearAndRefillAlias()`

first clears, then refills alias (so alias will be empty if nothing is found by RefillAlias call)

([TOC](#table-of-contents))

### Script: Form
`Scriptname Form extends ScriptObject Native Hidden`

([TOC](#table-of-contents))

#### Function: GetFormID (Native)
`Int Function GetFormID() native`

Returns the formID for this object

([TOC](#table-of-contents))

#### Function: GetFormEditorID (Native)
`string Function GetFormEditorID() native DebugOnly`

Returns the editor formID string for this object

([TOC](#table-of-contents))

#### Function: GetGoldValue (Native)
`int Function GetGoldValue() native`

Obtains this form's value in gold. Will return -1 if the form doesn't have any value (like a quest)

([TOC](#table-of-contents))

#### Function: GetWeight (Native)
`float Function GetWeight() native`

Get this object's weight

([TOC](#table-of-contents))

#### Function: HasKeyword (Native)
`bool Function HasKeyword(Keyword akKeyword) native`

Returns if this form has the specified keyword attached

([TOC](#table-of-contents))

#### Function: HasKeywordInFormList (Native)
`bool Function HasKeywordInFormList(FormList akKeywordList) native`

Returns if this form has any of the keywords in the list attached

([TOC](#table-of-contents))

#### Function: PlayerKnows (Native)
`bool Function PlayerKnows() native`

Is the "Known" flag set for this form?

([TOC](#table-of-contents))

#### Function: StartObjectProfiling (Native)
`Function StartObjectProfiling() native debugOnly`

Turns on profiling for this specific object and all scripts attached to it - setting doesn't persist across saves

Will do nothing on release console builds, and if the Papyrus:bEnableProfiling ini setting is off

([TOC](#table-of-contents))

#### Function: StopObjectProfiling (Native)
`Function StopObjectProfiling() native debugOnly`

Turns off profiling for this specific object and all scripts attached to it - setting doesn't persist across saves

Will do nothing on release console builds, and if the Papyrus:bEnableProfiling ini setting is off

([TOC](#table-of-contents))

#### Script: Action
`Scriptname Action extends Form Native Hidden`

([TOC](#table-of-contents))

#### Script: Activator
`Scriptname Activator extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: IsRadio (Native)
`bool Function IsRadio() Native`

Returns whether this activator is a radio or not

([TOC](#table-of-contents))

##### Script: Flora
`Scriptname Flora extends Activator Native Hidden`

([TOC](#table-of-contents))

##### Script: Furniture
`Scriptname Furniture extends Activator Native Hidden`

([TOC](#table-of-contents))

###### Function: GetAssociatedForm (Native)
`Form Function GetAssociatedForm() native`

Get the associated form for this furniture

([TOC](#table-of-contents))

##### Script: TalkingActivator
`Scriptname TalkingActivator extends Activator Native Hidden`

([TOC](#table-of-contents))

#### Script: ActorBase
`Scriptname ActorBase extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: GetClass (Native)
`Class Function GetClass() native`

Returns this actor's class

([TOC](#table-of-contents))

##### Function: GetDeadCount (Native)
`int Function GetDeadCount() native`

Gets the number of actors of this type that have been killed

([TOC](#table-of-contents))

##### Function: GetGiftFilter (Native)
`FormList Function GetGiftFilter() native`

Returns this actor's gift filter formlist

([TOC](#table-of-contents))

##### Function: GetRace (Native)
`Race Function GetRace() native`

Returns this actor's race

([TOC](#table-of-contents))

##### Function: GetLevel (Native)
`int Function GetLevel() native`

Obtains this actor's level

([TOC](#table-of-contents))

##### Function: GetLevelExact (Native)
`int Function GetLevelExact() native`

Obtains this actor's level, unmodified by matching the player's level

([TOC](#table-of-contents))

##### Function: GetSex (Native)
`int Function GetSex() native`

Returns this actor's sex. Values for sex are:

-1 - None

0 - Male

1 - Female

([TOC](#table-of-contents))

##### Function: GetPronoun (Native)
`int Function GetPronoun() native`

Returns this actor's pronoun.

0 - Unselected

1 - He_Him

2 - She_Her

3 - They_Them

([TOC](#table-of-contents))

##### Function: DeriveGeneticParentAppearance (Native)
`Function DeriveGeneticParentAppearance(ActorBase akChildSourceToDeriveFrom) native`

Copy some genetic parent appearance related information from another npc to the calling npc

([TOC](#table-of-contents))

##### Function: GetUniqueActor (Native)
`Actor Function GetUniqueActor() native`

Gets the actor for this UniqueNPC

([TOC](#table-of-contents))

##### Function: IsEssential (Native)
`bool Function IsEssential() native`

Is this actor essential?

([TOC](#table-of-contents))

##### Function: IsProtected (Native)
`bool Function IsProtected() native`

Is this actor protected (can only be killed by player)?

([TOC](#table-of-contents))

##### Function: IsUnique (Native)
`bool Function IsUnique() native`

Is this actor base unique?

([TOC](#table-of-contents))

##### Function: SetEssential (Native)
`Function SetEssential(bool abEssential = true) native`

Sets this actor as essential or not - if set as essential, will UNSET protected

([TOC](#table-of-contents))

##### Function: SetProtected (Native)
`Function SetProtected(bool abProtected = true) native`

Sets this actor as protected or not - if set as protected, will UNSET essential

([TOC](#table-of-contents))

##### Function: SetOutfit (Native)
`Function SetOutfit( Outfit akOutfit, bool abSleepOutfit = false ) native`

Sets the actors outfit

([TOC](#table-of-contents))

#### Script: ActorValue
`Scriptname ActorValue extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: GetResource (Native)
`Resource Function GetResource() native`

Get the Resource this ActorValue is pointing to, if any

([TOC](#table-of-contents))

#### Script: AffinityEvent
`Scriptname AffinityEvent extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: Send (Native)
`Function Send(ObjectReference akTarget = None) native`

Run the affinity event on all actors that qualify

([TOC](#table-of-contents))

##### Function: Reset (Native)
`Function Reset() native`

Reset the flags and timers on this affinity event

([TOC](#table-of-contents))

#### Script: Ammo
`Scriptname Ammo extends Form Native Hidden`

([TOC](#table-of-contents))

#### Script: Armor
`Scriptname Armor extends Form Native Hidden`

([TOC](#table-of-contents))

#### Script: AssociationType
`Scriptname AssociationType extends Form Native Hidden`

([TOC](#table-of-contents))

#### Script: Book
`Scriptname Book Extends Form Native Hidden`

([TOC](#table-of-contents))

#### Script: CameraShot
`Scriptname CameraShot extends Form Native Hidden`

([TOC](#table-of-contents))

#### Script: Cell
`Scriptname Cell extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: EnableFastTravel (Native)
`Function EnableFastTravel(bool abEnable = true) native`

Enables/disables fast travel in this cell

([TOC](#table-of-contents))

##### Function: GetActorOwner (Native)
`ActorBase Function GetActorOwner() native`

Gets the actor that owns this cell (or none if not owned by an actor)

([TOC](#table-of-contents))

##### Function: GetFactionOwner (Native)
`Faction Function GetFactionOwner() native`

Gets the faction that owns this cell (or none if not owned by a faction)

([TOC](#table-of-contents))

##### Function: GetParentRef (Native)
`ObjectReference Function GetParentRef() native`

Gets the 'parent' reference for this cell, if any (i.e. the ship if this is a ship interior/exterior cell)

([TOC](#table-of-contents))

##### Function: IsAttached (Native)
`bool Function IsAttached() native`

Is this cell "attached"? (In the loaded area)

([TOC](#table-of-contents))

##### Function: IsInterior (Native)
`bool Function IsInterior() native`

Is this cell an interior cell?

([TOC](#table-of-contents))

##### Function: IsLoaded (Native)
`bool Function IsLoaded() native`

Is this cell currently loaded?

([TOC](#table-of-contents))

##### Function: Reset (Native)
`Function Reset() native`

Flags the cell for reset on next load

([TOC](#table-of-contents))

##### Function: SetActorOwner (Native)
`Function SetActorOwner(ActorBase akActor) native`

Sets this cell's owner as the specified actor

([TOC](#table-of-contents))

##### Function: SetFactionOwner (Native)
`Function SetFactionOwner(Faction akFaction) native`

Sets this cell's owner as the specified faction

([TOC](#table-of-contents))

##### Function: SetFogColor (Native)
`Function SetFogColor(int aiNearRed, int aiNearGreen, int aiNearBlue, int aiFarRed, int aiFarGreen, int aiFarBlue) native`

Sets the fog color for this cell (interior, non-sky-lit cells only)

([TOC](#table-of-contents))

##### Function: SetFogPlanes (Native)
`Function SetFogPlanes(float afNear, float afFar) native`

Adjusts this cell's fog near and far planes (interior, non-sky-lit cells only)

([TOC](#table-of-contents))

##### Function: SetFogPower (Native)
`Function SetFogPower(float afPower) native`

Sets the fog power for this cell (interior, non-sky-lit cells only)

([TOC](#table-of-contents))

##### Function: SetGravityScale (Native)
`Function SetGravityScale(float aScale) native`

Sets the gravity scale on this cell, works on interiors only

([TOC](#table-of-contents))

##### Function: SetOffLimits (Native)
`Function SetOffLimits(bool abOffLimits = true) native`

Sets the OffLimits flag on this cell

([TOC](#table-of-contents))

##### Function: SetPublic (Native)
`Function SetPublic(bool abPublic = true) native`

Sets this cell as public or private

([TOC](#table-of-contents))

#### Script: Challenge
`Scriptname Challenge extends Form native hidden`

([TOC](#table-of-contents))

##### Function: StartPlayerChallenge (Native)
`Function StartPlayerChallenge() native`

Starts the specified challenge on the player

([TOC](#table-of-contents))

#### Script: Class
`Scriptname Class extends Form Native Hidden`

([TOC](#table-of-contents))

#### Script: CombatStyle
`Scriptname CombatStyle extends Form Native Hidden`

([TOC](#table-of-contents))

#### Script: ConditionForm
`Scriptname ConditionForm extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: IsTrue (Native)
`bool Function IsTrue(ObjectReference akRefObject = None, ObjectReference akTargetObject = None) native`

IsTrue this condition function on on a refobject and target object returns true if the condition is true

([TOC](#table-of-contents))

#### Script: Container
`Scriptname Container extends Form Native Hidden`

([TOC](#table-of-contents))

#### Script: Curve
`Scriptname Curve extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: HasValueAt (Native)
`bool Function HasValueAt(float afInput) native`

Check whether the given input value is within the range of defined values for the curve.

([TOC](#table-of-contents))

##### Function: GetValueAt (Native)
`float Function GetValueAt(float afInput) native`

Get the output value for the given input value.

NOTE: Depending on the curve edge setting, it will clamp/mirror/repeat. Use HasValueAt first if you need to check if its within range.

([TOC](#table-of-contents))

##### Function: GetValues
`float[] Function GetValues(float[] Inputs)`

gets an array of values for a given array of inputs

([TOC](#table-of-contents))

#### Script: Door
`Scriptname Door extends Form Native Hidden`

([TOC](#table-of-contents))

#### Script: EffectShader
`Scriptname EffectShader extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: Play (Native)
`Function Play(ObjectReference akObject, float afDuration = -1.0) native`

Starts playing this effect shader on the specified object for the specified length of time in seconds. Negative values indicate "infinite"

([TOC](#table-of-contents))

##### Function: Stop (Native)
`Function Stop(ObjectReference akObject) native`

Stops playing this effect shader on the specified object

([TOC](#table-of-contents))

#### Script: Enchantment
`Scriptname Enchantment extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: IsHostile (Native)
`bool Function IsHostile() native`

Is this enchantment classified as hostile?

([TOC](#table-of-contents))

#### Script: Explosion
`Scriptname Explosion extends Form Native Hidden`

([TOC](#table-of-contents))

#### Script: Faction
`Scriptname Faction extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: CanPayCrimeGold (Native)
`bool Function CanPayCrimeGold() native`

Checks to see if the player can pay the crime gold for this faction

([TOC](#table-of-contents))

##### Function: GetCrimeGold (Native)
`int Function GetCrimeGold() native`

Gets the amount of gold the player is to pay to this faction for crimes

([TOC](#table-of-contents))

##### Function: GetCrimeGoldNonViolent (Native)
`int Function GetCrimeGoldNonViolent() native`

Gets the amount of gold the player is to pay to this faction for non-violent crimes

([TOC](#table-of-contents))

##### Function: GetCrimeGoldViolent (Native)
`int Function GetCrimeGoldViolent() native`

Gets the amount of gold the player is to pay to this faction for violent crimes

([TOC](#table-of-contents))

##### Function: GetInfamy (Native)
`int Function GetInfamy() native`

Get the player's "infamy" with this faction (accumulated crime gold)

([TOC](#table-of-contents))

##### Function: GetInfamyNonViolent (Native)
`int Function GetInfamyNonViolent() native`

Get the player's "non-violent infamy" with this faction (accumulated non-violent crime gold)

([TOC](#table-of-contents))

##### Function: GetInfamyViolent (Native)
`int Function GetInfamyViolent() native`

Get the player's "violent infamy" with this faction (accumulated violent crime gold)

([TOC](#table-of-contents))

##### Function: GetFactionReaction (Native)
`int Function GetFactionReaction(Actor akOther) native`

Obtains this factions faction-based reaction to the actor

0 - Neutral

1 - Enemy

2 - Ally

3 - Friend

([TOC](#table-of-contents))

##### Function: GetStolenItemValueCrime (Native)
`int Function GetStolenItemValueCrime() native`

Obtains the value of all items stolen by the player from this faction that was witnessed

([TOC](#table-of-contents))

##### Function: GetStolenItemValueNoCrime (Native)
`int Function GetStolenItemValueNoCrime() native`

Obtains the value of all items stolen by the player from this faction that was NOT witnessed

([TOC](#table-of-contents))

##### Function: IsFactionInCrimeGroup (Native)
`bool Function IsFactionInCrimeGroup(Faction akOther) native`

Is the passed in faction in this faction's crime group

([TOC](#table-of-contents))

##### Function: IsPlayerEnemy (Native)
`bool Function IsPlayerEnemy() native`

Is the player an enemy of this faction?

([TOC](#table-of-contents))

##### Function: IsPlayerExpelled (Native)
`bool Function IsPlayerExpelled() native`

Is the player expelled from this faction?

([TOC](#table-of-contents))

##### Function: ModCrimeGold (Native)
`Function ModCrimeGold(int aiAmount, bool abViolent = false) native`

Modifies the amount of crime gold for this faction - violent or non-violent

([TOC](#table-of-contents))

##### Function: PlayerPayCrimeGold (Native)
`Function PlayerPayCrimeGold(bool abRemoveStolenItems = true, bool abGoToJail = true) native`

Has the player pay the crime gold for this faction

([TOC](#table-of-contents))

##### Function: RemovePlayerContrabandAndStolenItems (Native)
`Function RemovePlayerContrabandAndStolenItems() native`

Removes all contraband and stolen items from the player, their ship, and crew

([TOC](#table-of-contents))

##### Function: SendAssaultAlarm (Native)
`Function SendAssaultAlarm() native`

Finds a nearby NPC in this faction and has them behave as if assaulted

([TOC](#table-of-contents))

##### Function: SendPlayerToJail (Native)
`Function SendPlayerToJail(bool abRemoveInventory = true, bool abRealJail = false) native`

Sends the player to this faction's jail - removing inventory if requested, and to a "real" jail or not

([TOC](#table-of-contents))

##### Function: SendPlayerToJailEx (Native)
`Function SendPlayerToJailEx(bool abRemoveInventory = true, bool abRealJail = false, bool abSilent = false) native`

Sends the player to this faction's jail - removing inventory if requested, and to a "real" jail or not, silent param to suppress warnings

([TOC](#table-of-contents))

##### Function: SetAlly (Native)
`Function SetAlly(Faction akOther, bool abSelfIsFriendToOther = false, bool abOtherIsFriendToSelf = false) native`

Sets this faction and the other as allies or friends - if the friend booleans are true - the specified one-way relationship is a friend instead of an ally

([TOC](#table-of-contents))

##### Function: SetCrimeGold (Native)
`Function SetCrimeGold(int aiGold) native`

Sets the non-violent crime gold on this faction

([TOC](#table-of-contents))

##### Function: SetCrimeGoldViolent (Native)
`Function SetCrimeGoldViolent(int aiGold) native`

Sets the violent crime gold on this faction

([TOC](#table-of-contents))

##### Function: SetEnemy (Native)
`Function SetEnemy(Faction akOther, bool abSelfIsNeutralToOther = false, bool abOtherIsNeutralToSelf = false) native`

Sets this faction and the other as enemies or neutral - if the friend booleans are true - the specified one-way relationship is a neutral instead of an enemy

([TOC](#table-of-contents))

##### Function: SetPlayerEnemy (Native)
`Function SetPlayerEnemy(bool abIsEnemy = true) native`

Sets or clears the player as an enemy of this faction

([TOC](#table-of-contents))

##### Function: SetPlayerExpelled (Native)
`Function SetPlayerExpelled(bool abIsExpelled = true) native`

Sets or clears the expelled flag for this faction on the player

([TOC](#table-of-contents))

#### Script: FormList
`Scriptname FormList extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: AddForm (Native)
`Function AddForm(Form apForm) native`

Adds the given form to this form list

([TOC](#table-of-contents))

##### Function: Find (Native)
`int Function Find(Form apForm) native`

Finds the specified form in the form list and returns its index.

If not found, returns a negative number

([TOC](#table-of-contents))

##### Function: GetSize (Native)
`int Function GetSize() native`

Returns the number of forms in the list

([TOC](#table-of-contents))

##### Function: GetArray (Native)
`Form[] Function GetArray(bool abRecurse = false) native`

Returns an array of all forms in the list, with a parameter to specify whether to recurse one level

([TOC](#table-of-contents))

##### Function: GetAt (Native)
`Form Function GetAt(int aiIndex) native`

Returns the form at index 'aiIndex' in the list

([TOC](#table-of-contents))

##### Function: HasForm (Native)
`bool Function HasForm(Form akForm) native`

Queries the form list to see if it contains the passed in form

([TOC](#table-of-contents))

##### Function: RemoveAddedForm (Native)
`Function RemoveAddedForm(Form apForm) native`

Removes the given added form from this form list

([TOC](#table-of-contents))

##### Function: Revert (Native)
`Function Revert() native`

Removes all script added forms from this form list

([TOC](#table-of-contents))

#### Script: GameplayOption
`Scriptname GameplayOption extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: GetRewardValue (Native)
`float Function GetRewardValue() native`

Get the numerical reward value for the current setting on this GameplayOption form

([TOC](#table-of-contents))

##### Function: GetValue (Native)
`float Function GetValue() native`

Get this GameplayOption form's current value. Bools are represented as 0 for false and non-zero for true

([TOC](#table-of-contents))

##### Function: GetXPTotal (Native) (Global)
`float Function GetXPTotal() native global`

Get the sum total of all active XP modifiers across every GameplayOption

([TOC](#table-of-contents))

##### Function: NotifyGameplayOptionUpdateFinished (Native) (Global)
`Function NotifyGameplayOptionUpdateFinished() native global`

Notify native code that script is finished updating values related to GameplayOptions and may operate on the new state

([TOC](#table-of-contents))

#### Script: GlobalVariable
`Scriptname GlobalVariable extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: GetValue (Native)
`float Function GetValue() native`

Obtains the global's current value

([TOC](#table-of-contents))

##### Function: SetValue (Native)
`Function SetValue(float afNewValue) native`

Sets the global's current value

([TOC](#table-of-contents))

##### Function: GetValueInt
`int Function GetValueInt()`

convenience functions for ints

([TOC](#table-of-contents))

##### Function: SetValueInt
`Function SetValueInt(int aiNewValue)`

Sets the global's current value

([TOC](#table-of-contents))

##### Function: Mod
`float Function Mod(float afHowMuch)`

the threadsafe way to modify a global variable

([TOC](#table-of-contents))

##### Property: Value
`float Property Value Hidden`
; Easy access to the global's value

([TOC](#table-of-contents))

###### Function: get
`float Function get()`

([TOC](#table-of-contents))

###### Function: set
`Function set(float afValue)`

([TOC](#table-of-contents))

#### Script: Hazard
`Scriptname Hazard extends Form Native Hidden`

([TOC](#table-of-contents))

#### Script: HeadPart
`Scriptname HeadPart Extends Form Native Hidden`

([TOC](#table-of-contents))

#### Script: Idle
`Scriptname Idle extends Form Native Hidden`

([TOC](#table-of-contents))

#### Script: IdleMarker
`Scriptname IdleMarker extends Form Native Hidden`

([TOC](#table-of-contents))

#### Script: ImageSpaceModifier
`Scriptname ImageSpaceModifier extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: Apply (Native)
`Function Apply(float afStrength = 1.0) native`

Applies this modifier with the specified strength (which is not clamped)

([TOC](#table-of-contents))

##### Function: ApplyCrossFade (Native)
`Function ApplyCrossFade(float afFadeDuration = 1.0) native`

Adds this modifier to the cross-fade chain, removing the previous modifier, and fading over the specified duration (in seconds)

([TOC](#table-of-contents))

##### Function: PopTo (Native)
`Function PopTo(ImageSpaceModifier akNewModifier, float afStrength = 1.0) native`

Disables this modifier and enables the new one, "popping" between the two. Will not interrupt any running cross-fade (if the modifiers aren't the ones fading)

([TOC](#table-of-contents))

##### Function: Remove (Native)
`Function Remove() native`

Removes this modifier

([TOC](#table-of-contents))

##### Function: RemoveCrossFade (Native) (Global)
`Function RemoveCrossFade(float afFadeDuration = 1.0) native global`

Removes whatever modifier is on the cross-fade chain, fading it out

([TOC](#table-of-contents))

#### Script: ImpactDataSet
`Scriptname ImpactDataSet extends Form Native Hidden`

([TOC](#table-of-contents))

#### Script: Ingredient
`Scriptname Ingredient extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: IsHostile (Native)
`bool Function IsHostile() native`

Is this ingredient classified as hostile?

([TOC](#table-of-contents))

##### Function: LearnEffect (Native)
`Function LearnEffect(int aiIndex) native`

Flags the effect with the given 0 based index as known by the player

([TOC](#table-of-contents))

##### Function: LearnNextEffect (Native)
`int Function LearnNextEffect() native`

Flags the next unknown effect as known by the player, returning index of effect learned

([TOC](#table-of-contents))

##### Function: LearnAllEffects (Native)
`Function LearnAllEffects() native`

Flags the all effects as known by the player

([TOC](#table-of-contents))

#### Script: InstanceNamingRules
`Scriptname InstanceNamingRules extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: MergeWith (Native)
`Function MergeWith(InstanceNamingRules aSource) native`

([TOC](#table-of-contents))

#### Script: Keyword
`Scriptname Keyword Extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: SendStoryEvent (Native)
`Function SendStoryEvent(Location akLoc = None, ObjectReference akRef1 = None, ObjectReference akRef2 = None, int aiValue1 = 0, int aiValue2 = 0) native`

Sends this keyword as a story event to the story manager

([TOC](#table-of-contents))

##### Function: SendStoryEventAndWait (Native)
`Quest[] Function SendStoryEventAndWait(Location akLoc = None, ObjectReference akRef1 = None, ObjectReference akRef2 = None, int aiValue1 = 0, int aiValue2 = 0) native`

Sends this keyword as a story event to the story manager and waits for it to be processed. Returns the array of quests that were started if any.

([TOC](#table-of-contents))

##### Script: LocationRefType
`Scriptname LocationRefType extends Keyword Native Hidden`

([TOC](#table-of-contents))

#### Script: LegendaryItem
`Scriptname LegendaryItem extends Form native hidden`

([TOC](#table-of-contents))

#### Script: LeveledActor
`Scriptname LeveledActor extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: AddForm (Native)
`Function AddForm(Form apForm, int aiLevel) native`

Adds the given count of the given form to the under the given level in this leveled list

([TOC](#table-of-contents))

##### Function: Revert (Native)
`Function Revert() native`

Removes all script added forms from this leveled list

([TOC](#table-of-contents))

#### Script: LeveledItem
`Scriptname LeveledItem extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: AddForm (Native)
`Function AddForm(Form apForm, int aiLevel, int aiCount) native`

Adds the given count of the given form to the under the given level in this leveled list

([TOC](#table-of-contents))

##### Function: Revert (Native)
`Function Revert() native`

Removes all script added forms from this leveled list

([TOC](#table-of-contents))

#### Script: LeveledSpaceshipBase
`Scriptname LeveledSpaceshipBase extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: AddForm (Native)
`Function AddForm(SpaceshipBase apSpaceship, int aiLevel) native`

Adds the given spaceship to this leveled list under the given level

([TOC](#table-of-contents))

##### Function: Revert (Native)
`Function Revert() native`

Removes all script added forms from this leveled list

([TOC](#table-of-contents))

#### Script: LeveledSpell
`Scriptname LeveledSpell extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: AddForm (Native)
`Function AddForm(Form apForm, int aiLevel) native`

Adds the given count of the given form to the under the given level in this leveled list

([TOC](#table-of-contents))

##### Function: Revert (Native)
`Function Revert() native`

Removes all script added forms from this leveled list

([TOC](#table-of-contents))

#### Script: Light
`Scriptname Light extends Form Native Hidden`

([TOC](#table-of-contents))

#### Script: Location
`Scriptname Location extends Form Native Hidden`

([TOC](#table-of-contents))

##### Event: OnLocationExplored
`Event OnLocationExplored()`

Event sent to location when its explored

([TOC](#table-of-contents))

##### Event: OnLocationLoaded
`Event OnLocationLoaded()`

Event sent when a location is loaded

([TOC](#table-of-contents))

##### Function: AddKeyword (Native)
`Function AddKeyword(Keyword akKeyword) native`

Adds the specified keyword to the location

([TOC](#table-of-contents))

##### Function: AddLinkedLocation (Native)
`Function AddLinkedLocation(Location akLoc, Keyword akKeyword) native`

Links the given location to this one under the given keyword

([TOC](#table-of-contents))

##### Function: CountActors (Native)
`int Function CountActors( Keyword apRequiredLinkedRefKeyword = None, Keyword apExcludeLinkedRefKeyword = None ) native`

Get the count of all instantiated Actors (across all process levels) who belong to this location.  

Can optionally specify a keyword for a linkedref that they must have (apRequiredLinkedRefKeyword), and/or a linkedref keyword they must NOT have (apExcludeLinkedRefKeyword).

(Presence or absence of the keywordless linkedref cannot be checked.)

(NOTE: if you're also necessarily going to call GetActors, just do that and check its size, instead of calling this.)

([TOC](#table-of-contents))

##### Function: DisableSpaceTravelToAllExcept (Native)
`bool Function DisableSpaceTravelToAllExcept(Quest akQuest, bool abAddLocation = true) native`

Disables player space travel to all locations except the specified location. Can call on multiple locations.

([TOC](#table-of-contents))

##### Function: EnableSpaceTravel (Native)
`bool Function EnableSpaceTravel(Quest akQuest, bool abEnable = true) native`

Enables player space travel to the specified location.

([TOC](#table-of-contents))

##### Function: GetActors (Native)
`Actor[] Function GetActors( Keyword apRequiredLinkedRefKeyword = None, Keyword apExcludeLinkedRefKeyword = None ) native`

Get an array of all instantiated Actors (across all process levels) who belong to this location.  

Can optionally specify a keyword for a linkedref that they must have (apRequiredLinkedRefKeyword), and/or a linkedref keyword they must NOT have (apExcludeLinkedRefKeyword).

(Presence or absence of the keywordless linkedref cannot be checked.)

([TOC](#table-of-contents))

##### Function: GetAllLinkedLocations (Native)
`Location[] Function GetAllLinkedLocations(Keyword akKeyword) native`

Returns an array of all locations linked to this one under the given keyword

([TOC](#table-of-contents))

##### Function: GetCurrentPlanet (Native)
`Planet Function GetCurrentPlanet() native`

Returns this location's planet

([TOC](#table-of-contents))

##### Function: GetKeywordData (Native)
`float Function GetKeywordData(Keyword akKeyword) native`

Returns the float value attached to the specified keyword attached to this location

([TOC](#table-of-contents))

##### Function: GetMinLevel (Native)
`int Function GetMinLevel() native`

Gets this location's minimum level

([TOC](#table-of-contents))

##### Function: GetMaxLevel (Native)
`int Function GetMaxLevel() native`

Gets this location's maximum level

([TOC](#table-of-contents))

##### Function: GetParentLocations (Native)
`Location[] Function GetParentLocations(Keyword apKeyword = None) native`

Gets this location's parent locations

Can optionally specify a keyword that the parent location must have

([TOC](#table-of-contents))

##### Function: GetRefTypeAliveCount (Native)
`int Function GetRefTypeAliveCount(LocationRefType akRefType) native`

Returns the number of alive references matching the specified reference type

([TOC](#table-of-contents))

##### Function: GetRefTypeDeadCount (Native)
`int Function GetRefTypeDeadCount(LocationRefType akRefType) native`

Returns the number of dead references matching the specified reference type

([TOC](#table-of-contents))

##### Function: GetValue (Native)
`float Function GetValue(ActorValue akActorValue) native`

Gets an actor value on location

([TOC](#table-of-contents))

##### Function: HasCommonParent (Native)
`bool Function HasCommonParent(Location akOther, Keyword akFilter = None) native`

Returns if these two locations have a common parent - filtered with the keyword, if provided

([TOC](#table-of-contents))

##### Function: HasEverBeenExplored (Native)
`bool Function HasEverBeenExplored() native`

Returns if this location has ever been explored

([TOC](#table-of-contents))

##### Function: HasRefType (Native)
`bool Function HasRefType(LocationRefType akRefType) native`

Returns if this location has the specified reference type

([TOC](#table-of-contents))

##### Function: IsExplored (Native)
`bool Function IsExplored() native`

Returns whether this location is flagged as "explored" or not

([TOC](#table-of-contents))

##### Function: IsChild (Native)
`bool Function IsChild(Location akOther) native`

Returns whether the other location is a child of this one

([TOC](#table-of-contents))

##### Function: IsLinkedLocation (Native)
`bool Function IsLinkedLocation(Location akLocation, Keyword akKeyword) native`

Is this location linked to the given one under the given keyword?

([TOC](#table-of-contents))

##### Function: IsLoaded (Native)
`bool Function IsLoaded() native`

Is this location loaded in game?

([TOC](#table-of-contents))

##### Function: IsSameLocation
`bool Function IsSameLocation(Location akOtherLocation, Keyword akKeyword = None)`

Returns true if the calling location is the same as the supplied location - if an optional keyword is supplied, it also returns true if the locations share a parent with that keyword, or if either location is a child of the other and the other has that keyword.

([TOC](#table-of-contents))

##### Function: ModifyKeywordData
`Function ModifyKeywordData(Keyword akKeyword, float afData)`

adds afData to the current keyword value (threadsafe)

([TOC](#table-of-contents))

##### Function: RemoveKeyword (Native)
`Function RemoveKeyword(Keyword akKeyword) native`

Removed the specified keyword from the location

([TOC](#table-of-contents))

##### Function: RemoveLinkedLocation (Native)
`Function RemoveLinkedLocation(Location akLoc, Keyword akKeyword) native`

Removes any link between this location and the given one under the given keyword

([TOC](#table-of-contents))

##### Function: Reset (Native)
`Function Reset() native`

Forces reset on all encounter zones and interior cells which use this location

([TOC](#table-of-contents))

##### Function: SetKeywordData (Native)
`Function SetKeywordData(Keyword akKeyword, float afData) native`

Sets the specified keyword's data on the location

([TOC](#table-of-contents))

##### Function: SetExplored (Native)
`Function SetExplored(bool abExplored = true) native`

Sets this location as explored or not

([TOC](#table-of-contents))

##### Function: SetFactionOwner (Native)
`Function SetFactionOwner(Faction akFaction) native`

Set the given faction as the faction owner for this location

([TOC](#table-of-contents))

##### Function: SetMinLevel (Native)
`Function SetMinLevel( int aiMinLevel ) native`

Sets this encounter zone's minimum level

([TOC](#table-of-contents))

##### Function: SetMaxLevel (Native)
`Function SetMaxLevel( int aiMaxLevel ) native`

Sets this encounter zone's maximum level

([TOC](#table-of-contents))

##### Function: SetNeverResets (Native)
`Function SetNeverResets(bool abFlag = true) native`

Forces the value of the never reset flag on this location

([TOC](#table-of-contents))

##### Function: SetValue (Native)
`Function SetValue(ActorValue akActorValue, float afValue) native`

Sets an actor value on location

([TOC](#table-of-contents))

##### Function: ModValue
`Function ModValue(ActorValue akActorValue, float afAmount)`

Modifies an actor value on location

([TOC](#table-of-contents))

#### Script: MagicEffect
`Scriptname MagicEffect extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: GetAssociatedSkill (Native)
`ActorValue Function GetAssociatedSkill() native`

Get the Associated Skill for this MagicEffect

([TOC](#table-of-contents))

#### Script: Message
`Scriptname Message extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: Show (Native)
`int Function Show(float afArg1 = 0.0, float afArg2 = 0.0, float afArg3 = 0.0, float afArg4 = 0.0, float afArg5 = 0.0, float afArg6 = 0.0, float afArg7 = 0.0, float afArg8 = 0.0, float afArg9 = 0.0) native`

Show this message on the screen, substituting the values as appropriate. If a message box, it will wait until the user closes the box before returning - returning the button the user hit. If not a message box, or something went wrong, it will return -1


([TOC](#table-of-contents))

##### Function: ShowAsHelpMessage (Native)
`Function ShowAsHelpMessage(string asEvent, float afDuration, float afInterval, int aiMaxTimes, string asContext="", int aiPriority=0, Message GamepadMsg=None) native`

Shows help message for a user action on screen.

([TOC](#table-of-contents))

##### Function: UnshowAsHelpMessage (Native)
`Function UnshowAsHelpMessage() native`

Ends the showing of a help message and makes the message inactive.

([TOC](#table-of-contents))

##### Function: ClearHelpMessages (Native) (Global)
`Function ClearHelpMessages() native global`

Hides the help message without marking it as "complete"

([TOC](#table-of-contents))

##### Function: ResetHelpMessage (Native) (Global)
`Function ResetHelpMessage(string asEvent) native global`

Resets help message status for an input event so a new message can be displayed for that event.

([TOC](#table-of-contents))

##### Function: AttachLoadDoors (Native)
`Function AttachLoadDoors(ObjectReference[] aDoorRefsToAdd) native`

Assigns the given array of load doors to each option in the message respectively.  References passed must be of type door.

([TOC](#table-of-contents))

#### Script: MiscObject
`Scriptname MiscObject extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: GetObjectResourceCount (Native)
`int Function GetObjectResourceCount( Resource akResource ) native`

Returns the number of the given resource this form has.

([TOC](#table-of-contents))

##### Script: ConstructibleObject
`Scriptname ConstructibleObject extends MiscObject Native Hidden`

([TOC](#table-of-contents))

##### Script: Key
`Scriptname Key extends MiscObject Native Hidden`

([TOC](#table-of-contents))

##### Script: SoulGem
`Scriptname SoulGem extends MiscObject Native Hidden`

([TOC](#table-of-contents))

#### Script: MusicType
`Scriptname MusicType extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: Add (Native)
`Function Add() native`

Add this music type to the music system stack

([TOC](#table-of-contents))

##### Function: Remove (Native)
`Function Remove() native`

Remove this music type from the music system stack

([TOC](#table-of-contents))

#### Script: Note
`Scriptname Note Extends Form Native Hidden`

([TOC](#table-of-contents))

#### Script: ObjectMod
`Scriptname ObjectMod extends Form Native Hidden`

([TOC](#table-of-contents))

#### Script: ObjectReference
`Scriptname ObjectReference extends Form Native Hidden`

([TOC](#table-of-contents))

##### Property: X
`float Property X`

Property to obtain the current X position of the object

([TOC](#table-of-contents))

###### Function: get
`float Function get()`

([TOC](#table-of-contents))

##### Property: Y
`float Property Y`

Property to obtain the current Y position of the object

([TOC](#table-of-contents))

###### Function: get
`float Function get()`

([TOC](#table-of-contents))

##### Property: Z
`float Property Z`

Property to obtain the current Z position of the object

([TOC](#table-of-contents))

###### Function: get
`float Function get()`

([TOC](#table-of-contents))

##### Property: CONST_NearPosition_Min
`int property CONST_NearPosition_Min = 0 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearPosition_Max
`int property CONST_NearPosition_Max = 6 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearPosition_Random
`int property CONST_NearPosition_Random = -2 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearPosition_DeadAhead
`int property CONST_NearPosition_DeadAhead = -1 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearPosition_ForwardTight
`int property CONST_NearPosition_ForwardTight = 0 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearPosition_ForwardWide
`int property CONST_NearPosition_ForwardWide = 1 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearPosition_Behind
`int property CONST_NearPosition_Behind = 2 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearPosition_Above
`int property CONST_NearPosition_Above = 3 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearPosition_Below
`int property CONST_NearPosition_Below = 4 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearPosition_Left
`int property CONST_NearPosition_Left = 5 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearPosition_Right
`int property CONST_NearPosition_Right = 6 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearPosition_TightArc
`float property CONST_NearPosition_TightArc = 0.1 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearPosition_WideArc
`float property CONST_NearPosition_WideArc = 0.2 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearDistance_Min
`int property CONST_NearDistance_Min = 0 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearDistance_Max
`int property CONST_NearDistance_Max = 4 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearDistance_RandomFar
`int property CONST_NearDistance_RandomFar = -3 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearDistance_Random
`int property CONST_NearDistance_Random = -2 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearDistance_VeryClose
`int property CONST_NearDistance_VeryClose = -1 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearDistance_Close
`int property CONST_NearDistance_Close = 0 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearDistance_Short
`int property CONST_NearDistance_Short = 1 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearDistance_Moderate
`int property CONST_NearDistance_Moderate = 2 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearDistance_Long
`int property CONST_NearDistance_Long = 3 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearDistance_VeryLong
`int property CONST_NearDistance_VeryLong = 4 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearDistance_Close_Min
`int property CONST_NearDistance_Close_Min = 200 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearDistance_Close_Max
`int property CONST_NearDistance_Close_Max = 400 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearDistance_Short_Min
`int property CONST_NearDistance_Short_Min = 600 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearDistance_Short_Max
`int property CONST_NearDistance_Short_Max = 1000 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearDistance_Moderate_Min
`int property CONST_NearDistance_Moderate_Min = 1200 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearDistance_Moderate_Max
`int property CONST_NearDistance_Moderate_Max = 2000 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearDistance_Long_Min
`int property CONST_NearDistance_Long_Min = 2500 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearDistance_Long_Max
`int property CONST_NearDistance_Long_Max = 5000 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearDistance_VeryLong_Min
`int property CONST_NearDistance_VeryLong_Min = 6000 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearDistance_VeryLong_Max
`int property CONST_NearDistance_VeryLong_Max = 10000 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearFacing_Min
`int property CONST_NearFacing_Min = 0 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearFacing_Max
`int property CONST_NearFacing_Max = 7 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearFacing_TotallyRandom
`int property CONST_NearFacing_TotallyRandom = -3 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearFacing_Random
`int property CONST_NearFacing_Random = -2 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearFacing_Direct
`int property CONST_NearFacing_Direct = -1 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearFacing_TowardSmall
`int property CONST_NearFacing_TowardSmall = 0 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearFacing_TowardLarge
`int property CONST_NearFacing_TowardLarge = 1 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearFacing_AwaySmall
`int property CONST_NearFacing_AwaySmall = 2 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearFacing_AwayLarge
`int property CONST_NearFacing_AwayLarge = 3 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearFacing_LeftSideOn
`int property CONST_NearFacing_LeftSideOn = 4 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearFacing_RightSideOn
`int property CONST_NearFacing_RightSideOn = 5 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearFacing_BottomSideOn
`int property CONST_NearFacing_BottomSideOn = 6 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearFacing_TopSideOn
`int property CONST_NearFacing_TopSideOn = 7 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearFacing_HeadingCorrectionToDirectFacing
`float property CONST_NearFacing_HeadingCorrectionToDirectFacing = 90.0 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearFacing_TightAngle
`float property CONST_NearFacing_TightAngle = 15.0 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: CONST_NearFacing_WideAngle
`float property CONST_NearFacing_WideAngle = 30.0 AutoReadOnly`

Read-only value for the MoveNear convenience function

([TOC](#table-of-contents))

##### Property: Motion_Fixed
`int Property Motion_Fixed = 0 AutoReadOnly`

Constant for SetMotionType

([TOC](#table-of-contents))

##### Property: Motion_Dynamic
`int Property Motion_Dynamic = 1 AutoReadOnly`

Constant for SetMotionType

([TOC](#table-of-contents))

##### Property: Motion_Keyframed
`int Property Motion_Keyframed = 2 AutoReadOnly`

Constant for SetMotionType

([TOC](#table-of-contents))

##### Event: OnActivate
`Event OnActivate(ObjectReference akActionRef)`

Event received when this reference is activated

([TOC](#table-of-contents))

##### Event: OnBuilderMenuSelect
`Event OnBuilderMenuSelect(ActorValue akActorValue)`

Event received when the produced resource on an Workshop producer/builder has changed.

([TOC](#table-of-contents))

##### Event: OnCellAttach
`Event OnCellAttach()`

Event received when this object's parent cell is attached

([TOC](#table-of-contents))

##### Event: OnCellDetach
`Event OnCellDetach()`

Event received when this object's parent cell is detached

([TOC](#table-of-contents))

##### Event: OnCellLoad
`Event OnCellLoad()`

Event received when every object in this object's parent cell is loaded (TODO: Find restrictions)

([TOC](#table-of-contents))

##### Event: OnClose
`Event OnClose(ObjectReference akActionRef)`

Event received when this object is closed

([TOC](#table-of-contents))

##### Event: OnContainerChanged
`Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)`

Event received when this object enters, exits, or changes containers

([TOC](#table-of-contents))

##### Event: OnCrewAssigned
`Event OnCrewAssigned(Actor akCrew, ObjectReference akAssignmentRef, ObjectReference akPreviousAssignmentRef)`

Event received when a crew member is assigned.

([TOC](#table-of-contents))

##### Event: OnCrewDismissed
`Event OnCrewDismissed(Actor akCrew, ObjectReference akPreviousAssignmentRef)`

Event received when a crew member is dismissed.

([TOC](#table-of-contents))

##### Event: OnDestroyed
`Event OnDestroyed(ObjectReference akDestroyer)`

Event received when this reference is destroyed

([TOC](#table-of-contents))

##### Event: OnDestructionStageChanged
`Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)`

Event received when this reference's destruction stage has changed

([TOC](#table-of-contents))

##### Event: OnEnterFurniture
`Event OnEnterFurniture(Actor akActionRef)`

Event received when this furniture is entered.

([TOC](#table-of-contents))

##### Event: OnEquipped
`Event OnEquipped(Actor akActor)`

Event received when this object is equipped by an actor

([TOC](#table-of-contents))

##### Event: OnExitFurniture
`Event OnExitFurniture(ObjectReference akActionRef)`

Event received when this furniture is exited.

([TOC](#table-of-contents))

##### Event: OnGrab
`Event OnGrab()`

Event received when this object is grabbed by the player

([TOC](#table-of-contents))

##### Event: OnItemAdded
`Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, int aiTransferReason)`

Event received when an item is removed from this object's inventory. If the item is a persistent reference, akItemReference will point at it - otherwise the parameter will be None. For valid Transfer Reasons please refer to the wiki.

([TOC](#table-of-contents))

##### Event: OnItemRemoved
`Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, int aiTransferReason)`

Event received when an item is removed from this object's inventory. If the item is a persistent reference, akItemReference will point at it - otherwise the parameter will be None. For valid Transfer Reasons please refer to the wiki.

([TOC](#table-of-contents))

##### Event: OnLoad
`Event OnLoad()`

Event received when this object is completely loaded - will be fired every time this object is loaded

([TOC](#table-of-contents))

##### Event: OnLockStateChanged
`Event OnLockStateChanged()`

Event received when the lock on this object changes

([TOC](#table-of-contents))

##### Event: OnMapMarkerDiscovered
`Event OnMapMarkerDiscovered()`

Received when this map marker is discovered

([TOC](#table-of-contents))

##### Event: OnObjectRepaired
`Event OnObjectRepaired(ObjectReference akReference)`

Event received when an item has been repaired

([TOC](#table-of-contents))

##### Event: OnObjectDestroyed
`Event OnObjectDestroyed(ObjectReference akReference)`

Event received when an item has been destroyed

([TOC](#table-of-contents))

##### Event: OnOpen
`Event OnOpen(ObjectReference akActionRef)`

Event received when this object is opened

([TOC](#table-of-contents))

##### Event: OnOutpostItemPowerOff
`Event OnOutpostItemPowerOff(ObjectReference akPoweredItem)`

Event received when an Outpost item loses power

([TOC](#table-of-contents))

##### Event: OnOutpostItemPowerOn
`Event OnOutpostItemPowerOn(ObjectReference akPoweredItem, ObjectReference akPowerGenerator)`

Event received when an Outpost item receives power

([TOC](#table-of-contents))

##### Event: OnPipboyRadioDetection
`Event OnPipboyRadioDetection( bool abDetected )`

Event that occurs when the Pipboy enters/leaves the outer-radius of this radio ref

([TOC](#table-of-contents))

##### Event: OnPlayerDialogueTarget
`Event OnPlayerDialogueTarget( )`

Event received when ref goes into dialogue with player

([TOC](#table-of-contents))

##### Event: OnPowerOn
`Event OnPowerOn(ObjectReference akPowerGenerator)`

Event received when a workshop item receives power

([TOC](#table-of-contents))

##### Event: OnPowerOff
`Event OnPowerOff()`

Event received when a workshop loses all power

([TOC](#table-of-contents))

##### Event: OnQuickContainerOpened
`Event OnQuickContainerOpened()`

Received if the quick container opens

([TOC](#table-of-contents))

##### Event: OnRead
`Event OnRead()`

Event received when this object, if a book, is read

([TOC](#table-of-contents))

##### Event: OnRelease
`Event OnRelease()`

Event received when this object is released by the player

([TOC](#table-of-contents))

##### Event: OnReset
`Event OnReset()`

Event received when this reference is reset

([TOC](#table-of-contents))

##### Event: OnScanned
`Event OnScanned()`

Received when this object is scanned

([TOC](#table-of-contents))

##### Event: OnSell
`Event OnSell(Actor akSeller)`

Event received when this reference is sold by an actor

([TOC](#table-of-contents))

##### Event: OnSpellCast
`Event OnSpellCast(Form akSpell)`

Event received when a spell is cast by this object

([TOC](#table-of-contents))

##### Event: OnTerminalMenuItemRun
`Event OnTerminalMenuItemRun(int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)`

Received if terminal object has menu item clicked

([TOC](#table-of-contents))

##### Event: OnTranslationAlmostComplete
`Event OnTranslationAlmostComplete()`

Event received when translation is almost complete (from a call to TranslateTo, "almost" is determined by a gamesetting, default is 90% of the way)

([TOC](#table-of-contents))

##### Event: OnTranslationComplete
`Event OnTranslationComplete()`

Event received when translation is complete (from a call to TranslateTo)

([TOC](#table-of-contents))

##### Event: OnTranslationFailed
`Event OnTranslationFailed()`

Event received when translation is aborted (from a call to StopTranslateTo)

([TOC](#table-of-contents))

##### Event: OnTrapHitStart
`Event OnTrapHitStart(ObjectReference akTarget, float afXVel, float afYVel, float afZVel, float afXPos, float afYPos, float afZPos, int aeMaterial, bool abInitialHit, int aeMotionType)`

Event received when this starts hitting a target

([TOC](#table-of-contents))

##### Event: OnTrapHitStop
`Event OnTrapHitStop(ObjectReference akTarget)`

Event received when this stops hitting a target

([TOC](#table-of-contents))

##### Event: OnTriggerEnter
`Event OnTriggerEnter(ObjectReference akActionRef)`

Event received when this trigger volume is entered

([TOC](#table-of-contents))

##### Event: OnTriggerLeave
`Event OnTriggerLeave(ObjectReference akActionRef)`

Event received when this trigger volume is left

([TOC](#table-of-contents))

##### Event: OnUnequipped
`Event OnUnequipped(Actor akActor)`

Event received when this object is unequipped by an actor

([TOC](#table-of-contents))

##### Event: OnUnload
`Event OnUnload()`

Event received when this object is being unloaded - will be fired every time this object is unloaded

([TOC](#table-of-contents))

##### Event: OnWorkshopCargoLinkChanged
`Event OnWorkshopCargoLinkChanged(ObjectReference akOldTarget, ObjectReference akNewTarget)`

Event that is triggered when the target for a cargo link on workshop item changes.

([TOC](#table-of-contents))

##### Event: OnWorkshopFlyCam
`Event OnWorkshopFlyCam(bool aStart)`

Event received when the player enters or leaves Workshop FlyCam

([TOC](#table-of-contents))

##### Event: OnWorkshopMode
`Event OnWorkshopMode(bool aStart)`

Event received when the player enters or leaves Workshop Mode

([TOC](#table-of-contents))

##### Event: OnWorkshopObjectGrabbed
`Event OnWorkshopObjectGrabbed(ObjectReference akReference)`

Event received when the player grabs an existing object reference for edit while in Workshop mode.

([TOC](#table-of-contents))

##### Event: OnWorkshopObjectMoved
`Event OnWorkshopObjectMoved(ObjectReference akReference)`

Event received when an existing workshop item is moved in the world

([TOC](#table-of-contents))

##### Event: OnWorkshopObjectPlaced
`Event OnWorkshopObjectPlaced(ObjectReference akReference)`

Event received when a workshop item is placed in the world

([TOC](#table-of-contents))

##### Event: OnWorkshopObjectRemoved
`Event OnWorkshopObjectRemoved(ObjectReference akReference)`

Event received when a workshop item is removed ( from world and added back to workshop )

([TOC](#table-of-contents))

##### Event: OnWorkshopOutputLink
`Event OnWorkshopOutputLink(ObjectReference akSource, ObjectReference akTarget)`

Event received when a new Output Link is created at a Workshop.

([TOC](#table-of-contents))

##### Event: OnWorkshopNPCTransfer
`Event OnWorkshopNPCTransfer(Location akNewWorkshop, Keyword akActionKW)`

Event that occurs when a workshop NPC is directed to move to another settlement

([TOC](#table-of-contents))

##### Function: GetCurrentShipRef
`SpaceshipReference Function GetCurrentShipRef()`

Function to get the ObjectReference for the ship I am in

([TOC](#table-of-contents))

##### Function: Unlock
`Function Unlock(bool abAsOwner = false)`

convenient way to call Lock(False) on a door

([TOC](#table-of-contents))

##### Function: rampRumble
`bool FUNCTION rampRumble(float power = 0.5, float duration = 0.25, float falloff = 1600.0)`

Function to shake cam/controller based on distance from player

should always be called on the source of the rumble,

as final intensity is relevant to player

([TOC](#table-of-contents))

##### Function: IsNearPlayer
`bool Function IsNearPlayer()`

Function to know if I'm near the player (whether I can be safely enabled or disabled)

([TOC](#table-of-contents))

##### Function: IsInInterior
`bool Function IsInInterior()`

Returns !IsInExterior()

([TOC](#table-of-contents))

##### Function: MoveToIfUnloaded
`bool function MoveToIfUnloaded(ObjectReference akTarget, float afXOffset = 0.0, float afYOffset = 0.0, float afZOffset = 0.0)`

Calls MoveTo if the calling ObjectReference is currently unloaded. Doesn't do anything if it IS loaded. No waiting or while loops. Returns true if it does the moveto

([TOC](#table-of-contents))

##### Function: HasRefType
`bool Function HasRefType(LocationRefType akRefType)`

Returns if this reference has the specified location ref type (for backwards compatibility with function rename

([TOC](#table-of-contents))

##### Function: MoveToWhenUnloaded
`function MoveToWhenUnloaded(ObjectReference akTarget, float afXOffset = 0.0, float afYOffset = 0.0, float afZOffset = 0.0)`

DEPRECATED: DO NOT USE. Calls MoveTo if both the calling ObjectReference and the akTarget ObjectReference have current locations that are not loaded.

([TOC](#table-of-contents))

##### Function: Activate (Native)
`bool Function Activate(ObjectReference akActivator, bool abDefaultProcessingOnly = false) native`

Have akActivator activate this reference. If abDefaultProcessingOnly is true then any block will be bypassed and no OnActivate event will be sent. The function returns true if default processing ran, and succeeded. If default processing has been blocked, will always return false.

([TOC](#table-of-contents))

##### Function: AddDependentAnimatedObjectReference (Native)
`bool Function AddDependentAnimatedObjectReference(ObjectReference akDependent) native`

Sets up a dependent animated object

This function should be used only with a coder supervision. It is left undocumented because it can cause dangling pointers as well as very broken functionality for the dependent object if used improperly.

([TOC](#table-of-contents))

##### Function: AddDynamicTerminalMenuItem (Native)
`Function AddDynamicTerminalMenuItem(TerminalMenu akTemplateSource, int aiTemplateIndex, int aiItemID, Form[] akTagReplacementForms) native`

Adds a dynamically created terminal menu item to a terminal ref.

([TOC](#table-of-contents))

##### Function: AddAliasedItem
`Function AddAliasedItem(Form akItemToAdd, Alias akAlias, int aiCount = 1, bool abSilent = true)`

Creates an item, fills an alias with that item, then adds it to this container.

`aiCount` can be greater than 1 if we are adding to a RefCollection.

([TOC](#table-of-contents))

##### Function: AddAliasedItemSingle
`ObjectReference Function AddAliasedItemSingle(Form akItemToAdd, Alias akAlias, bool abSilent = true)`

place a single item (initially disabled) at this reference, and fill an alias with that item

([TOC](#table-of-contents))

##### Function: AddAliasedItemWithKeywords
`Function AddAliasedItemWithKeywords(Form akItemToAdd, Alias akAlias, int aiCount = 1, bool abSilent = true, Keyword[] keywords = NONE)`

place a number of items (initially disabled) at this reference, fill an alias with that item, and add the specified keywords to the items

([TOC](#table-of-contents))

##### Function: AddAliasedItemWithKeywordsSingle
`ObjectReference Function AddAliasedItemWithKeywordsSingle(Form akItemToAdd, Alias akAlias, bool abSilent = true, Keyword[] keywords = NONE)`

place a single item (initially disabled) at this reference, fill an alias with that item, and add the specified keywords to the item

([TOC](#table-of-contents))

##### Function: AddItem (Native)
`Function AddItem(Form akItemToAdd, int aiCount = 1, bool abSilent = false) native`

Adds the specified base object or object reference to this object reference's container/inventory

Note that you cannot add more then one copy of a reference to a container (a warning will be printed if you try)

([TOC](#table-of-contents))

##### Function: AddKeyword (Native)
`Function AddKeyword(Keyword apKeyword) native`

Adds a keyword to this reference

([TOC](#table-of-contents))

##### Function: AddKeyIfNeeded (Native)
`Function AddKeyIfNeeded(ObjectReference aLockedRef) native`

Adds a gets the key for the given locked reference and adds it to this reference's inventory

([TOC](#table-of-contents))

##### Function: AddSpell (Native)
`bool Function AddSpell(Spell akSpell, bool abVerbose=true) native`

Adds the specified spell to this reference - returns true on success

([TOC](#table-of-contents))

##### Function: AddTextReplacementData (Native)
`Function AddTextReplacementData(string asTokenLabel, Form akForm) native`

Adds the given text replacement pair to this ref

([TOC](#table-of-contents))

##### Function: AddTextReplacementValue (Native)
`Function AddTextReplacementValue(string asTokenLabel, float aValue) native`

Adds the given text replacement value to this ref

([TOC](#table-of-contents))

##### Function: AddToMap (Native)
`Function AddToMap(bool abAllowFastTravel = false) native`

Adds this reference (which is a map marker) to the map, optionally making it available for fast travel

([TOC](#table-of-contents))

##### Function: AddToMapScanned
`Function AddToMapScanned(bool abAllowFastTravel = false)`

Replacement function to also scan the map marker so it shows clearly on the compass

([TOC](#table-of-contents))

##### Function: AddTransferLink (Native)
`bool Function AddTransferLink(ObjectReference akTarget) native`

Add a transfer link from this reference to another.

([TOC](#table-of-contents))

##### Function: AssignCrew (Native)
`Function AssignCrew(Actor aCrewMember) native`

Assigns the specified actor as a member of the references crew

([TOC](#table-of-contents))

##### Function: ApplyConveyorBelt (Native)
`Function ApplyConveyorBelt( string aTarget, float aLinVelX, float aLinVelY, float aLinVelZ, bool abOn = true, bool abReverse = false ) native`

Add conveyor belt to this reference

([TOC](#table-of-contents))

##### Function: ApplyHavokImpulse (Native)
`Function ApplyHavokImpulse(float afX, float afY, float afZ, float afMagnitude) native`

Apply an impulse to this reference

([TOC](#table-of-contents))

##### Function: ApplyFanMotor (Native)
`Function ApplyFanMotor( string aTarget, float aAxisX, float aAxisY, float aAxisZ, float aForce, bool abOn = true) native`

Add fan motor to this reference

([TOC](#table-of-contents))

##### Function: AreAllInTrigger (Native)
`bool Function AreAllInTrigger(ObjectReference[] refsToCheck) native`

Are all refs in refsToCheck in this trigger?

([TOC](#table-of-contents))

##### Function: AreAnyInTrigger (Native)
`bool Function AreAnyInTrigger(ObjectReference[] refsToCheck) native`

Are any refs in refsToCheck in this trigger?

([TOC](#table-of-contents))

##### Function: FanMotorOn (Native)
`Function FanMotorOn( bool abOn = true) native`

Set fan motor on.

([TOC](#table-of-contents))

##### Function: IsFanMotorOn (Native)
`bool Function IsFanMotorOn(  ) native`

Check if fan motor on.

([TOC](#table-of-contents))

##### Function: AttachMod (Native)
`bool Function AttachMod(ObjectMod akMod, int aiAttachIndex = 0) native`

Attach a mod to this reference

([TOC](#table-of-contents))

##### Function: AttachModToInventoryItem (Native)
`bool Function AttachModToInventoryItem(Form akItem, ObjectMod akMod) native`

Attach a mod to an inventory item in this reference's inventory

([TOC](#table-of-contents))

##### Function: AttachTo (Native)
`Function AttachTo(ObjectReference akParent) native`

Attach this reference to the specified parent (only works on created refs)

([TOC](#table-of-contents))

##### Function: BlockActivation (Native)
`Function BlockActivation(bool abBlocked = true, bool abHideActivateText = false) native`

Turns on and off blocking of normal activation - OnActivate events will still be sent

([TOC](#table-of-contents))

##### Function: CalculateEncounterLevel (Native)
`int Function CalculateEncounterLevel(int aiDifficulty = 4) native`

Calculate's this references encounter level based on the requested difficulty level

0 - Easy

1 - Medium

2 - Hard

3 - Very Hard

4 - None

([TOC](#table-of-contents))

##### Function: CanFastTravelToMarker (Native)
`bool Function CanFastTravelToMarker() native`

Can the map marker be fast traveled to?

([TOC](#table-of-contents))

##### Function: CanProduceForWorkshop (Native)
`bool Function CanProduceForWorkshop() native`

Can the reference produce resources for a Workshop?

([TOC](#table-of-contents))

##### Function: ClearDestruction (Native)
`Function ClearDestruction() native`

Clears all effects of destruction from this object

([TOC](#table-of-contents))

##### Function: ClearDynamicTerminalMenuItems (Native)
`Function ClearDynamicTerminalMenuItems() native`

Clears dynamically created terminal menu items from a terminal ref.

([TOC](#table-of-contents))

##### Function: ClearFromOldLocations (Native)
`Function ClearFromOldLocations() native`

Clears this object from data on all invalid locations

([TOC](#table-of-contents))

##### Function: ConveyorBeltOn (Native)
`Function ConveyorBeltOn( bool abOn = true ) native`

Set conveyor belt on.

([TOC](#table-of-contents))

##### Function: CountActorsLinkedToMe (Native)
`int Function CountActorsLinkedToMe( Keyword apLinkKeyword = None, Keyword apExcludeKeyword = None ) native`

Get the count of all instantiated Actors (across all process levels) that link to this reference.

The actor must link to this ref with a keyworded linkedref using the keyword (apLinkKeyword).

Can optionally specify another keyword (apExcludeKeyword); actors with a linkedref using that keyword will be skipped when building the array.

(NOTE: if you're also necessarily going to call GetActorsLinkedToMe, just do that and check its size, instead of calling this.)

([TOC](#table-of-contents))

##### Function: CountLinkedRefChain (Native)
`int Function CountLinkedRefChain(keyword apKeyword = None, int maxExpectedLinkedRefs = 100) native`

This function  counts the number of linked refs that are in a linked Ref chain (ie object is linked to A, A is linked to B, etc. this then counts all the linked refs.)

Aborts early if it detects a loop

([TOC](#table-of-contents))

##### Function: CountRefsLinkedToMe (Native)
`int Function CountRefsLinkedToMe( Keyword apLinkKeyword = None, Keyword apExcludeKeyword = None ) native`

Get the count of all instantiated ObjectReferences that link to this reference.

They must link to this ref with a keyworded linkedref, using the keyword (apLinkKeyword).

Can optionally specify another keyword (apExcludeKeyword); refs with a linkedref using that keyword will be skipped when building the array.

(NOTE: if you're also necessarily going to call GetRefsLinkedToMe, just do that and check its size, instead of calling this.)

([TOC](#table-of-contents))

##### Function: CreateDetectionEvent (Native)
`Function CreateDetectionEvent(Actor akOwner, int aiSoundLevel = 0 ) native`

Create a detection event at this reference, with the specified owner. Sound level is between 0 and 100

([TOC](#table-of-contents))

##### Function: DamageObject (Native)
`Function DamageObject(float afDamage) native`

Damages this object and advances the destruction stage - does not return until the object is damaged

([TOC](#table-of-contents))

##### Function: DamageValue (Native)
`Function DamageValue(ActorValue akAV, float afDamage) native`

Damages the given actor value

([TOC](#table-of-contents))

##### Function: Delete (Native)
`Function Delete() native`

Deletes this object

([TOC](#table-of-contents))

##### Function: Disable (Native)
`Function Disable(bool abFadeOut = false) native`

Disables this object - fading out if requested

([TOC](#table-of-contents))

##### Function: DisableLinkChain (Native)
`Function DisableLinkChain(Keyword apKeyword = None, bool abFadeOut = false) native`

Disables all of the references that are linked, in a chain, to this one. (But NOT this one)

Does not wait for everything to disable before returning

([TOC](#table-of-contents))

##### Function: DisableNoWait (Native)
`Function DisableNoWait(bool abFadeOut = false) native`

Disables this object - fading out if requested. Does NOT wait for the fade or disable to finish

([TOC](#table-of-contents))

##### Function: DispelSpell (Native)
`bool Function DispelSpell( Spell akSpell ) native`

Dispel a spell from this reference

([TOC](#table-of-contents))

##### Function: Drop (Native)
`Function Drop(bool abSilent = false) native`

Drops this reference from the container it is in. If silent, will not display a message to the

player if it was in the player's inventory

([TOC](#table-of-contents))

##### Function: DropFirstObject (Native)
`ObjectReference Function DropFirstObject(bool abInitiallyDisabled = false) native`

Drops the first object from this object's inventory

([TOC](#table-of-contents))

##### Function: DropObject (Native)
`ObjectReference Function DropObject(Form akObject, int aiCount = 1) native`

Drops the specified object from this object's inventory (will not drop references)

([TOC](#table-of-contents))

##### Function: Enable (Native)
`bool Function Enable(bool abFadeIn = false) native`

Enables this object - fading in if requested

([TOC](#table-of-contents))

##### Function: EnableFastTravel (Native)
`Function EnableFastTravel(bool abEnable = true) native`

Enables the ability to fast travel to this marker - or disables it. Note that if you disable

fast travel the player will see "You haven't discovered this location" as an error message

([TOC](#table-of-contents))

##### Function: EnableLinkChain (Native)
`Function EnableLinkChain(Keyword apKeyword = None, bool abFadeIn = false) native`

Enables all of the references that are linked, in a chain, to this one. (But NOT this one)

Does not wait for everything to enable before returning

([TOC](#table-of-contents))

##### Function: EnableNoWait (Native)
`bool Function EnableNoWait(bool abFadeIn = false) native`

Enables this object - fading in if requested. Does NOT wait for the fade or enable to finish

([TOC](#table-of-contents))

##### Function: FindAllReferencesOfType (Native)
`ObjectReference[] Function FindAllReferencesOfType(Form akObjectOrList, float afRadius) native`

Finds all references to objects in the given list in the loaded area within the given radius of the calling

ref and returns an array of them

([TOC](#table-of-contents))

##### Function: FindAllReferencesWithKeyword (Native)
`ObjectReference[] Function FindAllReferencesWithKeyword(Form akKeywordOrList, float afRadius) native`

Finds all references with the given keyword(s) in the loaded area within the given radius of the calling

ref and returns an array of them

([TOC](#table-of-contents))

##### Function: ForceAddRagdollToWorld (Native)
`Function ForceAddRagdollToWorld() native`

Forcibly adds the ragdoll for a reference to the world

([TOC](#table-of-contents))

##### Function: ForceRemoveRagdollFromWorld (Native)
`Function ForceRemoveRagdollFromWorld() native`

Forcibly removes the ragdoll for a reference to the world

([TOC](#table-of-contents))

##### Function: GetActorBaseForResource (Native)
`ActorBase Function GetActorBaseForResource(ActorValue akAV) native`

Gets the ActorBase that matches the supplied ActorValue at the ObjectReference's owning Workshop or None if not found.

([TOC](#table-of-contents))

##### Function: GetActorOwner (Native)
`ActorBase Function GetActorOwner() native`

Gets the ActorBase that owns this object (or None if not owned by an ActorBase)

CAUTION: if owned by an Actor Ref, this will return the ActorBase of that Actor ref.

([TOC](#table-of-contents))

##### Function: GetActorRefOwner (Native)
`Actor Function GetActorRefOwner() native`

Gets the Actor (reference) that owns this object (or None if not owned by an Actor)

([TOC](#table-of-contents))

##### Function: GetActorsLinkedToMe (Native)
`Actor[] Function GetActorsLinkedToMe( Keyword apLinkKeyword = None, Keyword apExcludeKeyword = None ) native`

Get an array of all instantiated Actors (across all process levels) that link to this reference.

The actor must link to this ref with a keyworded linkedref using the keyword (apLinkKeyword).

Can optionally specify another keyword (apExcludeKeyword); actors with a linkedref using that keyword will be skipped when building the array.

([TOC](#table-of-contents))

##### Function: GetAllCrewMembers (Native)
`Actor[] Function GetAllCrewMembers() native`

gets all the crew members for this reference

([TOC](#table-of-contents))

##### Function: GetAllRefsInTrigger (Native)
`ObjectReference[] Function GetAllRefsInTrigger() native`

Get an array of all references currently in the trigger

([TOC](#table-of-contents))

##### Function: GetAngleX (Native)
`float Function GetAngleX() native`

Get the current X angle of this object

([TOC](#table-of-contents))

##### Function: GetAngleY (Native)
`float Function GetAngleY() native`

Get the current Y angle of this object

([TOC](#table-of-contents))

##### Function: GetAngleZ (Native)
`float Function GetAngleZ() native`

Get the current Z angle of this object

([TOC](#table-of-contents))

##### Function: GetAnimationVariableBool (Native)
`bool Function GetAnimationVariableBool(string arVariableName) native`

Get a variable from the reference's animation graph (if applicable). Bool version.

([TOC](#table-of-contents))

##### Function: GetAnimationVariableInt (Native)
`int Function GetAnimationVariableInt(string arVariableName) native`

Get a variable from the reference's animation graph (if applicable). Int version.

([TOC](#table-of-contents))

##### Function: GetAnimationVariableFloat (Native)
`float Function GetAnimationVariableFloat(string arVariableName) native`

Get a variable from the reference's animation graph (if applicable). Float version.

([TOC](#table-of-contents))

##### Function: GetBaseObject (Native)
`Form Function GetBaseObject() native`

Returns the base object this reference represents

([TOC](#table-of-contents))

##### Function: GetBaseValue (Native)
`float Function GetBaseValue(ActorValue akAV) native`

Gets the base value of the specified actor value - returns 0 and logs an error if the value is unknown

([TOC](#table-of-contents))

##### Function: GetBiomeActors (Native)
`ActorBase[] Function GetBiomeActors(float afMaxPercentageKnown = 1.0) native`

Gets the array of actor bases placed by the biome with a scan percentage less than or equal to specified, between 0.0 and 1.0

([TOC](#table-of-contents))

##### Function: GetBiomeFlora (Native)
`Flora[] Function GetBiomeFlora(float afMaxPercentageKnown = 1.0) native`

Gets the array of flora placed by the biome with a scan percentage less than or equal to specified

([TOC](#table-of-contents))

##### Function: GetCurrentDestructionStage (Native)
`int Function GetCurrentDestructionStage() native`

Returns the object's current destruction stage

([TOC](#table-of-contents))

##### Function: GetCurrentLocation (Native)
`Location Function GetCurrentLocation() native`

Returns this reference's current location

([TOC](#table-of-contents))

##### Function: GetCurrentPlanet (Native)
`Planet Function GetCurrentPlanet() native`

Returns this reference's current planet if any

([TOC](#table-of-contents))

##### Function: GetCurrentScene (Native)
`Scene Function GetCurrentScene() native`

Returns the scene this reference is currently in - if any

([TOC](#table-of-contents))

##### Function: GetDayLength
`float Function GetDayLength()`

Get the day length for the current planet

([TOC](#table-of-contents))

##### Function: GetDebugTextColor (Native)
`int[] Function GetDebugTextColor() native debugOnly`

Get the color of the debug text

([TOC](#table-of-contents))

##### Function: GetDebugTextSize (Native)
`int Function GetDebugTextSize() native debugOnly`

Get the font size of the debug text

([TOC](#table-of-contents))

##### Function: GetDebugTextString (Native)
`string Function GetDebugTextString() native debugOnly`

Get the text string of the debug text

([TOC](#table-of-contents))

##### Function: GetDestructibleOutpostObjects (Native)
`ObjectReference[] Function GetDestructibleOutpostObjects() native`

Get the list of destructible objects for an Outpost Beacon reference.

([TOC](#table-of-contents))

##### Function: GetDistance (Native)
`float Function GetDistance(ObjectReference akOther) native`

Calculates the distance between this reference and another - both must either be in the same interior, or same worldspace

([TOC](#table-of-contents))

##### Function: GetEditorLocation (Native)
`Location Function GetEditorLocation() native`

Returns this reference's editor location

([TOC](#table-of-contents))

##### Function: GetFactionOwner (Native)
`Faction Function GetFactionOwner() native`

Gets the faction that owns this object (or None if not owned by a Faction)

([TOC](#table-of-contents))

##### Function: GetFloraForResource (Native)
`Flora Function GetFloraForResource(ActorValue akAV) native`

Gets the Flora that produces the supplied ActorValue at the ObjectReference's owning Workshop or None if not found.

([TOC](#table-of-contents))

##### Function: GetGravityScale (Native)
`float Function GetGravityScale() native`

Get the current gravity for this object

([TOC](#table-of-contents))

##### Function: GetHeadingAngle (Native)
`float Function GetHeadingAngle(ObjectReference akOther) native`

Gets the angle between this object's heading and the other object in degrees - in the range from -180 to 180

([TOC](#table-of-contents))

##### Function: GetHeight (Native)
`float Function GetHeight() native`

Get the current height of the object

([TOC](#table-of-contents))

##### Function: GetHighestItemCountKeywords (Native)
`int Function GetHighestItemCountKeywords(Formlist akKeywords, bool abMustMatchAll) native`

Returns the count of the single most prevalent item in this object reference's inventory that has one or all given keywords on them.

([TOC](#table-of-contents))

##### Function: GetInventoryValue (Native)
`int Function GetInventoryValue() native`

Obtains the value of all objects in this reference's inventory

([TOC](#table-of-contents))

##### Function: GetItemCount (Native)
`int Function GetItemCount(Form akItem = None) native`

Returns how many of the specified item is in this object reference's inventory

If None is passed, it counts every item in the inventory

([TOC](#table-of-contents))

##### Function: GetItemCountKeywords (Native)
`int Function GetItemCountKeywords(Formlist akKeywords, bool abMustMatchAll) native`

Returns how many items have one or more given keywords on them, in this object reference's inventory.

([TOC](#table-of-contents))

##### Function: GetComponentCount (Native)
`int Function GetComponentCount(Form akItem = None) native`

Returns how many of the specified components are in this object reference's inventory

If None is passed, it counts every component in the inventory

([TOC](#table-of-contents))

##### Function: GetContainer (Native)
`ObjectReference Function GetContainer() native`

Returns the container this reference is in - if any

([TOC](#table-of-contents))

##### Function: GetItemHealthPercent (Native)
`float Function GetItemHealthPercent() native`

Returns the smithed health of this object reference (1.0 == 100%)

([TOC](#table-of-contents))

##### Function: GetKey (Native)
`Key Function GetKey() native`

Returns the key base object that will unlock this object

([TOC](#table-of-contents))

##### Function: GetLength (Native)
`float Function GetLength() native`

Get the current length of the object

([TOC](#table-of-contents))

##### Function: GetLinkedCell (Native)
`Cell Function GetLinkedCell(Keyword akKeyword) native`

Obtain the cell linked to us with the specified keyword (if any)

([TOC](#table-of-contents))

##### Function: GetLinkedRef (Native)
`ObjectReference Function GetLinkedRef(Keyword apKeyword = NONE) native`

Get our linked reference

([TOC](#table-of-contents))

##### Function: GetLinkedRefChain (Native)
`ObjectReference[] Function GetLinkedRefChain(keyword apKeyword = None, int iMaxExpectedLinkedRefs = 100) native`

Returns a chain of linked refs as an array,

Aborts early if it detects a loop

([TOC](#table-of-contents))

##### Function: GetLockLevel (Native)
`int Function GetLockLevel() native`

Get the level of the lock on this object

([TOC](#table-of-contents))

##### Function: GetLocRefTypes (Native)
`LocationRefType[] Function GetLocRefTypes() native`

Get the location ref types for this object

([TOC](#table-of-contents))

##### Function: GetNthLinkedRef (Native)
`ObjectReference Function GetNthLinkedRef(int aiLinkedRef, Keyword apKeyword = None) native`

Returns the Nth linked ref from this reference (0 = self, 1 = GetLinkedRef, 2 = GetLinkedRef.GetLinkedRef, etc)

([TOC](#table-of-contents))

##### Function: GetMass (Native)
`float Function GetMass() native`

Get this object's mass

([TOC](#table-of-contents))

##### Function: GetOpenState (Native)
`int Function GetOpenState() native`

Gets the open state of this object. Which can be one of the following:

0 - None

1 - Open

2 - Opening

3 - Closed

4 - Closing

([TOC](#table-of-contents))

##### Function: GetParentCell (Native)
`Cell Function GetParentCell() native`

Gets the cell this object is in

([TOC](#table-of-contents))

##### Function: GetPercentageKnown (Native)
`float Function GetPercentageKnown() native`

Gets the scan percentage of the ref between 0.0 and 1.0

([TOC](#table-of-contents))

##### Function: GetPositionX (Native)
`float Function GetPositionX() native`

Get the current X position of the object

([TOC](#table-of-contents))

##### Function: GetPositionY (Native)
`float Function GetPositionY() native`

Get the current Y position of the object

([TOC](#table-of-contents))

##### Function: GetPositionZ (Native)
`float Function GetPositionZ() native`

Get the current Z position of the object

([TOC](#table-of-contents))

##### Function: GetSpacePosition (Native)
`float[] Function GetSpacePosition() native`

Get the Cell Space position of the object

Values are returned in the array in the order:

position.x, position.y, position.z

([TOC](#table-of-contents))

##### Function: GetSpaceTransform (Native)
`float[] Function GetSpaceTransform() native`

Get the Cell Space transform of the object

Values are returned in the array in the order:

position.x, position.y, position.z,

xAxis.x, xAxis.y, xAxis.z,

yAxis.x, yAxis.y, yAxis.z,

zAxis.x, zAxis.y, zAxis.z

([TOC](#table-of-contents))

##### Function: GetRadioFrequency (Native)
`float Function GetRadioFrequency() native`

Get the frequency of this radio receiver (if it is a receiver)

([TOC](#table-of-contents))

##### Function: GetRadioVolume (Native)
`float Function GetRadioVolume() native`

Get the volume of this radio receiver (if it is a receiver)

([TOC](#table-of-contents))

##### Function: GetResourceDamage (Native)
`float Function GetResourceDamage(ActorValue akValue=None) native`

Get the total damage, if any, of the given resource or of all nonzero resource actor values.

([TOC](#table-of-contents))

##### Function: GetSafePosition (Native)
`float[] Function GetSafePosition(float aSearchRadius = -1.0, float aSafeRadius = -1.0 ) native`

Gets an array of the x,y,z of a safeRadius radius location within searchRadius of the reference, returns empty array if it fails.

([TOC](#table-of-contents))

##### Function: GetWeight (Native)
`float Function GetWeight() native`

Get this object's weight

([TOC](#table-of-contents))

##### Function: GetWeightInContainer (Native)
`float Function GetWeightInContainer() native`

Get the weight of all the objects in this container

([TOC](#table-of-contents))

##### Function: GetRefsLinkedToMe (Native)
`ObjectReference[] Function GetRefsLinkedToMe( Keyword apLinkKeyword = None, Keyword apExcludeKeyword = None ) native`

Get an array of all instantiated refs that link to this reference.

They must link to this ref with a keyworded linkedref using the keyword (apLinkKeyword).

Can optionally specify another keyword (apExcludeKeyword); refs with a linkedref using that keyword will be skipped when building the array.

([TOC](#table-of-contents))

##### Function: GetWorkshopOwnedObjects (Native)
`ObjectReference[] Function GetWorkshopOwnedObjects(Actor akActor) native`

Get all of the workshop objects on this Workbench owned by the given Actor.

([TOC](#table-of-contents))

##### Function: GetWorkshopResourceDamage (Native)
`float Function GetWorkshopResourceDamage(ActorValue akValue) native`

Get the total damage, if any, of the given resource on the Workshop.

([TOC](#table-of-contents))

##### Function: GetWorkshopResourceObjects (Native)
`ObjectReference[] Function GetWorkshopResourceObjects(ActorValue akAV = None, int aiOption = 0) native`

Get all of the resource-producing objects owned by this Workbench. If akAV is provided, only collect objects producing the corresponding resource. If aiOption is provided, use 0 for all nonzero resources, 1 for only damaged resources, 2 for only undamaged resources.

([TOC](#table-of-contents))

##### Function: GetScale (Native)
`float Function GetScale() native`

Get the current scale of the object

([TOC](#table-of-contents))

##### Function: GetSpaceshipAutopilotAI (Native)
`Actor Function GetSpaceshipAutopilotAI() native`

Get the autopilot ai actor for this reference if it has one

([TOC](#table-of-contents))

##### Function: GetTeleportCell (Native)
`Cell Function GetTeleportCell() native`

Get the target cell for this teleport ref

([TOC](#table-of-contents))

##### Function: GetTransitionCell (Native)
`Cell Function GetTransitionCell() native`

Get the transition cell for this teleport ref

([TOC](#table-of-contents))

##### Function: GetTransmitterDistance (Native)
`float Function GetTransmitterDistance() native`

Get the distance between this radio transmitter and the player

([TOC](#table-of-contents))

##### Function: GetTriggerObjectCount (Native)
`int Function GetTriggerObjectCount() native`

Get the number of objects inside this trigger (throws warning if not a trigger)

([TOC](#table-of-contents))

##### Function: GetValue (Native)
`float Function GetValue(ActorValue akAV) native`

Gets the specified actor value - returns 0 and logs an error if the value is unknown

([TOC](#table-of-contents))

##### Function: GetValueInt
`int Function GetValueInt(ActorValue akAV)`

returns GetValue() cast as an int

([TOC](#table-of-contents))

##### Function: GetValuePercentage (Native)
`float Function GetValuePercentage(ActorValue akAV) native`

Gets the specified actor value as a percentage of its max value - from 0 to 1

([TOC](#table-of-contents))

##### Function: GetValueResources (Native)
`Resource[] Function GetValueResources() native`

Returns all resources that are linked to this object via actor values

([TOC](#table-of-contents))

##### Function: GetValueEnumGlobal (Global)
`GlobalVariable Function GetValueEnumGlobal(ActorValue akAV, GlobalVariable[] akEnumGlobals)`

Returns a GlobalVariable with a matching value to the specified actorvalue (if there is more than one match it will return the first)

`akAV`: the ActorValue for which you want to return a matching GlobalVariable

`EnumGlobals`: an array of possibly matching GlobalVariables to return

([TOC](#table-of-contents))

##### Function: GetVoiceType (Native)
`VoiceType Function GetVoiceType() native`

Gets the voice type for this reference. Will return None if not an actor or a talking activator

([TOC](#table-of-contents))

##### Function: GetWidth (Native)
`float Function GetWidth() native`

Get the current width of the object

([TOC](#table-of-contents))

##### Function: GetWorkshop (Native)
`ObjectReference Function GetWorkshop() native`

Get the Workshop this reference belongs to, if any.

([TOC](#table-of-contents))

##### Function: GetWorldSpace (Native)
`WorldSpace Function GetWorldSpace() native`

Get this objects worldspace

([TOC](#table-of-contents))

##### Function: GetSelfAsActor
`actor Function GetSelfAsActor()`

Returns self cast as an actor

([TOC](#table-of-contents))

##### Function: GetSingleRefArray
`ObjectReference[] Function GetSingleRefArray()`

Returns a reference array with just this reference in it

([TOC](#table-of-contents))

##### Function: HasActorRefOwner (Native)
`bool Function HasActorRefOwner() native`

Returns true if there was an Actor (reference) set to own this object (even if that actor was a temp and is now gone).

([TOC](#table-of-contents))

##### Function: HasCrew (Native)
`bool Function HasCrew() native`

Checks to see if this reference has any crew members

([TOC](#table-of-contents))

##### Function: HasDirectLOS (Native)
`bool Function HasDirectLOS(ObjectReference akTarget, string asSourceNode = "", string asTargetNode = "") native`

Checks to see if there is a direct line-of-sight between us and the target, using the specified nodes

If the node strings are empty, the check will be done from the roots of the objects

([TOC](#table-of-contents))

##### Function: HasEffectKeyword (Native)
`bool Function HasEffectKeyword(Keyword akKeyword) native`

Returns if this reference has an active effect coming from a magic effect with the specified keyword attached

([TOC](#table-of-contents))

##### Function: HasKeyword (Native)
`bool Function HasKeyword(Keyword apKeyword) native`

Returns true if this reference has the specified keyword

([TOC](#table-of-contents))

##### Function: HasKeywordInFormList (Native)
`bool Function HasKeywordInFormList(FormList akKeywordList) native`

Returns if this reference has any of the keywords in the list attached

([TOC](#table-of-contents))

##### Function: HasLocRefType (Native)
`bool Function HasLocRefType(LocationRefType akRefType) native`

Returns if this reference has the specified location ref type

([TOC](#table-of-contents))

##### Function: HasMagicEffect (Native)
`bool Function HasMagicEffect(MagicEffect akMagicEffect) native`

check if this reference is affected by the given effect.

([TOC](#table-of-contents))

##### Function: HasNode (Native)
`bool Function HasNode(string asNodeName) native`

Returns whether the reference has the given node

([TOC](#table-of-contents))

##### Function: HasOwner
`bool Function HasOwner()`

Returns true if this ref owned in any way

([TOC](#table-of-contents))

##### Function: HasSharedPowerGrid (Native)
`bool Function HasSharedPowerGrid(ObjectReference akCompare) native`

Returns true if this reference is on the same power grid as the compare reference.

([TOC](#table-of-contents))

##### Function: IgnoreFriendlyHits (Native)
`Function IgnoreFriendlyHits(bool abIgnore = true) native`

Flags this reference as ignoring (or not ignoring) friendly hits

([TOC](#table-of-contents))

##### Function: InterruptCast (Native)
`Function InterruptCast() native`

Interrupts any spell-casting this object may be doing

([TOC](#table-of-contents))

##### Function: IsActivationBlocked (Native)
`bool Function IsActivationBlocked() native`

Checks to see if activation is currently blocked on this object

([TOC](#table-of-contents))

##### Function: Is3DLoaded (Native)
`bool Function Is3DLoaded() native`

Returns if the 3d for this object is loaded or not

([TOC](#table-of-contents))

##### Function: IsConveyorBeltOn (Native)
`bool Function IsConveyorBeltOn( ) native`

Check if conveyor belt on.

([TOC](#table-of-contents))

##### Function: IsCreated (Native)
`bool Function IsCreated() native`

Was this object created in-game?

([TOC](#table-of-contents))

##### Function: IsCrew
`bool Function IsCrew(Actor akActor)`

Returns true if specified actor is crew of this ship

([TOC](#table-of-contents))

##### Function: IsDebugTextBillboard (Native)
`bool Function IsDebugTextBillboard() native debugOnly`

Get the billboard flag of the debug text

([TOC](#table-of-contents))

##### Function: IsDeleted (Native)
`bool Function IsDeleted() native`

Is this object currently flagged for delete?

([TOC](#table-of-contents))

##### Function: IsDestroyed (Native)
`bool Function IsDestroyed() native`

Is this object destroyed?

([TOC](#table-of-contents))

##### Function: IsDisabled (Native)
`bool Function IsDisabled() native`

Is this object currently disabled?

([TOC](#table-of-contents))

##### Function: IsDoorInaccessible (Native)
`bool Function IsDoorInaccessible() native`

Is this object an inaccessible door

([TOC](#table-of-contents))

##### Function: IsEnabled
`bool Function IsEnabled()`

Because Shane got tired of remembering which way to call this

([TOC](#table-of-contents))

##### Function: IsFurnitureInUse (Native)
`bool Function IsFurnitureInUse(bool abIgnoreReserved = false) native`

Is any marker on this furniture in use?

([TOC](#table-of-contents))

##### Function: IsFurnitureMarkerInUse (Native)
`bool Function IsFurnitureMarkerInUse(int aiMarker, bool abIgnoreReserved = false) native`

Is a particular marker on this furniture in use?

([TOC](#table-of-contents))

##### Function: IsIgnoringFriendlyHits (Native)
`bool Function IsIgnoringFriendlyHits() native`

Is this object ignoring friendly hits?

([TOC](#table-of-contents))

##### Function: IsInDialogueWithPlayer (Native)
`bool Function IsInDialogueWithPlayer() native`

Is this actor or talking activator currently talking to the player?

([TOC](#table-of-contents))

##### Function: IsInTrigger (Native)
`bool Function IsInTrigger(ObjectReference refToCheck) native`

Is refToCheck in this trigger?

([TOC](#table-of-contents))

##### Function: IsInSpace (Native)
`bool Function IsInSpace() native`

Is this reference in space?

([TOC](#table-of-contents))

##### Function: IsLockBroken (Native)
`bool Function IsLockBroken() native`

Is the lock on this object broken?

([TOC](#table-of-contents))

##### Function: IsLocked (Native)
`bool Function IsLocked() native`

Is the lock on this object locked?

([TOC](#table-of-contents))

##### Function: IsMapMarkerVisible (Native)
`bool Function IsMapMarkerVisible() native`

Is the map marker visible?

([TOC](#table-of-contents))

##### Function: IsOwnedBy (Native)
`bool Function IsOwnedBy(Actor akOwner) native`

Is this ref owned by the given actor?

([TOC](#table-of-contents))

##### Function: IsPowered (Native)
`bool Function IsPowered() native`

Returns if the workshop object is considered powered

([TOC](#table-of-contents))

##### Function: IsQuestItem (Native)
`bool Function IsQuestItem() native`

Returns if this is a quest item or not

([TOC](#table-of-contents))

##### Function: IsRadioOn (Native)
`bool Function IsRadioOn() native`

Returns if this radio receiver is on or not

([TOC](#table-of-contents))

##### Function: IsScanned (Native)
`bool Function IsScanned() native`

Returns if this object has been scanned

([TOC](#table-of-contents))

##### Function: IsRefInTransitionCell (Native)
`bool Function IsRefInTransitionCell(ObjectReference akRef) native`

Returns if the given ref is inside this teleport ref's transition cell

([TOC](#table-of-contents))

##### Function: IsTeleportAreaLoaded (Native)
`bool Function IsTeleportAreaLoaded() native`

Returns if the given ref's teleport area is fully loaded or not

([TOC](#table-of-contents))

##### Function: IsSpellTarget (Native)
`bool Function IsSpellTarget(Form akMagicItemForm) native`

Returns if this ref is a spell target of the given magic item form.

([TOC](#table-of-contents))

##### Function: IsWithinBuildableArea (Native)
`bool Function IsWithinBuildableArea(ObjectReference akRef) native`

Returns if this reference is within the given Workshop activator's buildable area

([TOC](#table-of-contents))

##### Function: KnockAreaEffect (Native)
`Function KnockAreaEffect(float afMagnitude, float afRadius) native`

Executes a knock effect to an area

([TOC](#table-of-contents))

##### Function: Lock (Native)
`Function Lock(bool abLock = true, bool abAsOwner = false, bool abTraverseLinkedLockables = true) native`

Lock/unlock this object. If told to lock it, it will add a lock if it doesn't have one. If locked/unlocked as the owner on a door, the adjoining cell will be made public/private as appropriate. Can also optionally lock or unlock linked lockable reference

([TOC](#table-of-contents))

##### Function: MakeAliasedRefFromInventory (Native)
`ObjectReference Function MakeAliasedRefFromInventory(Form akObject, Alias akAlias) native`

Take an object in this ref's inventory, make a ref to it, force it into an alias, then re-add it to inventory

([TOC](#table-of-contents))

##### Function: MakeTransmitterRepeater (Native)
`Function MakeTransmitterRepeater(ObjectReference akTransmitterToRepeat, float afInnerRadius, float afOuterRadius, bool abUnlimitedRange = false) native`

Make this object a radio transmitter which will repeat all transmissions sent by akTransmitterToRepeat.

([TOC](#table-of-contents))

##### Function: ModValue (Native)
`Function ModValue(ActorValue akAV, float afAmount) native`

Modifies the specified actor value

([TOC](#table-of-contents))

##### Function: ModValueTo
`Function ModValueTo(ActorValue akAV, float afValue)`

Mod an actor value to a specified final value

([TOC](#table-of-contents))

##### Function: MoveContainerContentToUnfilledContainers (Native)
`Function MoveContainerContentToUnfilledContainers() native`

Moves containers content down the line to unfilled containers

([TOC](#table-of-contents))

##### Function: MoveTo (Native)
`Function MoveTo(ObjectReference akTarget, float afXOffset = 0.0, float afYOffset = 0.0, float afZOffset = 0.0, bool abMatchRotation = true, bool abRotateOffset = false) native`

Moves this object to the position of the specified object, with an offset, and optionally matching its rotation

([TOC](#table-of-contents))

##### Function: MoveToMyEditorLocation (Native)
`Function MoveToMyEditorLocation() native`

Moves this object to its editor location

([TOC](#table-of-contents))

##### Function: MoveToNearestNavmeshLocation (Native)
`Function MoveToNearestNavmeshLocation() native`

Moves this object to the nearest location on a Navmesh

([TOC](#table-of-contents))

##### Function: MoveToNode (Native)
`Function MoveToNode(ObjectReference akTarget, string asNodeName, string asMatchNodeName = "") native`

Moves this object (or its specified node if asMatchNodeName is valid) to the position (and rotation) of the specified node on the specified object's 3D

([TOC](#table-of-contents))

##### Function: OpenOneWayTransferMenu (Native)
`Function OpenOneWayTransferMenu(bool aIsGiveOnly, FormList aFilterList=None) native`

Opens this ref's inventory using a one-way transfer menu with optional filter list

([TOC](#table-of-contents))

##### Function: PlaceAtMe (Native)
`ObjectReference Function PlaceAtMe(Form akFormToPlace, int aiCount = 1, bool abForcePersist = false, bool abInitiallyDisabled = false, bool abDeleteWhenAble = true, float[] akOffsetValues = none, Alias akAliasToFill = None, bool abSnapOffsetToNavmesh = true) native`

Create x copies of the passed in form (forcing them to persist if desired) and place them at our location, returning the last object created

([TOC](#table-of-contents))

##### Function: PlaceShipAtMe (Native)
`SpaceshipReference Function PlaceShipAtMe(Form akFormToPlace, int aiLevelMod = 4, bool abPlayFx = true, bool abForcePersist = false, bool abInitiallyDisabled = false, bool abDeleteWhenAble = true, float[] akOffsetValues = none, Alias akAliasToFill = None, Location akEncLoc = None, bool abSnapOffsetToNavmesh = true) native`

Create a copy of the passed in form and place it at our location, returning the ship created

this must be a ship landing marker for ground placement

([TOC](#table-of-contents))

##### Function: PlaceShipAtMeOffset
`SpaceshipReference Function PlaceShipAtMeOffset(Form akFormToPlace, float xOffset = 0.0, float yOffset = 0.0, float zOffset = 0.0, int aiLevelMod = 4, bool abPlayFx = true, bool abForcePersist = false, bool abInitiallyDisabled = false, bool abDeleteWhenAble = true, Alias akAliasToFill = None, Location akEncLoc = None, bool abSnapOffsetToNavmesh = true)`

This is a version of PlaceShipAtMe that accepts offset for where the ship is placed instead of an array

([TOC](#table-of-contents))

##### Function: PlaceActorAtMe (Native)
`Actor Function PlaceActorAtMe(ActorBase akActorToPlace, int aiLevelMod = 4, Location akEncLoc = None, bool abForcePersist = false, bool abInitiallyDisabled = false, bool abDeleteWhenAble = true, float[] akOffsetValues = none, bool abSnapOffsetToNavmesh = true) native`

Create an actor at this object's location. Level mod is one of the following:

0 - Easy

1 - Medium

2 - Hard

3 - Boss

4 - None

([TOC](#table-of-contents))

##### Function: PlaceDuplicateActorAtMe (Native)
`Actor Function PlaceDuplicateActorAtMe(Actor akActorToDuplicate, bool abForcePersist = false, bool abInitiallyDisabled = false, bool abDeleteWhenAble = true, float[] akOffsetValues = none, Alias akAliasToFill = None, bool abSnapOffsetToNavmesh = true) native`

Creates a duplicate of the specified actor at this reference's location, returning the created actor

([TOC](#table-of-contents))

##### Function: PlaceAtNode (Native)
`ObjectReference Function PlaceAtNode(string asNodeName, Form akFormToPlace, int aiCount = 1, bool abForcePersist = false, bool abInitiallyDisabled = false, bool abDeleteWhenAble = true, bool abAttach = false) native`

Create x copies of the passed in form (forcing them to persist if desired) and place them at the location of the given node, returning the last object created

([TOC](#table-of-contents))

##### Function: PlaceCellAtMe (Native)
`Cell Function PlaceCellAtMe(Cell akCellToCopy, RefCollectionAlias akRefCollection = None, bool abForcePersist = false, bool abDeleteWhenAble = true, bool abInitiallyDisabled = false, float[] akOffsetValues = none) native`

Create a copy of the cell and place it at this reference's location - only works with refs in space exterior cells

DPierce: This function will place cells at incorrect locations. See: GEN-388123

([TOC](#table-of-contents))

##### Function: PlaceLockedRefKeyAtMe (Native)
`ObjectReference Function PlaceLockedRefKeyAtMe(ObjectReference aLockedRef, int aiCount = 1, bool abForcePersist = false, bool abInitiallyDisabled = false, bool abDeleteWhenAble = true) native`

Get the key for the given locked ref and place one of them at this reference

([TOC](#table-of-contents))

##### Function: PlayAnimation (Native)
`bool Function PlayAnimation(string asAnimation) native`

Start the specified animation playing - returns true if it succeeds

([TOC](#table-of-contents))

##### Function: PlayAnimationAndWait (Native)
`bool Function PlayAnimationAndWait(string asAnimation, string asEventName) native`

Start the specified animation playing and wait for the specified event - returns true if succeeds

([TOC](#table-of-contents))

##### Function: PlayGamebryoAnimation (Native)
`bool Function PlayGamebryoAnimation(string asAnimation, bool abStartOver = false, float afEaseInTime = 0.0) native`

Start the specified Gamebryo animation playing - returns true if it succeeds

([TOC](#table-of-contents))

##### Function: PlayImpactEffect (Native)
`bool Function PlayImpactEffect(ImpactDataSet akImpactEffect, string asNodeName = "", float afPickDirX = 0.0, float afPickDirY = 0.0, float afPickDirZ = -1.0, float afPickLength = 512.0, bool abApplyNodeRotation = false, bool abUseNodeLocalRotation = false) native`

Play the specified impact effect - returns true if it succeeds

([TOC](#table-of-contents))

##### Function: PlaySyncedAnimationSS (Native)
`bool Function PlaySyncedAnimationSS(string asAnimation1, ObjectReference akObj2, string asAnimation2) native`

Play two animations at once - one on this object, one on another object

([TOC](#table-of-contents))

##### Function: PlaySyncedAnimationAndWaitSS (Native)
`bool Function PlaySyncedAnimationAndWaitSS(string asAnimation1, string asEvent1, ObjectReference akObj2, string asAnimation2, string asEvent2) native`

Play two animations at once - one on this object, one on another object - and wait for both

([TOC](#table-of-contents))

##### Function: PlayTerrainEffect (Native)
`Function PlayTerrainEffect(string asEffectModelName, string asAttachBoneName) native`

Play a terrain effect that is attached to the specified bone of this object.

([TOC](#table-of-contents))

##### Function: PauseAudio (Native)
`Function PauseAudio() native`

Pause the audio file for a ref in a scene

([TOC](#table-of-contents))

##### Function: PreloadExteriorCell (Native)
`Function PreloadExteriorCell() native`

Preload only the exterior cell containing this reference

([TOC](#table-of-contents))

##### Function: PreloadTargetArea (Native)
`Function PreloadTargetArea() native`

Preload the target interior or exterior area for this reference

([TOC](#table-of-contents))

##### Function: ProcessTrapHit (Native)
`Function ProcessTrapHit(ObjectReference akTrap, float afDamage, float afPushback, float afXVel, float afYVel, float afZVel, float afXPos, float afYPos, float afZPos, int aeMaterial, float afStagger) native`

Tells this object to process a trap hitting it

([TOC](#table-of-contents))

##### Function: PromoteToLegendary (Native)
`Function PromoteToLegendary(int aiRank = 0, LegendaryItem akItemDefinition = None) native`

Turns this object into a legendary item

([TOC](#table-of-contents))

##### Function: PushActorAway (Native)
`Function PushActorAway(Actor akActorToPush, float aiKnockbackForce) native`

Pushes the passed-in actor away from this object, using the passed in knockback force to determine the speed

([TOC](#table-of-contents))

##### Function: RemoveAllItems (Native)
`Function RemoveAllItems(ObjectReference akTransferTo = None, bool abKeepOwnership = false, bool abRespectTargetCapacity = false) native`

Removes all items from this container, transferring it to the other object if passed

([TOC](#table-of-contents))

##### Function: RemoveAllItemsEx (Native)
`Function RemoveAllItemsEx(ObjectReference akTransferTo = None, bool abKeepOwnership = false, bool abRespectTargetCapacity = false, bool abSilent = false) native`

Removes all items from this container, transferring it to the other object if passed, silent param to supress warnings

([TOC](#table-of-contents))

##### Function: RemoveResources (Native)
`int Function RemoveResources(Resource akResource, int aiCount, bool abSilent = false) native`

Removes the specified count of resource from the container, scrapping items, and returning the remainder to said container.

The function returns the number of resource actually removed from the container

([TOC](#table-of-contents))

##### Function: RemoveItem (Native)
`int Function RemoveItem(Form akItemToRemove, int aiCount = 1, bool abSilent = false, ObjectReference akOtherContainer = None) native`

Removes the specified item from this object reference's inventory

The function returns the actual number of items removed from the container

([TOC](#table-of-contents))

##### Function: RemoveItemByComponent (Native)
`int Function RemoveItemByComponent(Form akComponentToRemove, int aiCount = 1, bool abSilent = false, ObjectReference akOtherContainer = None) native`

Removes items from this object reference's inventory containing up to aiCount components

The function returns the actual number of components removed from the container

([TOC](#table-of-contents))

##### Function: RemoveKeyword (Native)
`Function RemoveKeyword(Keyword apKeyword) native`

Removes a keyword from this reference

([TOC](#table-of-contents))

##### Function: RemoveAllMods (Native)
`Function RemoveAllMods() native`

Removes every single mod attached to this reference (warning, for some actors/items this will leave no rendering geometry at all!)

([TOC](#table-of-contents))

##### Function: RemoveAllModsFromInventoryItem (Native)
`Function RemoveAllModsFromInventoryItem(Form akItem) native`

Removes every single mod attach to an item in this reference's inventory. Note that some items won't have any geometry if you do this (handmade guns)

([TOC](#table-of-contents))

##### Function: RemoveMod (Native)
`Function RemoveMod(ObjectMod akMod) native`

Remove the requested mod from the reference

([TOC](#table-of-contents))

##### Function: RemoveModFromInventoryItem (Native)
`Function RemoveModFromInventoryItem(Form akItem, ObjectMod akMod) native`

Remove the requested mod from an item in this reference's inventory

([TOC](#table-of-contents))

##### Function: RemoveDependentAnimatedObjectReference (Native)
`bool Function RemoveDependentAnimatedObjectReference( ObjectReference akDependent ) native`

Removes a previously added dependent object

This function should be used only with a coder supervision.  It is left undocumented because it can cause dangling pointers as well as very broken functionality for the dependent object if used improperly.

([TOC](#table-of-contents))

##### Function: RemoveTransferLink (Native)
`Function RemoveTransferLink(ObjectReference akTarget) native`

Removes the transfer link from this reference and another, if any.

([TOC](#table-of-contents))

##### Function: Repair (Native)
`Function Repair() native`

Repair this object.

([TOC](#table-of-contents))

##### Function: Reset (Native)
`Function Reset(ObjectReference akTarget = None) native`

Resets this object, optional place the object at the new target

([TOC](#table-of-contents))

##### Function: SetRequiresScanning (Native)
`Function SetRequiresScanning(bool abRequiresScanning = true) native`

Sets the visibility of this reference (which is a map marker) on the star map

([TOC](#table-of-contents))

##### Function: ResetKeyword (Native)
`Function ResetKeyword(Keyword apKeyword) native`

Resets a keyword's add/remove status so the data comes from the base object and aliases

([TOC](#table-of-contents))

##### Function: RestoreValue (Native)
`Function RestoreValue(ActorValue akAV, float afAmount) native`

Restores damage done to the actor value(up to 0 damage)

([TOC](#table-of-contents))

##### Function: ResumeAudio (Native)
`Function ResumeAudio( ) native`

Resume the audio file for a ref in a scene

([TOC](#table-of-contents))

##### Function: ReverseConveyorBelt (Native)
`Function ReverseConveyorBelt( bool abReverse = true ) native`

Set conveyor belt reverse state.

([TOC](#table-of-contents))

##### Function: Say (Native)
`Function Say(Topic akTopicToSay, Actor akActorToSpeakAs = None, bool abSpeakInPlayersHead = false, ObjectReference akTarget = None) native`

Has this object "say" the specified topic, as if spoken by the specified actor (if one is provided), and potentially "speaking" in the player's head.

([TOC](#table-of-contents))

##### Function: SayCustom (Native)
`Function SayCustom(Keyword akKeywordToSay, Actor akActorToSpeakAs = None, bool abSpeakInPlayersHead = false, ObjectReference akTarget = None) native`

Has this object "say" a keyworded topic, as if spoken by the specified actor (if one is provided), and potentially "speaking" in the player's head.

([TOC](#table-of-contents))

##### Function: SendStealAlarm (Native)
`Function SendStealAlarm(Actor akThief) native`

Has this object behave as if the specified actor attempted to steal it

([TOC](#table-of-contents))

##### Function: SetActivateTextOverride (Native)
`Function SetActivateTextOverride(Message akText) native`

Sets this object's activate text to be the full name of the given message

([TOC](#table-of-contents))

##### Function: SetActorCause (Native)
`Function SetActorCause(Actor akActor) native`

Sets this object's actor cause to the specified actor

([TOC](#table-of-contents))

##### Function: SetActorOwner (Native)
`Function SetActorOwner(ActorBase akActorBase, bool abNoCrime = false) native`

Sets this object's owner to the specified actor base - None means to remove ownership

([TOC](#table-of-contents))

##### Function: SetActorRefOwner (Native)
`Function SetActorRefOwner(Actor akActor, bool abNoCrime = false) native`

Sets this object's owner to the specified actor ref - None means to remove ownership

([TOC](#table-of-contents))

##### Function: SetAngle (Native)
`Function SetAngle(float afXAngle, float afYAngle, float afZAngle) native`

Set the orientation of the object (angles are in degrees)

([TOC](#table-of-contents))

##### Function: SetAnimationVariableBool (Native)
`Function SetAnimationVariableBool(string arVariableName, bool abNewValue) native`

Set a variable on the reference's animation graph (if applicable). Bool version.

([TOC](#table-of-contents))

##### Function: SetAnimationVariableInt (Native)
`Function SetAnimationVariableInt(string arVariableName, int aiNewValue) native`

Set a variable on the reference's animation graph (if applicable). Int version.

([TOC](#table-of-contents))

##### Function: SetAnimationVariableFloat (Native)
`Function SetAnimationVariableFloat(string arVariableName, float afNewValue) native`

Set a variable on the reference's animation graph (if applicable). Float version.

([TOC](#table-of-contents))

##### Function: SetAttractionActive (Native)
`Function SetAttractionActive(Keyword apKeyword, bool abActive = true) native`

Sets whether this ref should send attraction-object story manager events for the specified keyword.

([TOC](#table-of-contents))

##### Function: SetConveyorBeltVelocity (Native)
`Function SetConveyorBeltVelocity( float afLinVelX, float afLinVelY, float afLinVelZ ) native`

Set linear velocity for conveyor belt.

([TOC](#table-of-contents))

##### Function: RotateCarouselDisplayCase (Native)
`Function RotateCarouselDisplayCase( int aiDirection ) native`

Rotate carousel display case.

([TOC](#table-of-contents))

##### Function: SetDebugTextBillboard (Native)
`Function SetDebugTextBillboard(bool abBillboard = true) native debugOnly`

Set the billboard flag of the debug text

([TOC](#table-of-contents))

##### Function: SetDebugTextColor (Native)
`Function SetDebugTextColor(int aiRed, int aiGreen, int aiBlue, int aiAlpha = 255) native debugOnly`

Set the color of the debug text (each int is clamped between 0 and 255)

([TOC](#table-of-contents))

##### Function: SetDebugTextSize (Native)
`Function SetDebugTextSize(int aiFontSize) native debugOnly`

Set the font size of the debug text

([TOC](#table-of-contents))

##### Function: SetDebugTextString (Native)
`Function SetDebugTextString(string asText) native debugOnly`

Set the text string of the debug text

([TOC](#table-of-contents))

##### Function: SetDestroyed (Native)
`Function SetDestroyed(bool abDestroyed = true) native`

Sets this object as destroyed or not

([TOC](#table-of-contents))

##### Function: SetDirectAtTarget (Native)
`Function SetDirectAtTarget(ObjectReference akTarget) native`

Sets the direct-at target for this reference (or clears it if None is passed)

Note that the object must have an animation graph with a direct-at modifier on it for this to do anything

([TOC](#table-of-contents))

##### Function: SetMarkerDiscovered (Native)
`Function SetMarkerDiscovered() native`

Sets a map marker as discovered

([TOC](#table-of-contents))

##### Function: SetDoorInaccessible (Native)
`Function SetDoorInaccessible(bool abInaccessible) native`

Sets this door as inaccessible

([TOC](#table-of-contents))

##### Function: SetFactionOwner (Native)
`Function SetFactionOwner(Faction akFaction, bool abNoCrime = false) native`

Sets this object's owner to the specified faction

([TOC](#table-of-contents))

##### Function: SetHarvested (Native)
`Function SetHarvested(bool abHarvested) native`

Marks the object as Harvested or not Harvested (if it's Flora)

([TOC](#table-of-contents))

##### Function: SetLinkedRef (Native)
`Function SetLinkedRef(ObjectReference akLinkedRef, Keyword apKeyword = NONE, bool abPromoteParentRefr = true) native`

Set our linked reference

([TOC](#table-of-contents))

##### Function: SetLockLevel (Native)
`Function SetLockLevel(int aiLockLevel) native`

Sets the lock level on this object. Will add an unlocked lock to it if it doesn't have one

([TOC](#table-of-contents))

##### Function: SetLocRefType (Native)
`Function SetLocRefType(Location akLoc, LocationRefType akRefType ) native`

Sets the an in-game created reference to have the given loc ref type for the given location

([TOC](#table-of-contents))

##### Function: SetMapMarkerCategory (Native)
`Function SetMapMarkerCategory (int iCategory = 0) native`

Sets the category of the map marker on the star map.

([TOC](#table-of-contents))

##### Function: SetMapMarkerType (Native)
`Function SetMapMarkerType(int iType = 0) native`

Sets the type of the map marker on the star map

([TOC](#table-of-contents))

##### Function: SetMapMarkerUnexploredName (Native)
`Function SetMapMarkerUnexploredName(Message aName) native`

Sets the unexplored name of the map marker on the star map.

([TOC](#table-of-contents))

##### Function: SetMarkerAllowGravJump (Native)
`Function SetMarkerAllowGravJump(bool aAllowGravJump = true) native`

Sets the map marker on the star map to allow grav jumping, defaults to true.

([TOC](#table-of-contents))

##### Function: SetMarkerUndiscoveredVisibility (Native)
`Function SetMarkerUndiscoveredVisibility(int iVisibilityEnum = 0) native`

Sets the undiscovered visibility on the star map

([TOC](#table-of-contents))

##### Function: SetMarkerVisibleOnStarMap (Native)
`Function SetMarkerVisibleOnStarMap(bool aVisible = true) native`

Sets the visibility of this reference (which is a map marker) on the star map

([TOC](#table-of-contents))

##### Function: SetMotionType (Native)
`Function SetMotionType(int aeMotionType, bool abImmediatelySimulate = true) native`

Sets the motion type of the reference

`aeMotionType`: The type of motion (see properties at end of file)

`abImmediatelySimulate`: If true, the object will immediately simulate (i.e. as if the player bumped into it)

([TOC](#table-of-contents))

##### Function: SetNoFavorAllowed (Native)
`Function SetNoFavorAllowed(bool abNoFavor = true) native`

Sets this object reference as one that teammates will refuse to do favors on

([TOC](#table-of-contents))

##### Function: SetOpen (Native)
`Function SetOpen(bool abOpen = true) native`

Opens/closes this object

([TOC](#table-of-contents))

##### Function: SetOverrideName (Native)
`Function SetOverrideName(Message akText) native`

Sets this object's name to the given message

([TOC](#table-of-contents))

##### Function: SetPersistLoc (Native)
`Function SetPersistLoc(Location akLoc) native`

Sets the persist location on an in-game created reference

([TOC](#table-of-contents))

##### Function: SetPlayerHasTaken (Native)
`Function SetPlayerHasTaken(bool abTaken = true) native`

Flags/unflags this reference as having been taken by the player

([TOC](#table-of-contents))

##### Function: SetPosition (Native)
`Function SetPosition(float afX, float afY, float afZ) native`

Set the position of the object

([TOC](#table-of-contents))

##### Function: SetRadioOn (Native)
`Function SetRadioOn(bool abOn = true) native`

Turns on/off this radio receiver

([TOC](#table-of-contents))

##### Function: SetRadioFrequency (Native)
`Function SetRadioFrequency(float afFrequency) native`

Sets the frequency of this radio receiver

([TOC](#table-of-contents))

##### Function: SetRadioVolume (Native)
`Function SetRadioVolume(float afVolume) native`

Sets the volume of this radio receiver

([TOC](#table-of-contents))

##### Function: SetWorkshopState (Native)
`bool Function SetWorkshopState(int aState) native`

Attempts to set the state of the given Workshop

([TOC](#table-of-contents))

##### Function: SetScale (Native)
`Function SetScale(float afScale) native`

Set the current scale of the object

([TOC](#table-of-contents))

##### Function: SetScanned (Native)
`Function SetScanned(bool abValue = true) native`

Sets the objects scanned status if it is scannable

([TOC](#table-of-contents))

##### Function: SetValue (Native)
`Function SetValue(ActorValue akAV, float afValue) native`

Sets the specified actor value

([TOC](#table-of-contents))

##### Function: IncrementLoopingValue
`int Function IncrementLoopingValue(ActorValue akAV, int aiMaxValue, int aiIncrementAmount = 1)`

Increments an actorvalue, and rolls it over to 0 if incremented value would exceed aiMaxValue

sets and returns (GetValueInt(akAV) + aiIncrementAmount) % (aiMaxValue + 1)

([TOC](#table-of-contents))

##### Function: ShowHangarMenu (Native)
`Function ShowHangarMenu(int aiMode = 0, Actor akVendor = None, SpaceshipReference akMenuTarget = None, bool abOpenToAvailableTab = false) native`

Opens the Hangar Menu for the current reference. Mode 0 = credits (vending), Mode 1 = resources (crafting)

([TOC](#table-of-contents))

##### Function: ShowWorkshopBuilderMenu (Native)
`Function ShowWorkshopBuilderMenu() native`

Opens the Workshop Builder Menu for the current reference

([TOC](#table-of-contents))

##### Function: ShowWorkshopTargetMenu (Native)
`Function ShowWorkshopTargetMenu(bool abIncludeSameSystem = true, Keyword akSameSystemRequiredKeyword = None, bool abIncludeIntersystem = true, Keyword akIntersystemRequiredKeyword = None) native`

Opens the Workshop Target Menu for the current reference

([TOC](#table-of-contents))

##### Function: SplineTranslateTo (Native)
`Function SplineTranslateTo(float afX, float afY, float afZ, float afXAngle, float afYAngle, float afZAngle, float afTangentMagnitude, float afSpeed, float afMaxRotationSpeed = 0.0) native`

Makes the reference translate to the given position/orientation on a spline

([TOC](#table-of-contents))

##### Function: SplineTranslateToRef
`Function SplineTranslateToRef(ObjectReference arTarget, float afTangentMagnitude, float afSpeed, float afMaxRotationSpeed = 0.0)`

Makes the reference translate to the target ref position/orient on a spline at the given speed

([TOC](#table-of-contents))

##### Function: SplineTranslateToRefNode (Native)
`Function SplineTranslateToRefNode(ObjectReference arTarget, string arNodeName, float afTangentMagnitude, float afSpeed, float afMaxRotationSpeed = 0.0) native`

Makes the reference translate to the target node's ref/orient on a spline at the given speed

([TOC](#table-of-contents))

##### Function: StartSequenceOnReferences (Native) (Global)
`Function StartSequenceOnReferences(string aSequenceName, ObjectReference[] aRefs, bool aAttach) native global`

Starts a named effect sequence on the passed in references.

Allows you to define if you should attach the effect sequence to the reference

([TOC](#table-of-contents))

##### Function: StartSequence (Native)
`Function StartSequence(string aSequenceName, bool aAttach, float afWeight = 1.0) native`

Starts a named effect sequence on the reference

Allows you to define if you should attach the effect sequence to the reference

Allows providing an optional weight to the sequence

([TOC](#table-of-contents))

##### Function: StartWorkshop (Native)
`Function StartWorkshop(bool abStart = true) native`

Starts/Stops Workshop mode with the given workshop ref

([TOC](#table-of-contents))

##### Function: StopAllSequencesOnReferences (Native) (Global)
`Function StopAllSequencesOnReferences(ObjectReference[] aRefs) native global`

Stops all sequences on the passed in references.

([TOC](#table-of-contents))

##### Function: StopAllSequences (Native)
`Function StopAllSequences() native`

Stops all sequences on the self reference.

([TOC](#table-of-contents))

##### Function: StopSequence (Native)
`Function StopSequence(string aSequenceName) native`

Stops the named sequence on the self reference.

([TOC](#table-of-contents))

##### Function: StopTranslation (Native)
`Function StopTranslation() native`

Stops the reference from moving

([TOC](#table-of-contents))

##### Function: TranslateTo (Native)
`Function TranslateTo(float afX, float afY, float afZ, float afXAngle, float afYAngle, float afZAngle, float afSpeed, float afMaxRotationSpeed = 0.0) native`

Makes the reference translate to the given position/orientation

Note: Rotation speed is entirely dependent on the length of the path and the movement speed that is, the rotation will happen such that the reference reaches the goal orientation at the end of the translation.

([TOC](#table-of-contents))

##### Function: TranslateToRef
`Function TranslateToRef(ObjectReference arTarget, float afSpeed, float afMaxRotationSpeed = 0.0)`

Makes the reference translate to the target ref position/orient at the given speed

([TOC](#table-of-contents))

##### Function: UnassignCrew (Native)
`Function UnassignCrew(Actor aCrewMember) native`

Unassigns the specified actor as a member of the references crew

([TOC](#table-of-contents))

##### Function: WaitForAnimationEvent (Native)
`bool Function WaitForAnimationEvent(string asEventName) native`

Waits for the animation graph to send the specified event

([TOC](#table-of-contents))

##### Function: WaitFor3DLoad (Native)
`bool Function WaitFor3DLoad() native`

Waits for this object's 3d to load. Returns true if the 3D loaded, or false if it was disabled, the parent cell was unloaded

or something else is preventing it from loading its 3D

([TOC](#table-of-contents))

##### Function: IsInLocation
`bool Function IsInLocation(Location akLocation)`

Convenience function to check if I'm in a location or any of its children

([TOC](#table-of-contents))

##### Function: TryToStartCombat
`bool Function TryToStartCombat(ObjectReference akTarget, bool abPreferredTarget = false)`

Starts combat with the target if called on a spaceship or an actor AND akTarget matches what you called it on

returns FALSE if called on something else

`abPreferredTarget` - OPTIONAL (Def=false) True to set the target as the actor's preferred target

([TOC](#table-of-contents))

##### Function: TryToStopCombat
`bool Function TryToStopCombat()`

Stops combat if called on a spaceship or an actor

returns FALSE if called on something else

([TOC](#table-of-contents))

##### Function: TryToStopCombatAlarm
`bool Function TryToStopCombatAlarm()`

Stops combat and alarms if called on a spaceship or an actor

returns FALSE if called on something else

([TOC](#table-of-contents))

##### Function: TryToAddToFaction
`bool Function TryToAddToFaction(Faction akFaction)`

Adds this actor or spaceship to a faction at rank 0 if they aren't already in it

returns FALSE if called on something else

([TOC](#table-of-contents))

##### Function: TryToRemoveFromFaction
`bool Function TryToRemoveFromFaction(Faction akFaction)`

Removes this actor or spaceship from the specified faction

returns FALSE if called on something else

([TOC](#table-of-contents))

##### Function: TryToRemoveFromAllFactions
`bool Function TryToRemoveFromAllFactions()`

Removes this actor or spaceship from all factions

returns FALSE if called on something else

([TOC](#table-of-contents))

##### Function: TryToEvaluatePackage
`bool Function TryToEvaluatePackage()`

Evaluates this actor or spaceship's package

returns FALSE if called on something else

([TOC](#table-of-contents))

##### Function: TryToKill
`bool Function TryToKill(ObjectReference akKiller)`

Evaluate if you're able to kill the `akKiller`

`akKiller`: The Actor or SpaceshipReference who is the guilty party in killing this one. If the type doesn't match, then the killer will be None. (I.e. if this is called on an actor, the killer must also be an actor)

Returns true if this was called on an actor or spaceship and was killed.

([TOC](#table-of-contents))

##### Function: TryToSetGhost
`bool Function TryToSetGhost(bool bSetGhost = True)`

Sets ghost flag on actor or spaceship

returns FALSE if called on something else

([TOC](#table-of-contents))

##### Function: TryToSetProtected
`bool Function TryToSetProtected(bool bSetProtected = True)`

Sets protected flag on actor or spaceship

returns FALSE if called on something else

([TOC](#table-of-contents))

##### Function: TryToSetEssential
`bool Function TryToSetEssential(bool bSetEssential = True)`

Sets essential flag on actor or spaceship

returns FALSE if called on something else

([TOC](#table-of-contents))

##### Function: PlaceShipNearMe
`SpaceshipReference Function PlaceShipNearMe(Form akFormToPlace, int positionVal=0, int distanceVal=0, int facingVal=0, int aiLevelMod = 4, bool abPlayFx = true, bool abForcePersist = false, bool abInitiallyDisabled = false, bool abDeleteWhenAble = true, Alias akAliasToFill = None)`

Convenience function that places a ship near a ref, calculating an offset position based on MoveNear's positionVal, distanceVal, and facingVal values.

([TOC](#table-of-contents))

##### Function: MoveNear
`Function MoveNear(ObjectReference akTarget, int positionVal=0, int distanceVal=0, int facingVal=0)`

Convenience function that moves this ref near another ref, calculating an offset position for it based on the following enums:

positionVal, default=0
- -2 = Random (0-6)
- -1 = Dead ahead.
- 0 = Tight forward arc. ("Half the distance to the outer targeting ring or less.")
- 1 = Wide forward arc. ("Within the outer targeting ring.")
- 2 = Behind you.
- 3 = Above you.
- 4 = Below you.
- 5 = On your left/port.
- 6 = On your right/starboard.

distanceVal, default=0
- -3 = Random (2-4)
- -2 = Random (0-4)
- -1 = Very close. ("As close as possible without colliding.")
- 0 = Close. ("Nearby, easily visible, at a good hailing distance.")
- 1 = Short Range. ("Nearby, hailing looks reasonable, a good range for an ambush.")
- 2 = Moderate Range. ("A good range for standard combat.")
- 3 = Long Range. ("A smudge in the distance.")
- 4 = Very Long Range. ("It's out there somewhere.")

facingVal, default=
- -3 = Totally at random.
- -2 = Random (0-7)
- -1 = Directly at you.
- 0 = Towards you, small offset. ("Looking at you.")
- 1 = Towards you, large offset. ("Looking in your general direction.")
- 2 = Away from you, small offset.
- 3 = Away from you, large offset.
- 4 = Left/port side facing you.
- 5 = Right/starboard side facing you.
- 6 = Bottom facing you.
- 7 = Top facing you.

([TOC](#table-of-contents))

##### Script: Actor
`Scriptname Actor extends ObjectReference Native Hidden`

Relationship functions use the following values:
- 4 - Lover
- 3 - Ally
- 2 - Confidant
- 1 - Friend
- 0 - Acquaintance
- -1 - Rival
- -2 - Foe
- -3 - Enemy
- -4 - Archnemesis

([TOC](#table-of-contents))

###### Event: OnActorActivatedRef
`Event OnActorActivatedRef(ObjectReference akActivatedRef)`

Event received when this actor activates a ref

([TOC](#table-of-contents))

###### Event: OnAffinityEvent
`Event OnAffinityEvent(AffinityEvent akAffinityEvent, ActorValue akActorValue, GlobalVariable akReactionValue, ObjectReference akTarget)`

Event received when affinity event is run

([TOC](#table-of-contents))

###### Event: OnCombatStateChanged
`Event OnCombatStateChanged(ObjectReference akTarget, int aeCombatState)`

Event that is triggered when this actor's combat state against the target changes

State is as follows:
- 0 - not in combat
- 1 - in combat
- 2 - searching

([TOC](#table-of-contents))

###### Event: OnCombatListAdded
`Event OnCombatListAdded(Actor akTarget)`

Event that is triggered when this actor adds another actor to its combat list.

([TOC](#table-of-contents))

###### Event: OnCombatListRemoved
`Event OnCombatListRemoved(Actor akTarget)`

Event that is triggered when this actor removes another actor from its combat list.

([TOC](#table-of-contents))

###### Event: OnCommandModeCompleteCommand
`Event OnCommandModeCompleteCommand(int aeCommandType, ObjectReference akTarget)`

Event received when the actor completes a command in command mode.

Type is as follows:
- 0 - None
- 1 - Call
- 2 - Follow
- 3 - Move
- 4 - Attack
- 5 - Inspect
- 6 - Retrieve
- 7 - Stay
- 8 - Release
- 9 - Heal
- 10 - Assign
- 11 - Ride
- 12 - Enter

([TOC](#table-of-contents))

###### Event: OnCommandModeEnter
`Event OnCommandModeEnter()`

Event received when the player begins commanding this actor.

([TOC](#table-of-contents))

###### Event: OnCommandModeExit
`Event OnCommandModeExit()`

Event received when the player ends commanding this actor.

([TOC](#table-of-contents))

###### Event: OnCommandModeGiveCommand
`Event OnCommandModeGiveCommand(int aeCommandType, ObjectReference akTarget)`

Event received when the player gives actor a command in command mode.

Type is as follows:
- 0 - None
- 1 - Call
- 2 - Follow
- 3 - Move
- 4 - Attack
- 5 - Inspect
- 6 - Retrieve
- 7 - Stay
- 8 - Release
- 9 - Heal
- 10 - Assign
- 11 - Ride
- 12 - Enter

([TOC](#table-of-contents))

###### Event: OnCompanionDismiss
`Event OnCompanionDismiss()`

Received when player dismisses teammate companion

([TOC](#table-of-contents))

###### Event: OnConsciousnessStateChanged
`Event OnConsciousnessStateChanged( bool abUnconscious )`

Event that is triggered when this actor's consciousness state changes

([TOC](#table-of-contents))

###### Event: OnCripple
`Event OnCripple(ActorValue akActorValue, bool abCrippled)`

Recieved immeadiately after a limb has become crippled or uncrippled.

([TOC](#table-of-contents))

###### Event: OnDeferredKill
`Event OnDeferredKill(Actor akKiller)`

Event that is triggered when this actor gets a deferred kill added

(they were in deferred kill mode and got "killed")

([TOC](#table-of-contents))

###### Event: OnDeath
`Event OnDeath(ObjectReference akKiller)`

Event that is triggered when this actor finishes dying

([TOC](#table-of-contents))

###### Event: OnDifficultyChanged
`Event OnDifficultyChanged(int aOldDifficulty, int aNewDifficulty)`

Event received when the player changes their difficulty

Type is as follows:
- 0 - Very Easy
- 1 - Easy
- 2 - Normal
- 3 - Hard
- 4 - Very Hard
- 5 - Survival

([TOC](#table-of-contents))

###### Event: OnDying
`Event OnDying(ObjectReference akKiller)`

Event that is triggered when this actor begins to die

([TOC](#table-of-contents))

###### Event: OnEnterBleedout
`Event OnEnterBleedout()`

Event received when an actor enters bleedout.

([TOC](#table-of-contents))

###### Event: OnEnterOutpostBeaconMode
`Event OnEnterOutpostBeaconMode()`

Event received when the player enters Outpost Beacon placement mode.

([TOC](#table-of-contents))

###### Event: OnEnterShipInterior
`Event OnEnterShipInterior(ObjectReference akShip)`

Event received when an actor enters a ship interior cell

([TOC](#table-of-contents))

###### Event: OnEnterSneaking
`Event OnEnterSneaking()`

Event received when an actor enters sneaking.

([TOC](#table-of-contents))

###### Event: OnEscortWaitStart
`Event OnEscortWaitStart()`

Event received when this actor is in an Escort procedure and begins waiting for the escorted actor to catch up.

([TOC](#table-of-contents))

###### Event: OnEscortWaitStop
`Event OnEscortWaitStop()`

Event received when this actor is in an Escort procedure and stops waiting because the escorted actor has caught up.

([TOC](#table-of-contents))

###### Event: OnExitShipInterior
`Event OnExitShipInterior(ObjectReference akShip)`

Event received when an actor exits a ship interior cell

([TOC](#table-of-contents))

###### Event: OnGetUp
`Event OnGetUp(ObjectReference akFurniture)`

Event that is triggered when this actor leaves the furniture

([TOC](#table-of-contents))

###### Event: OnHomeShipSet
`Event OnHomeShipSet(SpaceshipReference akShip, SpaceshipReference akPrevious)`

Event that is triggered when the actors home ship is set.

([TOC](#table-of-contents))

###### Event: OnItemEquipped
`Event OnItemEquipped(Form akBaseObject, ObjectReference akReference)`

Event received when this actor equips something - akReference may be None if object is not persistent

([TOC](#table-of-contents))

###### Event: OnItemUnequipped
`Event OnItemUnequipped(Form akBaseObject, ObjectReference akReference)`

Event received when this actor unequips something - akReference may be None if object is not persistent

([TOC](#table-of-contents))

###### Event: OnKill
`Event OnKill(ObjectReference akVictim)`

Event that is triggered when this actor kills another

([TOC](#table-of-contents))

###### Event: OnLocationChange
`Event OnLocationChange(Location akOldLoc, Location akNewLoc)`

Event that is triggered when this actor changes from one location to another

([TOC](#table-of-contents))

###### Event: OnOutpostPlaced
`Event OnOutpostPlaced(ObjectReference akOutpostBeacon)`

Received when player placed an outpost beacon

([TOC](#table-of-contents))

###### Event: OnPackageChange
`Event OnPackageChange(Package akOldPackage)`

Event received when this actor's package changes

([TOC](#table-of-contents))

###### Event: OnPackageEnd
`Event OnPackageEnd(Package akOldPackage)`

Event received when this actor's package ends

([TOC](#table-of-contents))

###### Event: OnPackageStart
`Event OnPackageStart(Package akNewPackage)`

Event received when this actor starts a new package

([TOC](#table-of-contents))

###### Event: OnPartialCripple
`Event OnPartialCripple(ActorValue akActorValue, bool abCrippled)`

Received immediately after the limb of a robot (or other actor whose race allows sub-segment damage) has become (or ceased to be) partially crippled.

([TOC](#table-of-contents))

###### Event: OnPickLock
`Event OnPickLock(ObjectReference akLockedRef, bool abCrime, bool abSucceeded, TerminalMenu akLockedTerminalMenu, int aiTerminalMenuItem)`

Event received when an actor picks a lock

([TOC](#table-of-contents))

###### Event: OnPickpocketFailed
`Event OnPickpocketFailed()`

Received when the player fails to pickpocket this actor

([TOC](#table-of-contents))

###### Event: OnPlayerArrested
`Event OnPlayerArrested(ObjectReference akGuard, Location akLocation, int aeCrimeType )`

Event that is triggered when the player is arrested.

([TOC](#table-of-contents))

###### Event: OnPlayerAssaultActor
`Event OnPlayerAssaultActor(ObjectReference akVictim, Location akLocation, bool aeCrime )`

Event that is triggered when the player assaults someone.

([TOC](#table-of-contents))

###### Event: OnPlayerBuyShip
`Event OnPlayerBuyShip(SpaceshipReference akShip)`

Event that is triggered when the player buys a ship

([TOC](#table-of-contents))

###### Event: OnPlayerCraftItem
`Event OnPlayerCraftItem(ObjectReference akBench, Location akLocation, Form akCreatedItem)`

Received when player crafts an item

([TOC](#table-of-contents))

###### Event: OnPlayerCreateRobot
`Event OnPlayerCreateRobot(Actor akNewRobot)`

Received when player creates a new robot

([TOC](#table-of-contents))

###### Event: OnPlayerCompleteResearch
`Event OnPlayerCompleteResearch(ObjectReference akBench, Location akLocation, ResearchProject akProject)`

Received when player completes research

([TOC](#table-of-contents))

###### Event: OnPlayerCrimeGold
`Event OnPlayerCrimeGold(ObjectReference akVictim, Form akFaction, int aeCrimeGold, int aeCrimeType )`

Event that is triggered when the player gets crimegold .

([TOC](#table-of-contents))

###### Event: OnPlayerEnterVertibird
`Event OnPlayerEnterVertibird(ObjectReference akVertibird)`

Received when player enters vertibird

([TOC](#table-of-contents))

###### Event: OnPlayerFailedPlotRoute
`Event OnPlayerFailedPlotRoute(int aeFailedPlotReason)`

Event received when the player plots a failed starmap route

Type is as follows:
- 0 - Success
- 1 - Insufficient Fuel
- 2 - Out of Range
- 3 - Unexplored System

([TOC](#table-of-contents))

###### Event: OnPlayerFallLongDistance
`Event OnPlayerFallLongDistance(float afDamage)`

Received when player takes fall damage

([TOC](#table-of-contents))

###### Event: OnPlayerFireWeapon
`Event OnPlayerFireWeapon(Form akBaseObject)`

Received when player fires a weapon out of combat and based on timer

([TOC](#table-of-contents))

###### Event: OnPlayerFollowerWarp
`Event OnPlayerFollowerWarp(ObjectReference akFollower)`

Event received when a player follower is warped

([TOC](#table-of-contents))

###### Event: OnPlayerHealTeammate
`Event OnPlayerHealTeammate(Actor akTeammate)`

Received when player heals his teammate

([TOC](#table-of-contents))

###### Event: OnPlayerItemAdded
`Event OnPlayerItemAdded(Form akBaseObject, ObjectReference akOwner, ObjectReference akSourceContainer, int aeAcquireType)`

Received when the player gains an item in their inventory

`aeAcquireType` is one of the following:
- 0: None
- 1: Steal
- 2: Buy
- 3: Pickpocket
- 4: Pickup
- 5: Container
- 6: Dead body

([TOC](#table-of-contents))

###### Event: OnPlayerJail
`Event OnPlayerJail(ObjectReference akGuard, Form akFaction,  Location akLocation,int aeCrimeGold)`

Event that is triggered when the player goes to jail.

([TOC](#table-of-contents))

###### Event: OnPlayerLoadGame
`Event OnPlayerLoadGame()`

Received immediately after the player has loaded a save game. A good time to check for additional content.

([TOC](#table-of-contents))

###### Event: OnPlayerLoiteringBegin
`Event OnPlayerLoiteringBegin()`

Received when player starts loitering

([TOC](#table-of-contents))

###### Event: OnPlayerLoiteringEnd
`Event OnPlayerLoiteringEnd()`

Received when player stops loitering

([TOC](#table-of-contents))

###### Event: OnPlayerModArmorWeapon
`Event OnPlayerModArmorWeapon(Form akBaseObject, ObjectMod akModBaseObject)`

Received when player mods a weapon or armor in the menu.

([TOC](#table-of-contents))

###### Event: OnPlayerModifiedShip
`Event OnPlayerModifiedShip(SpaceshipReference akShip)`

Event that is triggered when an actor modifies a ship

([TOC](#table-of-contents))

###### Event: OnPlayerModRobot
`Event OnPlayerModRobot(Actor akRobot, ObjectMod akModBaseObject)`

Received when the player mods a robot

([TOC](#table-of-contents))

###### Event: OnPlayerMurderActor
`Event OnPlayerMurderActor(ObjectReference akVictim, Location akLocation, bool aeCrime )`

Event that is triggered when the player murders someone.

([TOC](#table-of-contents))

###### Event: OnPlayerPayFine
`Event OnPlayerPayFine(ObjectReference akGuard, Form akFaction, int aeCrimeGold)`

Event that is triggered when the player pays fine.

([TOC](#table-of-contents))

###### Event: OnPlayerPlanetSurveyComplete
`Event OnPlayerPlanetSurveyComplete(Planet akPlanet)`

Received when player completely surveyed a planet

([TOC](#table-of-contents))

###### Event: OnPlayerScannedObject
`Event OnPlayerScannedObject(ObjectReference akScannedRef)`

Received by the player when they scan an object

([TOC](#table-of-contents))

###### Event: OnPlayerSellShip
`Event OnPlayerSellShip(SpaceshipReference akShip)`

Event that is triggered when the player sells a ship

([TOC](#table-of-contents))

###### Event: OnPlayerSwimming
`Event OnPlayerSwimming()`

Received when player starts swimming

([TOC](#table-of-contents))

###### Event: OnPlayerTrespass
`Event OnPlayerTrespass(ObjectReference akVictim, Location akLocation,bool aeCrime)`

Event that is triggered when the player trespassing.

([TOC](#table-of-contents))

###### Event: OnPlayerUseWorkBench
`Event OnPlayerUseWorkBench(ObjectReference akWorkBench)`

Received when player uses a workbench

([TOC](#table-of-contents))

###### Event: OnRaceSwitchComplete
`Event OnRaceSwitchComplete()`

Event received when this actor finishes changing its race

([TOC](#table-of-contents))

###### Event: OnRecoverFromBleedout
`Event OnRecoverFromBleedout()`

Event received when an actor exits bleedout.

([TOC](#table-of-contents))

###### Event: OnSit
`Event OnSit(ObjectReference akFurniture)`

Event that is triggered when this actor sits in the furniture

([TOC](#table-of-contents))

###### Event: OnSpeechChallengeAvailable
`Event OnSpeechChallengeAvailable(ObjectReference akSpeaker)`

Received when player gets a speech challenge in dialogue

([TOC](#table-of-contents))

###### Event: OnUnconscious
`Event OnUnconscious(ObjectReference akAttacker)`

Event that is triggered when an actor has been "killed" with EM weapons (the actor is still alive)

([TOC](#table-of-contents))

###### Property: PathingResult_Success
`int Property PathingResult_Success = 0 AutoReadOnly`

Constant for PathToReference return codes

([TOC](#table-of-contents))

###### Property: PathingResult_Failure
`int Property PathingResult_Failure = 1 AutoReadOnly`

Constant for PathToReference return codes

([TOC](#table-of-contents))

###### Property: PathingResult_Stopped
`int Property PathingResult_Stopped = 2 AutoReadOnly`

Constant for PathToReference return codes

([TOC](#table-of-contents))

###### Property: PathingResult_Cleared
`int Property PathingResult_Cleared = 3 AutoReadOnly`

Constant for PathToReference return codes

([TOC](#table-of-contents))

###### Property: PathingResult_Timeout
`int Property PathingResult_Timeout = 4 AutoReadOnly`

Constant for PathToReference return codes

([TOC](#table-of-contents))

###### Property: CritStage_None
`int Property CritStage_None = 0 AutoReadOnly`

Read-only property to essentially make a fake enum for critical stages

([TOC](#table-of-contents))

###### Property: CritStage_GooStart
`int Property CritStage_GooStart = 1 AutoReadOnly`

Read-only property to essentially make a fake enum for critical stages

([TOC](#table-of-contents))

###### Property: CritStage_GooEnd
`int Property CritStage_GooEnd = 2 AutoReadOnly`

Read-only property to essentially make a fake enum for critical stages

([TOC](#table-of-contents))

###### Property: CritStage_DisintegrateStart
`int Property CritStage_DisintegrateStart = 3 AutoReadOnly`

Read-only property to essentially make a fake enum for critical stages

([TOC](#table-of-contents))

###### Property: CritStage_DisintegrateEnd
`int Property CritStage_DisintegrateEnd = 4 AutoReadOnly`

Read-only property to essentially make a fake enum for critical stages

([TOC](#table-of-contents))

###### Property: CritStage_FreezeStart
`int Property CritStage_FreezeStart = 5 AutoReadOnly`

Read-only property to essentially make a fake enum for critical stages

([TOC](#table-of-contents))

###### Property: CritStage_FreezeEnd
`int Property CritStage_FreezeEnd = 6 AutoReadOnly`

Read-only property to essentially make a fake enum for critical stages


([TOC](#table-of-contents))

###### Function: ModFavorPoints
`Function ModFavorPoints(int iFavorPoints = 1)`

DEPRECATED - use MakePlayerFriend() instead as replacement for ModFavorPoints

if iFavorPoints > 0, will setRelationshipRank to 1 if 0, otherwise, won't do anything

([TOC](#table-of-contents))

###### Function: ModFavorPointsWithGlobal (Global)
`Function ModFavorPointsWithGlobal(GlobalVariable FavorPointsGlobal)`

DEPRECATED

modifies the favor points of the actor by the amount stored in the specified global

([TOC](#table-of-contents))

###### Function: MakePlayerFriend
`Function MakePlayerFriend()`

this function will make an actor a friend of the player if allowed

([TOC](#table-of-contents))

###### Function: AddBountyCrime (Native)
`Function AddBountyCrime(Form akBountyCrime) native`

Adds a bounty crime to the actor

([TOC](#table-of-contents))

###### Function: AddPassiveAffinity (Native)
`Function AddPassiveAffinity(float afAmountToAdd) native`

Adds Affinity to the actor

([TOC](#table-of-contents))

###### Function: AddPerk (Native)
`Function AddPerk(Perk akPerk, bool abNotify=false) native`

Adds the specified perk to this actor

([TOC](#table-of-contents))

###### Function: AllowBleedoutDialogue (Native)
`Function AllowBleedoutDialogue(bool abCanTalk ) native`

Sets this a essential actors ability to talk when in a bleedout state

([TOC](#table-of-contents))

###### Function: AllowPCDialogue (Native)
`Function AllowPCDialogue(bool abTalk) native`

overrides the race flag on an actor and determines if he can talk to the player in dialogue menu

([TOC](#table-of-contents))

###### Function: AttachAshPile (Native)
`Function AttachAshPile(Form akAshPileBase = None) native`

Attaches an "ash pile" to this actor, placing it at this actor's location and using the specified base object (or leveled item list) to represent the pile. If None is passed, it will use the default ash pile object

([TOC](#table-of-contents))

###### Function: AttackOutpostObjects (Native)
`int Function AttackOutpostObjects(ObjectReference akOutpostBeacon) native`

Have the actor start combat with any destructible object associated with the specified outpost beacon. Returns the number of objects that the actor entered combat with

([TOC](#table-of-contents))

###### Function: AttemptAnimationSetSwitch (Native)
`Function AttemptAnimationSetSwitch() native`

Attempt to change the set of animations loaded for this actor.

([TOC](#table-of-contents))

###### Function: CanFlyHere (Native)
`bool Function CanFlyHere() native`

Can this actor fly here?

([TOC](#table-of-contents))

###### Function: ChangeAnimArchetype (Native)
`bool Function ChangeAnimArchetype(keyword apKeyword = none) native`

Change this actor's anim archetype

([TOC](#table-of-contents))

###### Function: ChangeAnimFlavor (Native)
`bool Function ChangeAnimFlavor(keyword apKeyword = none) native`

Change this actor's anim flavor

([TOC](#table-of-contents))

###### Function: ChangeHeadPart (Native)
`Function ChangeHeadPart(headpart apHeadPart, bool abRemovePart = false, bool abRemoveExtraParts = false) native`

Change this actor's headpart

([TOC](#table-of-contents))

###### Function: ClearArrested (Native)
`Function ClearArrested() native`

Clears this actor's arrested state

([TOC](#table-of-contents))

###### Function: ClearExpressionOverride (Native)
`Function ClearExpressionOverride() native`

Clears any expression override on the actor

([TOC](#table-of-contents))

###### Function: ClearExtraArrows (Native)
`Function ClearExtraArrows() native`

Clears this actor's extra arrows 3D

([TOC](#table-of-contents))

###### Function: ClearForcedLandingMarker
`Function ClearForcedLandingMarker()`

Remove the obligation to use a particular marker when this actor has to land.

([TOC](#table-of-contents))

###### Function: ClearLookAt (Native)
`Function ClearLookAt() native`

Clears this actor's look at target

([TOC](#table-of-contents))

###### Function: Dismount (Native)
`bool Function Dismount() native`

Initiates a dismount.

([TOC](#table-of-contents))

###### Function: DispelAllSpells (Native)
`Function DispelAllSpells() native`

Dispel all spells from this actor

([TOC](#table-of-contents))

###### Function: DoCombatSpellApply (Native)
`Function DoCombatSpellApply( Spell akSpell, ObjectReference akTarget ) native`

Apply a spell to a target in combat

([TOC](#table-of-contents))

###### Function: EnableAI (Native)
`Function EnableAI(bool abEnable = true, bool abPauseVoice = false) native`

Enables or disable's this actor's AI, pausing their voice mid-line if desired.

([TOC](#table-of-contents))

###### Function: EndDeferredKill (Native)
`Function EndDeferredKill() native`

End the Deferred Kill state. This must only be called if StartDeferredKill was called first.

([TOC](#table-of-contents))

###### Function: EquipItem (Native)
`Function EquipItem(Form akItem, bool abPreventRemoval = false, bool abSilent = false) native`

Forces this actor to equip the specified item, preventing removal if requested

([TOC](#table-of-contents))

###### Function: EquipSpell (Native)
`Function EquipSpell(Spell akSpell, int aiSource) native`

Forces this actor to equip the specified spell. The casting source can be:
- 0 - Left hand
- 1 - Right hand
- 2 - Other

([TOC](#table-of-contents))

###### Function: EvaluatePackage (Native)
`Function EvaluatePackage(bool abResetAI = false) native`

Forces the AI to re-evaluate its package stack

([TOC](#table-of-contents))

###### Function: GetBribeAmount (Native)
`int Function GetBribeAmount() native`

Obtains how much it would cost to bribe this actor

([TOC](#table-of-contents))

###### Function: GetAllCombatTargets (Native)
`Actor[] Function GetAllCombatTargets() native`

Get all combat targets for this actor

([TOC](#table-of-contents))

###### Function: GetAllActorsInCombatWithMe (Native)
`Actor[] Function GetAllActorsInCombatWithMe() native`

Get all combat actors that have me listed as a combat target.

([TOC](#table-of-contents))

###### Function: GetCrewAssignment (Native)
`ObjectReference Function GetCrewAssignment() native`

Get actors crew assignment.

([TOC](#table-of-contents))

###### Function: GetCrimeFaction (Native)
`Faction Function GetCrimeFaction() native`

Get the faction this actor reports crimes to

([TOC](#table-of-contents))

###### Function: GetCombatState (Native)
`int Function GetCombatState() native`

Gets this actor's current combat state

([TOC](#table-of-contents))

###### Function: GetCombatTarget (Native)
`Actor Function GetCombatTarget() native`

Gets this actor's current combat target

([TOC](#table-of-contents))

###### Function: GetCurrentPackage (Native)
`Package Function GetCurrentPackage() native`

Gets this actor's current AI package

([TOC](#table-of-contents))

###### Function: GetDialogueTarget (Native)
`Actor Function GetDialogueTarget() native`

Gets this actor's current dialogue target

([TOC](#table-of-contents))

###### Function: GetEquippedItemType (Native)
`int Function GetEquippedItemType(int aiEquipIndex) native`

Obtains the item quipped for the specified equip index

Return values are:
- -1 - Error
- 0 - Nothing
- 1 - One-handed sword
- 2 - One-handed dagger
- 3 - One-handed axe
- 4 - One-handed mace
- 5 - Two-handed sword
- 6 - Two-handed axe
- 7 - Bow
- 8 - Staff
- 9 - Gun
- 10 - Grenade
- 11 - Mine
- 24 - Magic spell
- 25 - Shield
- 26 - Torch

([TOC](#table-of-contents))

###### Function: GetEquippedWeapon (Native)
`Weapon Function GetEquippedWeapon(int aiEquipIndex = 0) native`

Gets this actor's currently equipped weapon for the specified equip index

Defaults to the actor's first equip index

([TOC](#table-of-contents))

###### Function: GetEquippedShield (Native)
`Armor Function GetEquippedShield() native`

Gets this actor's currently equipped shield

([TOC](#table-of-contents))

###### Function: GetEquippedSpell (Native)
`Spell Function GetEquippedSpell(int aiSource) native`

Gets the spell currently equipped in the specified source
- 0 - Left Hand
- 1 - Right Hand
- 2 - Other
- 3 - Instant

([TOC](#table-of-contents))

###### Function: GetFactionRank (Native)
`int Function GetFactionRank(Faction akFaction) native`

Obtains this actor's rank with the specified faction - returns -1 if the actor is not a member

([TOC](#table-of-contents))

###### Function: GetFactionReaction (Native)
`int Function GetFactionReaction(Actor akOther) native`

Obtains this actor's faction-based reaction to the other actor
- 0 - Neutral
- 1 - Enemy
- 2 - Ally
- 3 - Friend

([TOC](#table-of-contents))

###### Function: GetFlyingState (Native)
`int Function GetFlyingState() native`

Obtains this actor's current flight state
- 0 - Not flying
- 1 - Taking off
- 2 - Cruising
- 3 - Hovering
- 4 - Landing

([TOC](#table-of-contents))

###### Function: GetFurnitureUsing (Native)
`ObjectReference Function GetFurnitureUsing() native`

Get the ref this actor is currently interacting with

([TOC](#table-of-contents))

###### Function: GetForcedLandingMarker (Native)
`ObjectReference Function GetForcedLandingMarker() native`

Get the ref at which this actor is obliged to land, if one is set (or none, if not).

([TOC](#table-of-contents))

###### Function: GetGoldAmount (Native)
`int Function GetGoldAmount() native`

Retrieves the amount of gold this actor has

([TOC](#table-of-contents))

###### Function: GetGroupFaction (Native)
`Faction Function GetGroupFaction() native`

Get the group faction for this actor if he has one for group behavior

([TOC](#table-of-contents))

###### Function: GetHighestRelationshipRank (Native)
`int Function GetHighestRelationshipRank() native`

Gets this actor's highest relationship rank - returns 0 if they have no relationships

([TOC](#table-of-contents))

###### Function: GetKiller (Native)
`Actor Function GetKiller() native`

Returns this actor's killer - or None if this actor is still alive

([TOC](#table-of-contents))

###### Function: GetLevel (Native)
`int Function GetLevel() native`

Returns this actor's current level.

([TOC](#table-of-contents))

###### Function: GetLightLevel (Native)
`float Function GetLightLevel() native`

Returns this actor's current light level.

([TOC](#table-of-contents))

###### Function: GetLowestRelationshipRank (Native)
`int Function GetLowestRelationshipRank() native`

Gets this actor's highest relationship rank - returns 0 if they have no relationships

([TOC](#table-of-contents))

###### Function: GetLeveledActorBase (Native)
`ActorBase Function GetLeveledActorBase() native`

Obtains a leveled actor's "fake" base (the one generated by the game when the actor is leveled. This differs from GetBaseObject which will return the editor base object)

([TOC](#table-of-contents))

###### Function: GetMatchingPlanetActorBase (Native)
`ActorBase Function GetMatchingPlanetActorBase() native`

Gets the ActorBase from the actor's biome data list, if the actor is of a creature type placed by the biome

([TOC](#table-of-contents))

###### Function: GetNoBleedoutRecovery (Native)
`bool Function GetNoBleedoutRecovery() native`

Queries whether this actor has no bleedout recovery flag set.

([TOC](#table-of-contents))

###### Function: GetPlayerControls (Native)
`bool Function GetPlayerControls() native`

Queries whether this actor receives player input

([TOC](#table-of-contents))

###### Function: GetRace (Native)
`Race Function GetRace() native`

Returns this actor's race

([TOC](#table-of-contents))

###### Function: GetRelationshipRank (Native)
`int Function GetRelationshipRank(Actor akOther) native`

Obtains the relationship rank between this actor and another

([TOC](#table-of-contents))

###### Function: GetSitState (Native)
`int Function GetSitState() native`

Obtains this actor's sit state, which is one of the following:
- 0 - Not sitting
- 1 - Not sitting, wants to sit
- 2 - Not sitting, in the process of sitting down (playing the animation)
- 3 - Sitting
- 4 - Sitting, wants to stand

([TOC](#table-of-contents))

###### Function: GetSleepState (Native)
`int Function GetSleepState() native`

Obtains this actor's sleep state, which is one of the following:
- 0 - Not sleeping
- 2 - Not sleeping, wants to sleep
- 3 - Sleeping
- 4 - Sleeping, wants to wake

([TOC](#table-of-contents))

###### Function: GetSpaceship (Native)
`SpaceshipReference Function GetSpaceship() native`

Obtains the spaceship this actor is piloting, if any

([TOC](#table-of-contents))

###### Function: HasAssociation (Native)
`bool Function HasAssociation(AssociationType akAssociation, Actor akOther = None) native`

Checks to see if this actor has the specified association with the other actor - or anyone (if no actor is passed)

([TOC](#table-of-contents))

###### Function: HasFamilyRelationship (Native)
`bool Function HasFamilyRelationship(Actor akOther = None) native`

Checks to see if this actor has a family relationship with the other actor - or anyone (if no actor is passed)

([TOC](#table-of-contents))

###### Function: HasDetectionLOS (Native)
`bool Function HasDetectionLOS(ObjectReference akOther) native`

Sees if this actor has detection-based line-of-sight to another object. Only the player can check LOS to a non-actor

([TOC](#table-of-contents))

###### Function: HasMagicEffect (Native)
`bool Function HasMagicEffect(MagicEffect akEffect) native`

Checks to see if this actor is currently being affected by the given Magic Effect

([TOC](#table-of-contents))

###### Function: HasMagicEffectWithKeyword (Native)
`bool Function HasMagicEffectWithKeyword(Keyword akKeyword) native`

Checks to see if this actor is currently being affected by a Magic Effect with the given Keyword

([TOC](#table-of-contents))

###### Function: HasParentRelationship (Native)
`bool Function HasParentRelationship(Actor akOther) native`

Checks to see if this actor has a parent relationship with the other actor

([TOC](#table-of-contents))

###### Function: HasPerk (Native)
`bool Function HasPerk(Perk akPerk) native`

Checks to see if this actor has the given Perk

([TOC](#table-of-contents))

###### Function: HasSpell (Native)
`bool Function HasSpell(Form akForm) native`

Checks to see if this actor has the given Spell

([TOC](#table-of-contents))

###### Function: IsAIEnabled (Native)
`bool Function IsAIEnabled() native`

Returns whether this actor's AI is enabled.

([TOC](#table-of-contents))

###### Function: IsAlarmed (Native)
`bool Function IsAlarmed() native`

Returns if this actor is alarmed or not

([TOC](#table-of-contents))

###### Function: IsAlerted (Native)
`bool Function IsAlerted() native`

Returns if this actor is alerted or not

([TOC](#table-of-contents))

###### Function: IsAllowedToFly (Native)
`bool Function IsAllowedToFly() native`

Is this actor allowed to fly?

([TOC](#table-of-contents))

###### Function: IsArrested (Native)
`bool Function IsArrested() native`

Is this actor currently arrested?

([TOC](#table-of-contents))

###### Function: IsArrestingTarget (Native)
`bool Function IsArrestingTarget() native`

Is this actor currently arresting his target? (Must be a guard and alarmed)

([TOC](#table-of-contents))

###### Function: IsBeingRidden (Native)
`bool Function IsBeingRidden() native`

Is the actor being ridden?

([TOC](#table-of-contents))

###### Function: IsBeingRiddenBy (Native)
`bool Function IsBeingRiddenBy(Actor akActor) native`

check if akActor is riding this actor

([TOC](#table-of-contents))

###### Function: IsBleedingOut (Native)
`int Function IsBleedingOut() native`

Is this actor currently bleeding out?
- 0 = Not bleeding out
- 1 = Bleeding out, will recover
- 2 = Bleeding out, will not recover

([TOC](#table-of-contents))

###### Function: IsBribed (Native)
`bool Function IsBribed() native`

Queries whether this actor has player bribe flag set.

([TOC](#table-of-contents))

###### Function: IsChild (Native)
`bool Function IsChild() native`

Is this actor a child?

([TOC](#table-of-contents))

###### Function: IsCommandedActor (Native)
`bool Function IsCommandedActor() native`

Is this actor a commanded by another?

([TOC](#table-of-contents))

###### Function: IsDead (Native)
`bool Function IsDead() native`

Returns if this actor is dead or not

([TOC](#table-of-contents))

###### Function: IsDetectedBy (Native)
`bool Function IsDetectedBy(Actor akOther) native`

Returns if this actor is detected by the other one

([TOC](#table-of-contents))

###### Function: IsDoingFavor (Native)
`bool Function IsDoingFavor() native`

Is this actor doing a favor for the player?

([TOC](#table-of-contents))

###### Function: IsEquipped (Native)
`bool Function IsEquipped(Form akItem) native`

Returns if the specified object is equipped on this actor

([TOC](#table-of-contents))

###### Function: IsEssential (Native)
`bool Function IsEssential() native`

Is this actor essential?

([TOC](#table-of-contents))

###### Function: IsFlying (Native)
`bool Function IsFlying() native`

Returns if this actor is flying or not

([TOC](#table-of-contents))

###### Function: IsGuard (Native)
`bool Function IsGuard() native`

Returns if this actor is a guard or not

([TOC](#table-of-contents))

###### Function: IsGhost (Native)
`bool Function IsGhost() native`

Is this actor flagged as a ghost?

([TOC](#table-of-contents))

###### Function: IsHostileToActor (Native)
`bool Function IsHostileToActor(Actor akActor) native`

Is this actor hostile to another actor?

([TOC](#table-of-contents))

###### Function: IsInCombat (Native)
`bool Function IsInCombat() native`

Returns if this actor is currently in combat

([TOC](#table-of-contents))

###### Function: IsInFaction (Native)
`bool Function IsInFaction(Faction akFaction) native`

Checks to see if this actor is a member of the specified faction

([TOC](#table-of-contents))

###### Function: IsInIronSights (Native)
`bool Function IsInIronSights() native`

Returns whether this actor is currently in iron sights.

([TOC](#table-of-contents))

###### Function: IsInKillMove (Native)
`bool Function IsInKillMove() native`

Returns if this actor is in a kill move or not

([TOC](#table-of-contents))

###### Function: IsInScene (Native)
`bool Function IsInScene() native`

Queries whether this actor is in a scene.

([TOC](#table-of-contents))

###### Function: IsIntimidated (Native)
`bool Function IsIntimidated() native`

Queries whether this actor has player intimidated flag set.

([TOC](#table-of-contents))

###### Function: IsOnMount (Native)
`bool Function IsOnMount() native`

Is the actor on a mount?

([TOC](#table-of-contents))

###### Function: IsOverEncumbered (Native)
`bool Function IsOverEncumbered() native`

Is the actor over-encumbered?

([TOC](#table-of-contents))

###### Function: IsOwner
`bool Function IsOwner(ObjectReference akObject)`

does the actor own the specified reference (in any way)

([TOC](#table-of-contents))

###### Function: IsPlayersLastRiddenHorse (Native)
`bool Function IsPlayersLastRiddenHorse() native`

Checks to see if this actor the last ridden horse of the player

([TOC](#table-of-contents))

###### Function: IsPlayerTeammate (Native)
`bool Function IsPlayerTeammate() native`

Is this actor currently a teammate of the player?

([TOC](#table-of-contents))

###### Function: IsRunning (Native)
`bool Function IsRunning() native`

Is this actor currently running?

([TOC](#table-of-contents))

###### Function: IsSeatOccupied (Native)
`bool Function IsSeatOccupied(keyword apKeyword) native`

Is the seat that corresponds to the passed in keyword currently occupied?

note: if this is not a mount with multiple seats or apKeyword is not a valid seat, this function will return false

([TOC](#table-of-contents))

###### Function: IsSneaking (Native)
`bool Function IsSneaking() native`

Is this actor currently sneaking?

([TOC](#table-of-contents))

###### Function: IsSprinting (Native)
`bool Function IsSprinting() native`

Is this actor currently sprinting?

([TOC](#table-of-contents))

###### Function: IsTalking (Native)
`bool Function IsTalking() native`

Is this actor talking

([TOC](#table-of-contents))

###### Function: IsTrespassing (Native)
`bool Function IsTrespassing() native`

Is this actor trespassing?

([TOC](#table-of-contents))

###### Function: IsUnconscious (Native)
`bool Function IsUnconscious() native`

Is this actor unconscious?

([TOC](#table-of-contents))

###### Function: IsWeaponDrawn (Native)
`bool Function IsWeaponDrawn() native`

Does this actor have his weapon and/or magic drawn?

([TOC](#table-of-contents))

###### Function: Kill (Native)
`Function Kill(Actor akKiller = None) native`

Kills this actor with the killer being the guilty party

([TOC](#table-of-contents))

###### Function: KillEssential
`Function KillEssential(Actor akKiller = None)`

Kills this actor even if essential

([TOC](#table-of-contents))

###### Function: KillSilent (Native)
`Function KillSilent(Actor akKiller = None) native`

Kills this actor without a kill event with the killer being the guilty party

([TOC](#table-of-contents))

###### Function: ApplyUnityCharacterData (Native)
`Function ApplyUnityCharacterData() native`

Apply Unity Character Data to Actor

([TOC](#table-of-contents))

###### Function: CopyAppearance (Native)
`Function CopyAppearance(Actor akSourceToCopyFrom) native`

Copy character customization appearance data from a given actor

([TOC](#table-of-contents))

###### Function: MarkItemAsFavorite (Native)
`Function MarkItemAsFavorite(Form akItem, int aiSlot=-1) native`

Mark the given item as a favorite.

([TOC](#table-of-contents))

###### Function: ModFactionRank (Native)
`Function ModFactionRank(Faction akFaction, int aiMod) native`

Modifies this actor's rank in the faction

([TOC](#table-of-contents))

###### Function: MoveToFurniture
`bool Function MoveToFurniture(ObjectReference akTargetFurniture)`

moves this actor to the furniture and snaps them into it

returns the value of SnapIntoInteraction()

Note: might not work in unloaded area

([TOC](#table-of-contents))

###### Function: MoveToPackageLocation (Native)
`Function MoveToPackageLocation() native`

Pop this actor to the initial location for a package. Mainly for use on disabled actors, since they would normally start at their editor locations.

([TOC](#table-of-contents))

###### Function: OpenInventory (Native)
`Function OpenInventory(bool abForceOpen = false, Form akFilter = None, bool abIncludeOnlyFromFilter = true) native`

Opens this actor's inventory, as if you were pick-pocketing them. Only works on teammates, or anyone if forced.

([TOC](#table-of-contents))

###### Function: PathToReference (Native)
`int Function PathToReference(ObjectReference aTarget, float afNormalizedSpeed, float afNormalizedRotationSpeed, float afTargetRadius=-1.0, bool abHardRadius=false) native`

Make the actor path to a reference, latent version

Note: this method doesn't return until the goal is reached or pathing failed or was interrupted (by another request for instance)

Return values (see above):
- 0 - Success
- 1 - Failure
- 2 - Stopped
- 3 - Cleared

([TOC](#table-of-contents))

###### Function: PlayIdle (Native)
`bool Function PlayIdle(Idle akIdle) native`

Send an idle to the actor to load in and play.

([TOC](#table-of-contents))

###### Function: PlayIdleAction (Native)
`bool Function PlayIdleAction(Action aAction, ObjectReference aTarget = None) native`

Attempts to run action on actor.

([TOC](#table-of-contents))

###### Function: PlayIdleWithTarget (Native)
`bool Function PlayIdleWithTarget(Idle akIdle, ObjectReference akTarget) native`

Send an idle to the actor to play, overriding its target with the specified reference

([TOC](#table-of-contents))

###### Function: PlaySubGraphAnimation (Native)
`Function PlaySubGraphAnimation(string asEventName) native`

Send an event to the subgraphs of an actor.

([TOC](#table-of-contents))

###### Function: RemoveFromFaction (Native)
`Function RemoveFromFaction(Faction akFaction) native`

Removes this actor from the specified faction

([TOC](#table-of-contents))

###### Function: RemoveFromAllFactions (Native)
`Function RemoveFromAllFactions() native`

Removes this actor from all factions

([TOC](#table-of-contents))

###### Function: RemovePerk (Native)
`Function RemovePerk(Perk akPerk) native`

Removes the specified perk from this actor

([TOC](#table-of-contents))

###### Function: RemoveSpell (Native)
`bool Function RemoveSpell(Spell akSpell) native`

Removes the specified spell from this actor - returns true on success

([TOC](#table-of-contents))

###### Function: ResetHealthAndLimbs (Native)
`Function ResetHealthAndLimbs() native`

Resets this actor's health and limb state

([TOC](#table-of-contents))

###### Function: Resurrect (Native)
`Function Resurrect() native`

Resurrects this actor

([TOC](#table-of-contents))

###### Function: SendAssaultAlarm (Native)
`Function SendAssaultAlarm() native`

Has this actor behave as if assaulted

([TOC](#table-of-contents))

###### Function: SendSmugglingAlarm (Native)
`Function SendSmugglingAlarm(Actor akCriminal) native`

Has this actor behave as if they caught another actor smuggling

([TOC](#table-of-contents))

###### Function: SendTrespassAlarm (Native)
`Function SendTrespassAlarm(Actor akCriminal) native`

Has this actor behave as if they caught the target trespassing

([TOC](#table-of-contents))

###### Function: SetAlert (Native)
`Function SetAlert(bool abAlerted = true) native`

Sets the actor in an alerted state

([TOC](#table-of-contents))

###### Function: SetAllowFlying (Native)
`Function SetAllowFlying(bool abAllowed = true, bool abAllowCrash = true, bool abAllowSearch = false) native`

Sets whether this actor is allowed to fly or not - if not, will land the actor

([TOC](#table-of-contents))

###### Function: SetAlpha (Native)
`Function SetAlpha(float afTargetAlpha, bool abFade = false) native`

Sets this actor's alpha - with an optional fade to that alpha

The alpha will be clamped between 0 and 1

([TOC](#table-of-contents))

###### Function: SetAttackActorOnSight (Native)
`Function SetAttackActorOnSight(bool abAttackOnSight = true) native`

Sets this actor to be attacked by all other actors on sight

([TOC](#table-of-contents))

###### Function: SetAvoidPlayer (Native)
`Function SetAvoidPlayer(bool abAvoid = true) native`

Tells pathing to avoid the player (which it already does by default) or not (for use in scenes where the player is meant to be an incorporeal observer).

([TOC](#table-of-contents))

###### Function: SetCommandState (Native)
`Function SetCommandState(bool abStartCommandMode ) native`

Sets/Unsets the actor in command mode so that we can order them around.  SetCanDoCommand() needs to have already been called on the actor.

([TOC](#table-of-contents))

###### Function: SetBribed (Native)
`Function SetBribed(bool abBribe = true) native`

Flags/unflags this actor as bribed by the player

([TOC](#table-of-contents))

###### Function: SetCanDoCommand (Native)
`Function SetCanDoCommand(bool abCanCommand= true) native`

Flags/unflags this actor as can be commanded by the player

([TOC](#table-of-contents))

###### Function: SetCombatStyle (Native)
`Function SetCombatStyle(CombatStyle akCombatStyle) native`

Sets the combatstyle for this actor

([TOC](#table-of-contents))

###### Function: SetCrimeFaction (Native)
`Function SetCrimeFaction(Faction akFaction) native`

Sets the faction this actor reports crimes to

([TOC](#table-of-contents))

###### Function: SetCriticalStage (Native)
`Function SetCriticalStage(int aiStage) native`

Sets this actor's critical stage, which is one of the following (properties also match this)
- 0 - None
- 1 - Goo start
- 2 - Goo end
- 3 - Disintegrate start
- 4 - Disintegrate end
- 5 - Freeze start
- 6 - Freeze end

([TOC](#table-of-contents))

###### Function: SetDoingFavor (Native)
`Function SetDoingFavor(bool abDoingFavor = true, bool abWorkShopMode=false) native`

Flag this actor as currently doing a favor for the player

Indicate if the actor is in workshop or normal command mode

([TOC](#table-of-contents))

###### Function: ChangeAnimFaceArchetype (Native)
`Function ChangeAnimFaceArchetype(keyword apKeyword = none) native`

Change this actor's anim face archetype

([TOC](#table-of-contents))

###### Function: SetEssential (Native)
`Function SetEssential(bool abEssential) native`

overrides the Essential status of the actor

([TOC](#table-of-contents))

###### Function: SetFactionRank (Native)
`Function SetFactionRank(Faction akFaction, int aiRank) native`

Sets this actor's rank with the specified faction

([TOC](#table-of-contents))

###### Function: SetForcedLandingMarker (Native)
`Function SetForcedLandingMarker( ObjectReference aMarker ) native`

Set a specific marker as the place at which this actor must land from flight.

params:

`aMarker`:  The ObjectReference to set as this actor's landing marker

([TOC](#table-of-contents))

###### Function: SetGhost (Native)
`Function SetGhost(bool abIsGhost = true) native`

Flags/unflags this actor as a ghost

([TOC](#table-of-contents))

###### Function: SetGroupFaction (Native)
`Function SetGroupFaction(Faction akFaction) native`

Sets the faction that this actor will use for group behavior

([TOC](#table-of-contents))

###### Function: SetHasCharGenSkeleton (Native)
`Function SetHasCharGenSkeleton(bool abCharGen = true) native`

Flags/unflags this actor as requiring a char gen skeleton

([TOC](#table-of-contents))

###### Function: AddToFaction
`Function AddToFaction(Faction akFaction)`

Adds this actor to a faction at rank 0 if they aren't already in it

([TOC](#table-of-contents))

###### Function: SetHeadTracking (Native)
`Function SetHeadTracking(bool abEnable = true) native`

Turns on/off headtracking on this actor

([TOC](#table-of-contents))

###### Function: SetIntimidated (Native)
`Function SetIntimidated(bool abIntimidate = true) native`

Flags/unflags this actor as intimidated by the player

([TOC](#table-of-contents))

###### Function: SetLookAt (Native)
`Function SetLookAt(ObjectReference akTarget, bool abPathingLookAt = false) native`

Sets this actor's head tracking target, optionally forcing it as their pathing look-at target

([TOC](#table-of-contents))

###### Function: SetNoBleedoutRecovery (Native)
`Function SetNoBleedoutRecovery(bool abAllowed) native`

Set the no bleedout recovery flag on this actor

([TOC](#table-of-contents))

###### Function: SetNotShowOnStealthMeter (Native)
`Function SetNotShowOnStealthMeter(bool abNotShow) native`

Sets this actor to not effect the detection level on the stealth meter if he is not hostile to the player

([TOC](#table-of-contents))

###### Function: SetOutfit (Native)
`Function SetOutfit( Outfit akOutfit, bool abSleepOutfit = false ) native`

Sets the actors outfit and makes him wear it

([TOC](#table-of-contents))

###### Function: SetOverrideVoiceType (Native)
`Function SetOverrideVoiceType( VoiceType akVoiceType ) native`

Sets the actor's override voice type

([TOC](#table-of-contents))

###### Function: SetOverrideVoiceTypeRandom
`voicetype Function SetOverrideVoiceTypeRandom(Formlist akVoiceList)`

calls SetOverrideVoiceType with a randomly choice from a formlist of voicetypes and returns the chosen voicetype

([TOC](#table-of-contents))

###### Function: SetPlayerControls (Native)
`Function SetPlayerControls(bool abControls) native`

Set/reset whether player input being sent to the actor

([TOC](#table-of-contents))

###### Function: SetPlayerResistingArrest (Native)
`Function SetPlayerResistingArrest() native`

Sets the player as resisting arrest from this actor's faction

([TOC](#table-of-contents))

###### Function: SetPlayerTeammate (Native)
`Function SetPlayerTeammate(bool abTeammate = true, bool abCanDoFavor=true, bool abGivePlayerXP=false) native`

Sets or clears this actor as a teammate of the player

`abCanDoFavor` - OPTIONAL default is true the teammate can do favors

`abGivePlayerXP` - OPTIONAL default is false the teammate will give the player XP for kills and unlocks

([TOC](#table-of-contents))

###### Function: SetProtected (Native)
`Function SetProtected(bool abProtected) native`

overrides the Protected status of the actor

([TOC](#table-of-contents))

###### Function: SetRace (Native)
`Function SetRace( Race akRace = None ) native`

Sets the actors race

`akRace` - OPTIONAL (Def=None) New race for this actor. Default, no race, to switch back to the original race.

([TOC](#table-of-contents))

###### Function: SetRelationshipRank (Native)
`Function SetRelationshipRank(Actor akOther, int aiRank) native`

Sets the relationship rank between this actor and another (See GetRelationshipRank for the ranks)

([TOC](#table-of-contents))

###### Function: SetRestrained (Native)
`bool Function SetRestrained(bool abRestrained = true) native`

Sets this actor as restrained or not - returns false if the state wasn't changed

([TOC](#table-of-contents))

###### Function: SetSubGraphFloatVariable (Native)
`Function SetSubGraphFloatVariable(string asVariableName, float afValue) native`

Set a variable on all of an actor's subgraphs

([TOC](#table-of-contents))

###### Function: SetUnconscious (Native)
`bool Function SetUnconscious(bool abUnconscious = true) native`

Sets this actor as unconscious or not - returns false if the state wasn't changed

([TOC](#table-of-contents))

###### Function: SetVehicle (Native)
`Function SetVehicle( Actor akVehicle ) native`

Attach the actor to a horse or other vehicle.

`akVehicle` is the vehicle ref. To detach the actor from its current vehicle, set `akVehicle` to None (or to the Actor itself).

([TOC](#table-of-contents))

###### Function: SetWantSprinting (Native)
`Function SetWantSprinting( bool abWantSprint ) native`

Set that the actor would like to sprint when possible (or turn that off).

`abWantSprint` is if we want to sprint currently, false otherwise

([TOC](#table-of-contents))

###### Function: SheatheWeapon (Native)
`Function SheatheWeapon() native`

Makes this actor sheathe his weapon

([TOC](#table-of-contents))

###### Function: ShowBarterMenu (Native)
`Function ShowBarterMenu() native`

Opens the Barter menu

([TOC](#table-of-contents))

###### Function: ShowCrewAssign (Native)
`Function ShowCrewAssign(bool abAssign=true) native`

Opens the crew assignment menu

([TOC](#table-of-contents))

###### Function: StartCombat (Native)
`bool Function StartCombat(ObjectReference akTarget, bool abPreferredTarget = false) native`

Starts combat with the target reference - returns true if combat was started

`abPreferredTarget` - OPTIONAL (Def=false) True to set the target as the actor's preferred target

([TOC](#table-of-contents))

###### Function: StartDeferredKill (Native)
`Function StartDeferredKill() native`

Start the Deferred Kill state. Be sure to call EndDeferredKill or the actor will be invulnerable.

([TOC](#table-of-contents))

###### Function: StartVampireFeed (Native)
`Function StartVampireFeed(Actor akTarget) native`

Starts vampire feed with the target

([TOC](#table-of-contents))

###### Function: StartFrenzyAttack (Native)
`Function StartFrenzyAttack(float aChance = 0.1, float aInterval = 0.5) native`

Starts a frenzey attack target selector.

([TOC](#table-of-contents))

###### Function: StopCombat (Native)
`Function StopCombat() native`

Removes this actor from combat

([TOC](#table-of-contents))

###### Function: StopCombatAlarm (Native)
`Function StopCombatAlarm() native`

Stops all combat and alarms against this actor

([TOC](#table-of-contents))

###### Function: SwitchToPowerArmor (Native)
`Function SwitchToPowerArmor(ObjectReference aArmorFurniture) native`

Instantly pop an actor into aArmorFurniture without any animation or repositioning

([TOC](#table-of-contents))

###### Function: SnapIntoInteraction (Native)
`bool Function SnapIntoInteraction(ObjectReference akTarget) native`

(near) Instantly snaps an actor into a furniture or onto a mount

([TOC](#table-of-contents))

###### Function: TrapSoul (Native)
`bool Function TrapSoul(Actor akTarget) native`

Returns whether the actor can trap the soul of the given actor.

([TOC](#table-of-contents))

###### Function: UnequipAll (Native)
`Function UnequipAll() native`

Unequips the all items from this actor

([TOC](#table-of-contents))

###### Function: UnequipItem (Native)
`Function UnequipItem(Form akItem, bool abPreventEquip = false, bool abSilent = false) native`

Unequips the specified item from this actor

([TOC](#table-of-contents))

###### Function: UnequipItemSlot (Native)
`Function UnequipItemSlot(int aiSlot) native`

Unequips the all items in this slot for the actor

([TOC](#table-of-contents))

###### Function: UnequipSpell (Native)
`Function UnequipSpell(Spell akSpell, int aiSource) native`

Forces this actor to unequip the specified spell. The casting source can be:
- 0 - Left hand
- 1 - Right hand
- 2 - Other

([TOC](#table-of-contents))

###### Function: UnLockOwnedDoorsInCell (Native)
`Function UnLockOwnedDoorsInCell() native`

This actor will unlock all the doors that he qualifies for ownership in his current parentcell

([TOC](#table-of-contents))

###### Function: WillIntimidateSucceed (Native)
`bool Function WillIntimidateSucceed() native`

Returns whether intimidate will succeed against this actor or not

([TOC](#table-of-contents))

###### Function: WornCoversBipedSlot (Native)
`bool Function WornCoversBipedSlot(int aiSlot) native`

Returns whether anything the actor is wearing covers this biped slot

([TOC](#table-of-contents))

###### Function: WornHasKeyword (Native)
`bool Function WornHasKeyword(Keyword akKeyword) native`

Returns whether anything the actor is wearing has the specified keyword

([TOC](#table-of-contents))

###### Function: WouldBeStealing (Native)
`bool Function WouldBeStealing(ObjectReference akObject) native`

Returns if actor is stealing taking a ref

([TOC](#table-of-contents))

###### Function: WouldRefuseCommand (Native)
`int Function WouldRefuseCommand(ObjectReference akObject) native`

Obtains the ability to do a command on ref for player
- 0 - will do the command
- 1 - refuse for reasons other then moral/impossible
- 2 - Impossible
- 3 - Morale refusal

Returns if actor can do command on ref for player

([TOC](#table-of-contents))

###### Function: StartSneaking (Native)
`Function StartSneaking() native`

Makes this actor start sneaking

([TOC](#table-of-contents))

###### Function: DrawWeapon (Native)
`Function DrawWeapon() native`

Makes this actor draw his weapon

([TOC](#table-of-contents))

###### Function: DogPlaceInMouth (Native)
`Function DogPlaceInMouth( Form akItem ) native`

Add this object to the dog's mouth

([TOC](#table-of-contents))

###### Function: DogDropItems (Native)
`Function DogDropItems( ) native`

Drop the dog's items in the world

([TOC](#table-of-contents))

###### Function: ForceMovementDirection (Native)
`Function ForceMovementDirection(float afXAngle = 0.0, float afYAngle = 0.0, float afZAngle = 0.0) native debugOnly`

**** For Debugging Movement Animations (not in release builds) ****

Forces the movement direction on the actor

`afXAngle`, `afYAngle` and `afZAngle` are in degrees

([TOC](#table-of-contents))

###### Function: ForceMovementSpeed (Native)
`Function ForceMovementSpeed(float afSpeedMult) native debugOnly`

**** For Debugging Movement Animations (not in release builds) ****

Forces the movement speed on the actor

`afSpeedMult` is a speed multiplier based on the current max speeds
- 0 -> 1 Scales between 0 and the Walk speed
- 1 -> 2 Scales between Walk speed and Run Speed
- 2 and above is a multiplier of the run speed (less 1.0 since Run is 2.0)

([TOC](#table-of-contents))

###### Function: ForceMovementRotationSpeed (Native)
`Function ForceMovementRotationSpeed(float afXMult = 0.0, float afYMult = 0.0, float afZMult = 0.0) native debugOnly`

**** For Debugging Movement Animations (not in release builds) ****

Forces the movement rotation speed on the actor

Each component of the rotation speed is a multiplier following these rules:
- 0 -> 1 Scales between 0 and the Walk speed
- 1 -> 2 Scales between Walk speed and Run Speed
- 2 and above is a multiplier of the run speed (less 1.0 since Run is 2.0)

([TOC](#table-of-contents))

###### Function: ForceMovementDirectionRamp (Native)
`Function ForceMovementDirectionRamp(float afXAngle = 0.0, float afYAngle = 0.0, float afZAngle = 0.0, float afRampTime = 0.1) native debugOnly`

**** For Debugging Movement Animations (not in release builds) ****

Ramps the movement direction on the actor to the passed in value over the passed in time

`afXAngle`, `afYAngle`, and `afZAngle` are in degrees

`afRampTime` is in seconds

([TOC](#table-of-contents))

###### Function: ForceMovementSpeedRamp (Native)
`Function ForceMovementSpeedRamp(float afSpeedMult, float afRampTime = 0.1) native debugOnly`

**** For Debugging Movement Animations (not in release builds) ****

Ramps the movement speed on the actor to the passed in value over the passed in time

`afSpeedMult` is a speed multiplier based on the current max speeds
- 0 -> 1 Scales between 0 and the Walk speed
- 1 -> 2 Scales between Walk speed and Run Speed
- 2 and above is a multiplier of the run speed (less 1.0 since Run is 2.0)

`afRampTime` is in seconds

([TOC](#table-of-contents))

###### Function: ForceMovementRotationSpeedRamp (Native)
`Function ForceMovementRotationSpeedRamp(float afXMult = 0.0, float afYMult = 0.0, float afZMult = 0.0, float afRampTime = 0.1) native debugOnly`

**** For Debugging Movement Animations (not in release builds) ****

Ramps the movement rotation speed on the actor to the passed in value over the passed in time

Each component of the rotation speed is a multiplier following these rules:
- 0 -> 1 Scales between 0 and the Walk speed
- 1 -> 2 Scales between Walk speed and Run Speed
- 2 and above is a multiplier of the run speed (less 1.0 since Run is 2.0)

`afRampTime` is in seconds

([TOC](#table-of-contents))

###### Function: ForceTargetDirection (Native)
`Function ForceTargetDirection(float afXAngle = 0.0, float afYAngle = 0.0, float afZAngle = 0.0) native debugOnly`

**** For Debugging Movement Animations (not in release builds) ****

Sets the target movement direction on the actor

afXAngle, afYAngle and afZAngle are in degrees

([TOC](#table-of-contents))

###### Function: ForceTargetSpeed (Native)
`Function ForceTargetSpeed(float afSpeed) native debugOnly`

**** For Debugging Movement Animations (not in release builds) ****

Sets the target movement speed on the actor

`afSpeedMult` is a speed multiplier based on the current max speeds:
- 0 -> 1 Scales between 0 and the Walk speed
- 1 -> 2 Scales between Walk speed and Run Speed
- 2 and above is a multiplier of the run speed (less 1.0 since Run is 2.0)

([TOC](#table-of-contents))

###### Function: ForceTargetAngle (Native)
`Function ForceTargetAngle(float afXAngle = 0.0, float afYAngle = 0.0, float afZAngle = 0.0) native debugOnly`

**** For Debugging Movement Animations (not in release builds) ****

Sets the target facing angle on the actor

afXAngle, afYAngle and afZAngle are in degrees

([TOC](#table-of-contents))

###### Function: ClearForcedMovement (Native)
`Function ClearForcedMovement() native debugOnly`

**** For Debugging Movement Animations (not in release builds) ****

Clears any forced movement on the actor and return it to its standard state

([TOC](#table-of-contents))

###### Function: CanMoveVertical (Native)
`bool Function CanMoveVertical() native debugOnly`

**** For Debugging Movement Animations (not in release builds) ****

Check to see if the actor can move vertically.

([TOC](#table-of-contents))

###### Function: CanStrafe (Native)
`bool Function CanStrafe() native debugOnly`

**** For Debugging Movement Animations (not in release builds) ****

Check to see if the actor can strafe side to side.

([TOC](#table-of-contents))

###### Function: GetActorInDialogueWithRobot (Native)
`Actor Function GetActorInDialogueWithRobot() native debugOnly`

**** For Debugging Movement Animations (not in release builds) ****

Check all possible dialogue targets for the actor the robot is speaking with, including the current scene's last target/speaker. Used by RobotQuestRunner for debugging purposes.

([TOC](#table-of-contents))

##### Script: SpaceshipReference
`Scriptname SpaceshipReference extends ObjectReference Native Hidden`

([TOC](#table-of-contents))

###### Event: OnCombatStateChanged
`Event OnCombatStateChanged(ObjectReference akTarget, int aeCombatState)`

Event that is triggered when this spaceship's combat state against the target changes

State is as follows:
- 0 - not in combat
- 1 - in combat
- 2 - searching

([TOC](#table-of-contents))

###### Event: OnSpaceshipCombatListAdded
`Event OnSpaceshipCombatListAdded(SpaceshipReference akTarget)`

Event that is triggered when this ship's pilot adds another ship's pilot to its combat list.

([TOC](#table-of-contents))

###### Event: OnSpaceshipCombatListRemoved
`Event OnSpaceshipCombatListRemoved(SpaceshipReference akTarget)`

Event that is triggered when this ship's pilot removes another ship's pilot from its combat list.

([TOC](#table-of-contents))

###### Event: OnEnterBleedout
`Event OnEnterBleedout()`

Event received when a ship enters the essential down state.

([TOC](#table-of-contents))

###### Event: OnEscortWaitStart
`Event OnEscortWaitStart()`

Event received when this spaceship is in an Escort procedure and begins waiting for the escorted spaceship to catch up.

([TOC](#table-of-contents))

###### Event: OnEscortWaitStop
`Event OnEscortWaitStop()`

Event received when this spaceship is in an Escort procedure and stops waiting because the escorted spaceship has caught up.

([TOC](#table-of-contents))

###### Event: OnLocationChange
`Event OnLocationChange(Location akOldLoc, Location akNewLoc)`

Event that is triggered when this spaceship changes from one location to another

([TOC](#table-of-contents))

###### Event: OnRecoverFromBleedout
`Event OnRecoverFromBleedout()`

Event received when a ship exits the essential down state.

([TOC](#table-of-contents))

###### Event: OnShipDock
`Event OnShipDock(bool abComplete, SpaceshipReference akDocking, SpaceshipReference akParent)`

Event received when a ship initiates and completes docking with a parent

([TOC](#table-of-contents))

###### Event: OnShipFarTravel
`Event OnShipFarTravel(Location aDepartureLocation, Location aArrivalLocation, int aState)`

Event received when a ship begins or ends far travel - State { Departure = 0, Arrival = 1 }

([TOC](#table-of-contents))

###### Event: OnShipGravJump
`Event OnShipGravJump(Location aDestination, int aState)`

Event received when a ship grav jump event occurs - State { Initiated = 0, AnimStarted = 1, Completed = 2, Failed = 3 }

([TOC](#table-of-contents))

###### Event: OnShipLanding
`Event OnShipLanding(bool abComplete)`

Event received when a ship initiates or completes landing

([TOC](#table-of-contents))

###### Event: OnShipRampDown
`Event OnShipRampDown()`

Event received when a ship's landing ramp has lowered all the way and connected to the surrounding navmesh

([TOC](#table-of-contents))

###### Event: OnShipRefueled
`Event OnShipRefueled(int aFuelAdded)`

Event that is triggered when fuel has been added to this spaceship

([TOC](#table-of-contents))

###### Event: OnShipScan
`Event OnShipScan(Location aPlanet, ObjectReference[] aMarkersArray)`

Event that is triggered when the player scans a planet with this spaceship

([TOC](#table-of-contents))

###### Event: OnShipSystemPowerChange
`Event OnShipSystemPowerChange(ActorValue akSystem, bool abAddPower, bool abDamagedRelated)`

Event received when a ship system adds or removes power

([TOC](#table-of-contents))

###### Event: OnShipSystemDamaged
`Event OnShipSystemDamaged(ActorValue akSystem, int aBlocksLost, bool aElectromagneticDamage, bool aFullyDamaged)`

Event that is triggered when one of this spaceship's systems loses a power block due to damage

([TOC](#table-of-contents))

###### Event: OnShipSystemRepaired
`Event OnShipSystemRepaired(ActorValue akSystem, int aBlocksGained, bool aElectromagneticDamage)`

Event that is triggered when one of this spaceship's systems gains a power block due to being repaired

([TOC](#table-of-contents))

###### Event: OnShipTakeOff
`Event OnShipTakeOff(bool abComplete)`

Event received when a ship initiates or completes takeoff

([TOC](#table-of-contents))

###### Event: OnDeath
`Event OnDeath(ObjectReference akKiller)`

Event that is triggered when a spaceship dies

([TOC](#table-of-contents))

###### Event: OnDying
`Event OnDying(ObjectReference akKiller)`

Event that is triggered when a spaceship is dying

([TOC](#table-of-contents))

###### Event: OnKill
`Event OnKill(ObjectReference akVictim)`

Event that is triggered when a spaceship kills another spaceship

([TOC](#table-of-contents))

###### Event: OnShipUndock
`Event OnShipUndock(bool abComplete, SpaceshipReference akUndocking, SpaceshipReference akParent)`

Event received when a ship initiates or completes undocking with a parent

([TOC](#table-of-contents))

###### Event: OnShipBought
`Event OnShipBought()`

Event this is triggered when a ship is bought

([TOC](#table-of-contents))

###### Event: OnShipSold
`Event OnShipSold()`

Event this is triggered when a ship is sold

([TOC](#table-of-contents))

###### Function: AddPerk (Native)
`Function AddPerk(Perk akPerk, bool abNotify=false) native`

Adds the specified perk to this actor

([TOC](#table-of-contents))

###### Function: AddToFaction
`Function AddToFaction(Faction akFaction)`

Adds this spaceship to a faction at rank 0 if they aren't already in it

([TOC](#table-of-contents))

###### Function: CanLandAtMarker (Native)
`bool Function CanLandAtMarker(ObjectReference akLandingMarker) native`

Tests if the spaceship is allowed to land at the given marker based on the maximum allowed ship size.

([TOC](#table-of-contents))

###### Function: CheckContrabandStatus (Native)
`int Function CheckContrabandStatus(bool abCheckWholeShip = true) native`

Retrieves the ships contraband status. (Only checks ships cargo if abCheckWholeShip is false)
- -1 - Below shielded inventory limit
- 0 - At shielded inventory limit
- 1 - Above shielded inventory limit

([TOC](#table-of-contents))

###### Function: DisableWithGravJump (Native)
`Function DisableWithGravJump() native`

disable this spaceship with grav jump FX

([TOC](#table-of-contents))

###### Function: DisableWithGravJumpNoWait (Native)
`Function DisableWithGravJumpNoWait() native`

disable this spaceship with grav jump FX. Does NOT wait for the FX to finish

([TOC](#table-of-contents))

###### Function: DisableWithTakeOffOrLanding (Native)
`Function DisableWithTakeOffOrLanding() native`

disable this spaceship after playing a takeoff or landing animation (whichever is appropriate)

([TOC](#table-of-contents))

###### Function: DisableWithTakeOffOrLandingNoWait (Native)
`Function DisableWithTakeOffOrLandingNoWait() native`

disable this spaceship after playing a takeoff or landing animation (whichever is appropriate). Does NOT wait for the animation to complete

([TOC](#table-of-contents))

###### Function: EnablePartRepair (Native)
`Function EnablePartRepair(ActorValue aSystemHealth, bool abEnable = true) native`

Enable/disable repairing the spaceship part associated with the given System Health actor value

If no part is specified, all the parts will be affected

pass true to enable repairing the part(s), false to disable it

([TOC](#table-of-contents))

###### Function: EvaluatePackage (Native)
`Function EvaluatePackage(bool abResetAI = false) native`

evaluate this spaceships packages.

([TOC](#table-of-contents))

###### Function: EnableAI (Native)
`Function EnableAI(bool abEnable = true, bool abPauseVoice = false) native`

enable or disable the AI for this ship

([TOC](#table-of-contents))

###### Function: EnableWithGravJump (Native)
`bool Function EnableWithGravJump() native`

enable this spaceship with grav jump FX

([TOC](#table-of-contents))

###### Function: EnableWithGravJumpNoWait (Native)
`bool Function EnableWithGravJumpNoWait() native`

enable this spaceship with grav jump FX - does not wait for 3d to load

([TOC](#table-of-contents))

###### Function: EnableWithLanding (Native)
`bool Function EnableWithLanding() native`

enable this spaceship and land it at its currently linked landing marker

([TOC](#table-of-contents))

###### Function: EnableWithLandingNoWait (Native)
`bool Function EnableWithLandingNoWait() native`

enable this spaceship and land it at its currently linked landing marker. Does not wait for the animation to complete or the 3d to load

([TOC](#table-of-contents))

###### Function: GetAllCombatTargets (Native)
`SpaceshipReference[] Function GetAllCombatTargets() native`

gets all the combat targets for this spaceship

([TOC](#table-of-contents))

###### Function: GetCombatTarget (Native)
`SpaceshipReference Function GetCombatTarget() native`

gets the current combat target

([TOC](#table-of-contents))

###### Function: GetContrabandWeight (Native)
`float Function GetContrabandWeight(bool abCheckWholeShip = true) native`

Retrieves the ships contraband weight. (Only checks ships cargo if abCheckWholeShip is false)

([TOC](#table-of-contents))

###### Function: GetCrimeFaction (Native)
`Faction Function GetCrimeFaction() native`

Get the faction this ship reports crimes to

([TOC](#table-of-contents))

###### Function: GetCurrentPackage (Native)
`Package Function GetCurrentPackage() native`

Gets this spaceships's current AI package

([TOC](#table-of-contents))

###### Function: GetExteriorLoadDoors (Native)
`ObjectReference[] Function GetExteriorLoadDoors() native`

Gets all exterior references for this spaceship which are load doors

([TOC](#table-of-contents))

###### Function: GetExteriorRefs (Native)
`ObjectReference[] Function GetExteriorRefs(keyword apKeyword) native`

Gets this spaceship's exterior references filtered by the given keyword

([TOC](#table-of-contents))

###### Function: GetFactionRank (Native)
`int Function GetFactionRank(Faction akFaction) native`

Obtains this spaceship's rank with the specified faction - returns -1 if the spaceship is not a member

([TOC](#table-of-contents))

###### Function: GetActorFactionReaction (Native)
`int Function GetActorFactionReaction(Actor akOtherActor) native`

returns the faction reaction to the other actor
- 0 - Neutral
- 1 - Enemy
- 2 - Ally
- 3 - Friend

([TOC](#table-of-contents))

###### Function: GetDockedShips (Native)
`SpaceshipReference[] Function GetDockedShips() native`

Retrieve all the spaceships currently docked with this spaceship

([TOC](#table-of-contents))

###### Function: GetFactionReaction (Native)
`int Function GetFactionReaction(SpaceshipReference akOther) native`

returns the faction reaction to the other spaceship
- 0 - Neutral
- 1 - Enemy
- 2 - Ally
- 3 - Friend

([TOC](#table-of-contents))

###### Function: GetFirstDockedShip (Native)
`SpaceshipReference Function GetFirstDockedShip() native`

Retrieve the first spaceship docked with this spaceship, if any

([TOC](#table-of-contents))

###### Function: GetKiller (Native)
`ObjectReference Function GetKiller() native`

get this ship's killer

([TOC](#table-of-contents))

###### Function: GetLandingRamps (Native)
`ObjectReference[] Function GetLandingRamps() native`

Gets all exterior references for this spaceship which are ramps

([TOC](#table-of-contents))

###### Function: GetLevel (Native)
`int Function GetLevel() native`

get the level of this spaceship

([TOC](#table-of-contents))

###### Function: GetLeveledSpaceshipBase (Native)
`SpaceshipBase Function GetLeveledSpaceshipBase() native`

get the base object of this spaceship, either the created one for a leveled ship or the editor saved one for a non leveled ship.

([TOC](#table-of-contents))

###### Function: GetNoBleedoutRecovery (Native)
`bool Function GetNoBleedoutRecovery() native`

get the no bleedout recovery status for this ship

([TOC](#table-of-contents))

###### Function: GetPartCount (Native)
`int Function GetPartCount(int aiShipPartID) native`

Gets the number of parts of a specific type

valid aiShipPartIDs 0 - Weapons, 1 - Engine, 2 - Shields, 3 - Gravdrive, 4 - Generator

([TOC](#table-of-contents))

###### Function: GetPartPower (Native)
`int Function GetPartPower(int aiShipPartID, int aiShipPartIndex) native`

Gets the amount of power allocated to a given part

valid aiShipPartIDs 0 - Weapons, 1 - Engine, 2 - Shields, 3 - Gravdrive, 4 - Generator

([TOC](#table-of-contents))

###### Function: GetShipMaxCargoWeight (Native)
`float Function GetShipMaxCargoWeight() native`

Gets the spaceships maximum weight capacity by summing normal and shielded cargo capacity.

([TOC](#table-of-contents))

###### Function: GetWeaponGroupBaseObject (Native)
`Weapon Function GetWeaponGroupBaseObject(ActorValue aWeaponGroupSystemHealth) native`

Returns the weapon associated with a weapon group part

([TOC](#table-of-contents))

###### Function: HasPerk (Native)
`bool Function HasPerk(Perk akPerk) native`

Checks to see if this speaceship has the given Perk

([TOC](#table-of-contents))

###### Function: InstantDock (Native)
`bool Function InstantDock(ObjectReference akTarget) native`

Instantly docks the spaceship with a target which can be another ship or a docking port

([TOC](#table-of-contents))

###### Function: InstantUndock (Native)
`Function InstantUndock() native`

Instantly undocks a spaceship

([TOC](#table-of-contents))

###### Function: IsAIEnabled (Native)
`bool Function IsAIEnabled() native`

Returns whether this spaceship's AI is enabled.

([TOC](#table-of-contents))

###### Function: IsAlarmed (Native)
`bool Function IsAlarmed() native`

Returns if this spaceship is alarmed or not

([TOC](#table-of-contents))

###### Function: IsAlerted (Native)
`bool Function IsAlerted() native`

Returns if this spaceship is alerted or not

([TOC](#table-of-contents))

###### Function: IsDead (Native)
`bool Function IsDead() native`

check if this spaceship is dead

([TOC](#table-of-contents))

###### Function: IsDetectedBy (Native)
`bool Function IsDetectedBy(SpaceshipReference akOther) native`

Returns if this spaceship is detected by the other one

([TOC](#table-of-contents))

###### Function: IsDocked (Native)
`bool Function IsDocked() native`

Get whether this spaceship is currently docked

([TOC](#table-of-contents))

###### Function: IsDockedWith (Native)
`bool Function IsDockedWith(SpaceshipReference akTarget) native`

Get whether this spaceship is currently docked with a given target

([TOC](#table-of-contents))

###### Function: IsDockedAsChild (Native)
`bool Function IsDockedAsChild() native`

Get whether this spaceship is docked as a child

([TOC](#table-of-contents))

###### Function: IsEssential (Native)
`bool Function IsEssential(bool abIncludeActors = true) native`

get if this spaceship is considered essential

Included actors are anyone in the ship's interior or exterior

([TOC](#table-of-contents))

###### Function: IsGhost (Native)
`bool Function IsGhost() native`

check if the ship is set to be a ghost

([TOC](#table-of-contents))

###### Function: IsHostileToSpaceship (Native)
`bool Function IsHostileToSpaceship(SpaceshipReference akSpaceship) native`

Is this spaceship hostile to another spaceship?

([TOC](#table-of-contents))

###### Function: IsInCombat (Native)
`bool Function IsInCombat() native`

check if the ship is in combat.

([TOC](#table-of-contents))

###### Function: IsInFaction (Native)
`bool Function IsInFaction(Faction akFaction) native`

Checks to see if this spaceship is a member of the specified faction

([TOC](#table-of-contents))

###### Function: IsInScene (Native)
`bool Function IsInScene() native`

check if this spaceship is in a scene

([TOC](#table-of-contents))

###### Function: IsLanded (Native)
`bool Function IsLanded() native`

check if this spaceship is landed

([TOC](#table-of-contents))

###### Function: IsProtected (Native)
`bool Function IsProtected(bool abIncludeActors = true) native`

get if this spaceship is considered protected

Included actors are anyone in the ship's interior or exterior

([TOC](#table-of-contents))

###### Function: IsRampDown (Native)
`bool Function IsRampDown() native`

check if this spaceship's ramp is connected to the surrounding navmesh yet

([TOC](#table-of-contents))

###### Function: Kill (Native)
`Function Kill(SpaceshipReference akKiller = none) native`

kill this ship with akKiller as the source of the kill

([TOC](#table-of-contents))

###### Function: KillEssential (Native)
`Function KillEssential(SpaceshipReference akKiller = none) native`

kill this ship with akKiller as the source of the kill even if the ship or any on board actors are essential.

([TOC](#table-of-contents))

###### Function: KillSilent (Native)
`Function KillSilent(SpaceshipReference akKiller = none) native`

kill this ship with akKiller as the source of the kill but do not generate story events

([TOC](#table-of-contents))

###### Function: ModFactionRank (Native)
`Function ModFactionRank(Faction akFaction, int aiAmount) native`

modifies the faction rank by the given amount

([TOC](#table-of-contents))

###### Function: MoveToPackageLocation (Native)
`Function MoveToPackageLocation( ) native`

Pop this spaceship to the initial location for a package.

([TOC](#table-of-contents))

###### Function: OpenInventory (Native)
`Function OpenInventory() native`

Opens this ship's inventory.

([TOC](#table-of-contents))

###### Function: LockPowerAllocation (Native)
`Function LockPowerAllocation(int aiShipPartID, int aiShipPartIndex, bool abLock = true) native`

Lock the power allocation of a specific part to keep the AI from modifying it

valid aiShipPartIDs 0 - Weapons, 1 - Engine, 2 - Shields, 3 - Gravdrive, 4 - Generator

pass -1 to aiShipPartIndex to lock/unlock the power of all the parts of the specified type

This will also keep the AI from repairing a damaged part

([TOC](#table-of-contents))

###### Function: PathToReference (Native)
`int Function PathToReference(ObjectReference aTarget, float afNormalizedSpeed, float afNormalizedRotationSpeed, float afTargetRadius=-1.0, bool abHardRadius=false) native`

Make the spaceship attempt to path to a reference, latent version

Note: this method doesn't return until the goal is reached or pathing

failed or was interrupted (by another request for instance)

Return values (see Actor for PathingResult properties):
- 0 - Success
- 1 - Failure
- 2 - Stopped
- 3 - Cleared
- 4 - Timeout

([TOC](#table-of-contents))

###### Function: RemoveFromAllFactions (Native)
`Function RemoveFromAllFactions() native`

remove the ship from the all factions

([TOC](#table-of-contents))

###### Function: RemoveFromFaction (Native)
`Function RemoveFromFaction(Faction akFaction) native`

remove the ship from the given faction

([TOC](#table-of-contents))

###### Function: RemovePerk (Native)
`Function RemovePerk(Perk akPerk) native`

Removes the specified perk from this spaceship

([TOC](#table-of-contents))

###### Function: SendAssaultAlarm (Native)
`Function SendAssaultAlarm() native`

Has this spaceship behave as if assaulted

([TOC](#table-of-contents))

###### Function: SendPiracyAlarm (Native)
`Function SendPiracyAlarm() native`

Have the ship behave as if pirated

([TOC](#table-of-contents))

###### Function: SendSmugglingAlarm (Native)
`Function SendSmugglingAlarm(bool abCheckWholeShip = true) native`

Have this spaceship behave as if they detected the player smuggling

([TOC](#table-of-contents))

###### Function: SetAlert (Native)
`Function SetAlert(bool abAlerted = true) native`

Sets the spaceship in an alerted state

([TOC](#table-of-contents))

###### Function: SetAttackShipOnSight (Native)
`Function SetAttackShipOnSight(bool abAttackOnSight = true) native`

Sets this ship to be attacked by all other ships on sight

([TOC](#table-of-contents))

###### Function: SetAvoidPlayer (Native)
`Function SetAvoidPlayer(bool abAvoid = true) native`

Tells pathing to avoid the player (which it already does by default) or not (for use in scenes where the player is meant to be an incorporeal observer).

([TOC](#table-of-contents))

###### Function: SetCombatStyle (Native)
`Function SetCombatStyle(CombatStyle akCombatStyle) native`

Sets the combatstyle for this spaceship

([TOC](#table-of-contents))

###### Function: SetCrimeFaction (Native)
`Function SetCrimeFaction(Faction akFaction) native`

Sets the faction this spaceship reports crimes to

([TOC](#table-of-contents))

###### Function: SetEssential (Native)
`Function SetEssential(bool abEssential) native`

set if this spaceship is considered essential

([TOC](#table-of-contents))

###### Function: SetFactionRank (Native)
`Function SetFactionRank(Faction akFaction, int aiRank) native`

Sets this spaceship's rank with the specified faction

([TOC](#table-of-contents))

###### Function: SetGhost (Native)
`Function SetGhost(bool abIsGhost = true) native`

sets if this spaceship is a ghost

([TOC](#table-of-contents))

###### Function: SetNoBleedoutRecovery (Native)
`Function SetNoBleedoutRecovery(bool abBleedoutRecoveryNotAllowed = true) native`

set the no bleedout recovery status for this ship; pass true to prevent recovery

([TOC](#table-of-contents))

###### Function: SetNotShowOnStealthMeter (Native)
`Function SetNotShowOnStealthMeter(bool abNotShow = true) native`

Sets this spaceship to not effect the detection level on the stealth meter if they are not hostile to the player

([TOC](#table-of-contents))

###### Function: SetPartPower (Native)
`Function SetPartPower(int aiShipPartID, int aiShipPartIndex, int aiPower) native`

Sets the amount of power allocated to a given part

valid aiShipPartIDs 0 - Weapons, 1 - Engine, 2 - Shields, 3 - Gravdrive, 4 - Generator

specify -1 for the aiShipPartIndex to set the power of all the parts of the specified type (such as weapons)

([TOC](#table-of-contents))

###### Function: SetPlayerResistingArrest (Native)
`Function SetPlayerResistingArrest() native`

Sets the player as resisting arrest from this spaceships's faction

([TOC](#table-of-contents))

###### Function: SetProtected (Native)
`Function SetProtected(bool abProtected) native`

set if this spaceship is considered protected

([TOC](#table-of-contents))

###### Function: ShowBarterMenu (Native)
`Function ShowBarterMenu() native`

Opens the Barter menu

([TOC](#table-of-contents))

###### Function: StartCombat (Native)
`Function StartCombat(SpaceshipReference akTarget, bool abPreferTarget = false) native`

start combat with the given target

([TOC](#table-of-contents))

###### Function: StopCombat (Native)
`Function StopCombat() native`

stops combat for this spaceship

([TOC](#table-of-contents))

###### Function: StopCombatAlarm (Native)
`Function StopCombatAlarm() native`

Stops all combat and alarms against this spaceship

([TOC](#table-of-contents))

###### Function: TakeOff (Native)
`Function TakeOff() native`

Force this spaceship to takeoff immediately (if it isn't in space)

([TOC](#table-of-contents))

###### Function: SetForwardVelocity (Native)
`Function SetForwardVelocity(float aVelocity) native`

Set the forward velocity of the ship as a percentage of max speed(0-1)

([TOC](#table-of-contents))

###### Function: SetUnconscious (Native)
`Function SetUnconscious(bool aUnconscious) native`

Set the autopilot of the ship unonscious or conscious

([TOC](#table-of-contents))

###### Function: SetIgnoreFriendlyHits (Native)
`Function SetIgnoreFriendlyHits(bool aIgnoreFriendlyHits) native`

Set the ship to ignore friendly hits

([TOC](#table-of-contents))

###### Function: GetGravJumpRange (Native)
`float Function GetGravJumpRange() native`

Gets the spaceships current max grav jump range in light years

([TOC](#table-of-contents))

###### Function: GetReactorClassKeyword (Native)
`Keyword Function GetReactorClassKeyword() native`

Get this ship's reactor class keyword

([TOC](#table-of-contents))

###### Function: IsExteriorLoadDoorInaccessible
`bool Function IsExteriorLoadDoorInaccessible()`

Is the ship's exterior load door inaccessible? (Checks the state of the first door found, if there are multiple.)

([TOC](#table-of-contents))

###### Function: SetExteriorLoadDoorInaccessible
`Function SetExteriorLoadDoorInaccessible(bool abInaccessible = true)`

Sets the ship's exterior load door(s) inaccessible.

([TOC](#table-of-contents))

###### Function: IsLandingDeckClear
`bool Function IsLandingDeckClear()`

Are there any actors on the ship's exterior landing deck? (That is, any actors in the trigger encompassing the landing deck and ramp?) (Checks the state of the first deck found, if there are multiple.)

([TOC](#table-of-contents))

#### Script: Outfit
`Scriptname Outfit extends Form Native Hidden`

([TOC](#table-of-contents))

#### Script: Package
`Scriptname Package extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: GetOwningQuest (Native)
`Quest Function GetOwningQuest() native`

Returns the quest that owns this package

([TOC](#table-of-contents))

##### Function: GetTemplate (Native)
`Package Function GetTemplate() native`

Obtains the package that is the parent template of this one (if any)

([TOC](#table-of-contents))

##### Event: OnStart
`Event OnStart(Actor akActor)`

Event called when the package first starts (in parallel with the fragment)

([TOC](#table-of-contents))

##### Event: OnEnd
`Event OnEnd(Actor akActor)`

Event called when the package ends (in parallel with the fragment)

([TOC](#table-of-contents))

##### Event: OnChange
`Event OnChange(Actor akActor)`

Event called when the package changes (in parallel with the fragment)

([TOC](#table-of-contents))

#### Script: PackIn
`Scriptname PackIn extends Form Native Hidden`

([TOC](#table-of-contents))

#### Script: Perk
`Scriptname Perk extends Form Native Hidden`

([TOC](#table-of-contents))

##### Event: OnEntryRun
`Event OnEntryRun(int auiEntryID, ObjectReference akTarget, Actor akOwner)`

Event called when a perk entry is run, with the specified target and perk owner (in parallel with the fragment)

([TOC](#table-of-contents))

#### Script: Planet
`Scriptname Planet extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: GetAtmosphereType (Native)
`Keyword Function GetAtmosphereType() native`

Get the atmosphere type keyword for this planet

([TOC](#table-of-contents))

##### Function: GetDayLength (Native)
`float Function GetDayLength() native`

Get the day length in hours for this planet

([TOC](#table-of-contents))

##### Function: GetGravity (Native)
`float Function GetGravity() native`

Get the gravity multiplier for this planet

([TOC](#table-of-contents))

##### Function: GetKeywordTypeList (Native)
`Keyword[] Function GetKeywordTypeList(int aType) native`

Get all of the keywords of the given type on this planet

([TOC](#table-of-contents))

##### Function: GetPressure (Native)
`float Function GetPressure() native`

Get the pressure value for this planet

([TOC](#table-of-contents))

##### Function: GetSurveyPercent (Native)
`float Function GetSurveyPercent() native`

Get the survey percent for this planet

([TOC](#table-of-contents))

##### Function: GetTemperature (Native)
`float Function GetTemperature() native`

Get the temperature value for this planet

([TOC](#table-of-contents))

##### Function: GetType (Native)
`Keyword Function GetType() native`

Get the planet type keyword for this planet

([TOC](#table-of-contents))

##### Function: IsTraitKnown (Native)
`bool Function IsTraitKnown(Keyword aKeyword) native`

Check if a planet trait is known

([TOC](#table-of-contents))

##### Function: SetTraitKnown (Native)
`Function SetTraitKnown(Keyword aKeyword, bool abKnown = true) native`

Set a planet trait as known by the player

([TOC](#table-of-contents))

##### Function: GetLocation (Native)
`Location Function GetLocation() native`

Get the location for this planet

([TOC](#table-of-contents))

#### Script: Potion
`Scriptname Potion extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: IsHostile (Native)
`bool Function IsHostile() native`

Is this potion classified as hostile?

([TOC](#table-of-contents))

#### Script: Projectile
`Scriptname Projectile extends Form Native Hidden`

([TOC](#table-of-contents))

#### Script: Quest
`Scriptname Quest extends Form Native Hidden`

([TOC](#table-of-contents))

##### Struct: QuestStage
`struct QuestStage`

QuestStage struct

Members:

`Quest QuestToSet`
`int StageToSet`

([TOC](#table-of-contents))

##### Event: OnMissionAccepted
`Event OnMissionAccepted()`

Event received when a mission-type quest is accepted via the mission board

([TOC](#table-of-contents))

##### Event: OnQuestInit
`Event OnQuestInit()`

Event received when the quest is initialized, aliases are filled, and it is about to run the startup stage

([TOC](#table-of-contents))

##### Event: OnQuestShutdown
`Event OnQuestShutdown()`

Event received when the quest has been shut down

Note that the aliases will be empty by the time this event is received

([TOC](#table-of-contents))

##### Event: OnQuestStarted
`Event OnQuestStarted()`

Event received when the quest has been started

([TOC](#table-of-contents))

##### Event: OnQuestRejected
`Event OnQuestRejected()`

Event received when the quest is rejected

([TOC](#table-of-contents))

##### Event: OnQuestTimerStart
`Event OnQuestTimerStart(int aiReason)`

Event received when the quest timer has started

aiReason values are 0=timer expired, 1=stage triggered, 2=script

([TOC](#table-of-contents))

##### Event: OnQuestTimerEnd
`Event OnQuestTimerEnd(int aiReason)`

Event received when the quest timer has ended

aiReason values are 0=timer expired, 1=stage triggered, 2=script

([TOC](#table-of-contents))

##### Event: OnQuestTimerPause
`Event OnQuestTimerPause(int aiReason)`

Event received when the quest timer has been paused

aiReason values are 0=timer expired, 1=stage triggered, 2=script

([TOC](#table-of-contents))

##### Event: OnQuestTimerResume
`Event OnQuestTimerResume(int aiReason)`

Event received when the quest timer has resumed

aiReason values are 0=timer expired, 1=stage triggered, 2=script

([TOC](#table-of-contents))

##### Event: OnQuestTimerMod
`Event OnQuestTimerMod(int aiReason)`

Event received when the quest timer has be modded

aiReason values are 0=timer expired, 1=stage triggered, 2=script

([TOC](#table-of-contents))

##### Event: OnReset
`Event OnReset()`

Event received when the quest owning this alias is reset

([TOC](#table-of-contents))

##### Event: OnStageSet
`Event OnStageSet(int auiStageID, int auiItemID)`

Event received when a quest stage is set (in parallel with the fragment)

([TOC](#table-of-contents))

##### Event: OnSpeechChallengeCompletion
`Event OnSpeechChallengeCompletion(SpeechChallengeObject akSpeechChallenge, bool abSuccess)`

Event called when a speech challenge is completed (won or lost).

([TOC](#table-of-contents))

##### Event: OnStoryActivateActor
`Event OnStoryActivateActor(Location akLocation, ObjectReference akActor)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryActorAttach
`Event OnStoryActorAttach(ObjectReference akActor, Location akLocation)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryAddToPlayer
`Event OnStoryAddToPlayer(ObjectReference akOwner, ObjectReference akContainer, Location akLocation, Form akItemBase, int aiAcquireType, int aiValue)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryArrest
`Event OnStoryArrest(ObjectReference akArrestingGuard, ObjectReference akCriminal, Location akLocation, int aiCrime)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryAssaultActor
`Event OnStoryAssaultActor(ObjectReference akVictim, ObjectReference akAttacker, Location akLocation, bool abCrime)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryAttractionObject
`Event OnStoryAttractionObject(ObjectReference akActor, ObjectReference akObject, Location akLocation, bool abCommanded)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryBribeNPC
`Event OnStoryBribeNPC(ObjectReference akActor, int aiAmount)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryCastMagic
`Event OnStoryCastMagic(ObjectReference akCastingActor, ObjectReference akSpellTarget, Location akLocation, Form akSpell)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryChangeLocation
`Event OnStoryChangeLocation(ObjectReference akActor, Location akOldLocation, Location akNewLocation)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryExploredLocation
`Event OnStoryExploredLocation(Location akOldLocation)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryCraftItem
`Event OnStoryCraftItem(ObjectReference akBench, Location akLocation, Form akCreatedItem)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryCrimeGold
`Event OnStoryCrimeGold(ObjectReference akVictim, ObjectReference akCriminal, Form akFaction, int aiGoldAmount, int aiCrime)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryCure
`Event OnStoryCure(Form akInfection)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryDialogue
`Event OnStoryDialogue(Location akLocation)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryDiscoverDeadBody
`Event OnStoryDiscoverDeadBody(ObjectReference akActor, ObjectReference akDeadActor, Location akLocation)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryEscapeJail
`Event OnStoryEscapeJail(Location akLocation, Form akCrimeGroup)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryFlatterNPC
`Event OnStoryFlatterNPC(ObjectReference akActor)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryHackTerminal
`Event OnStoryHackTerminal(ObjectReference akComputer, bool abSucceeded)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryHello
`Event OnStoryHello(Location akLocation, ObjectReference akActor1, ObjectReference akActor2)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryIncreaseLevel
`Event OnStoryIncreaseLevel(int aiNewLevel)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryInfection
`Event OnStoryInfection(ObjectReference akTransmittingActor, Form akInfection)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryIntimidateNPC
`Event OnStoryIntimidateNPC(ObjectReference akActor)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryIronSights
`Event OnStoryIronSights(ObjectReference akActor, Form akWeapon)`

Story manager event - fired in parallel with the quest startup stage


([TOC](#table-of-contents))

##### Event: OnStoryJail
`Event OnStoryJail(ObjectReference akGuard, Form akCrimeGroup, Location akLocation, int aiCrimeGold)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryKillActor
`Event OnStoryKillActor(ObjectReference akVictim, ObjectReference akKiller, Location akLocation, int aiCrimeStatus, int aiRelationshipRank)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryLocationLoaded
`Event OnStoryLocationLoaded(Location akLocation)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryMineExplosion
`Event OnStoryMineExplosion(ObjectReference akVictim, ObjectReference akAttacker)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryNewVoicePower
`Event OnStoryNewVoicePower(ObjectReference akActor, Form akVoicePower)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryPayFine
`Event OnStoryPayFine(ObjectReference akCriminal, ObjectReference akGuard, Form akCrimeGroup, int aiCrimeGold)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryPickLock
`Event OnStoryPickLock(ObjectReference akActor, ObjectReference akLock, bool abCrime)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryPickPocket
`Event OnStoryPickPocket(ObjectReference akVictim, bool abSuccess)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryPiracyActor
`Event OnStoryPiracyActor(ObjectReference akVictim, ObjectReference akAttacker, Location akLocation, bool abCrime)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryPlayerGetsFavor
`Event OnStoryPlayerGetsFavor(ObjectReference akActor)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryRelationshipChange
`Event OnStoryRelationshipChange(ObjectReference akActor1, ObjectReference akActor2, int aiOldRelationship, int aiNewRelationship)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryRemoveFromPlayer
`Event OnStoryRemoveFromPlayer(ObjectReference akOwner, ObjectReference akItem, Location akLocation, Form akItemBase, int aiRemoveType, int aiValue)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryScript
`Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, int aiValue1, int aiValue2)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryServedTime
`Event OnStoryServedTime(Location akLocation, Form akCrimeGroup, int aiCrimeGold, int aiDaysJail)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryShipDock
`Event OnStoryShipDock(ObjectReference akDockingShip, ObjectReference akDockTargetShip, bool abDocking)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryShipLanding
`Event OnStoryShipLanding(ObjectReference akLandingShip, ObjectReference akLandingMarker)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStorySpeechChallengeCompletion
`Event OnStorySpeechChallengeCompletion(SpeechChallengeObject akChallenge, bool abSuccess)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Event: OnStoryTrespass
`Event OnStoryTrespass(ObjectReference akVictim, ObjectReference akTrespasser, Location akLocation, bool abCrime)`

Story manager event - fired in parallel with the quest startup stage

([TOC](#table-of-contents))

##### Function: ModObjectiveGlobal (Global)
`bool Function ModObjectiveGlobal(float afModValue, GlobalVariable aModGlobal, int aiObjectiveID = -1, float afTargetValue = -1.0, bool abCountingUp = true, bool abCompleteObjective = true, bool abRedisplayObjective = true, bool abAllowRollbackObjective = false)`

thread-safe way to modify a global value

optional parameters:

`aiObjectiveID` = objective ID to redisplay

`afTargetValue` = value you're counting up (or down) towards -- if included, function will return TRUE when the global reaches the target value

`abCountingUp` = by default, function assumes you're counting up towards the target value; make this false to count DOWN towards target value

`abCompleteObjective` = by default, function assumes you're completing the objective once you reach the target value; make this false to FAIL the objective

`abRedisplayObjective` = by default, function assumes you want to redisplay the objective every time the global is incremented; make this FALSE to only display the objectives on complete or failure

`abAllowRollbackObjective` = by default, function assumes you do not want to rollback a completed objective; make this TRUE to reopen an already completed objective if `aModGlobal` goes below/above target value

([TOC](#table-of-contents))

##### Function: SetAllStages
`function SetAllStages(int lastStage)`

sets all stages up to lastStage

([TOC](#table-of-contents))

##### Function: SetQuestStage (Global)
`function SetQuestStage(QuestStage questStageToSet) global`

set the specified quest to the specified stage

([TOC](#table-of-contents))

##### Function: GetQuestStageDone (Global)
`bool function GetQuestStageDone(QuestStage questStageToCheck) global`

get whether the specified stage from the specified quest is done

([TOC](#table-of-contents))

##### Function: SetObjectiveSkipped
`Function SetObjectiveSkipped(int aiObjectiveID)`

handle objectives that might have been skipped over. For now, hide them

([TOC](#table-of-contents))

##### Function: SetObjectiveActive
`Function SetObjectiveActive(int aiObjective,  bool abForceRedisplay = true)`

uncompletes, unfails and displays the objective

`int aiObjective`: the objective id to display

`bool abForceRedisplay`: should the objective be re-displayed (if already)? (default: true)

([TOC](#table-of-contents))

##### Function: CompleteAllObjectives (Native)
`Function CompleteAllObjectives() native`

Flags all objectives as complete

([TOC](#table-of-contents))

##### Function: CompleteQuest (Native)
`Function CompleteQuest() native`

Flags this quest as completed

([TOC](#table-of-contents))

##### Function: FailAllObjectives (Native)
`Function FailAllObjectives() native`

Flags all objectives as failed

([TOC](#table-of-contents))

##### Function: GetAlias (Native)
`Alias Function GetAlias(int aiAliasID) native`

Obtains the specified alias on the quest

([TOC](#table-of-contents))

##### Function: GetCurrentStageID (Native)
`int Function GetCurrentStageID() native`

Obtains the id of the highest completed stage on this quest

([TOC](#table-of-contents))

##### Function: GetCurrentStageTargets (Native)
`ObjectReference[] Function GetCurrentStageTargets() native`

Returns the array of object reference targets pertinent to the current quest stage

([TOC](#table-of-contents))

##### Function: GetStage
`int Function GetStage()`

Alias for GetCurrentStageID - obtains the highest completed stage on this quest

([TOC](#table-of-contents))

##### Function: GetQuestTimeRemaining (Native)
`float Function GetQuestTimeRemaining() native`

gets the remaining time for the quest timer if any

([TOC](#table-of-contents))

##### Function: GetStageDone
`bool Function GetStageDone(int aiStage)`

Alias for IsStageDone - checks to see whether the given stage is done or not

([TOC](#table-of-contents))

##### Function: HasObjective (Native)
`bool Function HasObjective(int aiObjective) native`

Checks to see if the specified objective exists on the quest

([TOC](#table-of-contents))

##### Function: IsActive (Native)
`bool Function IsActive() native`

Is this quest "active" (tracked by the player)?

([TOC](#table-of-contents))

##### Function: IsCompleted (Native)
`bool Function IsCompleted() native`

Checks to see if the quest is completed

([TOC](#table-of-contents))

##### Function: IsObjectiveCompleted (Native)
`bool Function IsObjectiveCompleted(int aiObjective) native`

Checks to see if the specified objective is completed

([TOC](#table-of-contents))

##### Function: IsObjectiveDisplayed (Native)
`bool Function IsObjectiveDisplayed(int aiObjective) native`

Checks to see if the specified objective is displayed

([TOC](#table-of-contents))

##### Function: IsObjectiveFailed (Native)
`bool Function IsObjectiveFailed(int aiObjective) native`

Checks to see if the specified objective is failed

([TOC](#table-of-contents))

##### Function: SetObjectiveDisplayedAtTop (Native)
`Function SetObjectiveDisplayedAtTop(int aiObjective) native`

Sets the specified objective to be displayed at the top of the player's objective list

([TOC](#table-of-contents))

##### Function: IsQuestTimerPaused (Native)
`bool Function IsQuestTimerPaused() native`

Checks if the quest timer is paused; returns true if paused otherwise false which means the timer is running

([TOC](#table-of-contents))

##### Function: IsRunning (Native)
`bool Function IsRunning() native`

Checks to see if the quest is running

([TOC](#table-of-contents))

##### Function: IsStageDone (Native)
`bool Function IsStageDone(int aiStage) native`

Obtains whether the specified stage is done or not

([TOC](#table-of-contents))

##### Function: IsStarting (Native)
`bool Function IsStarting() native`

Checks to see if the quest is enabled but not running yet

([TOC](#table-of-contents))

##### Function: IsStopping (Native)
`bool Function IsStopping() native`

Checks to see if the quest is not enabled anymore but still shutting down

([TOC](#table-of-contents))

##### Function: IsStopped (Native)
`bool Function IsStopped() native`

Checks to see if the quest is no longer enabled or running

([TOC](#table-of-contents))

##### Function: ModQuestTimer (Native)
`Function ModQuestTimer(float afModValue) native`

Modifies a quest timer

The timer is modified by the given afModValue can be negative or positive but not 0

([TOC](#table-of-contents))

##### Function: PauseQuestTimer (Native)
`Function PauseQuestTimer(bool abPause = true) native`

Pauses the quest timer if abPause is true, resumes it if false. If the timer was already in the requested state nothing happens.

([TOC](#table-of-contents))

##### Function: RemoveRequestedPCMQuestLocations (Native)
`Function RemoveRequestedPCMQuestLocations() native`

Removes PCM locations requested by this quest.

([TOC](#table-of-contents))

##### Function: Reset (Native)
`Function Reset() native`

Resets the quest

([TOC](#table-of-contents))

##### Function: SetActive (Native)
`Function SetActive(bool abActive = true) native`

Flags this quest as "active" (tracked by the player)

([TOC](#table-of-contents))

##### Function: SetCurrentStageID (Native)
`bool Function SetCurrentStageID(int aiStageID) native`

Set the quest to the requested stage ID - returns true if stage exists and was set.

This function is latent and will wait for the quest to start up before returning (if it needed to be started)

([TOC](#table-of-contents))

##### Function: SetObjectiveCompleted (Native)
`Function SetObjectiveCompleted(int aiObjective, bool abCompleted = true) native`

Sets the specified objective to completed or not

([TOC](#table-of-contents))

##### Function: SetObjectiveDisplayed (Native)
`Function SetObjectiveDisplayed(int aiObjective, bool abDisplayed = true, bool abForce = false) native`

Sets the specified objective to displayed or hidden - if abForce is true, will display the objective even if it has already been displayed

([TOC](#table-of-contents))

##### Function: SetObjectiveFailed (Native)
`Function SetObjectiveFailed(int aiObjective, bool abFailed = true) native`

Sets the specified objective to failed or not

([TOC](#table-of-contents))

##### Function: SetObjectiveFailedIfNotCompleted
`Function SetObjectiveFailedIfNotCompleted(int aiObjective)`

fails the objective if it's not completed

([TOC](#table-of-contents))

##### Function: SetStage
`bool Function SetStage(int aiStage)`

Alias of SetCurrentStageID - Set the quest to the requested stage

This function is latent and will wait for the quest to start up before returning (if it needed to be started)

([TOC](#table-of-contents))

##### Function: SetStageNoWait (Native)
`Function SetStageNoWait(int aiStage) native`

Sets the quest to the requested stage. Will NOT wait for the quest to start up, or for fragments to run. As such, it cannot return whether the stage was set or not, unlike SetStage or SetCurrentStageID

([TOC](#table-of-contents))

##### Function: Start (Native)
`bool Function Start() native`

Starts the quest - returns whether the quest was able to be started or not

This function is latent and will wait for the quest to start up before returning

([TOC](#table-of-contents))

##### Function: StartNoWait (Native)
`bool Function StartNoWait() native`

Starts the quest - returns whether the quest was able to be started or not

This function does not wait for aliases to fill or fragments to run and returns immediately

([TOC](#table-of-contents))

##### Function: StartQuestTimer (Native)
`Function StartQuestTimer(float afTimeInHours = -1.0) native`

Starts this quests timer with the given time or the time saved on the quest itself if none was given.

Will reset the timer with the new time if the timer was running.

([TOC](#table-of-contents))

##### Function: Stop (Native)
`Function Stop() native`

Stops the quest

([TOC](#table-of-contents))

##### Function: StopQuestTimer (Native)
`Function StopQuestTimer() native`

stop the running quest timer

Will trigger OnQuestTimerEnd

([TOC](#table-of-contents))

##### Function: UpdateCurrentInstanceGlobal (Native) (Global)
`bool Function UpdateCurrentInstanceGlobal( GlobalVariable aUpdateGlobal ) native`

Updates current instance's value for the given global

([TOC](#table-of-contents))

#### Script: Race
`Scriptname Race extends Form Native Hidden`

([TOC](#table-of-contents))

#### Script: ResearchProject
`Scriptname ResearchProject extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: Complete (Native)
`Function Complete() native`

Set the status of the Research Project to completed.

([TOC](#table-of-contents))

#### Script: Resource
`Scriptname Resource extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: GetCreatedObject (Native)
`Form Function GetCreatedObject() native`

Returns the Created Object of the ResourceItem (Constructible) of this Resource

([TOC](#table-of-contents))

#### Script: Scene
`Scriptname Scene extends Form Native Hidden`

([TOC](#table-of-contents))

##### Event: OnAction
`Event OnAction(int auiActionID, ReferenceAlias akAlias)`

Event received when a scene action is executed on an alias (in parallel with the fragment)

([TOC](#table-of-contents))

##### Event: OnBegin
`Event OnBegin()`

Event received when this scene starts up (in parallel with the fragment)

([TOC](#table-of-contents))

##### Event: OnEnd
`Event OnEnd()`

Event received when this scene ends (in parallel with the fragment)

([TOC](#table-of-contents))

##### Event: OnPhaseBegin
`Event OnPhaseBegin(int auiPhaseIndex)`

Event received when a phase starts (in parallel with the fragment)

([TOC](#table-of-contents))

##### Event: OnPhaseEnd
`Event OnPhaseEnd(int auiPhaseIndex)`

Event received when a phase ends (in parallel with the fragment)

([TOC](#table-of-contents))

##### Function: ForceStart (Native)
`Function ForceStart() native`

Forces a scene to start and kills the current scenes running on any ref in that scene

([TOC](#table-of-contents))

##### Function: Start (Native)
`Function Start() native`

Starts this scene

([TOC](#table-of-contents))

##### Function: Stop (Native)
`Function Stop() native`

Stops the scene

([TOC](#table-of-contents))

##### Function: IsPlaying (Native)
`bool Function IsPlaying() native`

Is this scene currently playing?

([TOC](#table-of-contents))

##### Function: GetOwningQuest (Native)
`Quest Function GetOwningQuest() native`

Returns the quest that owns this scene

([TOC](#table-of-contents))

##### Function: IsActionComplete (Native)
`bool Function IsActionComplete(int aiActionID) native`

Returns whether the specified action is complete or not

([TOC](#table-of-contents))

##### Function: Pause (Native)
`Function Pause(bool abPause) native`

Pauses or unpauses the scene

([TOC](#table-of-contents))

#### Script: Scroll
`Scriptname Scroll extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: Cast (Native)
`Function Cast(ObjectReference akSource, ObjectReference akTarget=NONE) native`

Cast this scroll from an ObjectReference, optionally toward another.

([TOC](#table-of-contents))

#### Script: ShaderParticleGeometry
`Scriptname ShaderParticleGeometry extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: Apply (Native)
`Function Apply(float afFadeInTime = 0.0) Native`

Applies this effect, optionally fading it in (0 means pop-in)

([TOC](#table-of-contents))

##### Function: Remove (Native)
`Function Remove(Float afFadeOutTime = 0.0) Native`

Removes this effect, optionally fading it out (0 means pop-out)

([TOC](#table-of-contents))

#### Script: Shout
`Scriptname Shout extends Form Native Hidden`

([TOC](#table-of-contents))

#### Script: SpaceshipBase
`Scriptname SpaceshipBase Extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: IsUnique (Native)
`bool Function IsUnique() native`

Is this base unique?

([TOC](#table-of-contents))

#### Script: SpeechChallengeObject
`Scriptname SpeechChallengeObject extends Form Native Hidden`

([TOC](#table-of-contents))

#### Script: Spell
`Scriptname Spell extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: Cast (Native)
`Function Cast(ObjectReference akSource, ObjectReference akTarget=NONE) native`

Cast this spell from an ObjectReference, optionally toward another.

([TOC](#table-of-contents))

##### Function: RemoteCast (Native)
`Function RemoteCast(ObjectReference akSource, Actor akBlameActor, ObjectReference akTarget=NONE) native`

Cast this spell from an ObjectReference, optionally toward another, and blame it on a particular actor.

([TOC](#table-of-contents))

##### Function: IsHostile (Native)
`bool Function IsHostile() native`

Is this spell classified as hostile?

([TOC](#table-of-contents))

#### Script: Static
`Scriptname Static Extends Form Native Hidden`

([TOC](#table-of-contents))

##### Script: MovableStatic
`Scriptname MovableStatic Extends Static Native Hidden`

([TOC](#table-of-contents))

#### Script: Terminal
`Scriptname Terminal extends Form Native Hidden`

([TOC](#table-of-contents))

#### Script: TerminalMenu
`Scriptname TerminalMenu extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: OnTerminalMenuItemRun
`Event OnTerminalMenuItemRun(int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)`

Event called when a terminal menu item is run, with the specified target and terminal owner (in parallel with the fragment)

([TOC](#table-of-contents))

##### Function: OnTerminalMenuEnter
`Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)`

Event called when this terminal menu is entered, with the specified target

([TOC](#table-of-contents))

##### Function: AddDynamicMenuItem (Native)
`Function AddDynamicMenuItem(ObjectReference aTerminalRef, int aiTemplateIndex, int aiItemID, Form[] akTagReplacementForms) native`

Adds a dynamic menu item to the TerminalMenu of the specified reference

([TOC](#table-of-contents))

##### Function: AddDynamicBodyTextItem (Native)
`Function AddDynamicBodyTextItem(ObjectReference aTerminalRef, int aiTemplateIndex, int aiItemID, Form[] akTagReplacementForms) native`

Adds a dynamic body text item to the TerminalMenu of the specified reference

([TOC](#table-of-contents))

##### Function: ClearDynamicMenuItems (Native)
`Function ClearDynamicMenuItems(ObjectReference aTerminalRef) native`

Clears all dynamic menu items from the specified reference

([TOC](#table-of-contents))

##### Function: ClearDynamicBodyTextItems (Native)
`Function ClearDynamicBodyTextItems(ObjectReference aTerminalRef) native`

Clears all dynamic body text items from the specified reference

([TOC](#table-of-contents))

##### Function: GetCurrentTerminalObjectRef (Native) (Global)
`ObjectReference Function GetCurrentTerminalObjectRef() native global`

Get the current terminal reference being used by the player

([TOC](#table-of-contents))

#### Script: TextureSet
`Scriptname TextureSet extends Form Hidden Native`

([TOC](#table-of-contents))

#### Script: Topic
`Scriptname Topic extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: Add (Native)
`Function Add() native`

Adds this topic to the list the player knows about

([TOC](#table-of-contents))

#### Script: TopicInfo
`Scriptname TopicInfo extends Form Native Hidden`

([TOC](#table-of-contents))

##### Event: OnBegin
`Event OnBegin(ObjectReference akSpeakerRef, bool abHasBeenSaid)`

Event called when this topic info begins (in parallel with the fragment)

([TOC](#table-of-contents))

##### Event: OnEnd
`Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)`

Event called when this topic info ends (in parallel with the fragment)

([TOC](#table-of-contents))

##### Function: GetOwningQuest (Native)
`Quest Function GetOwningQuest() native`

Returns the quest that owns this topic info

([TOC](#table-of-contents))

##### Function: HasBeenSaid (Native)
`bool  Function HasBeenSaid() native`

Returns if the topic info has been said to the player

([TOC](#table-of-contents))

#### Script: VisualEffect
`Scriptname VisualEffect extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: Play (Native)
`Function Play(ObjectReference akObject, float afTime = -1.0, ObjectReference akFacingObject = None) native`

Plays this visual effect on the specified object, for a certain length of time (negative for infinite) and possibly facing another object

([TOC](#table-of-contents))

##### Function: Stop (Native)
`Function Stop(ObjectReference akObject) native`

Stops this visual effect from playing in the specified object

([TOC](#table-of-contents))

#### Script: VoiceType
`Scriptname VoiceType extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: GetSex (Native)
`int Function GetSex() native`

returns the gender of the voice type. -1 = None, 0 = Male, 1 = Female

([TOC](#table-of-contents))

#### Script: Weapon
`Scriptname Weapon extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: Fire (Native)
`Function Fire(ObjectReference akSource, Ammo akAmmo = None) native`

Fire this weapon base object from the specified source

([TOC](#table-of-contents))

##### Function: GetAmmo (Native)
`Ammo Function GetAmmo() native`

Get the ammo for this weapon base object

([TOC](#table-of-contents))

#### Script: Weather
`Scriptname Weather extends Form Native Hidden`

([TOC](#table-of-contents))

##### Function: EnableAmbientParticles (Native) (Global)
`function EnableAmbientParticles( bool abEnable = true ) native global`

Turns on/off ambient particles in the sky

([TOC](#table-of-contents))

##### Function: FindWeather (Native) (Global)
`Weather function FindWeather( Keyword aKeyword ) native global`

Finds a weather from the current region/climate whose classification matches the given one.

([TOC](#table-of-contents))

##### Function: ForceActive (Native)
`function ForceActive( bool abOverride=false ) native`

Forces the active weather on the sky to be this weather.

([TOC](#table-of-contents))

##### Function: GetClassification (Native)
`Keyword[] function GetClassification() native`

Gets this weather's classification keywords

([TOC](#table-of-contents))

##### Function: GetCurrentWeather (Native) (Global)
`Weather function GetCurrentWeather() native global`

Gets the sky's current weather

([TOC](#table-of-contents))

##### Function: GetCurrentWeatherTransition (Native) (Global)
`float function GetCurrentWeatherTransition() native global`

Gets the transition percentage of the current weather

([TOC](#table-of-contents))

##### Function: GetOutgoingWeather (Native) (Global)
`Weather function GetOutgoingWeather() native global`

Gets the sky's outgoing weather

([TOC](#table-of-contents))

##### Function: GetSkyMode (Native) (Global)
`int function GetSkyMode() native global`

Gets the sky's current mode

0 - No sky (SM_NONE)

1 - Interior (SM_INTERIOR)

2 - Skydome only (SM_SKYDOME_ONLY)

3 - Full sky (SM_FULL)

([TOC](#table-of-contents))

##### Function: ReleaseOverride (Native) (Global)
`function ReleaseOverride() native global`

Tells the sky to release its overriding weather.

([TOC](#table-of-contents))

##### Function: SetActive (Native)
`function SetActive( bool abOverride=false, bool abAccelerate=false ) native`

Sets the active weather on the sky to be this weather.

([TOC](#table-of-contents))

#### Script: WordOfPower
`Scriptname WordOfPower Extends Form Native Hidden`

([TOC](#table-of-contents))

#### Script: WorldSpace
`Scriptname WorldSpace extends Form Native Hidden`

([TOC](#table-of-contents))

#### Script: WwiseEvent
`Scriptname WwiseEvent extends Form Native Hidden`

([TOC](#table-of-contents))

##### Struct WwiseSwitchParam
`struct WwiseSwitchParam`

A single Wwise Switch parameter

Members:

`string GroupName`: Name of the Switch Group that contains the given State
`string StateName`: Name of the Switch State that should be activated

([TOC](#table-of-contents))

##### Struct: WwiseRTPCParam
`struct WwiseRTPCParam`

A single Wwise RTPC parameter

Members:

`string Name`: Name of the Wwise Game Parameter to set
`float Value`: Value the Game Parameter should be set to

([TOC](#table-of-contents))

##### Function: MakeNewWwiseSwitchParam (Global)
`WwiseSwitchParam Function MakeNewWwiseSwitchParam(string aGroupName, string aStateName) global`

Helper function to construct a WwiseSwitchParam

([TOC](#table-of-contents))

##### Function: MakeNewWwiseRTPCParam (Global)
`WwiseRTPCParam Function MakeNewWwiseRTPCParam(string aName, float aValue) global`

Helper function to construct a WwiseRTPCParam

([TOC](#table-of-contents))

##### Function: Play
`int Function Play(ObjectReference akSource, WwiseSwitchParam[] aSwitchParams = none, WwiseRTPCParam[] aRTPCParams = none)`

Play this sound base object from the specified source

([TOC](#table-of-contents))

##### Function: PlayUI
`int Function PlayUI(WwiseSwitchParam[] aSwitchParams = none, WwiseRTPCParam[] aRTPCParams = none)`

Play this sound base object as a UI sound

([TOC](#table-of-contents))

##### Function: PlayAndWait
`bool Function PlayAndWait(ObjectReference akSource, WwiseSwitchParam[] aSwitchParams = none, WwiseRTPCParam[] aRTPCParams = none)`

Play this sound base object from the specified source, and wait for it to finish

([TOC](#table-of-contents))

##### Function: PlayUIAndWait
`bool Function PlayUIAndWait(WwiseSwitchParam[] aSwitchParams = none, WwiseRTPCParam[] aRTPCParams = none)`

Play this sound base object as a UI sound, and wait for it to finish

([TOC](#table-of-contents))

##### Function: PlayWithRTPC (Native)
`int Function PlayWithRTPC(ObjectReference akSource, string asRTPCName, float afRTPCValue) native`

Play this sound base object from the specified source and set an RTPC on the instance before playing

([TOC](#table-of-contents))

##### Function: PlayUIWithRTPC (Native)
`int Function PlayUIWithRTPC(string asRTPCName, float afRTPCValue) native`

Play this sound base object as UI and set an RTPC on the instance before playing

([TOC](#table-of-contents))

##### Function: StopInstance (Native) (Global)
`Function StopInstance(int aiPlaybackInstance) native global`

Stops a given playback instance of a sound

([TOC](#table-of-contents))

##### Function: UpdateInstanceRTPC (Native) (Global)
`Function UpdateInstanceRTPC(int aiPlaybackInstance, string asRTPCName, float afRTPCValue) native global`

Update a single RTPC value on a given playback instance of a sound

([TOC](#table-of-contents))

##### Function: UpdateInstanceRTPCs (Global)
`Function UpdateInstanceRTPCs(int aiPlaybackInstance, WwiseRTPCParam[] aRTPCParams) global`

Update a set of RTPC values on a given playback instance of a sound

([TOC](#table-of-contents))

##### Function: SetGlobalRTPC (Native) (Global)
`Function SetGlobalRTPC(string asRTPCName, float afRTPCValue) native global`

Sets the global value of a Wwise real-time parameter control

([TOC](#table-of-contents))

##### Function: SetGlobalState (Native) (Global)
`Function SetGlobalState(string asStateGroup, string asStateName) native global`

Sets a global Wwise State Group to the given named state

([TOC](#table-of-contents))

##### Function: PlayMenuSound (Native) (Global)
`Function PlayMenuSound(string asSoundID) native global`

Called by the VM to play a UI sound by the ID of sound

([TOC](#table-of-contents))

##### Function: ExtractSwitchGroups (Global)
`string[] Function ExtractSwitchGroups(WwiseSwitchParam[] aSwitchParams) global private`

For internal use only. Extracts an array of Switch Group names from an array of WwiseSwitchParam.

([TOC](#table-of-contents))

##### Function: ExtractSwitchStates (Global)
`string[] Function ExtractSwitchStates(WwiseSwitchParam[] aSwitchParams) global private`

For internal use only. Extracts an array of Switch State names from an array of WwiseSwitchParam.

([TOC](#table-of-contents))

##### Function: ExtractRTPCNames (Global)
`string[] Function ExtractRTPCNames(WwiseRTPCParam[] aRTPCParams) global private`

For internal use only. Extracts an array of RTPC names from an array of WwiseRTPCParam.

([TOC](#table-of-contents))

##### Function: ExtractRTPCValues (Global)
`float[] Function ExtractRTPCValues(WwiseRTPCParam[] aRTPCParams) global private`

For internal use only. Extracts an array of RTPC values from an array of WwiseRTPCParam.

([TOC](#table-of-contents))

##### Function: PlayImpl (Native)
`int Function PlayImpl(ObjectReference akSource, string[] aSwitchGroups, string[] aSwitchStates, string[] aRTPCNames, float[] aRTPCValues) native private`

For internal use only. Users should call the Play function defined above. Play this Wwise Event from the given ObjectReference with an optional set of control parameters.

([TOC](#table-of-contents))

##### Function: PlayUIImpl (Native)
`int Function PlayUIImpl(string[] aSwitchGroups, string[] aSwitchStates, string[] aRTPCNames, float[] aRTPCValues) native private`

For internal use only. Users should call the PlayUI function defined above. Plays this Wwise Event as a UI sound with an optional set of control parameters.

([TOC](#table-of-contents))

##### Function: PlayAndWaitImpl (Native)
`bool Function PlayAndWaitImpl(ObjectReference akSource, string[] aSwitchGroups, string[] aSwitchStates, string[] aRTPCNames, float[] aRTPCValues) native private`

For internal use only. Users should call the PlayAndWait function defined above. Play this Wwise Event from the given ObjectReference with an optional set of control parameters, and wait for it to finish before resuming execution.

([TOC](#table-of-contents))

##### Function: PlayUIAndWaitImpl (Native)
`bool Function PlayUIAndWaitImpl(string[] aSwitchGroups, string[] aSwitchStates, string[] aRTPCNames, float[] aRTPCValues) native private`

For internal use only. Users should call the PlayUIAndWait function defined above. Plays this Wwise Event as a UI sound with an optional set of control parameters, and wait for it to finish before resuming execution.

([TOC](#table-of-contents))

##### Function: UpdateInstanceRTPCsImpl (Native) (Global)
`Function UpdateInstanceRTPCsImpl(int aiPlaybackInstance, string[] aRTPCNames, float[] aRTPCValues) native global private`

For internal use only. Users should call the UpdateInstanceRTPCs function defined above. Updates a set of RTPC values on a given playback instance.

([TOC](#table-of-contents))

### Script: InputEnableLayer
`Scriptname InputEnableLayer extends ScriptObject Native Hidden`

This is a single layer of input enable/disable. The end result of all layers in the game determine the actual state of the player's controls.

([TOC](#table-of-contents))

#### Function: Create (Native) (Global)
`InputEnableLayer Function Create() Native Global`

Creates a new input enable layer and returns it. These are limited, so make sure to dispose of it when you're done (by setting variables to None)

([TOC](#table-of-contents))

#### Function: Delete (Native)
`Function Delete() Native`

Force-deletes this input layer. Any variable pointing at this layer will become invalid and it should also clear any disables this layer had (unless code, for some reason, is keeping it alive).

([TOC](#table-of-contents))

#### Function: DisablePlayerControls (Native)
`Function DisablePlayerControls(bool abMovement = true, bool abFighting = true, bool abCamSwitch = false, bool abLooking = false, bool abSneaking = false, bool abMenu = true, bool abActivate = true, bool abJournalTabs = false, bool abVATS = true, bool abFavorites = true, bool abRunning = false) Native`

Disables the user's controls

([TOC](#table-of-contents))

#### Function: EnableActivate (Native)
`Function EnableActivate(bool abEnable = true) Native`

Enables/disables the player's ability to activate objects

([TOC](#table-of-contents))

#### Function: EnableVATS (Native)
`Function EnableVATS(bool abEnable = true) Native`

Enables/disables the player's VATS

([TOC](#table-of-contents))

#### Function: EnableCamSwitch (Native)
`Function EnableCamSwitch(bool abEnable = true) Native`

Enables/disables the player's ability to switch the camera between 1st and 3rd person

([TOC](#table-of-contents))

#### Function: EnableFarTravel (Native)
`Function EnableFarTravel(bool abEnable = true) Native`

Enables/disables the player's ability to far travel in a spaceship

([TOC](#table-of-contents))

#### Function: EnableFastTravel (Native)
`Function EnableFastTravel(bool abEnable = true) Native`

Enables/disables the player's ability to fast travel

([TOC](#table-of-contents))

#### Function: EnableFavorites (Native)
`Function EnableFavorites(bool abEnable = true) Native`

Enables/disables the player's ability to open the Favorites menu

([TOC](#table-of-contents))

#### Function: EnableGravJump (Native)
`Function EnableGravJump(bool abEnable = true) Native`

Enables/disables the player's ability to grav jump in a spaceship

([TOC](#table-of-contents))

#### Function: EnableTakeoff (Native)
`Function EnableTakeoff(bool abEnable = true) Native`

Enables/disables the player's ability to take off in a spaceship

([TOC](#table-of-contents))

#### Function: EnableFighting (Native)
`Function EnableFighting(bool abEnable = true) Native`

Enables/disables the player's ability to fight

([TOC](#table-of-contents))

#### Function: EnableJournal (Native)
`Function EnableJournal(bool abEnable = true) Native`

Enables/disables the player's ability to use the journal menu

([TOC](#table-of-contents))

#### Function: EnableJumping (Native)
`Function EnableJumping(bool abEnable = true) Native`

Enables/disables the player's ability to jump (Note: Movement disable/enable also touches this)

([TOC](#table-of-contents))

#### Function: EnableLocationDiscovery (Native)
`Function EnableLocationDiscovery(bool abEnable = true) Native`

Enables/disables the player's ability to discover new locations

([TOC](#table-of-contents))

#### Function: EnableLooking (Native)
`Function EnableLooking(bool abEnable = true) Native`

Enables/disables the player's ability to look around

([TOC](#table-of-contents))

#### Function: EnableMenu (Native)
`Function EnableMenu(bool abEnable = true) Native`

Enables/disables the player's ability to use the main menu

([TOC](#table-of-contents))

#### Function: EnableMovement (Native)
`Function EnableMovement(bool abEnable = true) Native`

Enables/disables the player's ability to move

([TOC](#table-of-contents))

#### Function: EnableRunning (Native)
`Function EnableRunning(bool abEnable = true) Native`

Enables/disables the player's ability to run
  
#### Function: EnableSprinting (Native)
`Function EnableSprinting(bool abEnable = true) Native`

Enables/disables the player's ability to sprint

([TOC](#table-of-contents))

#### Function: EnableZKey (Native)
`Function EnableZKey(bool abEnable = true) Native`

Enables/disables the player's ability to z-key

([TOC](#table-of-contents))

#### Function: EnableHandscanner (Native)
`Function EnableHandscanner(bool abEnable = true) Native`

Enables/disables the player's ability to use the handscanner

([TOC](#table-of-contents))

#### Function: EnablePlayerControls (Native)
`Function EnablePlayerControls(bool abMovement = true, bool abFighting = true, bool abCamSwitch = true, bool abLooking = true, bool abSneaking = true, bool abMenu = true, bool abActivate = true, bool abJournalTabs = true, bool abVATS = true, bool abFavorites = true, bool abRunning = true) Native`

Enables the user's controls

([TOC](#table-of-contents))

#### Function: EnableInventoryMenuAccess (Native)
`Function EnableInventoryMenuAccess(bool aEnable = true) Native`

Enable/Disable access to the inventory menu from the data menu

([TOC](#table-of-contents))

#### Function: EnableSneaking (Native)
`Function EnableSneaking(bool abEnable = true) Native`

Enables/disables the player's ability to sneak

([TOC](#table-of-contents))

#### Function: IsActivateEnabled (Native)
`bool Function IsActivateEnabled() Native`

Returns whether activation is enabled on this layer

([TOC](#table-of-contents))

#### Function: IsVATSEnabled (Native)
`bool Function IsVATSEnabled() Native`

Returns whether VATS is enabled on this layer

([TOC](#table-of-contents))

#### Function: IsCamSwitchEnabled (Native)
`bool Function IsCamSwitchEnabled() Native`

Returns whether camera switch is enabled on this layer

([TOC](#table-of-contents))

#### Function: IsFarTravelEnabled (Native)
`bool Function IsFarTravelEnabled() Native`

Returns whether far travel is enabled on this layer

([TOC](#table-of-contents))

#### Function: IsFastTravelEnabled (Native)
`bool Function IsFastTravelEnabled() Native`

Returns whether fast travel is enabled on this layer

([TOC](#table-of-contents))

#### Function: IsFavoritesEnabled (Native)
`bool Function IsFavoritesEnabled() Native`

Returns whether the Favorites menu is enabled on this layer

([TOC](#table-of-contents))

#### Function: IsGravJumpEnabled (Native)
`bool Function IsGravJumpEnabled() Native`

Returns whether grav jump is enabled on this layer

([TOC](#table-of-contents))

#### Function: IsTakeoffEnabled (Native)
`bool Function IsTakeoffEnabled() Native`

Returns whether ship takeoff is enabled on this layer

([TOC](#table-of-contents))

#### Function: IsFightingEnabled (Native)
`bool Function IsFightingEnabled() Native`

Returns whether fighting is enabled on this layer

([TOC](#table-of-contents))

#### Function: IsJournalEnabled (Native)
`bool Function IsJournalEnabled() Native`

Returns whether the journal menu is enabled on this layer

([TOC](#table-of-contents))

#### Function: IsJumpingEnabled (Native)
`bool Function IsJumpingEnabled() Native`

Returns whether jumping is enabled on this layer (Note: Movement also controls this)

([TOC](#table-of-contents))

#### Function: IsLocationDiscoveryEnabled (Native)
`bool Function IsLocationDiscoveryEnabled() native`

Returns whether location discovery is enabled on this layer

([TOC](#table-of-contents))

#### Function: IsLookingEnabled (Native)
`bool Function IsLookingEnabled() Native`

Returns whether looking is enabled on this layer

([TOC](#table-of-contents))

#### Function: IsMenuEnabled (Native)
`bool Function IsMenuEnabled() Native`

Returns whether the menu is enabled on this layer

([TOC](#table-of-contents))

#### Function: IsMovementEnabled (Native)
`bool Function IsMovementEnabled() Native`

Returns whether movement is enabled on this layer

([TOC](#table-of-contents))

#### Function: IsRunningEnabled (Native)
`bool Function IsRunningEnabled() Native`

Returns whether running is enabled on this layer

([TOC](#table-of-contents))

#### Function: IsSprintingEnabled (Native)
`bool Function IsSprintingEnabled() Native`

Returns whether sprinting is enabled on this layer

([TOC](#table-of-contents))

#### Function: IsZKeyEnabled (Native)
`bool Function IsZKeyEnabled() Native`

Returns whether z-key is enabled on this layer

([TOC](#table-of-contents))

#### Function: IsHandscannerEnabled (Native)
`bool Function IsHandscannerEnabled() Native`

Returns whether the handscanner is enabled on this layer

([TOC](#table-of-contents))

#### Function: IsSneakingEnabled (Native)
`bool Function IsSneakingEnabled() Native`

Returns whether sneaking is enabled on this layer

([TOC](#table-of-contents))

#### Function: IsInventoryMenuAccessEnabled (Native)
`bool Function IsInventoryMenuAccessEnabled() Native`

Returns whether access to the inventory menu is enabled on this layer

([TOC](#table-of-contents))

#### Function: Reset (Native)
`Function Reset() Native`

Re-enables all controls currently disabled on this layer

## Script: Utility
`Scriptname Utility Native Hidden`

([TOC](#table-of-contents))

### Function: CallGlobalFunction (Native) (Global)
`Var Function CallGlobalFunction(string asScriptName, string asFuncName, Var[] aParams) native global`

Calls a global function specified by name. Note that the compiler cannot check that the function exists, nor that the parameters are the right type. It will also not be able to auto-cast, so you must pre-cast the parameters to the right type (derived or parent types won't work). Will error if the function or script type are not valid or don't exist

([TOC](#table-of-contents))

### Function: CallGlobalFunctionNoWait (Native) (Global)
`Function CallGlobalFunctionNoWait(string asScriptName, string asFuncName, Var[] aParams) native global`

Calls a global function specified by name without waiting for it to return. Note that the compiler cannot check that the function exists, nor that the parameters are the right type. It will also not be able to auto-cast, so you must pre-cast the parameters to the right type (derived or parent types won't work). Will error if the function or script type are not valid or don't exist

([TOC](#table-of-contents))

### Function: GameTimeToString (Native) (Global)
`string Function GameTimeToString(float afGameTime) native global`

Converts a float game time (in terms of game days passed) to a string detailing the date and time it represents in "MM/DD/YYYY HH:MM" format. A 24-hour clock is used, and the function is latent (due to issues in the current architecture with returning strings from code)

([TOC](#table-of-contents))

### Function: GetCurrentGameTime (Native) (Global)
`float Function GetCurrentGameTime() native global`

Obtains the current game time in terms of game days passed (same as the global variable)

([TOC](#table-of-contents))

### Function: GetCurrentRealTime (Native) (Global)
`float Function GetCurrentRealTime() native global`

Obtains the number of seconds since the application started (the same timer that WaitMenuPause uses)

Does not take into account menu-paused, or VM frozen time

Most useful for determining how long something took to run

([TOC](#table-of-contents))

### Function: GetCurrentStackID (Native) (Global)
`int Function GetCurrentStackID() native global debugOnly`

Obtains the ID number of the current running stack

([TOC](#table-of-contents))

### Function: IntToHex (Native) (Global)
`String Function IntToHex(int IntID) global native`

Int to Hex converter. General use, but mainly for converting GetFormID which returns an Int to get the Hex ID

([TOC](#table-of-contents))

### Function: IsGameMenuPaused (Native) (Global)
`bool Function IsGameMenuPaused() native global`

Returns whether the game is currently in menu-paused or not

([TOC](#table-of-contents))

### Function: RandomFloat (Native) (Global)
`float Function RandomFloat(float afMin = 0.0, float afMax = 1.0) native global`

Generates a random floating point number between afMin and afMax (inclusive)

([TOC](#table-of-contents))

### Function: RandomFloatsFromSeed (Native) (Global)
`float[] Function RandomFloatsFromSeed(int aiSeed, int aiCount, float afMin = 0.0, float afMax = 1.0) native global`

Generates an array of pseudorandom floating point numbers from a specific seed between afMin and afMax (inclusive)

([TOC](#table-of-contents))

### Function: RandomInt (Native) (Global)
`int Function RandomInt(int aiMin = 0, int aiMax = 100) native global`

Generates a random integer between aiMin and aiMax (inclusive)

([TOC](#table-of-contents))

### Function: RandomIntsFromSeed (Native) (Global)
`int[] Function RandomIntsFromSeed(int aiSeed, int aiCount, int aiMin = 0, int aiMax = 100) native global`

Generates an array of pseudorandom integer numbers from a specific seed between aiMin and aiMax (inclusive)

([TOC](#table-of-contents))

### Function: SetINIFloat (Native) (Global)
`function SetINIFloat(string ini, float value) native global debugOnly`

Set the given INI by type

([TOC](#table-of-contents))

### Function: SetINIInt (Native) (Global)
`function SetINIInt(string ini, int value) native global debugOnly`

Set the given INI by type

([TOC](#table-of-contents))

### Function: SetINIBool (Native) (Global)
`function SetINIBool(string ini, bool value) native global debugOnly`

Set the given INI by type

([TOC](#table-of-contents))

### Function: SetINIString (Native) (Global)
`function SetINIString(string ini, string value) native global debugOnly`

Set the given INI by type

([TOC](#table-of-contents))

### Function: SplitStringChars (Native) (Global)
`int[] Function SplitStringChars(string aString) native global`

String parsing functions

([TOC](#table-of-contents))

### Function: Wait (Native) (Global)
`Function Wait(float afSeconds) native global`

Waits for the specified amount of time (latent). Timer will not run during menu mode

([TOC](#table-of-contents))

### Function: WaitGameTime (Native) (Global)
`Function WaitGameTime(float afHours) native global`

Waits for the specified amount of game time (latent)

([TOC](#table-of-contents))

### Function: WaitMenuPause (Native) (Global)
`Function WaitMenuPause(float afSeconds) native global`

Waits for the specified amount of time (latent) - Timer WILL run during menu mode

`Frame rate capture function - only available in beta version`

([TOC](#table-of-contents))

### Function: CaptureFrameRate (Native) (Global)
`string Function CaptureFrameRate(int numFrames) native global debugOnly`

Frame rate capture function - only available in beta version

Gets you a string describing the frame rate for a certain number of frames

(String will be no longer than 1K characters long, separated by commas)

([TOC](#table-of-contents))

### Function: EnterTestData (Native) (Global)
`Function EnterTestData(string asTestType, string asTestMatter, string asTestDetails, string asTestResultContext, string asTestResult) native global debugOnly`

Frame rate capture function - only available in beta version

Sends the passed in test data to the tests website.

([TOC](#table-of-contents))

### Function: PostStartUpTimes (Native) (Global)
`Function PostStartUpTimes() native global debugOnly`

Sends the start up times to the tests website.

Frame rate capture function - only available in beta version

([TOC](#table-of-contents))

### Function: StartFrameRateCapture (Native) (Global)
`Function StartFrameRateCapture() native global debugOnly`

Starts or ends a frame rate capture -- then you can get the min or max since frame capture started at any time

Frame rate capture function - only available in beta version

([TOC](#table-of-contents))

### Function: EndFrameRateCapture (Native) (Global)
`Function EndFrameRateCapture() native global debugOnly`

Starts or ends a frame rate capture -- then you can get the min or max since frame capture started at any time

Frame rate capture function - only available in beta version

([TOC](#table-of-contents))

### Function: GetAverageFrameRate (Native) (Global)
`float Function GetAverageFrameRate() native global debugOnly`

Frame rate capture function - only available in beta version

([TOC](#table-of-contents))

### Function: GetMinFrameRate (Native) (Global)
`float Function GetMinFrameRate() native global debugOnly`

Frame rate capture function - only available in beta version

([TOC](#table-of-contents))

### Function: GetMaxFrameRate (Native) (Global)
`float Function GetMaxFrameRate() native global debugOnly`

Frame rate capture function - only available in beta version

([TOC](#table-of-contents))

### Function: GetCurrentMemory (Native) (Global)
`string Function GetCurrentMemory() native global debugOnly`

Must be called first, it sets up the memory stats used by the other functions

Memory tracking function - only available if memory tracking is turned on

([TOC](#table-of-contents))

### Function: GetBudgetCount (Native) (Global)
`int Function GetBudgetCount() native global debugOnly`

Memory tracking function - only available if memory tracking is turned on

([TOC](#table-of-contents))

### Function: GetCurrentBudget (Native) (Global)
`string Function GetCurrentBudget(int aiBudgetNumber) native global debugOnly`

Memory tracking function - only available if memory tracking is turned on

([TOC](#table-of-contents))

### Function: GetBudgetLimit (Native) (Global)
`string Function GetBudgetLimit(int aiBudgetNumber) native global debugOnly`

Memory tracking function - only available if memory tracking is turned on

([TOC](#table-of-contents))

### Function: OverBudget (Native) (Global)
`bool Function OverBudget(int aiBudgetNumber) native global debugOnly`

Memory tracking function - only available if memory tracking is turned on

([TOC](#table-of-contents))

### Function: GetBudgetName (Native) (Global)
`string Function GetBudgetName(int aiBudgetNumber) native global debugOnly`

Memory tracking function - only available if memory tracking is turned on

([TOC](#table-of-contents))

### Function: ExpiryDay (Global)
`float Function ExpiryDay(float DaysFromNow, Planet LocalPlanet = none, float MaxUniversalDays = -1.0, float FutureStartDay = -1.0) global`

returns a float representing days in the future from now (in terms of `GameDaysPassed` - where 1 = 24 hours)

`DaysFromNow`: how many days in the future should the expiration date be?

`LocalPlanet`: (optional, ignored if none) will scale DaysFromNow so that it will reflect local day length on planet is if different than universal 24 standard

`MaxUniversalDays`: (optional, ignored if <= 0) - no matter the local day length scale, this is the max (24 hour) days you want to add - useful for tidally locked planets, or planets with exceptionally long days

`FutureStartDay`: (optional, ignored if < GameDaysPassed) - the start day to add DaysFromNow to.

([TOC](#table-of-contents))

### Function: HasExpiryDayPassed (Global)
`bool Function HasExpiryDayPassed(float afExpiryDay) global`

checks to see if the passed in value is less than the current day

([TOC](#table-of-contents))

### Function: GetHoursUntilLocalHour (Global)
`float Function GetHoursUntilLocalHour(float afTargetHourLocal) global`

returns hours until specified LOCAL target hour (local equivalent of 24-hour time, 0.0-24.0)

([TOC](#table-of-contents))

### Function: GetFirstPlayer (Global)
`ObjectReference Function GetFirstPlayer(ObjectReference refToCheck01, ObjectReference refToCheck02, ObjectReference refToCheck03 = NONE, ObjectReference refToCheck04 = NONE) global`

returns first player in list of refs passed in (mainly for use in distance check events)

([TOC](#table-of-contents))

### Function: GetFirstNonPlayer (Global)
`ObjectReference Function GetFirstNonPlayer(ObjectReference refToCheck01, ObjectReference refToCheck02, ObjectReference refToCheck03 = NONE, ObjectReference refToCheck04 = NONE) global`

returns first non-player in list of refs passed in (mainly for use in distance check events)

([TOC](#table-of-contents))
