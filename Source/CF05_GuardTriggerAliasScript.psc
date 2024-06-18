Scriptname CF05_GuardTriggerAliasScript extends ReferenceAlias
{Script to handle the security guards, the checks they run, and the scenes they play as a result.}

Scene Property GuardSceneToPlay Auto Const Mandatory
{Scene to play when the player enters the trigger volume.}

Bool Property CheckStage Auto Const
{Determines whether or not to check for a stage vs uniform.
False = Check uniform
True = Check quest stage}

Int Property iStageToCheck = -1 Auto Const
{Stage to check to determine if scene will play.}

Int Property iStageDone = -1 Auto Const
{Stage to check to prevent scene playing again.}

Armor Property UniformToCheck Auto Const 
{Uniform to check to determine if scene will play.}

ReferenceAlias Property GuardAliasToCheck Auto Const Mandatory
{The guard alias to check for detection that's in the scene.}

Scene Property CF05_1000_CargoBayGuard01_TeleportPlayer Auto Const Mandatory

; NOTE: Need LD adjustments to handle IsDetectedBy because one guard in question isn't
; detecting the player. I've commented out this check for now.
Event OnTriggerEnter(ObjectReference akActionRef)
Debug.Trace(Self + "EVENT: OnTriggerEnter fired.")
    Actor PlayerRef = Game.GetPlayer()

    If akActionRef == PlayerRef && !PlayerRef.IsTrespassing() ;&& PlayerRef.IsDetectedBy(GuardAliasToCheck.GetActorRef())
    Debug.Trace(Self + " akActionRef is a player, and player is NOT trespassing.")
        If !CheckStage && !GetOwningQuest().GetStageDone(iStageDone)
        Debug.Trace(Self + " Checking for uniform and stage done")
            If !PlayerRef.IsEquipped(UniformToCheck) && !CF05_1000_CargoBayGuard01_TeleportPlayer.IsPlaying()
                GuardSceneToPlay.Start()
            EndIf
        Else
        Debug.Trace(Self + " Checking for stage done. ")
            If !GetOwningQuest().GetStageDone(iStageToCheck) && !CF05_1000_CargoBayGuard01_TeleportPlayer.IsPlaying()
            Debug.Trace(Self + "Stage is NOT done, so play scene. ")
                GuardSceneToPlay.Start()
            EndIf
        EndIf
    EndIf
EndEvent
