Scriptname LC044DialogueCrimeGuardsScript extends Quest
{special cases for LC044}

ReferenceAlias property Alias_Guard auto const Mandatory

Function PlayerWinSpeechChallenge()
    Actor guardRef = Alias_Guard.GetActorRef()
    Faction crimeFaction = guardRef.GetCrimeFaction()
	debug.trace(self + "PlayerWinSpeechChallenge" + crimeFaction)
    ClearPlayerBounty(crimeFaction)
	Alias_Guard.TryToPlayerPayFine(abRemoveStolenItems = false, abGoToJail = false)
endFunction

Function PlayerGoToDetention()
    Actor guardRef = Alias_Guard.GetActorRef()
    Faction crimeFaction = guardRef.GetCrimeFaction()
	debug.trace(self + "PlayerGoToDetention " + crimeFaction)
    ClearPlayerBounty(crimeFaction)
	crimeFaction.SendPlayerToJail(abRemoveInventory = false, abRealJail = true)
endFunction

function ClearPlayerBounty(Faction crimeFaction)
    if crimeFaction
        crimeFaction.SetCrimeGold(0)
    EndIf
    debug.trace(self + " ClearPlayerBounty bounty=" + crimeFaction.GetCrimeGold())
EndFunction
