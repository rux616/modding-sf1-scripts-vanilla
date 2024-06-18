Scriptname MQ305Script extends Quest Conditional

InputEnableLayer Property MQ305EnableLayer Auto Hidden

ActorValue Property PlayerUnityTimesEntered Auto Const Mandatory
ActorValue Property COM_IsRomantic Mandatory Const Auto

ReferenceAlias Property Andreja Mandatory Const Auto
ReferenceAlias Property Barrett Mandatory Const Auto
ReferenceAlias Property SamCoe Mandatory Const Auto
ReferenceAlias Property SarahMorgan Mandatory Const Auto
ReferenceAlias Property CoraCoe Mandatory Const Auto
ReferenceAlias Property Vasco Mandatory Const Auto

Int Property MQ305_MultiRomance_var Auto Conditional
Int Property MQ305_FriendTalkCount_var=9 Auto Conditional
Int Property MQ305_AllFriendsTalkedStage=50 Auto Const

Int Property AllArtifactsObtainedStage=20 Auto Const
Int Property ArmillaryPlacedStage=30 Auto Const
Int Property ArmillaryCompleteStage=40 Auto Const
Int Property WentToUnityOnceStage=100 Auto Const
Int Property PlaceArmillaryObj=30 Auto Const
Int Property PowerUpGravObj=60 Auto Const
Int Property RemoveArmillaryObj=70 Auto Const

ObjectReference Property UnityMovetoMarker Mandatory Const Auto

ActorValue Property MQ305JumpedToUnity Mandatory Const Auto
LocationAlias Property PlayerShipInteriorLocation Mandatory Const Auto

Faction Property AvailableCompanionFaction Mandatory Const Auto

Struct PlayerKnowledgeStruct
    GlobalVariable PlayerKnowledgeGlobal
    ActorValue PlayerKnowledgeAV
EndStruct

PlayerKnowledgeStruct[] Property PlayerKnowledgeArray Const Auto

ObjectReference Property MQ305EndingMarkerAndreja Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerBarrett Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerSamCoe Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerSarahMorgan Mandatory Const Auto

Quest Property SQ_ENV Mandatory Const Auto

GlobalVariable Property MQ302_SidedWithChoice Mandatory Const Auto
GlobalVariable Property MQ305_CF_SysDefEnding Mandatory Const Auto
GlobalVariable Property MQ305_CF_PirateEnding Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerEmissary Mandatory Const Auto
ObjectReference Property Mq305EndingMarkerHunter Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerNeither Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerCF_SysDef Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerCF_Delgado Mandatory Const Auto
GlobalVariable Property MQ305_FSC_RonHopeKilled Mandatory Const Auto
GlobalVariable Property MQ305_FSC_RonHopeBribeAccepted Mandatory Const Auto
GlobalVariable Property MQ305_FSC_RonHopeJailed Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerFSC_HopeDead Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerFSC_HopeNotDead Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerFSC_HopeLetGo Mandatory Const Auto
GlobalVariable Property MQ305_RI_NeuroampPromoted Mandatory Const Auto
GlobalVariable Property RI08_MasakoRemainedCEO Mandatory Const Auto
GlobalVariable Property MQ305_RI_NeuroampNotPromoted Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerRI_NeuroAmp Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerRI_NeuroAmp_Masako Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerRI_NeuroAmp_Ularu Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerRI_NoNeuroAmp Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerRI_NoNeuroAmp_Masako Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerRI_NoNeuroAmp_Ularu Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerConstellation Mandatory Const Auto
GlobalVariable Property MQ305_UC_PlagueEnding Mandatory Const Auto
GlobalVariable Property MQ305_UC_AcelesEnding Mandatory Const Auto
GlobalVariable Property MQ305_UC_SterilizationEnding Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerUC_Terrormorph Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerUC_Aceles Mandatory Const Auto
WwiseEvent Property WwiseEvent_QST_PlayerEntersUnityA Mandatory Const Auto
Idle Property IdleArtifactTouch Mandatory Const Auto
ObjectReference Property MQ305EndingMarkerCompanionAny Mandatory Const Auto
Spell Property CureAddictions Mandatory Const Auto
Scene Property MQ305_002_Unity_05 Mandatory Const Auto
VisualEffect Property UnityActorEffect Mandatory Const Auto
VisualEffect Property UnityCameraFadeIn_AO Mandatory Const Auto

Function EnableUnityEndScenes()
	Int HunterEmissaryChoice = MQ302_SidedWithChoice.GetValueInt()

	If HunterEmissaryChoice == 0
		MQ305EndingMarkerEmissary.EnableNoWait()
	ElseIf HunterEmissaryChoice == 1
		Mq305EndingMarkerHunter.EnableNoWait()
	ElseIf HunterEmissaryChoice == 2
		MQ305EndingMarkerNeither.EnableNoWait()
	EndIf

	EnableRomanceCompanions()

	If MQ305_CF_SysDefEnding.GetValueInt() >= 1
		MQ305EndingMarkerCF_SysDef.EnableNoWait()
	ElseIf MQ305_CF_PirateEnding.GetValueInt() >= 1
		MQ305EndingMarkerCF_Delgado.EnableNoWait()
	EndIf

	If MQ305_FSC_RonHopeKilled.GetValueInt() >= 1
		MQ305EndingMarkerFSC_HopeDead.EnableNoWait()
	ElseIf MQ305_FSC_RonHopeBribeAccepted.GetValueInt() >= 1
		MQ305EndingMarkerFSC_HopeLetGo.EnableNoWait()
	ElseIf MQ305_FSC_RonHopeJailed.GetValueInt() >= 1
		MQ305EndingMarkerFSC_HopeNotDead.EnableNoWait()
	EndIf

	If MQ305_RI_NeuroampPromoted.GetValueInt() >= 1
		MQ305EndingMarkerRI_NeuroAmp.EnableNoWait()
		If RI08_MasakoRemainedCEO.GetValueInt()>=1
			MQ305EndingMarkerRI_NeuroAmp_Masako.EnableNoWait()
		Else
			MQ305EndingMarkerRI_NeuroAmp_Ularu.EnableNoWait()
		EndIf
	ElseIf MQ305_RI_NeuroampNotPromoted.GetValueInt() >= 1
		MQ305EndingMarkerRI_NoNeuroAmp.EnableNoWait()
		If RI08_MasakoRemainedCEO.GetValueInt()>=1
			MQ305EndingMarkerRI_NoNeuroAmp_Masako.EnableNoWait()
		Else
			MQ305EndingMarkerRI_NoNeuroAmp_Ularu.EnableNoWait()
		EndIf
	EndIf

	If MQ305_UC_PlagueEnding.GetValueInt() >= 1
		MQ305EndingMarkerUC_Terrormorph.EnableNoWait()
	ElseIf MQ305_UC_AcelesEnding.GetValueInt() >= 1
		MQ305EndingMarkerUC_Aceles.EnableNoWait()
	ElseIf MQ305_UC_SterilizationEnding.GetValueInt() >= 1
		MQ305EndingMarkerUC_Terrormorph.EnableNoWait()
	EndIf

	MQ305EndingMarkerConstellation.EnableNoWait()
EndFunction

Function SavePlayerKnowledge()
;check all the relevent player knowledge globals and set the equivalent actor value for starborn save
	Actor PlayerREF = Game.GetPlayer()

    int currentElement = 0
    while (currentElement < PlayerKnowledgeArray.Length)
		Float CurrentPlayerKnowledgeGlobalValue = PlayerKnowledgeArray[currentElement].PlayerKnowledgeGlobal.GetValue()
    	ActorValue CurrentPlayerKnowledgeAV = PlayerKnowledgeArray[currentElement].PlayerKnowledgeAV

		PlayerREF.SetValue(CurrentPlayerKnowledgeAV, CurrentPlayerKnowledgeGlobalValue)

        currentElement += 1
    endWhile
EndFunction

