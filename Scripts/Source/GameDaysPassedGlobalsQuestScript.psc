Scriptname GameDaysPassedGlobalsQuestScript extends Quest Const default
{Used to set globalvariables in terms of gamedays passed. 
Useful for story manager and dialogue conditions like:
GetGlobalValue NextAllowed <= GameDaysPassed}

struct GlobalsDatum

int QuestStage
{When this quest stage is set, set NextAllowed to GameDaysPassed + DaysToAdd}

globalvariable NextAllowed
{Global we are setting}

globalvariable DaysToAdd
{Global representing how many days to add to current GameDaysPassed before storing in NextAllowed
Hours and minutes expressed as GameDaysPassed:
Hour: 1/24 = .04167
Minute: 1/(24*60) = .0006945 
So to add 4 hours would be (.04167 * 4) = 0.17

(Note: We are using another global for DaysToAdd assuming this is for systemic things and thus more convenient to use a globalvariable rather than a float)
}
endStruct

GlobalsDatum[] Property GameDaysPassedGlobalsAndQuestStages const auto 
{Holds quest stages and globals to set with GameDaysPassed}

Event OnStageSet(int auiStageID, int auiItemID)
	if auiItemID == 0 ;do this only once

		int i = GameDaysPassedGlobalsAndQuestStages.findStruct("QuestStage", auiStageID)
		while (i >= 0)
			GlobalsDatum CurrentGlobalDatum = GameDaysPassedGlobalsAndQuestStages[i]
			CurrentGlobalDatum.NextAllowed.SetValue(Utility.GetCurrentGameTime() + CurrentGlobalDatum.DaysToAdd.GetValue())

			if i + 1 < GameDaysPassedGlobalsAndQuestStages.length
				i = GameDaysPassedGlobalsAndQuestStages.findStruct("QuestStage", auiStageID, i + 1)
			else
				i = -1 ;bail out of while loop
			endif
		endwhile

	endif

EndEvent