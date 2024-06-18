Scriptname Achievements_TrackedStatsScript extends Quest Const

{Track player stats for awarding achievements}

struct ChallengeAchievement
	Challenge AchievementChallenge
	{Challenge to trigger}

	int AchievementNumber
	{The achievement to unlock}
endStruct

struct StatsAchievement
    String statString
	{Stat to use for achievement}

    int statCount
    { how many times required to get the achievement?}

	int AchievementNumber
	{The achievement to unlock}
endStruct

StatsAchievement[] Property StatsAchievements auto const mandatory
{ All activity based achievements defined via tracked stat events }

ChallengeAchievement[] Property ChallengeAchievements auto const mandatory
{ All activity based achievements defined via Challenge forms }

Function RegisterTrackedStats()
    int i = 0
    while i < StatsAchievements.Length
        StatsAchievement theStatAchievement = StatsAchievements[i]
        RegisterForTrackedStatsEvent(theStatAchievement.statString, theStatAchievement.statCount)
        i += 1
    EndWhile

    RegisterForChallengeEvents()
    
    ; Add all achievement challenges:
    int index = 0
    while (index < ChallengeAchievements.Length)
		ChallengeAchievements[index].AchievementChallenge.StartPlayerChallenge()
		index += 1
	endWhile

endFunction

Event OnTrackedStatsEvent(string asStatFilter, int aiStatValue)
    int statsAchievementsIndex = StatsAchievements.FindStruct("statString", asStatFilter, 0)
    while ( statsAchievementsIndex > -1 ) 
        StatsAchievement theStatAchievement = StatsAchievements[statsAchievementsIndex]

        ; Check that the found stat achievement's target value matches the value of the stat event
        if(theStatAchievement.statCount <= aiStatValue)
            Game.AddAchievement(theStatAchievement.AchievementNumber)
        EndIf

        ; Check past this index in case another achievement is based on this same stat
        statsAchievementsIndex = StatsAchievements.FindStruct("statString", asStatFilter, statsAchievementsIndex + 1)     
    EndWhile
endEvent

Event OnChallengeCompleted(ObjectReference akOwner, Challenge akChallenge)
    if (akOwner == Game.GetPlayer())
        int index = ChallengeAchievements.FindStruct("AchievementChallenge", akChallenge)
	    if (index >= 0)
	      Game.AddAchievement(ChallengeAchievements[index].AchievementNumber)
        endif
    endif
endEvent