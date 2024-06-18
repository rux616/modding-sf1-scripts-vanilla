Scriptname PEO:PEO_SustenanceCastWatchScript extends ActiveMagicEffect
{This script sends alerts to the watch and causes short player "grunts" to remind the player they have negative effects. We do this by casting short duration spells that effectively ping the watch}
Group MagicEffect_Keywords
{These keywords define spell effects that should trigger the watch display spells to be cast}
    Keyword Property KeywordCheckMalnourished Mandatory Const Auto
    Keyword Property KeywordCheckDehydrated Mandatory Const Auto
EndGroup

Group Spells
{These are the spells that we cast to have text appear on the watch}
    Spell Property MalnourishedSpell Mandatory Const Auto 
    Spell Property DehydratedSpell Mandatory Const Auto
EndGroup

Group Dialogue_Keywords
{These dialogue subtypes we use to get the players to grunt when negative effects fire on the watch}
    Keyword Property DialogueKeywordHungry Mandatory Const Auto   
    Keyword Property DialogueKeywordThirsty Mandatory Const Auto
EndGroup

Group TimerData
    float Property ReminderDuration = 300.0 Const Auto ;300.0 = 5 minutes alternating, 10 minutes for each specifically
    {because we alternate between reminding about Malnourished and Dehydrated, double this to get the time for each individually}
EndGroup

bool NextCheckMalnourished = false

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    Trace(self, "OnEffectStart() akBaseEffect: " + akBaseEffect + ", will play audio for any newly turned on effects ")

    Keyword keywordToSay = None

    Actor Player = Game.GetPlayer()

    ;we only need to say one line of dialogue initially even if both are present.
    if Player.HasMagicEffectWithKeyword(KeywordCheckMalnourished)
        keywordToSay = DialogueKeywordHungry
    elseif Player.HasMagicEffectWithKeyword(KeywordCheckDehydrated)
        keywordToSay = DialogueKeywordThirsty
    endif

    if keywordToSay
        player.SayCustom(KeywordToSay)
    endif

    StartTimer(ReminderDuration)
EndEvent

Event OnTimer(int aiTimerID) 
    NextCheckMalnourished = !NextCheckMalnourished ;swap the toggle
    Trace(self, "OnTimer() NextCheckMalnourished: " + NextCheckMalnourished)

    PlayAudioAndCastWatchSpellsIfNeeded()
    StartTimer(ReminderDuration) ;This timer needs to continue until the effect is no longer active because this how we ping the watch to let the player know they have a ongoing negative effect. When the spell effect ends, it cancels the timer
EndEvent

Function PlayAudioAndCastWatchSpellsIfNeeded()
    Actor Player = Game.GetPlayer()

    if NextCheckMalnourished && Player.HasMagicEffectWithKeyword(KeywordCheckMalnourished)
        PlayAudioAndCastWatchSpell(Player, MalnourishedSpell, DialogueKeywordHungry)

    elseif NextCheckMalnourished == false && Player.HasMagicEffectWithKeyword(KeywordCheckDehydrated) 
        PlayAudioAndCastWatchSpell(Player, DehydratedSpell, DialogueKeywordThirsty)

    endif
EndFunction

Function PlayAudioAndCastWatchSpell(Actor Player, Spell SpellToCast, Keyword KeywordToSay)
    Trace(self, "PlayAudioAndCastWatchSpell() SpellToCast: " + SpellToCast + ", KeywordToSay: " + KeywordToSay)
    SpellToCast.Cast(Player, Player)
    Player.SayCustom(KeywordToSay) ;Short "grunt" fires off
EndFunction

;************************************************************************************
;****************************      CUSTOM TRACE LOG     *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "PEO",  string SubLogName = "PEO_SustenanceCastWatchScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "PEO",  string SubLogName = "PEO_SustenanceCastWatchScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction