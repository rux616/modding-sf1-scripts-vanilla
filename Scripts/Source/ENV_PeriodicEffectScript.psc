Scriptname ENV_PeriodicEffectScript extends ActiveMagicEffect

Struct TimerDatum
int ID
GlobalVariable IntervalGlobal
{A global holding the interval in seconds, for this timer. Values of 0 or less are ignored.}

GlobalVariable MaxIntervalGlobal
{Optional: If set, IntervalGlobal becomes a min and this global becomes the max of a randomized interval in seconds, for this timer. Values of 0 or less are ignored.}

EndStruct

Struct PeriodicEffectDatum

potion PotionToConsume
{Optional: Consume this potion when this effect is fired}

bool FireOnStart
{These effects should fire when the magic effect starts}

int FireOnTimerID = -1
{These effects should fire when the OnTimer event for this ID occurs}

bool StopFiringIfSuccessful = true
{If true (default), if this Periodic Effect fires, ignore any further Periodic Effect that would also fire on this same FireOnTimerID / FireOnStart}

GlobalVariable ChanceGlobal
{if there is a ChanceGlobal, that becomes a chance on a d100 to fire the effect (everything below)}

ActorValue ChanceAV
{added to the ChanceGlobal}

bool MagnitudeScalesChance
{If true: If there is a ChanceGlobal, it's value is multiplied by the magnitude; if there is no ChanceGlobal the magnitude IS the chance.}

ConditionForm Conditions
{if true, before firing, make sure this condition form is true for the subject}

spell SpellToCast
{Cast this spell when this effect is fired}

formlist IncrementalSpellListToCast
{Cast a spell from this list when effect is fired. Start with spells in lower index. If already present, dispell it and cast the next higher one that isn't already running on player.}

bool AddSpellInsteadOfCast = false
{If true will add spell instead of casting it (for abilities, etc.)}

ENV_AfflictionScript AfflictionToGain
{Gain this affliction when this effect is fired}

FormList RandomAfflictionsToGainList
{Gain the afflictions in this formlist when this effect is fired. Put the same affliction in the array if you want to weight it to be more likely that others}

message MessageToDisplay
{Display this message when this effect is fired}

bool ShowAsHelpMessage
{Display the message as a tutorial message}

float HelpMessageDuration
{How long to disply help message}

Keyword DialogueSubTopicToSay
{Dialogue for player to "say" when this effect is fired (ie choking, gasping, etc.)
A quest must be running with this dialogue... usually a unique game started quest)}

int DetectionEventSoundLevel = -1
{if > -1, will send a detection event with this sound level}

EndStruct

Group TimerDataSetting
TimerDatum[] Property TimerData Auto Const
{If you aren't just firing things on start, then you need to create at least one TimerDatum in this list.}
EndGroup

Group PeriodicEffectDataSetting
PeriodicEffectDatum[] Property PeriodicEffectData Auto Const Mandatory

message Property MessageToDisplayOnFinish auto const
{Display this message when this effect finishes}

EndGroup


Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	Trace(self, "OnEffectStart() GetBaseObject(): " + GetBaseObject() + ", akTarget: " + akTarget + ", akCaster: " + akCaster + ". PeriodicEffectData " + PeriodicEffectData)

	;fire all Periodic Effects that FireOnStart...
	ProcessPeriodicEventData(GetAllPeriodicEffectsFiringOnStart())

	;start the timers...
	StartTimers(TimerData)
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    Trace(self, "OnEffectFinish()")

	if MessageToDisplayOnFinish != None
	    MessageToDisplayOnFinish.Show()
	endif

EndEvent

Event OnTimer(int aiTimerID)
	Trace(self, "OnTimer() aiTimerID: " + aiTimerID)
	PeriodicEffectDatum[] foundPeriodicEffectData = GetAllPeriodicEffectsFiringOnTimerID(aiTimerID)

	Trace(self, "foundPeriodicEffectData: " + foundPeriodicEffectData + ", GetCasterActor(): " + GetCasterActor() + ", TargetActor: " + GetTargetActor())
	ProcessPeriodicEventData(foundPeriodicEffectData)

	;restart the timer
	StartTimerInDatum(TimerData[TimerData.FindStruct("ID", aiTimerID)])
EndEvent

Function StartTimers(TimerDatum[] Timers)
	Trace(self, "StartTimers() Timers: " + Timers)
	int i = 0
	While (i < Timers.length)
		StartTimerInDatum(Timers[i])
		i += 1
	EndWhile
EndFunction


Function StartTimerInDatum(TimerDatum TimerDatumToStart)
	GlobalVariable intervalGlobal = TimerDatumToStart.IntervalGlobal
	GlobalVariable maxIntervalGlobal = TimerDatumToStart.MaxIntervalGlobal

	if intervalGlobal
		float interval = intervalGlobal.GetValue()

		if maxIntervalGlobal
			interval = Utility.RandomFloat(interval, maxIntervalGlobal.GetValue())
		endif
		
		if interval > 0
			StartTimer(interval, TimerDatumToStart.ID)
		endif
	endif
EndFunction


;loop through PeriodicEffectDataToProcess, casting spell, showing message, and saying dialogue as appropriate
Function ProcessPeriodicEventData(PeriodicEffectDatum[] PeriodicEffectDataToProcess)
	if IsBoundGameObjectAvailable() == false
		return
	endif

	Trace(self, "ProcessPeriodicEventData() PeriodicEffectDataToProcess: " + PeriodicEffectDataToProcess)

	Actor TargetActor = GetTargetActor()
	Actor CasterActor = GetCasterActor()

	if CasterActor == None
		Trace(self, "ProcessPeriodicEventData() no CasterActor, using Subject as CasterActor for SpellToCast")
		CasterActor = TargetActor
	EndIf

	bool ShouldStopFiring
	int i = 0
	While (i < PeriodicEffectDataToProcess.length && ShouldStopFiring == false && CasterActor)
		PeriodicEffectDatum currentPeriodicEffectDatum = PeriodicEffectDataToProcess[i]

		Trace(self, "ProcessPeriodicEventData() currentPeriodicEffectDatum: " + currentPeriodicEffectDatum)

		bool chanceSuccess = true
		bool conditionsSuccess = true

		If (currentPeriodicEffectDatum.ChanceGlobal != None || currentPeriodicEffectDatum.ChanceAV || currentPeriodicEffectDatum.MagnitudeScalesChance)
			Trace(self, "ProcessPeriodicEventData() ChanceGlobal: " + currentPeriodicEffectDatum.ChanceGlobal + ", GetValue(): " + currentPeriodicEffectDatum.ChanceGlobal.GetValue() + ",  currentPeriodicEffectDatum.ChanceAV: " +  currentPeriodicEffectDatum.ChanceAV + ", TargetActor.GetValue(currentPeriodicEffectDatum.ChanceAV): " + TargetActor.GetValue(currentPeriodicEffectDatum.ChanceAV) + ",  MagnitudeScalesChance: " + currentPeriodicEffectDatum.MagnitudeScalesChance)
			float chance = 1.0
			
			if currentPeriodicEffectDatum.ChanceGlobal
				chance = currentPeriodicEffectDatum.ChanceGlobal.GetValueInt()

				if currentPeriodicEffectDatum.ChanceAV
					chance += TargetActor.GetValue(currentPeriodicEffectDatum.ChanceAV)
				endif

			elseif currentPeriodicEffectDatum.ChanceAV
				chance = TargetActor.GetValue(currentPeriodicEffectDatum.ChanceAV)
			endif

			if currentPeriodicEffectDatum.MagnitudeScalesChance
				float magnitude = GetMagnitude()
				Trace(self, "ProcessPeriodicEventData() magnitude: " + magnitude)

				chance = chance * magnitude
			endif

			Trace(self, "ProcessPeriodicEventData() chance: " + chance)
			
			chanceSuccess = Game.GetDieRollSuccess(chance as int)
			Trace(self, "ProcessPeriodicEventData() chanceSuccess: " + chanceSuccess)
		EndIf

		if (currentPeriodicEffectDatum.Conditions != None)
			Trace(self, "ProcessPeriodicEventData() TargetActor (subject): " + TargetActor + ",  conditions: " + currentPeriodicEffectDatum.conditions)
			conditionsSuccess = currentPeriodicEffectDatum.Conditions.IsTrue(TargetActor)
			Trace(self, "ProcessPeriodicEventData() conditionsSuccess: " + conditionsSuccess)
		endif

		if chanceSuccess == true && conditionsSuccess == true
			if currentPeriodicEffectDatum.SpellToCast
				Trace(self, "Calling Cast() SpellToCast: " + currentPeriodicEffectDatum.SpellToCast + ", CasterActor: " + CasterActor + ", TargetActor: " + TargetActor)
				currentPeriodicEffectDatum.SpellToCast.Cast(CasterActor, TargetActor)
			endif

			if currentPeriodicEffectDatum.PotionToConsume
				Trace(self, "Calling ConsumePotion() PotionToConsume: " + currentPeriodicEffectDatum.PotionToConsume + ", TargetActor: " + TargetActor)
				ConsumePotion(currentPeriodicEffectDatum.PotionToConsume, TargetActor)
			endif

			if currentPeriodicEffectDatum.IncrementalSpellListToCast
				Trace(self, "Looking for spell to cast from IncrementalSpellListToCast: " + currentPeriodicEffectDatum.IncrementalSpellListToCast)

				;loop through formlist looking for a spell to cast, and dispelling the previous one
				formlist currentSpellList = currentPeriodicEffectDatum.IncrementalSpellListToCast

				int iSpell = 0
				int iLastSpell = currentSpellList.GetSize() - 1 ;NOTE THIS IS THE LAST INDEX

				if iLastSpell < 0 ;empty list
					Warning(self, "ProcessPeriodicEventData() had empty formlist for currentPeriodicEffectDatum: " + currentPeriodicEffectDatum)
				endif

				Spell foundSpell = none
				While (iSpell <= iLastSpell)
					Spell currentSpell = currentSpellList.GetAt(iSpell) as Spell	

					if TargetActor.IsSpellTarget(currentSpell)
						foundSpell = currentSpell
						Trace(self, "foundSpell: " + foundSpell)

						;if found is not the last one in list, dispell it and cast the next one
						if iSpell < iLastSpell
							;dispel found (unless it's the last) and cast the next
							Spell nextSpell = currentSpellList.GetAt(iSpell + 1) as Spell
							
							Trace(self, "Dispelling or Removing foundSpell: " + foundSpell + ", Casting or Adding nextSpell: " + nextSpell)
							DispelOrRemoveSpell(foundSpell, TargetActor, currentPeriodicEffectDatum.AddSpellInsteadOfCast)
							CastOrAddSpell(nextSpell, CasterActor, TargetActor, currentPeriodicEffectDatum.AddSpellInsteadOfCast)
						endif

						;we're done
						iSpell = iLastSpell
					endif
					
					iSpell += 1
				EndWhile

				if foundSpell == None ;spell not found
					;will cast the first spell
					Spell nextSpell = currentSpellList.GetAt(0) as Spell

					Trace(self, "Casting or Adding (first) nextSpell: " + nextSpell)
					CastOrAddSpell(nextSpell, CasterActor, TargetActor, currentPeriodicEffectDatum.AddSpellInsteadOfCast)
				endif

			endif

			if currentPeriodicEffectDatum.AfflictionToGain
				GainAffliction(TargetActor, currentPeriodicEffectDatum.AfflictionToGain)
			endif

			if currentPeriodicEffectDatum.RandomAfflictionsToGainList
				int iRandom = Utility.RandomInt(0, currentPeriodicEffectDatum.RandomAfflictionsToGainList.GetSize() - 1)
				ENV_AfflictionScript randomAffliction = currentPeriodicEffectDatum.RandomAfflictionsToGainList.GetAt(iRandom) as ENV_AfflictionScript

				Trace(self, "Gaining randomAffliction: " + randomAffliction + ", from currentPeriodicEffectDatum.RandomAfflictionsToGainList: " + currentPeriodicEffectDatum.RandomAfflictionsToGainList + ",  ")
				GainAffliction(TargetActor, randomAffliction)
			endif

			if currentPeriodicEffectDatum.MessageToDisplay
				

				if currentPeriodicEffectDatum.ShowAsHelpMessage
					Trace(self, "Calling ShowAsHelpMessage() MessageToDisplay: " + currentPeriodicEffectDatum.MessageToDisplay)
					currentPeriodicEffectDatum.MessageToDisplay.ShowAsHelpMessage("PeriodicEffectHelpMsg", currentPeriodicEffectDatum.HelpMessageDuration, 1, 1)
				else
					Trace(self, "Calling Show() MessageToDisplay: " + currentPeriodicEffectDatum.MessageToDisplay)
					currentPeriodicEffectDatum.MessageToDisplay.Show()
				endif
			endif

			if currentPeriodicEffectDatum.DialogueSubTopicToSay
				Trace(self, "Calling SayCustom() DialogueSubTopicToSay: " + currentPeriodicEffectDatum.DialogueSubTopicToSay)
				TargetActor.SayCustom(currentPeriodicEffectDatum.DialogueSubTopicToSay)
			endif

			if currentPeriodicEffectDatum.DetectionEventSoundLevel > -1
				Trace(self, "Calling CreateDetectionEvent()")
				TargetActor.CreateDetectionEvent(TargetActor, currentPeriodicEffectDatum.DetectionEventSoundLevel)
			endif

			If (currentPeriodicEffectDatum.StopFiringIfSuccessful)
				ShouldStopFiring = true
				Trace(self, "Calling SayCustom() ShouldStopFiring == true, skipping further effects for this timer.")
			EndIf
		endif

		i += 1
	EndWhile

EndFunction

Function GainAffliction(Actor TargetActor, ENV_AfflictionScript AfflictionToGain)
		;only player can get afflictions, and only if the subject of this effect.
		if TargetActor == Game.GetPlayer()
			Trace(self, "Calling Gain(PerformSkillCheck = true) on AfflictionToGain: " + AfflictionToGain)
			AfflictionToGain.Gain(PerformSkillCheck = true)
		else
			Warning(self, "GainAffliction() Tried to Gain an effection on a target that WAS NOT the player!!! AfflictionToGain: " + AfflictionToGain + ", GetBaseObject(): " + GetBaseObject())
		endif
EndFunction

Function CastOrAddSpell(Spell SpellToCastOrAdd, Actor CasterActor, Actor TargetActor, bool AddSpell = false)
	if AddSpell
		TargetActor.AddSpell(SpellToCastOrAdd)
	else
		SpellToCastOrAdd.Cast(CasterActor, TargetActor)
	endif
EndFunction

Function DispelOrRemoveSpell(Spell SpellToDispelOrRemove, Actor TargetActor, bool RemoveSpell = false)
	if RemoveSpell
		TargetActor.RemoveSpell(SpellToDispelOrRemove)
	else
		TargetActor.DispelSpell(SpellToDispelOrRemove)
	endif
EndFunction

Function ConsumePotion(Potion PotionToConsume, Actor TargetActor)

	Trace(self, "PotiontoConsume" + potionToConsume)

	;consume the potion:
	TargetActor.EquipItem(PotionToConsume, abSilent = true)

EndFunction


;return all PeriodicEffectDatum that have FireOnStart set to true
PeriodicEffectDatum[] Function GetAllPeriodicEffectsFiringOnStart()

	PeriodicEffectDatum[] foundPeriodicEffectDatum = new PeriodicEffectDatum[0]

	int  iFound = PeriodicEffectData.FindStruct("FireOnStart", true)
	Trace(Self, "iFound =" + iFound)

	While (iFound >= 0 )
		foundPeriodicEffectDatum.add(PeriodicEffectData[iFound])
		if iFound < PeriodicEffectData.Length - 1
			iFound = PeriodicEffectData.FindStruct("FireOnStart", true, iFound + 1)
		else
			iFound = -1
		endif
	EndWhile

	return foundPeriodicEffectDatum

EndFunction


;return all PeriodicEffectDatum that have FireOnTimerID of the specified ID
PeriodicEffectDatum[] Function GetAllPeriodicEffectsFiringOnTimerID(int ID)

	PeriodicEffectDatum[] foundPeriodicEffectData = new PeriodicEffectDatum[0]

	int  iFound = PeriodicEffectData.FindStruct("FireOnTimerID", ID)

	While (iFound >= 0 )
		foundPeriodicEffectData.add(PeriodicEffectData[iFound])
		if iFound < PeriodicEffectData.Length - 1
			iFound = PeriodicEffectData.FindStruct("FireOnTimerID", ID, iFound + 1)
		else
			iFound = -1
		endif
	EndWhile

	return foundPeriodicEffectData

EndFunction




;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "EnvironmentalGameplay",  string SubLogName = "PeriodicEffect", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "EnvironmentalGameplay",  string SubLogName = "PeriodicEffect", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction