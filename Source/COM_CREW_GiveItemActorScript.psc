Scriptname COM_CREW_GiveItemActorScript extends Actor 
{Used for Companions and Crew, if you find another use for this. Let jduvall know. :)}

Group Autofill
	SQ_COM_CREW_GiveItemQuestScript Property SQ_Crew Mandatory Const Auto
	{autofill}

	ActorValue Property COM_CREW_GiveItem_HasItems Mandatory Const Auto
	{Autofill}

	GlobalVariable Property COM_CREW_GiveItemAvailableCooldownDays Mandatory Const Auto
	{autofill; the number of days that need to pass for new items to be offered to player after they accept previous offer}

	ActorValue Property COM_CREW_GiveItemAvailableDay Mandatory Const Auto
	{autofill; the day (in gamedayspassed terms) that the next item is available}

	Keyword Property COM_CREW_GiveItemReminder Mandatory Const Auto
	{dialogue subtype for line to say to remind player they have something to give}

	ConditionForm Property COM_CREW_CND_GiveItemAvailable Mandatory Const Auto
	{the condition form that means they have something to give player - rolls up the above}

EndGroup

Group Properties
	LeveledItem Property GiveItemList Mandatory Const Auto
	{holds items to give the player.
	Filter for: GiveItemList}
EndGroup

bool InitialCooldownPassed = false


Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	Trace(self, "OnLocationChange() akOldLoc: " + akOldLoc + ", akNewLoc: " + akNewLoc)

	If InitialCooldownPassed == true

		bool hasItems = GetValue(COM_CREW_GiveItem_HasItems)

		if hasItems == false

			bool expiryDayCheckPassed = Utility.HasExpiryDayPassed(GetValue(COM_CREW_GiveItemAvailableDay))

			Trace(self, "OnLocationChange() expiryDayCheckPassed: " + expiryDayCheckPassed)

			if expiryDayCheckPassed

				bool giveItemsCheckPassed = SQ_Crew.CheckGiveItemConditions(self)

				Trace(self, "OnLocationChange() giveItemsCheckPassed: " +  giveItemsCheckPassed)

				if giveItemsCheckPassed
					SetValue(COM_CREW_GiveItem_HasItems, 1)
				endif

			endif

		endif

	else
		StartTimerGameTime(Math.DaysAsHours(COM_CREW_GiveItemAvailableCooldownDays.GetValue()))
	endif

	if COM_CREW_CND_GiveItemAvailable.IsTrue(self) ;includes check for COM_CREW_GiveItem_HasItems but also possible other things that might supppress dialogue, so we use the condition form to check before saying the reminder line
		;cool down for saying line should be set on dialogue info/group Hours Until Repeat
		SayCustom(COM_CREW_GiveItemReminder)
	endif

EndEvent


Event OnTimerGameTime(int aiTimerID)
	InitialCooldownPassed = true
EndEvent


Function GiveItems()
	Trace(self, "GiveItems() GiveItemList: " + GiveItemList)

	float ExpiryDay = Utility.ExpiryDay(COM_CREW_GiveItemAvailableCooldownDays.GetValue())

	Trace(self, "GiveItems() COM_CREW_GiveItemAvailableDay set to ExpiryDay: " + ExpiryDay)
	setvalue(COM_CREW_GiveItemAvailableDay, ExpiryDay) ;REMINDER -1 is default and used to conditionalize first time dialogue so that 0 can be used for debugging to make it available
	setValue(COM_CREW_GiveItem_HasItems, 0)

	Game.GetPlayer().AddItem(GiveItemList)
EndFunction



;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "Crew",  string SubLogName = "GiveItem", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "Crew",  string SubLogName = "GiveItem", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction