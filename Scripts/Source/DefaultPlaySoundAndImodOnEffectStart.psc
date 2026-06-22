Scriptname DefaultPlaySoundAndImodOnEffectStart extends ActiveMagicEffect default
{ For playing an imagespace, a sound, or both when Potions are used, typically when these should be played only once the Data Menu is closed. }

Group OptionalProperties
    WwiseEvent Property SoundEvent Const Auto
    { Optional: The Sound Event to play. }

    ImageSpaceModifier Property theImod Const Auto
    { Optional: The Imagespace Modifier to play. }

    bool Property StartWhenGameIsRunning = true auto const
    { Optional: If true, VFX/SFX won't start playing until game is not paused (e.g. if effect starts from using a potion from inventory) }
endGroup

int soundInstance = -1
int waitForMenuTimer = 1 const
float waitForMenuTimerDuration = 0.01 const
bool bDonePlayingEffects = false

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	PlayEffects()
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
   	PlayEffects(false)
EndEvent

Event OnTimer(int aiTimerID)
    if aiTimerID == waitForMenuTimer && soundInstance < 0 && !bDonePlayingEffects
        PlayEffects()
    endif
EndEvent

function PlayEffects(bool startPlaying = true)
    debug.trace(self + " PlayEffects startPlaying=" + startPlaying)
    if startPlaying
        if StartWhenGameIsRunning == false || Utility.IsGameMenuPaused() == false
            debug.trace(self + " playing sound " + SoundEvent + " and/or imagespace modifier " + theImod)
            if SoundEvent
                soundInstance = SoundEvent.Play(GetTargetActor())
            endif
            if theImod
                theImod.Apply()
            endif
        Else
            StartTimer(waitForMenuTimerDuration, waitForMenuTimer)
            debug.trace(self + " game is paused - wait for it to be unpaused")
        endif
    Else
        if soundInstance > -1
            WWiseEvent.StopInstance(soundInstance)
            soundInstance = -1
        endif
        if theImod
            theImod.Remove()
        endif
        bDonePlayingEffects = true ; in case effect expires while game is paused
    endif
EndFunction
