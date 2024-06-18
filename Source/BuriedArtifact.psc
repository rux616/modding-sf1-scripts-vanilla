Scriptname BuriedArtifact extends ObjectReference

CustomEvent OnArtifactAcquireStarted
CustomEvent OnArtifactAcquireEnded

Group SharedDefaults CollapsedOnRef
	WwiseEvent Property VisionAmbient auto  const
	{The ambient sound that leads into the vision}
	VisualEffect Property VisionEffects auto  const
	{The visual component of the vision.}
	MusicType Property VisionMusic Auto Const
	{Music To Play during the vision, should be flagged as "Plays One Selection" }
	InputEnableLayer Property ArtifactEnableLayer Auto Hidden
EndGroup

bool Property PickupEnabled = false auto

ObjectReference Property FXlights Auto Const

Event OnActivate(ObjectReference akActionRef)
	if(PickupEnabled)
		ArtifactEnableLayer = InputEnableLayer.Create()
		;poo edit---------
		;ArtifactEnableLayer.DisablePlayerControls(true, true, true, true, true, true, true, true, true, true, true)
		ArtifactEnableLayer.DisablePlayerControls()
		FXlights.Enable()
		;endpoo edit-------
		PickupEnabled = false
		SendCustomEvent("OnArtifactAcquireStarted")
	    ;VFX and SFX for vision here.
		if(VisionEffects)
	    	VisionEffects.Play(Game.GetPlayer() as ObjectReference)
		endif
		if (VisionMusic)
			VisionMusic.Add()
		endif
	    VisionAmbient.PlayAndWait(Game.GetPlayer() as ObjectReference)
		;Utility.Wait(15)
	    ArtifactAcquired()
	EndIf
EndEvent

Function ArtifactAcquired()
	if(VisionEffects)
	    VisionEffects.Stop(Game.GetPlayer() as ObjectReference)
	endif
	ArtifactEnableLayer.Delete()
	SendCustomEvent("OnArtifactAcquireEnded")
EndFunction






