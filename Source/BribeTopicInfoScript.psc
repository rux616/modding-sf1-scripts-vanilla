Scriptname BribeTopicInfoScript extends TopicInfo const
{for bribe infos - remove credits}

GlobalVariable property CreditsToRemoveGlobal auto const mandatory
{ global used for credits to remove for this bribe }

ConditionForm property Perk_CND_NegotiationRank4Check auto const mandatory

Message property NegotiationRank4Message auto const mandatory
{ message for if you get a free bribe }

GlobalVariable property NegotiationRank4Chance auto const mandatory
{ percentage chance to get a free bribe if you have Bribery rank 4 }

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	RemoveItem(akSpeakerRef)
endEvent

function RemoveItem(ObjectReference akSpeakerRef)
    bool freeBribe = false
    if Perk_CND_NegotiationRank4Check.IsTrue()
        debug.trace(self + " player has Negotiation rank 4 - checking for free bribe")
        int freeBribeRoll = Utility.RandomInt()
        int freeBribeChance = NegotiationRank4Chance.GetValueInt()
        freeBribe = (freeBribeRoll <= freeBribeChance)
        debug.trace(self + " freeBribeRoll=" + freeBribeRoll + ", NegotiationRank4Chance=" + freeBribeChance)
        if freeBribe
            ; free bribe!
            debug.trace(self + " free bribe!")
            NegotiationRank4Message.Show()
        endif
    EndIf

    if freeBribe == false
        ; otherwise, pay for bribe
        int countToRemove = CreditsToRemoveGlobal.GetValueInt()
        Game.GetPlayer().RemoveItem(Game.GetCredits(), countToRemove, akOtherContainer=akSpeakerRef)
    endif
endFunction
