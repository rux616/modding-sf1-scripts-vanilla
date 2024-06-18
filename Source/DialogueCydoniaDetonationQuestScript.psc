Scriptname DialogueCydoniaDetonationQuestScript extends Quest

Cell Property CityCydoniaMainLevel Mandatory Const Auto
Cell Property CityCydoniaMainLevel02 Mandatory Const Auto
GlobalVariable Property CY_DetonationEndOfDay Mandatory Const Auto
GlobalVariable Property CY_DetonationCount Mandatory Const Auto
LocationAlias Property Cydonia Mandatory Const Auto
Scene Property DialogueCydonia_Detonation_Announcer_Countdown Mandatory Const Auto
Scene Property DialogueCydonia_Detonation_Announcer_LastCall Mandatory Const Auto
Scene Property DialogueCydonia_Detonation_Concluded Mandatory Const Auto
Scene Property DialogueCydonia_Detonation_Concluded_LastCall Mandatory Const Auto
WwiseEvent Property AMB_Cydonia_Fracking_Explosion_FirstEncounter Mandatory Const Auto
WwiseEvent Property AMB_Cydonia_Fracking_Explosion Mandatory Const Auto
WwiseEvent Property AMB_Cydonia_Fracking_Klaxon_TriggerEchos Mandatory Const Auto
WwiseEvent Property AMB_Cydonia_EXT_Fracking_Explosion_NoOcc Mandatory Const Auto
WwiseEvent Property AMB_Cydonia_EXT_Fracking_StructureRumbleTriggerEchos Mandatory Const Auto
ReferenceAlias Property DetonationSoundMarkerFirstTime Mandatory Const Auto
ReferenceAlias Property DetonationSoundMarker Mandatory Const Auto
ReferenceAlias Property DetonationSoundMarkerInt02 Mandatory Const Auto
ReferenceAlias Property DetonationSoundMarkerExt Mandatory Const Auto
RefCollectionAlias Property Klaxons Mandatory Const Auto
Int Property KlaxonTimerID = 1 Const Auto
Float Property KlaxonTimerLength = 3.0 Const Auto
Int Property DetonationTimerID = 2 Const Auto
Float Property DetonationTimerLength = 8.0 Const Auto
Int Property EndQuestTimerID = 3 Const Auto
Float Property EndQuestTimerLength = 3.0 Const Auto
Float Property DetonationShakeLength = 4.0 Const Auto
Int Property QuestDoneStage = 1000 Const Auto


;Plays first
Function PlayKlaxons()
    ;Turn on the klaxon lights.
    Int i
    Int iCount = Klaxons.GetCount()
    While i < iCount
        ObjectReference myKlaxon = Klaxons.GetAt(i)
        myKlaxon.PlayAnimation("Play01")
        i += 1
    EndWhile

    If CY_DetonationCount.GetValue() < 1
        AMB_Cydonia_Fracking_Klaxon_TriggerEchos.Play(DetonationSoundMarkerFirstTime.GetRef())
        AMB_Cydonia_Fracking_Klaxon_TriggerEchos.Play(DetonationSoundMarkerInt02.GetRef())
    Else
        AMB_Cydonia_Fracking_Klaxon_TriggerEchos.Play(DetonationSoundMarker.GetRef())
        AMB_Cydonia_Fracking_Klaxon_TriggerEchos.Play(DetonationSoundMarkerInt02.GetRef())
        AMB_Cydonia_Fracking_Klaxon_TriggerEchos.Play(DetonationSoundMarkerEXT.GetRef())
    EndIf
    StartTimer(KlaxonTimerLength, KlaxonTimerID)
EndFunction

;Announcement plays second, based on where the player is.
Function PlaySequence()
    Actor myPlayer = Game.GetPlayer()
    If ( Game.GetLocalTime() >= (CY_DetonationEndOfDay.GetValue() - 2.0) && Game.GetLocalTime() <= CY_DetonationEndOfDay.GetValue() )
        If myPlayer.IsInLocation(Cydonia.GetLocation())
            DialogueCydonia_Detonation_Announcer_LastCall.Start()
        Else
            SetStage(QuestDoneStage)
        EndIf
        
    Else
        If myPlayer.IsInLocation(Cydonia.GetLocation())
            DialogueCydonia_Detonation_Announcer_Countdown.Start()
        Else
            SetStage(QuestDoneStage)
        EndIf
    EndIf
