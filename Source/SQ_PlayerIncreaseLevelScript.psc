Scriptname SQ_PlayerIncreaseLevelScript extends Quest

GlobalVariable property MB_MaxTargetLevel auto const mandatory
{ global for max encounter level }

int property encounterLevelMaxAdjustment = 10 auto Const
{ how much to add to player level to get max encounter level global }

Spell Property WellnessAbilityRank01 Auto Const Mandatory

Spell Property WellnessAbilityRank02 Auto Const Mandatory

Spell Property WellnessAbilityRank03 Auto Const Mandatory

Spell Property WellnessAbilityRank04 Auto Const Mandatory

Event OnQuestStarted()
    Actor playerRef = Game.GetPlayer()
    int playerLevel = playerRef.GetLevel()

    debug.trace(self + " OnQuestStarted: player level=" + playerLevel)

    MB_MaxTargetLevel.SetValueInt(playerLevel + encounterLevelMaxAdjustment)
    
    RemoveAndReapplySpells(playerRef, WellnessAbilityRank01)
    RemoveAndReapplySpells(playerRef, WellnessAbilityRank02)
    RemoveAndReapplySpells(playerRef, WellnessAbilityRank03)
    RemoveAndReapplySpells(playerRef, WellnessAbilityRank04)

    Stop()
EndEvent

Function RemoveAndReapplySpells(Actor akActor, Spell spellToRemoveAndReapply)
    int timeoutIterations = 0

    if akActor.HasSpell(spellToRemoveAndReapply)
            akActor.removeSpell(spellToRemoveAndReapply)
            while (akActor.HasSpell(spellToRemoveAndReapply) == 1 || timeoutIterations < 10)
                Utility.Wait(0.1)
                timeoutIterations += 1
            endWhile
            akActor.addSpell(spellToRemoveAndReapply)

            if timeoutIterations >= 10
                debug.Trace("Timeout failed; " + spellToRemoveAndReapply + " was not applied on level up.")
            EndIf
    endif 

EndFunction