Scriptname DefaultCollectionRandomVoiceType extends RefCollectionAlias default
{used to use a random voice from a formlist of voicetypes to reference(s) in the alias}

FormList Property VoicesList Mandatory Const Auto
{The formlist with random voices you want to select from.
IMPORTANT: make sure the alias has the same formlist in the Export drop down if they are getting new dialogue in this quest.}

Group Debug_Properties
    Bool Property ShowTraces = false Auto Const
    {(Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives.}
EndGroup

Event OnAliasInit()
	Actor[] actors = GetActorArray()

	int iActor = 0
	While (iActor < actors.length)
		Actor actorRef = actors[iActor]
		VoiceType forcedVoice = actorRef.SetOverrideVoiceTypeRandom(VoicesList)
		DefaultScriptFunctions.Trace(self, "ForceRandomVoices() forced forcedVoice: " + forcedVoice + ", on actorRef: " + actorRef, ShowTraces)

		iActor += 1
	EndWhile
EndEvent