;handle everything that happens when we step into the Unity
Function EnterUnity()
	Actor PlayerREF = Game.GetPlayer()

	Game.FadeOutGame(true, false, 0.0, 1.0, true)
	Utility.Wait(1.0) ; give the fade a second to process
	
	;Wait until this scene completes before moving on
	While MQ305_002_Unity_05.IsPlaying()
		Utility.Wait(0.50)
	EndWhile

	Int myUnityTimesEntered = PlayerREF.GetValueInt(PlayerUnityTimesEntered) + 1
	PlayerREF.SetValue(PlayerUnityTimesEntered, myUnityTimesEntered)
	SavePlayerKnowledge()

	;Play the Unity movie.
	WwiseEvent_QST_PlayerEntersUnityA.Play(PlayerREF) ;play audio
	Game.PlayBinkNoWait("EndingVision.bk2", abMuteAudio=False, abMuteMusic=False, aPlayDuringLoadingScreen=True)

	Utility.Wait(0.1)
	
	;Trigger the reset and restart of the game
	Game.CreateStarbornGame()

EndFunction

;check if the player is in more than one romance
Function CheckMultipleRomance()
	Actor AndrejaREF = Andreja.GetActorRef()
	Actor BarrettREF = Barrett.GetActorRef()
	Actor SamREF = SamCoe.GetActorRef()
	Actor SarahREF = SarahMorgan.GetActorRef()

	MQ305_MultiRomance_var=0 ;clear the var at the start of this function before we calc the value
	If (AndrejaREF.IsDead() == False) && (AndrejaREF.GetValue(Com_IsRomantic)==1)
		MQ305_MultiRomance_var += 1
	EndIf

	If (BarrettREF.IsDead() == False) && (BarrettREF.GetValue(Com_IsRomantic)==1)
		MQ305_MultiRomance_var += 1
	EndIf

	If (SamREF.IsDead() == False) && (SamREF.GetValue(Com_IsRomantic)==1)
		MQ305_MultiRomance_var += 1
	EndIf

	If (SarahREF.IsDead() == False) && (SarahREF.GetValue(Com_IsRomantic)==1)
		MQ305_MultiRomance_var += 1
	EndIf
EndFunction

Function EnableRomanceCompanions()
	Actor AndrejaREF = Andreja.GetActorRef()
	Actor BarrettREF = Barrett.GetActorRef()
	Actor SamREF = SamCoe.GetActorRef()
	Actor SarahREF = SarahMorgan.GetActorRef()
	Bool bAnyCompanionEnabled=False

	If (AndrejaREF.IsDead() == False) && (AndrejaREF.GetValue(Com_IsRomantic)==1)
		MQ305EndingMarkerAndreja.EnableNoWait()
		bAnyCompanionEnabled=True
	EndIf

	If (BarrettREF.IsDead() == False) && (BarrettREF.GetValue(Com_IsRomantic)==1)
		MQ305EndingMarkerBarrett.EnableNoWait()
		bAnyCompanionEnabled=True
	EndIf

	If (SamREF.IsDead() == False) && (SamREF.GetValue(Com_IsRomantic)==1)
		MQ305EndingMarkerSamCoe.EnableNoWait()
		bAnyCompanionEnabled=True
	EndIf

	If (SarahREF.IsDead() == False) && (SarahREF.GetValue(Com_IsRomantic)==1)
		MQ305EndingMarkerSarahMorgan.EnableNoWait()
		bAnyCompanionEnabled=True
	EndIf

	If bAnyCompanionEnabled
		MQ305EndingMarkerCompanionAny.EnableNoWait()
	EndIf
EndFunction

Function UpdateFriendTalkCount()
	;if Sam is dead, Cora is disabled, so the count is lower
	Actor SamREF = SamCoe.GetActorRef()
	
	If (SamREF.IsDead())
		MQ305_FriendTalkCount_var = 8
	EndIf
EndFunction

;every time you talk to someone about entering the Unity, reduce the count down
Function CheckFriendUnityTalks()
	If GetStageDone(MQ305_AllFriendsTalkedStage) == False
		MQ305_FriendTalkCount_var -= 1
		;if we've talked to everyone, advance quest
		If (MQ305_FriendTalkCount_var <= 0)
			SetStage(MQ305_AllFriendsTalkedStage)
		EndIf
	EndIf
EndFunction

Function ArmillaryPlaced(int iAllArtifactsIn)
	If iAllArtifactsIn == 0 ;Armillary is placed but doesn't have all the Artifacts yet
		SetStage(ArmillaryPlacedStage)
	Else	
		If GetStageDone(ArmillaryCompleteStage) && !GetStageDone(WentToUnityOnceStage)
			;if the player already completed the Armillary before, then complete/display objectives again
			SetObjectiveCompleted(PlaceArmillaryObj)
			SetObjectiveDisplayed(PowerUpGravObj, abForce=True)
			SetObjectiveDisplayed(RemoveArmillaryObj, abForce=True)
		Else
			SetStage(ArmillaryPlacedStage)
			SetStage(ArmillaryCompleteStage)
		EndIf
	EndIf
EndFunction

Function ArmillaryRemoved()
	;roll back objectives if the player removes the Armillary before going to the Unity
	If GetStageDone(ArmillaryCompleteStage) && !GetStageDone(WentToUnityOnceStage)
		SetObjectiveCompleted(PlaceArmillaryObj, False)
		SetObjectiveDisplayed(PowerUpGravObj, False)
		SetObjectiveDisplayed(RemoveArmillaryObj, False)
	EndIf
EndFunction

Function GravJumpToUnity()
	Actor AndrejaREF = Andreja.GetActorRef()
	Actor BarrettREF = Barrett.GetActorRef()
	Actor SamREF = SamCoe.GetActorRef()
	Actor SarahREF = SarahMorgan.GetActorRef()
	Actor CoraREF = CoraCoe.GetActorRef()
	Actor VascoREF = Vasco.GetActorRef()
	Location PlayerShipLoc = PlayerShipInteriorLocation.GetLocation()

	;play special grav-jump FX
	Game.SetCharGenHUDMode(1) ;hide HUD
	Game.FadeOutGame(true, false, 0.0, 1.0, true)
	Utility.Wait(1.0) ; give the fade a second to process

	;every companion (plus Cora/Vasco) who is currently in your ship gets tagged as having been with you for the jump
	CheckInPlayerShip(AndrejaREF, PlayerShipLoc)
	CheckInPlayerShip(BarrettREF, PlayerShipLoc)
	CheckInPlayerShip(SamREF, PlayerShipLoc)
	CheckInPlayerShip(SarahREF, PlayerShipLoc)
	CheckInPlayerShip(CoraREF, PlayerShipLoc)
	CheckInPlayerShip(VascoREF, PlayerShipLoc)

	Actor PlayerREF = Game.GetPlayer()
	PlayerREF.moveto(UnityMovetoMarker)

	;heal player and cure afflictions
	(SQ_ENV as SQ_ENV_AfflictionsScript).CureAllAfflictions()
	CureAddictions.Cast(PlayerREF, PlayerREF) ;cure addictions
	PlayerREF.ResetHealthAndLimbs()
	Game.FadeOutGame(abFadingOut=False, abBlackFade=True, afSecsBeforeFade=0.0, afFadeDuration=0.5)
EndFunction

Function CheckInPlayerShip(Actor myActor, Location myLoc)
	If MyActor.IsInLocation(myLoc)
		MyActor.SetValue(MQ305JumpedToUnity, 1)
	EndIf
EndFunction

Function LockPlayerControlsUnity()
	Actor PlayerREF = Game.GetPlayer()
	Game.ForceFirstPerson()
	Game.SetCharGenHUDMode(1) ;hide HUD
	MQ305EnableLayer = InputEnableLayer.Create()
	MQ305EnableLayer.DisablePlayerControls(abMovement=False, abFighting=True, abCamSwitch=True, abLooking=False, abSneaking=True, abMenu=True, abActivate=True, abRunning=True) ;lock player to walk speed
	MQ305EnableLayer.EnableJumping(False)
	UnityActorEffect.Play(PlayerREF)
	UnityCameraFadeIn_AO.Play(PlayerREF, 20)
	Utility.Wait(20)
	MQ305EnableLayer.EnableCamSwitch(True) ; allow third person
EndFunction

Function UnlockPlayerControlUnity()
	Game.SetCharGenHUDMode(0) ;reveal HUD
	MQ305EnableLayer = None
	UnityActorEffect.Stop(Game.GetPlayer())
EndFunction