EndFunction


Function Shake()
    Game.ShakeCamera(none, 0.2, DetonationShakeLength)
	Game.ShakeController(0.3, 0.15, DetonationShakeLength)
    Utility.Wait(3)
    Game.ShakeCamera(none, 0.05, DetonationShakeLength)
	Game.ShakeController(0.15, 0.0, DetonationShakeLength)
EndFunction


;Detonation plays third (Interior)
Function PlayDetonationFX()
    If CY_DetonationCount.GetValue() < 1
        AMB_Cydonia_Fracking_Explosion_FirstEncounter.Play(DetonationSoundMarkerFirstTime.GetRef())
    Else
        AMB_Cydonia_Fracking_Explosion.Play(DetonationSoundMarker.GetRef())
    EndIf
    DetonationTimer()
    Shake()
EndFunction

;Detonation plays third (Interior 2)
Function PlayDetonationFXInt02()
    AMB_Cydonia_Fracking_Explosion.Play(DetonationSoundMarkerInt02.GetRef())
    DetonationTimer()
    Shake()
EndFunction

;Detonation plays third (Exterior)
Function PlayDetonationFXEXT()
    AMB_Cydonia_EXT_Fracking_Explosion_NoOcc.Play(DetonationSoundMarkerExt.GetRef())
    AMB_Cydonia_EXT_Fracking_StructureRumbleTriggerEchos.Play(Game.GetPlayer())
    DetonationTimer()
    Shake()
EndFunction


;Starts the Detonation Timer so the rest of the sequence can proceed.
Function DetonationTimer()
    StartTimer(DetonationTimerLength, DetonationTimerID)
EndFunction


;Conclusion announcement plays fourth (Interior)
Function ConcludeSequence()
    If ( Game.GetLocalTime() >= (CY_DetonationEndOfDay.GetValue() - 1.0) && Game.GetLocalTime() <= (CY_DetonationEndOfDay.GetValue() + 1.0) )
        DialogueCydonia_Detonation_Concluded_LastCall.Start()
    Else 
        DialogueCydonia_Detonation_Concluded.Start()
    EndIf
EndFunction


;Delay the end of the quest after the last call detonation message goes out so that we don't play it again. 
;CYDetonationHelperQuestScript will handle this check in StartDetonationSequence()
Function DelayQuestEndForLastCall()
    StartTimerGameTime(EndQuestTimerLength, EndQuestTimerID)
EndFunction


Function EndKlaxons()
    ;Turn off the klaxon lights.
    Int i
    Int iCount = Klaxons.GetCount()
    While i < iCount
        ObjectReference myKlaxon = Klaxons.GetAt(i)
        myKlaxon.PlayAnimation("Play02")
        i += 1
    EndWhile
EndFunction


;Selects the correct Detonation to play based on where the player is.
Function SelectCorrectDetonation()
    Actor myPlayer = Game.GetPlayer()
    If myPlayer.IsInLocation(Cydonia.GetLocation())
        If myPlayer.IsInInterior()
            Cell myCell = myPlayer.GetParentCell()
            If myCell == CityCydoniaMainLevel
                PlayDetonationFX()
            ElseIf myCell == CityCydoniaMainLevel02
                PlayDetonationFXInt02()
            Else
                SetStage(QuestDoneStage)
            EndIf
        Else
            PlayDetonationFXEXT()
        EndIf
    Else
        SetStage(QuestDoneStage)
    EndIf
EndFunction


;Chooses which scene to play based on where the player is. If no locations/cells are valid, then it ends the quest
Function SelectCorrectConclusion()
    Actor myPlayer = Game.GetPlayer()
    If myPlayer.IsInLocation(Cydonia.GetLocation())
        ConcludeSequence()
    Else
        SetStage(QuestDoneStage)
    EndIf
EndFunction




Event OnQuestInit()
    PlayKlaxons()
EndEvent

Event OnTimer(int aiTimerID)
    If aiTimerID == KlaxonTimerID
        PlaySequence()
    ElseIf aiTimerID == DetonationTimerID
        SelectCorrectConclusion()
    EndIf
EndEvent

Event OnTimerGameTime(int aiTimerID)
    If aiTimerID == EndQuestTimerID
        Stop()
    Endif
EndEvent