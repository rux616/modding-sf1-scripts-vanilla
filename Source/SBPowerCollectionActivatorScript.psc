Scriptname SBPowerCollectionActivatorScript extends ObjectReference
{
This is on the spherical activator in the very center of the rings.
It gets enabled when the puzzle is solved. 
It handles the FX sequence for the player getting the appropriate power (or ranks it up if they already have the power) if they have the necessary artifact, gives xp, and a permanent health boost.
}

group effectsData
    ImageSpaceModifier Property MQ207CShiftFadeHoldImod Mandatory Const Auto
    ImageSpaceModifier Property MQ207CShiftFadeInImod Mandatory Const Auto

    Explosion Property PowerExplosion Mandatory Const Auto

    EffectShader property StarbornPuzzle_PlayerFXS auto const mandatory
EndGroup

group soundData
    WwiseEvent Property wPowerAbsorbFXEvent Mandatory Const Auto

    MusicType Property mPowerAbsorbStinger Mandatory Const Auto
EndGroup

group keywords
    Keyword Property SBExplosionMarkerKeyword Mandatory Const Auto
    Keyword Property SBRingsPuzzleKeyword Mandatory Const Auto
    Keyword Property SBPlayerMoveToMarkerKeyword Mandatory Const Auto

    Keyword Property BQ01_Keyword_BarrettTempleMarkerLink Const Auto
    Keyword Property BQ01_Keyword_BarrettPowerMarkerLink  Const Auto
    Keyword Property BQ01_Keyword_TempleLocation Const Auto
    Keyword Property SBTempleCompanionMarkerLinkKeyword Const Auto
    Keyword Property SBAbsorbPowerFurnKeyword Mandatory Const Auto
endGroup

group specialHandling
	SQ_FollowersScript property SQ_Followers Auto Const Mandatory

    ReferenceAlias Property Barrett Const Auto
    Quest Property BarrettQuest Const Auto
    int property BarrettQuestTempleStagePrereq = 8500 const auto
    Int Property BarrettQuestTempleStage = 8501 Const Auto
EndGroup

group powerReward
    Idle Property IdlePowerUp_Start Mandatory Const Auto
    Idle Property IdlePowerUp_Stop Mandatory Const Auto

    Message Property PlayerHealthIncreaseMessage Mandatory Const Auto

    GlobalVariable Property StarbornPuzzleXP Mandatory Const Auto

    ActorValue Property HealthAV Mandatory Const Auto

    GlobalVariable Property SBPowerHealthBonus Mandatory Const Auto
    { how much is added to the player's health for solving the puzzle }
    
    Spell Property RankUpPerk Auto
    string Property sVisionBink Auto
    WwiseEvent Property WwiseEvent_AMBArtifactVision Auto
EndGroup

group quests
    Quest Property QuestToCheck Const Auto
    { optional - if provided and StageToSet > -1, this quest stage will be set when the power sequence is done }
    Int Property StageToSet = -1 Const Auto
EndGroup

CustomEvent PowerAcquiredEvent

Auto State WaitingForPlayer
    Event OnTriggerEnter(ObjectReference akActionRef)
        if akActionRef == Game.GetPlayer()
            GotoState("HasBeenTriggered")
            PlayerPowerSequence()
        endif
    EndEvent
EndState

State HasBeenTriggered
    Event OnTriggerEnter(ObjectReference akActionRef)
        ;do nothing
    EndEvent
EndState

Function PlayerPowerSequence()
    debug.trace(self + "PlayerPowerSequence START")
    ;check if we're doing this in Barrett's Companion Quest
    Bool bBarrettQuestActive = False
    If GetCurrentLocation().HasKeyword(BQ01_Keyword_TempleLocation)
        bBarrettQuestActive = true
    EndIf

    ObjectReference puzzleRef = GetLinkedRef(SBRingsPuzzleKeyword)
    Actor playerRef = Game.GetPlayer()

    InputEnableLayer myLayer = InputEnableLayer.Create()
    myLayer.DisablePlayerControls()
    ; put player in furniture
    ObjectReference absorbPowerFurnitureRef = GetLinkedRef(SBAbsorbPowerFurnKeyword)
    debug.trace(self + "    put player in furniture " + absorbPowerFurnitureRef)
    if absorbPowerFurnitureRef
        absorbPowerFurnitureRef.Activate(PlayerREF) ;put player in furniture
    endif
    ; put effect on player
    StarbornPuzzle_PlayerFXS.Play(playerRef)
    int instancePowerFX = wPowerAbsorbFXEvent.Play(playerRef)
    ;mPowerAbsorbStinger.Add()

    ; play puzzle animation and wait for it to complete
    debug.trace(self + "    play animation start")
    puzzleRef.PlayAnimationAndWait("Stage1", "Stage2")
    debug.trace(self + "    play animation done")

    ; done - move player to exterior and remove effect
    ;mPowerAbsorbStinger.Remove()
    WwiseEvent_AMBArtifactVision.Play(playerRef)
    Game.PlayBinkNoWait(sVisionBink, abMuteAudio=False, abMuteMusic=False, aPlayDuringLoadingScreen=True)
    PlayerREF.MoveTo(GetLinkedRef(SBPlayerMoveToMarkerKeyword))
    StarbornPuzzle_PlayerFXS.Stop(playerRef)

    If bBarrettQuestActive
        Barrett.TryToMoveTo(GetLinkedRef(BQ01_Keyword_BarrettTempleMarkerLink)) ;also move Barrett if we're on his companion quest
    Else
        ;move current followers
        SQ_Followers.TeleportFollowers(GetLinkedRef(SBTempleCompanionMarkerLinkKeyword))
    EndIf

    PlayerREF.WaitFor3DLoad() ;wait for the player to load into the next cell
    Utility.Wait(3.0) ;give the fader a couple seconds

    myLayer.EnablePlayerControls()
    PlayerReceivePower()

    ;if Barrett's quest is active we need to update it
    If bBarrettQuestActive
        BarrettQuest.SetStage(BarrettQuestTempleStage)
    EndIf

    ;update quest once receive power sequence is done
    if QuestToCheck && StageToSet > -1
        QuestToCheck.SetStage(StageToSet)
    endif
EndFunction

Function PlayerReceivePower()
    Actor playerRef = Game.GetPlayer()
    int iXPIncrease = StarbornPuzzleXP.GetValueInt()

    RankUpPerk.Cast(playerRef, playerRef) ;give player the relevant power
    Utility.Wait(0.2)
    playerRef.ModValue(HealthAV, SBPowerHealthBonus.GetValueInt())
    Utility.Wait(0.2)
    Game.RewardPlayerXP(iXPIncrease)
    Utility.Wait(1.0)

    ;notify any scripts listening for the power to be acquired
    SendCustomEvent("PowerAcquiredEvent")
EndFunction

Function UpdatePowerProperties(Spell newRankUpPerk, String newVisionBink, WwiseEvent newArtifactVision)
    RankUpPerk = newRankUpPerk
    sVisionBink = newVisionBink
    WwiseEvent_AMBArtifactVision = newArtifactVision
endFunction