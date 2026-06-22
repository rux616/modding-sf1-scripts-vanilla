Scriptname CompanionCrimeFactionHostilityScript extends Actor
{Makes Companion Crime Faction hostile if they are ever in combat with a shared crime faction which is enemy to the player because of crime}

float TimerInterval = 3.0 const

Faction[] Property IgnoreSharedCrimeForAnyoneInTheseFactions const auto
{Even if the companion would help them because they are in his shared crime list, ignore it if they are in this faction.}

Event OnCombatStateChanged(ObjectReference akTarget, int aeCombatState)
    debug.trace(self + "OnCombatStateChanged() akTarget:" + akTarget + ", aeCombatState:" + aeCombatState)

    if aeCombatState > 0
    	StartTimer(Game.GetGameSettingFloat("fCombatYieldTime")) ;give player a chance to yield before we join in the fight against him
    endif
EndEvent

Event OnTimer(int aiTimerID)
   debug.trace(self + "OnTimer()")

	TestForSharedCrimeCombatants()
   
    if IsInCombat()
    	StartTimer(TimerInterval)
    endif

EndEvent

Function TestForSharedCrimeCombatants()
	
	faction myCrimeFaction = GetCrimeFaction()

	if myCrimeFaction.IsPlayerEnemy()
		debug.trace(self + "TestForSharedCrimeCombatants() myCrimeFaction is already Enemy of player, BAILING:" + myCrimeFaction)
		RETURN
	endif

	Actor[] combatants = GetAllCombatTargets()

	debug.trace(self + "TestForSharedCrimeCombatants() myCrimeFaction:" + myCrimeFaction)
	debug.trace(self + "GetAllCombatTargets():" + combatants)

	int i = 0
	int max = combatants.length
	while (i < max)
		;check to see if the combatant's crime faction is an enemy of the player
		faction currentCrimeFaction = combatants[i].GetCrimeFaction()

   		debug.trace(self + "TestForSharedCrimeCombatants() currentCrimeFaction:" + currentCrimeFaction)

		if currentCrimeFaction && currentCrimeFaction.IsPlayerEnemy()
  			debug.trace(self + "TestForSharedCrimeCombatants() currentCrimeFaction.IsPlayerEnemy() and not in IgnoreSharedCrimeForAnyoneInTheseFactions")

			;check to see if the crime faction is in my shared crime faction list and the actor isn't in the ignore array
			if myCrimeFaction.IsFactionInCrimeGroup(currentCrimeFaction) && CommonArrayFunctions.CheckActorAgainstFactionArray(combatants[i], IgnoreSharedCrimeForAnyoneInTheseFactions) == false
				
				debug.trace(self + "currentCrimeFaction is in my Crime Faction's shared crime group. Making my crime faction an enemy of the player." + myCrimeFaction)

				;make my crime faction also an enemy of the player
				myCrimeFaction.SetPlayerEnemy()
				RETURN

			endif

		endif 

		i += 1
	endwhile

EndFunction