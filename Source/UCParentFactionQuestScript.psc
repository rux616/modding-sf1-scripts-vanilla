Scriptname UCParentFactionQuestScript extends Quest

GlobalVariable Property UC04_ReconstructionStateTimerLength Mandatory Const Auto
{Global var used to determine how long we wait before trying to turn off the New Atlantis "reconstruction" state}

Location Property CityNewAtlantisLocation Mandatory Const Auto
{New Atlantis city location used to make sure we're not turning off the state change while the player's around}

int Property FailsafeTimerLength = 60 Auto Const
{If the player is in New Atlantis when we try to clean up this state change, use this timer length to wait and check again}

int Property StageToSet = 1000 Auto Const
{Stage to set once enough time has elapsed and the player's no longer on New Atlantis to clean up the reconstruction}

RefCollectionAlias Property Thralls Mandatory Const Auto
{Collection used to handle any human thralls and cleaning up their voicetypes}

VoiceType Property NPCFTerrormorphThrall Mandatory Const Auto
{Female Terrormorph Thrall voicetype}

VoiceType Property NPCMTerrormorphThrall Mandatory Const Auto
{Male Terrormorph Thrall voicetype}

Race Property HumanRace Mandatory Const Auto
{Used to know if we should override the NPC's voicetype}

float Property AggressionOverride = 2.0 Const Auto
{What we set the mind controlled NPCs aggression to}

ActorValue Property Aggression Mandatory Const Auto RequiresGuard(MindControlGuard)
{AV used to make the NPCs hostile}

ActorValue Property UC_MindControl_InitialAggression Mandatory Const Auto RequiresGuard(MindControlGuard)
{The NPCs mind control value when the moment starts}

Topic Property Thrall_TakeOverStart Mandatory Const Auto
{Topic to play when a human NPC is initially taken over by a Terrormorph}

Keyword Property UC_MindControlledNPC Mandatory Const Auto
{Keyword applied to Mind Controlled NPC's}

;Custom Events
CustomEvent MindControlTriggered
CustomEvent UCR04SampleCollected

;Lock guards
Guard MindControlGuard

;Local Vars
int iTimerID = 1 const

Function SendNPCSuccessfullyMindControledEvent(Actor akSourceTerrormorph, Actor akMindControlTarget)
    Var[] akargs = new Var[2]
    akargs[0] = akSourceTerrormorph
    akargs[1] = akMindControlTarget
    trace(self, "UC Mind control event triggered. Source: " + akSourceTerrormorph + ". Target: " + akMindControlTarget)

    SendCustomEvent("MindControlTriggered", akArgs)
EndFunction

Function SendUCR04SampleCollectedEvent(Actor akTargetActor)
    Var[] akargs = new Var[1]
    akargs[0] = akTargetActor
    trace(self, "UCR04 Sample Collected triggered. Source: " + akTargetActor)

    SendCustomEvent("UCR04SampleCollected", akArgs)
EndFunction

Function BeginStateChangeTimer()
    trace(self, "Start UC04 state change timer with length: " + UC04_ReconstructionStateTimerLength.GetValue())
    StartTimer(UC04_ReconstructionStateTimerLength.GetValue(), iTimerID)
EndFunction

Event OnTimer(int aiTimerID)
    trace(self, "Timer complete. ID: " + aiTimerID)
    if aiTimerID == iTimerID
        Location CurrLoc = Game.GetPlayer().GetCurrentLocation()
        trace(self, "Player's current location: " + CurrLoc + ". Is child of New Atlantis Location: " + CityNewAtlantisLocation.IsChild(CurrLoc))
        if CurrLoc != CityNewAtlantisLocation && !CityNewAtlantisLocation.IsChild(CurrLoc)
            SetStage(StageToSet)
            trace(self, "Turning off state change.")
        else
            StartTimer(FailsafeTimerLength, iTimerID)
            trace(self, "Restarting countdown timer with length: "+ FailsafeTimerLength)
        endif
    endif
EndEvent

Function StartThrallTimer()
    (Thralls as ThrallCollVOCleanUpScript).StartCheck()
EndFunction

Function StartMindControlBehavior(Actor TargetActor, Actor akCaster)
    LockGuard MindControlGuard
        trace(self, "Kicking off mind control behavior for NPC: " + TargetActor)

        ;Add them to the Thralls ref collection
        Thralls.AddRef(TargetActor)

        ;First, check to make sure this NPC doesn't already have an aggression modifier on them
        float currAggression = TargetActor.GetValue(Aggression)
        trace(self, "Target Actor: " + TargetActor + " current Aggression is: " + currAggression +". BaseAggression: " + TargetActor.GetBaseValue(Aggression))

        if TargetActor.GetBaseValue(Aggression) == currAggression

            ;If their current aggression is less than the override, set it to the override
            if currAggression < AggressionOverride

                ;Apply the "mind controlled" keyword
                TargetActor.AddKeyword(UC_MindControlledNPC)

                ;Save off their current Aggression (since setting the value changes their base permanently)
                TargetActor.SetValue(UC_MindControl_InitialAggression, currAggression)

                ;And now make 'em violent
                TargetActor.SetValue(Aggression, AggressionOverride)

                trace(self, "Updating target Actor: " + TargetActor + "'s Aggression. Saved Aggression is: " + TargetActor.GetValue(UC_MindControl_InitialAggression) +". Current aggression: " + TargetActor.GetBaseValue(Aggression))
            endif
        endif

        ;Now check to see if they're human so we can swap out their voicetype
        if TargetActor.GetRace() == HumanRace
            VoiceType OverrideVoiceType
            ActorBase TargetBase = TargetActor.GetBaseObject() as ActorBase
            trace(self, "Target base: " + TargetBase)

            if TargetBase
                if TargetBase.GetSex() == 0
                    OverrideVoiceType = NPCMTerrormorphThrall
                else
                    OverrideVoiceType = NPCFTerrormorphThrall
                endif

                trace(self, "Override voicetype will be: " + OverrideVoiceType)

                if OverrideVoiceType != none && TargetActor.GetVoiceType() != OverrideVoiceType
                    TargetActor.SetOverrideVoiceType(OverrideVoiceType)
                    trace(self, "TargetActor: " + TargetActor + " now has voicetype: " + TargetActor.GetVoiceType())
                    TargetActor.Say(Thrall_TakeOverStart)
                endif
            endif
        endif

        ;Send off the custom event that this NPC has been mind controlled
        trace(self, "Sending Mind Control event with caster: " + akCaster + " and Target: " + TargetActor)
        SendNPCSuccessfullyMindControledEvent(akCaster, TargetActor)

    EndLockGuard
EndFunction

Function StopMindControlBehavior(Actor OriginalTarget)
    LockGuard MindControlGuard
        trace(self, "Clean up mind control behavior for NPC: " + OriginalTarget)

        float currAggression = OriginalTarget.GetValue(Aggression)
        float SavedAggression = OriginalTarget.GetValue(UC_MindControl_InitialAggression)
        float BaseAggression = OriginalTarget.GetBaseValue(Aggression)
        trace(self, "Target Actor: " + OriginalTarget + " current Aggression is: " + currAggression +". SavedAggression: " + SavedAggression + ". Base Aggression: " + BaseAggression)

        ;If they currently have an aggression that doesn't match their saved aggression, restore it to the old value
        ;At the time of ship, there are no spells that set NPC's Aggression to 2, so we can know they're not under a spell if matches AggressionOverride
        if currAggression != SavedAggression && BaseAggression == AggressionOverride
            OriginalTarget.SetValue(Aggression, SavedAggression)

            ;Now reset their old saved Aggression
            OriginalTarget.SetValue(UC_MindControl_InitialAggression, 0)
            trace(self, "Updating Target Actor: " + OriginalTarget + " Aggression to: " + OriginalTarget.GetValue(Aggression))
        endif

        ;Try to stop combat
        OriginalTarget.StopCombat()

        trace(self, "Mind control target " + OriginalTarget + " has voicetype " + OriginalTarget.GetVoiceType())

        ;Clean up the voicetype override of the affected actor
        if OriginalTarget.GetVoiceType() ==  NPCFTerrormorphThrall || OriginalTarget.GetVoiceType() ==  NPCMTerrormorphThrall
            trace(self, "Mind control target " + OriginalTarget + " has voicetype cleaned up.")
            OriginalTarget.SetOverrideVoiceType(none)
        endif

        trace(self, "Mind control target " + OriginalTarget + ", post-VO clean-up now has voicetype " + OriginalTarget.GetVoiceType())
    EndLockGuard
EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC_Parent", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction