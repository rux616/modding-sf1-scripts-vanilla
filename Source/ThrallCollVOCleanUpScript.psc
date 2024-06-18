Scriptname ThrallCollVOCleanUpScript extends RefCollectionAlias

MagicEffect Property CrTerrormorphMindControlEffect_NPC Mandatory Const Auto
{The NPC mind control property}

int Property TimerLength = 5 Const Auto
{How frequently we check to see if there's any NPCs in the list that need their VO cleaned up}

VoiceType Property NPCFTerrormorphThrall Mandatory Const Auto
{Female Terrormorph voicetype}

VoiceType Property NPCMTerrormorphThrall Mandatory Const Auto
{Male Terrormorph voicetype}

int iTimerID = 1 const

Event OnAliasInit()
    StartCheck()
EndEvent

Function StartCheck()
    StartTimer(TimerLength, iTimerID)
EndFunction

Event OnTimer(int aiTimerID)
    if aiTimerID == iTimerID
        if GetCount() > 0
            RunVOCleanUp()
        else
            StartCheck()
        endif
    endif
EndEvent

Function RunVOCleanUp()
    int i = GetCount() - 1

    while i >= 0
        Actor currAct = GetAt(i) as Actor

        if currAct != None
            AttemptVOCleanUp(currAct)
        endif

        i -= 1
    endwhile

    StartCheck()
EndFunction

Function AttemptVOCleanUp(Actor akActorRef)
    if !akActorRef.HasMagicEffect(CrTerrormorphMindControlEffect_NPC)
        VoiceType currVoiceType = akActorRef.GetVoiceType()
        if currVoiceType == NPCFTerrormorphThrall || currVoiceType == NPCMTerrormorphThrall
            akActorRef.SetOverrideVoiceType(none)
        endif
        RemoveRef(akActorRef)
    endif
EndFunction