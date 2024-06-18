Scriptname AchievementsScript extends Quest Conditional

struct StatAchievement
	string StatName
	{Name of the stat}
	int Threshold
	{If the stat is equal to or greater than this, unlock the achievement}
	int AchievementNumber
	{The achievement to unlock}
endStruct

StatAchievement[] Property StatAchievements auto const mandatory
{All the simple "stat is equal or larger than x" achivements - must be unique stats and not overlap with future retro or other achivements}

string[] Property FutureRetroStats auto const mandatory
{All the stats that will trigger the future retro achivement - must be unique stats and not overlap with other achivements}

; Used by fragments
Int Property nNumberOfCompanions Auto Conditional Hidden
Int Property nGiantsKilled Auto Conditional Hidden

bool initialized

function InitializeQuest()
	if initialized
		return
	endif

	RegisterEvents()

	Debug.Trace("Achievements Intialized")

	initialized = true
endFunction

string sChemsCraftedStat			= "Chems Crafted" const
string sFoodCookedStat				= "Food Cooked" const
int nCraftedItems					= 100 const
string sBobbleheadsCollectedStat	= "Bobbleheads Collected" const
int nBobbleHead01					= 10 const
int nBobbleHead02					= 20 const

int nCurrentChems ; number of current chems crafted
int nCurrentFood ; number of current food items crafted
bool bCraftedItemsAwarded ; have we awarded the crafted items yet?

bool bFutureRetro ; have we awarded future retro yet?

; Function that does all the registration for events that we care about
; It's seperate from InitializeQuest so that it can easily be called from
; the console to 'fix' old save games made before the stat events were
; changed to single-shot
; This could also be used if we change the thresholds for the achivements
; as the thresholds are saved into the save game, so we'd need to update
; them.
function RegisterEvents()
	; Register all the simple ones
	int index = 0
	while (index < StatAchievements.Length)
		StatAchievement curAchivement = StatAchievements[index]
		RegisterForTrackedStatsEvent(curAchivement.StatName, curAchivement.Threshold)
		index += 1
	endWhile
	index = 0
	while (index < FutureRetroStats.Length)
		; We only care when one of these trigger, so only ask for 1
		RegisterForTrackedStatsEvent(FutureRetroStats[index], 1)
		index += 1
	endWhile

	; Add all the complicated ones

	; Unfortunately, we want these two stats to add up to a value, but we have no idea
	; what combination of the two the player will make, so we have to get them
	; one-by-one and check each time.
	; We avoid event spam by not re-registering until we've processed whether we award
	; the achivement or not. We won't end up off-by-one because when we re-register it
	; will send us the event again if the player has already blown past that value in
	; the meantime
	RegisterForTrackedStatsEvent(sChemsCraftedStat, 1)
	RegisterForTrackedStatsEvent(sFoodCookedStat, 1)

	; Bobbleheads has two thresholds, so register for the lower one. We'll register
	; for the higher one when we get the lower one.
	RegisterForTrackedStatsEvent(sBobbleheadsCollectedStat, nBobbleHead01)
endFunction

; Unregister for all events related to the future retro achivement
function UnregisterFutureRetroEvents()
	int index = 0
	while (index < FutureRetroStats.Length)
		UnregisterForTrackedStatsEvent(FutureRetroStats[index])
		index += 1
	endWhile
endFunction

EVENT OnTrackedStatsEvent(string statFilter, int statValue)
	Debug.Trace(statFilter + " is " + statValue)

	; Note that once we find a stat, we stop looking to see if it is used in other achivements under
	; the assumption that a stat is never used in more than one achivement. If this changes, this
	; code will need to change as well.
	
	bool handled = HandleBasicStat(statFilter) ; try to handle it as a basic stat achivement
	handled = handled || HandleRetroStat(statFilter) ; then try to handle it as a retro stat achivement
	handled = handled || HandleCraftedStat(statFilter, statValue) ; next try crafted stats
	handled = handled || HandleBobbleheadStat(statFilter, statValue) ; finally do the bobblehead one
endEvent

; Handle the stat event if it is a basic stat achivement
; Returns true if it was handled as the caller should stop looking
bool function HandleBasicStat(string statFilter)
	int achievementIndex = StatAchievements.FindStruct("StatName", statFilter)
	if (achievementIndex >= 0)
		Game.AddAchievement(StatAchievements[achievementIndex].AchievementNumber)
		return true ; it was a basic stat, return true
	else
		return false ; wasn't a basic stat, return false so they keep trying
	endif
endFunction

; Handle the stat event if it is a retro future achivement stat
; Returns true if it was handled as the caller should stop looking
bool function HandleRetroStat(string statFilter)
	int achievementIndex = FutureRetroStats.Find(statFilter)
	if (achievementIndex >= 0)
		if (!bFutureRetro)
			bFutureRetro = true
			Game.AddAchievement(35)
			UnregisterFutureRetroEvents()
		endif
		return true ; it was a retro stat, so return true
	else
		return false ; wasn't a retro stat, return false so they keep trying
	endif
endFunction

; Handle the stat event if it is a crafted items stat
; Returns true if it was handled as the caller should stop looking
bool function HandleCraftedStat(string statFilter, int statValue)
	if (statFilter == sChemsCraftedStat)
		nCurrentChems = statValue
		UpdateCraftedAchievement(sChemsCraftedStat, nCurrentChems)
		return true ; it was the chems stat, return true
	elseif (statFilter == sFoodCookedStat)
		nCurrentFood = statValue
		UpdateCraftedAchievement(sFoodCookedStat, nCurrentFood)
		return true ; it was the foot stat, return true
	else
		return false ; it wasn't a crafted stat, let them keep trying
	endif
endFunction

; Helper function that checks the current number of crafted items and awards the achievement
; Otherwise it will re-register us for another stat event of the type passed in (and one past the value)
function UpdateCraftedAchievement(string statFilter, int currentValue)
	if (!bCraftedItemsAwarded)
		if (nCurrentChems + nCurrentFood >= nCraftedItems)
			bCraftedItemsAwarded = true
			Game.AddAchievement(31)
			; we don't care about these anymore, so unregister
			UnregisterForTrackedStatsEvent(sChemsCraftedStat)
			UnregisterForTrackedStatsEvent(sFoodCookedStat)
		else
			; they haven't crafted enough, wait for the next one
			RegisterForTrackedStatsEvent(statFilter, currentValue + 1)
		endif
	endif
endFunction

; Handle the stat event if it is a bobblehead achievement stat
; Returns true if it was handled as the caller should stop looking
bool function HandleBobbleheadStat(string statFilter, int statValue)
	if (statFilter == sBobbleheadsCollectedStat)
		; We always award the lower level one, cause we know we're higher than that
		Game.AddAchievement(44)
		; Only award the higher one if we're over that value too
		if (statValue >= nBobbleHead02)
			Game.AddAchievement(45)
		else
			; otherwise we haven't hit the second tier yet, so register for it
			RegisterForTrackedStatsEvent(sBobbleheadsCollectedStat, nBobbleHead02)
		endif
		return true ; it was a bobblehead stat, return true
	else
		return false ; not a bobblehead stat, caller should keep checking
	endif
endFunction