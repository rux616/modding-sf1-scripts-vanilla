Scriptname TestAudioObjectScript extends ObjectReference Const

ReferenceAlias Property TestAudioActor Auto Const
Scene Property SceneToPlay Auto Const
Scene[] Property AdditionalScenesToStop Auto Const

Event OnActivate(ObjectReference akActionRef)
    If akActionRef == Game.GetPlayer()
	    SceneToPlay.Stop()

        if AdditionalScenesToStop.Length > 0
            int i = 0
            int iLength = AdditionalScenesToStop.Length

            while i < iLength
                AdditionalScenesToStop[i].Stop()
                i += 1
            endwhile
        endif

        TestAudioActor.ForceRefTo(Self)
        SceneToPlay.Start()
    EndIf
EndEvent
