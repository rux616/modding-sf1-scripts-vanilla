Scriptname TerrormorphMindControlEffectScript extends ActiveMagicEffect

Quest Property UC_TerrormorphSupportQuest Mandatory Const Auto
{Quest to start playing if this is the player}

WwiseEvent Property EventForm1 Mandatory Const Auto 
{First Wwise event to play}

WwiseEvent Property EventForm2 Mandatory Const Auto 
{Second Wwise event to play}

String Property GlobalStateGroup Mandatory Const Auto
{State group name from Wwise. String must match what's in Wwise.}

String Property GlobalStateActive Mandatory Const Auto
{Active State name from Wwise. String must match what's in Wwise.}

String Property GlobalStateInactive Mandatory Const Auto
{Inactive State name from Wwise. String must match what's in Wwise.}

Quest Property DialogueUCFactionAlwaysOn Mandatory Const Auto
{Parent quest used to track the mind control custom event}

RefCollectionAlias Property Thralls Mandatory Const Auto
{Failsafe ref collection for the thralls to clean up their voicetype}

bool Property DispelOnBleedout = true Const Auto
{Set to true on NPCs you want to lose the effect on bleedout}

;Local vars
int eventInstance1 = 0
int eventInstance2 = 0
float initialAssistance = -1.0
Actor CastingActor
Actor OriginalTarget
bool bEffectComplete

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    trace(self, "OnEffectStart akTarget=" + akTarget)

    if !bEffectComplete

        ;Register to watch for Death/Bleedout events from the casting Terrormorph to clean this up if it dies
        CastingActor = akCaster
        RegisterForRemoteEvent(CastingActor, "OnDeath")

        if DispelOnBleedout
            RegisterForRemoteEvent(CastingActor, "OnEnterBleedOut")
        endif

        if akTarget == Game.GetPlayer()
            UC_TerrormorphSupportQuest.Start()
            (UC_TerrormorphSupportQuest as UC_TerrormorphSupportScript).SourceTerrormorph.ForceRefTo(CastingActor)
            WwiseEvent.SetGlobalState(GlobalStateGroup, GlobalStateActive)

        ;If we're dealing with an NPC...
        else
            Actor TargetActor = akTarget as Actor
            if TargetActor
                ;Save off our NPC target to use later for clean up
                OriginalTarget = TargetActor

                UCParentFactionQuestScript ParentQuest = DialogueUCFactionAlwaysOn as UCParentFactionQuestScript
                ParentQuest.StartMindControlBehavior(TargetActor, akCaster)
            endif
        endif
    endif
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    trace(self, "OnEffectFinish akTarget=" + akTarget)
    if !bEffectComplete
        bEffectComplete = true
    endif

    if akTarget == Game.GetPlayer()
        UC_TerrormorphSupportQuest.Stop()
        WwiseEvent.SetGlobalState(GlobalStateGroup, GlobalStateInactive)
    else
    
        Actor TargetActor = akTarget as Actor
        trace(self, "TargetActor for cleanup: " + TargetActor + ". Currently has voicetype: " + TargetActor.GetVoiceType())
        if TargetActor

            (DialogueUCFactionAlwaysOn as UCParentFactionQuestScript).StopMindControlBehavior(TargetActor)
            trace(self, "TargetActor: " + TargetActor + ", post-VO override clean-up now has voicetype: " + TargetActor.GetVoiceType())
        endif
    endif

    UnregisterForRemoteEvent(CastingActor, "OnDeath")
    UnregisterForRemoteEvent(CastingActor, "OnEnterBleedOut")
    CastingActor = none
    OriginalTarget = none
EndEvent

Event Actor.OnDeath(Actor akSender, ObjectReference akKiller)
    if akSender == CastingActor
       trace(self, "CastingMorph: " + akSender + " is dead. Time to clean up.")
        CleanUpEffect()
    endif
EndEvent

Event Actor.OnEnterBleedout(Actor akSender)
    if akSender == CastingActor
        trace(self, "CastingMorph: " + akSender + " is downed. Time to clean up.")
        CleanUpEffect()
    endif
EndEvent

Function CleanUpEffect()
    if !bEffectComplete
        bEffectComplete = true
    endif

    (DialogueUCFactionAlwaysOn as UCParentFactionQuestScript).StopMindControlBehavior(OriginalTarget)
    UnregisterForRemoteEvent(CastingActor, "OnDeath")
    UnregisterForRemoteEvent(CastingActor, "OnEnterBleedOut")
    CastingActor = none
    OriginalTarget = none
    Dispel()
EndFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC04", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction