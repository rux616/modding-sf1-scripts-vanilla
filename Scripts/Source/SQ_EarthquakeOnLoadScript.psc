Scriptname SQ_EarthquakeOnLoadScript extends ObjectReference
{does an "earthquake" effect on load, and disables itself}

float property EarthquakePercentChance = 50.0 auto Const
{ percent chance the earthquake is triggered onLoad }

float property timeBetweenQuakesMin = 5.0 auto Const

float property  timeBetweenQuakesMax = 15.0 auto Const

float property earthquakeDurationMin = 2.5 auto Const

float property  earthquakeDurationMax = 7.0 auto Const

float property earthquakeStaggerMinTime = 3.0 auto Const
{ min amount of time between casting the stagger spell }

int property minQuakes = 2 auto Const

int property maxQuakes = 5 auto Const

int numQuakes = 0 ; how many quakes to trigger
int numRevealCave = 0 ; when to disable myself to reveal the cave etc.
float staggerTime = 0.0 ; how long between stagger spells?
int numStaggers = 0 ; how many times to cast stagger?

WwiseEvent Property OE_EarthquakeSound Mandatory Const Auto
{ sound the earthquake makes }

WwiseEvent Property WwiseEvent_ShakeController_p5_p5_05 Mandatory Const Auto
{ controller shake }

WwiseEvent Property WwiseEvent_ShakeController_p25_p25_03 Mandatory Const Auto
{ controller shake }

Spell Property SQ_EarthquakeStagger auto const mandatory
{ spell to stagger actors in loaded area }

Keyword[] property EarthquakeTraits auto Const
{ array of planet traits that allow earthquakes - if this is on a planet without earthquakes, immediately do the cave reveal (if any) and shut down }

String property jumpAnimVariableName = "iSyncJumpState" auto Const
{ used to check player's jump state }

Keyword property PCM_Request_BlockCreation auto const mandatory
{ used to check if being placed by quest/scan request }

Group CaveRevealData
    bool property HasCaveReveal = true auto const
    { set to true if there's a cave to reveal (FX will play)
      set to false if this should only play earthquake FX }

    Explosion property RockfallExplosion Mandatory const Auto
    { rockfall explosion }

    MovableStatic property RockfallFX mandatory const Auto
    { place some FX at me for a bit }

    float property RockfallFXTime = 10.0 const Auto
    { how long to leave RockfallFX enabled? }
EndGroup

int earthquakeTimerID = 1 Const
int rockfallFXTimerID = 2 Const
int staggerTimerID = 3 Const

ObjectReference rockfallFXRef

auto STATE Waiting
    Event OnInit()
        debug.trace(self + "OnInit")
        ; does this planet even have earthquakes?
        Planet myPlanet = GetCurrentPlanet()
        if myPlanet
            int i = 0
            bool traitFound = false
            ; only enable this for block-creation placed locations
            Location myLocation = GetCurrentLocation()
            debug.trace(self + "OnInit: myLocation=" + myLocation)
            if myLocation == NONE || myLocation.HasKeyword(PCM_Request_BlockCreation)
                while i < EarthquakeTraits.Length && traitFound == false
                    traitFound = myPlanet.HasKeyword(EarthquakeTraits[i])
                    i += 1
                EndWhile
            EndIf

            if traitFound == false
                debug.trace(self + " OnInit: no earthquake trait found - turn off: location=" + GetCurrentLocation())
                ; clear cave block and turn off
                GotoState("Done")
            Else
                ; if this has a cave reveal, roll now
                if HasCaveReveal == false || Game.GetDieRollSuccess(EarthquakePercentChance as int)
                    debug.trace(self + " OnInit: enabling trigger in " + GetCurrentLocation())
                    EnableNoWait() ; enable trigger and cave block, which disables map marker
                Else
                    debug.trace(self + " OnInit: cave is always visible - turn off: location=" + GetCurrentLocation())
                    ; clear cave block and turn off
                    GotoState("Done")
                endif
            endif
        endif
    endEvent

    Event OnLoad()
        debug.trace(self + " OnLoad - location=" + GetCurrentLocation())
        if IsDisabled() == false
            ; if this has a cave reveal and is enabled, we always want an earthquake (to reveal the cave)
            if HasCaveReveal || Game.GetDieRollSuccess(EarthquakePercentChance as int)
                ; start earthquake
                gotoState("earthquake")
            endif
        endif
    EndEvent
EndState

state earthquake
    Event OnBeginState(string asOldState)
        debug.trace(self + " OnBeginState EARTHQUAKE asOldState=" + asOldState)
        numQuakes = Utility.RandomInt(minQuakes, maxQuakes)
        numRevealCave = Utility.RandomInt(1, numQuakes)

        float timeToNextQuake = Utility.RandomFloat(timeBetweenQuakesMin, timeBetweenQuakesMax)
        debug.trace(self + "numQuakes=" + numQuakes + " timeToNextQuake=" + timeToNextQuake)
        StartTimer(timeToNextQuake, earthquakeTimerID)
    EndEvent
EndState

state Done
    Event OnBeginState(string asOldState)
        debug.trace(self + " OnBeginState DONE asOldState=" + asOldState)
    endEvent
    ; do nothing
endState

function Earthquake()
    debug.trace(self + " Earthquake")
    float duration = Utility.RandomFloat(earthquakeDurationMin, earthquakeDurationMax)
    Game.ShakeCamera(none, 0.25, duration)
    if duration < 5
        WwiseEvent_ShakeController_p25_p25_03.Play(game.GetPlayer())
    Else
        WwiseEvent_ShakeController_p5_p5_05.Play(game.GetPlayer())
    endif
    Actor playerRef = Game.GetPlayer()
    OE_EarthquakeSound.Play(playerRef)
   bool isJumping = playerRef.GetAnimationVariableBool(jumpAnimVariableName)
    debug.trace(self + "   isJumping=" + isJumping)
    if isJumping == false
        SQ_EarthquakeStagger.Cast(self, playerRef)
    endif
    ; see if we need to play another stagger
    if duration > earthquakeStaggerMinTime
        staggerTime = Utility.RandomFloat(earthquakeStaggerMinTime, duration)
        numStaggers = Math.Floor(duration/staggerTime)
        ; for now don't do this, unless we get a longer earthquake sound
        ;StartTimer(staggerTime, staggerTimerID)
    endif
    
    if HasCaveReveal && numQuakes <= numRevealCave && IsDisabled() == false
        ; FX for cave entrance reveal
        utility.wait(1.0)
        Disable()
        StartTimer(RockfallFXTime, rockfallFXTimerID)
    EndIf

    numQuakes -= 1
    if numQuakes > 0
        float timeToNextQuake = Utility.RandomFloat(timeBetweenQuakesMin, timeBetweenQuakesMax)
        StartTimer(timeToNextQuake, earthquakeTimerID)
    Else
        GotoState("Done")
    endif
endFunction

Event OnTimer(int aiTimerID)
    if aiTimerID == earthquakeTimerID
        Earthquake()
    elseif aiTimerID == rockfallFXTimerID
        if rockfallFXRef
            rockfallFXRef.Disable()
            rockfallFXRef = NONE
        endif
    elseif aiTimerID == staggerTimerID
        numStaggers -= 1
        SQ_EarthquakeStagger.Cast(self, Game.GetPlayer())
        if numStaggers > 0
            StartTimer(staggerTime, staggerTimerID)
        endif
    endif
EndEvent

Event OnUnload()
    ; cancel all timers!
    CancelTimer(earthquakeTimerID)
    CancelTimer(rockfallFXTimerID)
    CancelTimer(staggerTimerID)
EndEvent
