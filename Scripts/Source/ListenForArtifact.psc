Scriptname ListenForArtifact extends ReferenceAlias

int Property VisionStartedStage Auto Mandatory Const
int Property VisionEndedStage Auto Mandatory Const

Event OnLoad()
	BuriedArtifact myRef = Self.GetRef() as BuriedArtifact
    RegisterForCustomEvent(myRef, "OnArtifactAcquireEnded")
	RegisterForCustomEvent(myRef, "OnArtifactAcquireStarted")
EndEvent

;Artifact vision has completed
Event BuriedArtifact.OnArtifactAcquireEnded(BuriedArtifact akSender, Var[] akArgs)
	GetOwningQuest().SetStage(50)
EndEvent

Event BuriedArtifact.OnArtifactAcquireStarted(BuriedArtifact akSender, Var[] akArgs)
	GetOwningQuest().SetStage(49)
EndEvent


;shut down any other scenes
;MQ101_002_LinSupervisorScene.Stop()
;MQ101_004_WallDownScene.Stop()

;disable controls
;kmyquest.VSEnableLayer.DisablePlayerControls()