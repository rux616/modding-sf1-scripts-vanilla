Scriptname UC01_OrientationDisplayScript extends ReferenceAlias

Scene Property SceneToPlay Mandatory Const Auto

ReferenceAlias Property StarterLight Mandatory Const Auto
{Alias for the light paired to this display. Used to turn off all the lights if the player stops the sequence}

Event OnAliasInit()
    RegisterForCustomEvent(GetOwningQuest() as UC01_OrientationDisplayQuestScript, "HaltOrientationScenes")
EndEvent

Event OnActivate(ObjectReference akActionRef)
    if !SceneToPlay.IsPlaying()
        (GetOwningQuest() as UC01_OrientationDisplayQuestScript).SendHaltScenes(GetRef())
        SceneToPlay.Start()
    EndIf
EndEvent

Event UC01_OrientationDisplayQuestScript.HaltOrientationScenes(UC01_OrientationDisplayQuestScript akSenderRef, Var[] akargs)
    ObjectReference TriggeringDisplay = akargs[0] as ObjectReference

    if TriggeringDisplay != GetRef() && SceneToPlay.IsPlaying()
        SceneToPlay.Stop()
        (StarterLight.GetRef() as UC01_LightTimingRefScript).TriggerLightUpdate(true)
    endif
EndEvent